@implementation ASDPersistentRequest

- (void)cancelWithErrorHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ASDPersistentRequest_cancelWithErrorHandler___block_invoke;
  v6[3] = &unk_1E37BE250;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ASDRequest _cancelWithErrorHandler:](self, "_cancelWithErrorHandler:", v6);

}

void __47__ASDPersistentRequest_cancelWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDRequestBroker markRequestAsComplete:](v3, *(void **)(a1 + 32));

}

- (void)startWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDRequestBroker markRequestAsActive:](v5, self);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ASDPersistentRequest_startWithErrorHandler___block_invoke;
  v7[3] = &unk_1E37BE250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ASDRequest _startWithErrorHandler:](self, "_startWithErrorHandler:", v7);

}

void __46__ASDPersistentRequest_startWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  +[ASDRequest _sharedBroker](ASDRequest, "_sharedBroker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ASDRequestBroker markRequestAsComplete:](v3, *(void **)(a1 + 32));

}

@end
