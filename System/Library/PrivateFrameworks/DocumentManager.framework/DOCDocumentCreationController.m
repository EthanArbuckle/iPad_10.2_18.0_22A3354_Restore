@implementation DOCDocumentCreationController

- (id)initForBrowserViewController:(id)a3
{
  id v4;
  DOCDocumentCreationController *v5;
  DOCDocumentCreationController *v6;
  NSString *activeDocumentCreationIntent;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DOCDocumentCreationController;
  v5 = -[DOCDocumentCreationController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserViewController, v4);
    activeDocumentCreationIntent = v6->_activeDocumentCreationIntent;
    v6->_activeDocumentCreationIntent = 0;

  }
  return v6;
}

- (void)willBeginSession
{
  if (!self->_hasActiveSession)
    -[DOCDocumentCreationController _sendDidBeginToLandingPresenter](self, "_sendDidBeginToLandingPresenter");
}

- (void)didEndSessionWithImportedURL:(id)a3 canceled:(BOOL)a4 error:(id)a5
{
  if (self->_hasActiveSession)
    -[DOCDocumentCreationController _sendDidEndToLandingPresenterWithImportedURL:canceled:error:](self, "_sendDidEndToLandingPresenterWithImportedURL:canceled:error:", a3, a4, a5);
}

- (void)didDenyCreateDocumentSessionWithError:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;

  v4 = a3;
  if (self->_hasActiveSession)
  {
    v5 = (NSObject **)MEMORY[0x24BE2DF90];
    v6 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[DOCDocumentCreationController didDenyCreateDocumentSessionWithError:].cold.1();
  }
  else
  {
    -[DOCDocumentCreationController _sendDidBeginToLandingPresenter](self, "_sendDidBeginToLandingPresenter");
    -[DOCDocumentCreationController _sendDidEndToLandingPresenterWithImportedURL:canceled:error:](self, "_sendDidEndToLandingPresenterWithImportedURL:canceled:error:", 0, 1, v4);
  }

}

- (void)_sendDidBeginToLandingPresenter
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_209052000, v0, v1, "Failed to send 'willStart' - bad landingPresenter: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sendDidEndToLandingPresenterWithImportedURL:(id)a3 canceled:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *activeDocumentCreationIntent;
  uint8_t v16[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  self->_hasActiveSession = 0;
  v10 = (NSObject **)MEMORY[0x24BE2DF70];
  v11 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_209052000, v11, OS_LOG_TYPE_DEFAULT, "Sending 'didEnd' to landingPresenter", v16, 2u);
  }
  -[DOCDocumentCreationController browserViewController](self, "browserViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentLandingPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_2545C5498))
  {
    objc_msgSend(v13, "documentLandingBrowserDidEndDocumentCreation:importedURL:canceled:error:", v12, v8, v6, v9);
  }
  else if (v13)
  {
    v14 = *v10;
    if (!*v10)
    {
      DOCInitLogging();
      v14 = *v10;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[DOCDocumentCreationController _sendDidEndToLandingPresenterWithImportedURL:canceled:error:].cold.1();
  }
  if (!self->_hasActiveSession)
  {
    activeDocumentCreationIntent = self->_activeDocumentCreationIntent;
    self->_activeDocumentCreationIntent = 0;

  }
}

- (BOOL)handlesDidRequestDocumentCreation
{
  unint64_t v3;
  void *v4;
  char v5;

  v3 = -[DOCDocumentCreationController underlyingHandlerType](self, "underlyingHandlerType");
  if (v3 == 1 || v3 == 2)
  {
    -[DOCDocumentCreationController underylingHandler](self, "underylingHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)performDidRequestDocumentCreationWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  unint64_t v8;
  id WeakRetained;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DOCDocumentCreationController willBeginSession](self, "willBeginSession");
  -[DOCDocumentCreationController underylingHandler](self, "underylingHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSObject **)MEMORY[0x24BE2DF70];
  v7 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_209052000, v7, OS_LOG_TYPE_DEFAULT, "Sending 'document creation request' to creationHandler: %@", (uint8_t *)&v11, 0xCu);
  }
  v8 = -[DOCDocumentCreationController underlyingHandlerType](self, "underlyingHandlerType");
  if (v8)
  {
    if (v8 == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
      objc_msgSend(v5, "documentLandingBrowser:didRequestDocumentCreationWithHandler:", WeakRetained, v4);
      goto LABEL_14;
    }
    if (v8 == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
      objc_msgSend(v5, "documentBrowser:didRequestDocumentCreationWithHandler:", WeakRetained, v4);
LABEL_14:

    }
  }
  else
  {
    v10 = *v6;
    if (!*v6)
    {
      DOCInitLogging();
      v10 = *v6;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[DOCDocumentCreationController performDidRequestDocumentCreationWithHandler:].cold.1();
  }

}

- (void)performDidImportDocumentAtURL:(id)a3 toDestinationURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  NSObject **v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DOCDocumentCreationController underylingHandler](self, "underylingHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (NSObject **)MEMORY[0x24BE2DF70];
    v10 = *MEMORY[0x24BE2DF70];
    if (!*MEMORY[0x24BE2DF70])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_DEFAULT, "Sending 'did import' to creationHandler: %@", (uint8_t *)&v14, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    objc_msgSend(v8, "documentBrowser:didImportDocumentAtURL:toDestinationURL:", WeakRetained, v6, v7);
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *MEMORY[0x24BE2DF70];
    if (!*MEMORY[0x24BE2DF70])
    {
      v13 = (NSObject **)MEMORY[0x24BE2DF70];
      DOCInitLogging();
      v12 = *v13;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_DEFAULT, "Sending 'did import' to landingPresenter: %@", (uint8_t *)&v14, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    objc_msgSend(v8, "documentLandingBrowser:didImportDocumentAtURL:toDestinationURL:", WeakRetained, v6, v7);
    goto LABEL_13;
  }
LABEL_14:
  -[DOCDocumentCreationController didEndSessionWithImportedURL:canceled:error:](self, "didEndSessionWithImportedURL:canceled:error:", v7, 0, 0);

}

- (void)performFailedToImportDocumentAtURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  NSObject **v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DOCDocumentCreationController underylingHandler](self, "underylingHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (NSObject **)MEMORY[0x24BE2DF70];
    v10 = *MEMORY[0x24BE2DF70];
    if (!*MEMORY[0x24BE2DF70])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_DEFAULT, "Sending 'failed to import' to creationHandler: %@", (uint8_t *)&v14, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    objc_msgSend(v8, "documentBrowser:failedToImportDocumentAtURL:error:", WeakRetained, v6, v7);
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *MEMORY[0x24BE2DF70];
    if (!*MEMORY[0x24BE2DF70])
    {
      v13 = (NSObject **)MEMORY[0x24BE2DF70];
      DOCInitLogging();
      v12 = *v13;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_DEFAULT, "Sending 'failed to import' to landingPresenter: %@", (uint8_t *)&v14, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    objc_msgSend(v8, "documentLandingBrowser:failedToImportDocumentAtURL:error:", WeakRetained, v6, v7);
    goto LABEL_13;
  }
LABEL_14:
  -[DOCDocumentCreationController didEndSessionWithImportedURL:canceled:error:](self, "didEndSessionWithImportedURL:canceled:error:", 0, 0, v7);

}

- (BOOL)hasCreationHandlerWithoutValidatingMethodRequirements
{
  UIDocumentBrowserViewController **p_browserViewController;
  id WeakRetained;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;

  p_browserViewController = &self->_browserViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_browserViewController);
    objc_msgSend(v6, "documentLandingPresenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (BOOL)hasCreationHandlerWithRequiredMethods
{
  return -[DOCDocumentCreationController underlyingHandlerType](self, "underlyingHandlerType") != 0;
}

- (void)warnIfNoValidCreationHandler
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = CFSTR("allowsDocumentCreation");
  _os_log_error_impl(&dword_209052000, v5, OS_LOG_TYPE_ERROR, "Warning: You must implement %{public}@ in the %{public}@ if %{public}@ is set to YES.", (uint8_t *)&v8, 0x20u);

}

- (unint64_t)underlyingHandlerType
{
  UIDocumentBrowserViewController **p_browserViewController;
  id WeakRetained;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;

  p_browserViewController = &self->_browserViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_browserViewController);
    objc_msgSend(v6, "documentLandingPresenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "conformsToProtocol:", &unk_2545C5498))
      v5 = 2;
    else
      v5 = 0;
    v4 = v7;
  }

  return v5;
}

- (id)landingPresenter
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
  objc_msgSend(WeakRetained, "documentLandingPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2545C5498))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)underylingHandler
{
  unint64_t v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;

  v3 = -[DOCDocumentCreationController underlyingHandlerType](self, "underlyingHandlerType");
  if (v3 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    objc_msgSend(WeakRetained, "documentLandingPresenter");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 1)
    {
      v6 = 0;
      return v6;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserViewController);
    objc_msgSend(WeakRetained, "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (UIDocumentBrowserViewController)browserViewController
{
  return (UIDocumentBrowserViewController *)objc_loadWeakRetained((id *)&self->_browserViewController);
}

- (NSString)activeDocumentCreationIntent
{
  return self->_activeDocumentCreationIntent;
}

- (void)setActiveDocumentCreationIntent:(id)a3
{
  objc_storeStrong((id *)&self->_activeDocumentCreationIntent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDocumentCreationIntent, 0);
  objc_destroyWeak((id *)&self->_browserViewController);
}

- (void)didDenyCreateDocumentSessionWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_209052000, v0, v1, "Unexpected condition.  Session denied, but found one active", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_sendDidEndToLandingPresenterWithImportedURL:canceled:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_209052000, v0, v1, "Failed to send 'didEnd' - bad landingPresenter: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)performDidRequestDocumentCreationWithHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_209052000, v0, v1, "Failed to send 'document creation request' - creationHandler is 'None'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
