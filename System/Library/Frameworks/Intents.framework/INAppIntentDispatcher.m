@implementation INAppIntentDispatcher

- (INAppIntentDispatcher)initWithDelegate:(id)a3
{
  id v4;
  INAppIntentDispatcher *v5;
  INAppIntentDispatcher *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INAppIntentDispatcher;
  v5 = -[INAppIntentDispatcher init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)dispatchIntentForwardingAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  INIntentDeliverer *v10;
  INIntentDeliverer *v11;
  INIntentDeliverer *v12;
  void *v13;
  _QWORD v14[4];
  INIntentDeliverer *v15;
  id v16;
  _OWORD v17[2];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v8 = (void *)getWFOnScreenContentExtractorClass_softClass;
    v22 = getWFOnScreenContentExtractorClass_softClass;
    if (!getWFOnScreenContentExtractorClass_softClass)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __getWFOnScreenContentExtractorClass_block_invoke;
      v18[3] = &unk_1E22953C0;
      v18[4] = &v19;
      __getWFOnScreenContentExtractorClass_block_invoke((uint64_t)v18);
      v8 = (void *)v20[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v19, 8);
    v10 = (INIntentDeliverer *)objc_alloc_init(v9);
    -[INIntentDeliverer handleAction:completionHandler:](v10, "handleAction:completionHandler:", v6, v7);
  }
  else
  {
    v11 = [INIntentDeliverer alloc];
    if (v6)
      objc_msgSend(v6, "hostProcessAuditToken");
    else
      memset(v17, 0, sizeof(v17));
    v12 = -[INIntentDeliverer initWithQueue:auditToken:](v11, "initWithQueue:auditToken:", MEMORY[0x1E0C80D38], v17);
    -[INAppIntentDispatcher delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentDeliverer setDelegate:](v12, "setDelegate:", v13);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__INAppIntentDispatcher_dispatchIntentForwardingAction_completionHandler___block_invoke;
    v14[3] = &unk_1E2293218;
    v15 = v12;
    v16 = v7;
    v10 = v12;
    objc_msgSend(v6, "executeLocallyWithIntentDeliverer:completionHandler:", v10, v14);

  }
}

- (INIntentDeliveringDelegate)delegate
{
  return (INIntentDeliveringDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __74__INAppIntentDispatcher_dispatchIntentForwardingAction_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
