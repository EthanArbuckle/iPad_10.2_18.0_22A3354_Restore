@implementation AAUIPrintableAccountSummaryHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("recovery:print"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("recovery:print"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUIPrintableAccountSummaryHook _launchPrintableSummaryFlow:completion:](self, "_launchPrintableSummaryFlow:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIPrintableAccountSummaryHook _launchPrintableSummaryFlow:completion:](self, "_launchPrintableSummaryFlow:completion:", v7, v6);

}

- (void)_launchPrintableSummaryFlow:(id)a3 completion:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v5 = a4;
  v6 = +[AAUIFeatureFlags isPrintableSummaryEnabled](AAUIFeatureFlags, "isPrintableSummaryEnabled");
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "_launchPrintableSummaryFlow: Launching Printable Summary Flow.", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "presentationContextForHook:", self);
    v8 = objc_claimAutoreleasedReturnValue();

    +[AAUIPrintableAccountRecoverySummaryViewFactory createWithContext:](AAUIPrintableAccountRecoverySummaryViewFactory, "createWithContext:", CFSTR("hook"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__AAUIPrintableAccountSummaryHook__launchPrintableSummaryFlow_completion___block_invoke;
    v11[3] = &unk_1EA2DB0E8;
    v12 = v5;
    -[NSObject presentViewController:animated:completion:](v8, "presentViewController:animated:completion:", v10, 1, v11);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[AAUIPrintableAccountSummaryHook _launchPrintableSummaryFlow:completion:].cold.1(v8);
  }

}

uint64_t __74__AAUIPrintableAccountSummaryHook__launchPrintableSummaryFlow_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverHookResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_launchPrintableSummaryFlow:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "_launchPrintableSummaryFlow: Printable Summary is disabled.", v1, 2u);
}

@end
