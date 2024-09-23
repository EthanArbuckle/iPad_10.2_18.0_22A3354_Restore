@implementation CHSynchronizable

void __42__CHSynchronizable_executeSyncWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)executeSyncWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[CHSynchronizable queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__CHSynchronizable_executeSyncWithResult___block_invoke;
  v9[3] = &unk_1E6746360;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)execute:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[CHSynchronizable queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (void)executeSync:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[CHSynchronizable queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, v4);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (CHSynchronizable)initWithName:(const char *)a3
{
  CHSynchronizable *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHSynchronizable;
  v4 = -[CHSynchronizable init](&v10, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create(a3, v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

  }
  return v4;
}

- (CHSynchronizable)initWithQueue:(id)a3
{
  id v5;
  CHSynchronizable *v6;
  CHSynchronizable *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSynchronizable;
  v6 = -[CHSynchronizable init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (BOOL)executeSyncWithBOOL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CHSynchronizable queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CHSynchronizable_executeSyncWithBOOL___block_invoke;
  v8[3] = &unk_1E6746360;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

uint64_t __40__CHSynchronizable_executeSyncWithBOOL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
