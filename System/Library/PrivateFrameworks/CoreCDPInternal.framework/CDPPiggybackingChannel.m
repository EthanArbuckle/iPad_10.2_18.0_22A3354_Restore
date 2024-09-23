@implementation CDPPiggybackingChannel

- (CDPPiggybackingChannel)initWithContext:(id)a3
{
  id v5;
  CDPPiggybackingChannel *v6;
  CDPPiggybackingChannel *v7;

  v5 = a3;
  v6 = -[CDPPiggybackingChannel init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)sendPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Sending payload over piggybacking channel\", buf, 2u);
  }

  -[CDPPiggybackingChannel _replyContextWithPakeData:](self, "_replyContextWithPakeData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__CDPPiggybackingChannel_sendPayload_completion___block_invoke;
  v12[3] = &unk_24C81DD98;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "performCircleRequestWithContext:completion:", v9, v12);

}

void __49__CDPPiggybackingChannel_sendPayload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v8, "clientErrorCode"))
  {
    _CDPStateError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v6);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "clientInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v6, v5);
  }

}

- (BOOL)approverBackupRecordsExist
{
  return 0;
}

- (unint64_t)approveriCloudKeychainState
{
  return 0;
}

- (id)_replyContextWithPakeData:(id)a3
{
  CDPContext *context;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  context = self->_context;
  v5 = a3;
  -[CDPContext resumeContext](context, "resumeContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replyPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext resumeContext](self->_context, "resumeContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPayload:", v8);

  -[CDPContext resumeContext](self->_context, "resumeContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientInfo:", v5);

  return (id)-[CDPContext resumeContext](self->_context, "resumeContext");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
