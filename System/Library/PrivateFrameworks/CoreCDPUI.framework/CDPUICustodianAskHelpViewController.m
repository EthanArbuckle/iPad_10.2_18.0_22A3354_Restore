@implementation CDPUICustodianAskHelpViewController

- (CDPUICustodianAskHelpViewController)initWithViewModel:(id)a3 cdpContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CDPUICustodianAskHelpViewController *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v7, "iconName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CDPUICustodianAskHelpViewController;
  v15 = -[CDPUICustodianAskHelpViewController initWithTitle:detailText:icon:contentLayout:](&v17, sel_initWithTitle_detailText_icon_contentLayout_, v13, v14, v12, 3);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_viewModel, a3);
    objc_storeStrong((id *)&v15->_cdpContext, a4);
  }

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDPUICustodianAskHelpViewController;
  -[OBBaseWelcomeController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__handleAskForHelpNowAction_, 64);
  -[CDPUICustodianAskHelpViewController _getHelpNowButtonTitle](self, "_getHelpNowButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v4, 0);

  -[CDPUICustodianAskHelpViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", v3);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleDontAskForHelpAction_, 64);
  -[CDPUICustodianAskHelpViewController _dontAskForHelpButtonTitle](self, "_dontAskForHelpButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  -[CDPUICustodianAskHelpViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianAskHelpViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewController _makeViewAppearedEvent](self, "_makeViewAppearedEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPUICustodianAskHelpViewController;
  -[CDPUICustodianAskHelpViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewController _makeViewWillDisappearEvent](self, "_makeViewWillDisappearEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v5);

}

- (id)_makeViewAppearedEvent
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A740], *MEMORY[0x24BE1A860]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewController _buttonIdentifiersJoinedByComma](self, "_buttonIdentifiersJoinedByComma");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE1A648]);

  return v3;
}

- (id)_makeViewWillDisappearEvent
{
  void *v3;
  _BOOL4 v4;
  _QWORD *v5;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A660], *MEMORY[0x24BE1A860]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIViewController isDisappearingDueToPop](self, "isDisappearingDueToPop");
  v5 = (_QWORD *)MEMORY[0x24BE1A880];
  if (!v4)
    v5 = (_QWORD *)MEMORY[0x24BE1A888];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v5, *MEMORY[0x24BE1A658]);
  return v3;
}

- (void)_handleAskForHelpNowAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewController _makeEventForAskForHelp](self, "_makeEventForAskForHelp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v5);

  -[CDPUICustodianAskHelpViewModel getHelpNowOption](self->_viewModel, "getHelpNowOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "escapeAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CDPUICustodianAskHelpViewModel getHelpNowOption](self->_viewModel, "getHelpNowOption");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "escapeAction");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  else
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CDPUICustodianAskHelpViewController _handleAskForHelpNowAction:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)_handleDontAskForHelpAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewController _makeEventForDontAskForHelp](self, "_makeEventForDontAskForHelp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", v5);

  -[CDPUICustodianAskHelpViewModel dontAskForHelpOption](self->_viewModel, "dontAskForHelpOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDPUICustodianAskHelpViewModel dontAskForHelpOption](self->_viewModel, "dontAskForHelpOption");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleEscapeAction:", self);

  }
  else
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPUICustodianAskHelpViewController _handleDontAskForHelpAction:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (id)_getHelpNowButtonTitle
{
  void *v2;
  void *v3;

  -[CDPUICustodianAskHelpViewModel getHelpNowOption](self->_viewModel, "getHelpNowOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dontAskForHelpButtonTitle
{
  void *v2;
  void *v3;

  -[CDPUICustodianAskHelpViewModel dontAskForHelpOption](self->_viewModel, "dontAskForHelpOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "escapeOfferName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_buttonIdentifiersJoinedByComma
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (_QWORD *)MEMORY[0x24BE1A880];
  }
  else
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_6;
    v6 = (_QWORD *)MEMORY[0x24BE1A888];
  }
  objc_msgSend(v3, "addObject:", *v6);
LABEL_6:
  -[CDPUICustodianAskHelpViewModel getHelpNowOption](self->_viewModel, "getHelpNowOption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CDPUICustodianAskHelpViewModel getHelpNowOption](self->_viewModel, "getHelpNowOption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleTelemetryKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[CDPUICustodianAskHelpViewModel dontAskForHelpOption](self->_viewModel, "dontAskForHelpOption");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CDPUICustodianAskHelpViewModel dontAskForHelpOption](self->_viewModel, "dontAskForHelpOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleTelemetryKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "aaf_arrayAsCommaSeperatedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_makeEventForAskForHelp
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A660], *MEMORY[0x24BE1A860]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewModel getHelpNowOption](self->_viewModel, "getHelpNowOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleTelemetryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE1A658]);

  return v3;
}

- (id)_makeEventForDontAskForHelp
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithContext:eventName:category:", self->_cdpContext, *MEMORY[0x24BE1A660], *MEMORY[0x24BE1A860]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUICustodianAskHelpViewModel dontAskForHelpOption](self->_viewModel, "dontAskForHelpOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleTelemetryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE1A658]);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)_handleAskForHelpNowAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20DC8F000, a1, a3, "@\"Escape action for 'Get help now' is nil\", a5, a6, a7, a8, 0);
}

- (void)_handleDontAskForHelpAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20DC8F000, a1, a3, "@\"Escape option for 'Dont ask for help' is nil\", a5, a6, a7, a8, 0);
}

@end
