@implementation NRActiveDeviceAssertion

- (id)initWithDevice:(void *)a3 identifier:
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  NSObject *v10;
  id v11;
  dispatch_queue_t v12;
  id v13;
  objc_super v15;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)NRActiveDeviceAssertion;
    v8 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.nanoregistry.activeDeviceAssertion.%p"), a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = objc_retainAutorelease(v9);
      v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), v10);
      v13 = a1[3];
      a1[3] = v12;

    }
  }

  return a1;
}

- (void)dealloc
{
  objc_super v3;

  -[NRActiveDeviceAssertion _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRActiveDeviceAssertion;
  -[NRActiveDeviceAssertion dealloc](&v3, sel_dealloc);
}

- (void)_invalidate
{
  id v2;

  if (a1)
  {
    +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_invalidateActiveDeviceAssertionWithIdentifier:", *(_QWORD *)(a1 + 16));

  }
}

- (id)description
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__NRActiveDeviceAssertion_description__block_invoke;
  v5[3] = &unk_1E4494F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__NRActiveDeviceAssertion_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "valueForProperty:", CFSTR("pairingID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; pairingID = %@>"),
    objc_opt_class(),
    *(_QWORD *)(a1 + 32),
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16),
    v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isActive
{
  void *v3;

  +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isAssertionActive:", self->_identifier);

  return (char)self;
}

- (NRDevice)device
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__NRActiveDeviceAssertion_device__block_invoke;
  v5[3] = &unk_1E4495A48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NRDevice *)v3;
}

void __33__NRActiveDeviceAssertion_device__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NRActiveDeviceAssertion_invalidate__block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__NRActiveDeviceAssertion_invalidate__block_invoke(uint64_t a1)
{
  -[NRActiveDeviceAssertion _invalidate](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
