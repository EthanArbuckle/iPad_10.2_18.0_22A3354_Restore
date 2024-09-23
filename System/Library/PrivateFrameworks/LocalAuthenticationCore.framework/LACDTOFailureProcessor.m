@implementation LACDTOFailureProcessor

- (LACDTOFailureProcessor)initWithReplyQueue:(id)a3 ui:(id)a4
{
  id v6;
  LACDTOFailureProcessor *v7;
  LACDTOFailureProcessor *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)LACDTOFailureProcessor;
  v7 = -[LACDTOFailureProcessor init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_ui, a4);

  return v8;
}

- (BOOL)canProcessRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1039);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    v8 = v12 ^ 1;
  }

  return v8;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  LACUserInterfacePresenting *ui;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[LACDTOFailureProcessor canProcessRequest:](self, "canProcessRequest:", v8)
    && (objc_msgSend(v9, "error"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11)
    && (objc_msgSend(v9, "error"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = -[LACDTOFailureProcessor _checkErrorRequiresUI:](self, "_checkErrorRequiresUI:", v12),
        v12,
        v13))
  {
    LACLogDTO();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Failure alert will appear.", buf, 2u);
    }

    ui = self->_ui;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63__LACDTOFailureProcessor_postProcessRequest_result_completion___block_invoke;
    v16[3] = &unk_2510C2130;
    v18 = v10;
    v17 = v9;
    -[LACUserInterfacePresenting presentUIForIdentifier:request:completion:](ui, "presentUIForIdentifier:request:completion:", 5, v8, v16);

  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }

}

void __63__LACDTOFailureProcessor_postProcessRequest_result_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTO();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2409DC000, v4, OS_LOG_TYPE_DEFAULT, "Failure alert did disappear (err: %@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_checkErrorRequiresUI:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (v3)
    v4 = +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -1, 32)
      || +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -8, 15)
      || +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -8, 29)
      || +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -8, 4)
      || +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -8, -1)
      || +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -4, 12)
      || +[LACError error:hasCode:subcode:](LACError, "error:hasCode:subcode:", v3, -4, 18);
  else
    v4 = 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ui, 0);
}

@end
