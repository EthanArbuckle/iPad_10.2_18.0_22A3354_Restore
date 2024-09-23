@implementation ITIdleTimerAssertion

- (id)_initWithConfiguration:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  ITIdleTimerAssertion *v12;
  uint64_t v13;
  ITIdleTimerConfiguration *configuration;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = (id *)&v20;
  v22 = 0x3042000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__ITIdleTimerAssertion__initWithConfiguration_forReason_invalidationBlock___block_invoke;
  v17[3] = &unk_24BF08BE8;
  v19 = &v20;
  v11 = v10;
  v18 = v11;
  v16.receiver = self;
  v16.super_class = (Class)ITIdleTimerAssertion;
  v12 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](&v16, sel_initWithIdentifier_forReason_invalidationBlock_, CFSTR("IdleTimerConfiguration"), v9, v17);
  if (v12)
  {
    objc_storeWeak(v21 + 5, v12);
    v13 = objc_msgSend(v8, "copy");
    configuration = v12->_configuration;
    v12->_configuration = (ITIdleTimerConfiguration *)v13;

  }
  _Block_object_dispose(&v20, 8);
  objc_destroyWeak(&v25);

  return v12;
}

void __75__ITIdleTimerAssertion__initWithConfiguration_forReason_invalidationBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ITIdleTimerAssertion;
  -[BSSimpleAssertion succinctDescriptionBuilder](&v8, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ITIdleTimerAssertion _uniqueReason](self, "_uniqueReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("uniqueReason"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_configuration, CFSTR("configuration"));
  return v3;
}

- (NSString)_uniqueReason
{
  ITIdleTimerConfiguration *configuration;
  void *v3;
  void *v4;

  configuration = self->_configuration;
  -[BSSimpleAssertion reason](self, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ITIdleTimerConfiguration _uniquedReason:](configuration, "_uniquedReason:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (ITIdleTimerConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
