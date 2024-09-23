@implementation SKProductPageExtension

- (void)finishWithResult:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  -[SKProductPageExtension _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__SKProductPageExtension_finishWithResult_completion___block_invoke;
    v8[3] = &unk_1E5B26758;
    v9 = v6;
    objc_msgSend(v7, "finishWithResult:completion:", a3, v8);

  }
  else
  {
    -[SKProductPageExtension dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  }

}

uint64_t __54__SKProductPageExtension_finishWithResult_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)loadDidFinish
{
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *MEMORY[0x1E0DC45C0];
  -[SKProductPageExtension view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

  -[SKProductPageExtension _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "loadDidFinish");
    v5 = v6;
  }

}

- (void)userDidInteractWithProduct:(unint64_t)a3
{
  void *v4;
  id v5;

  -[SKProductPageExtension _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "userDidInteractWithProduct:", a3);
    v4 = v5;
  }

}

- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4
{
  return 1;
}

- (void)clientLookupItemDidLoad:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("isViewOnly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[SKProductPageExtension setShowsStoreButton:](self, "setShowsStoreButton:", 0);
  -[SKProductPageExtension _createNavigationItem](self, "_createNavigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKProductPageExtension promptString](self, "promptString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKProductPageExtension setupWithCustomNavigationItem:promptString:askToBuy:](self, "setupWithCustomNavigationItem:promptString:askToBuy:", v9, v10, -[SKProductPageExtension askToBuy](self, "askToBuy"));

  LODWORD(v9) = -[SKProductPageExtension lookupItemDidLoad:parameters:](self, "lookupItemDidLoad:parameters:", v7, v6);
  if ((_DWORD)v9)
    -[SKProductPageExtension loadDidFinish](self, "loadDidFinish");
}

- (void)cancelButtonPressed:(id)a3
{
  -[SKProductPageExtension finishWithResult:completion:](self, "finishWithResult:completion:", 0, 0);
}

- (void)rightBarButtonPressed:(id)a3
{
  -[SKProductPageExtension finishWithResult:completion:](self, "finishWithResult:completion:", 2, 0);
}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC85EB8);
}

+ (id)serviceInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC9F2D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_clientLookupItemDidLoad_parameters_, 0, 0);

  return v2;
}

- (id)_createNavigationItem
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3A48]);
  -[SKProductPageExtension cancelButtonTitle](self, "cancelButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v6 = v5;
  if (v4)
  {
    -[SKProductPageExtension cancelButtonTitle](self, "cancelButtonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, sel_cancelButtonPressed_);
    objc_msgSend(v3, "setLeftBarButtonItem:", v8);

  }
  else
  {
    v7 = (void *)objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", 0, self, sel_cancelButtonPressed_);
    objc_msgSend(v3, "setLeftBarButtonItem:", v7);
  }

  if (-[SKProductPageExtension showsRightBarButton](self, "showsRightBarButton"))
  {
    -[SKProductPageExtension rightBarButtonTitle](self, "rightBarButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
      -[SKProductPageExtension rightBarButtonTitle](self, "rightBarButtonTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v11, 0, self, sel_rightBarButtonPressed_);
      objc_msgSend(v3, "setRightBarButtonItem:", v12);
LABEL_9:

      return v3;
    }
  }
  if (-[SKProductPageExtension showsStoreButton](self, "showsStoreButton"))
  {
    v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("VIEW_IN_STORE"), &stru_1E5B2D460, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v12, 0, self, sel_storeButtonPressed_);
    objc_msgSend(v3, "setRightBarButtonItem:", v14);

    goto LABEL_9;
  }
  return v3;
}

- (void)_setShowsStoreButton:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setShowsStoreButton:](self, "setShowsStoreButton:", v3);
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR))
      -[SKProductPageExtension _setShowsStoreButton:].cold.1();
  }
}

- (void)_setCancelButtonTitle:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setCancelButtonTitle:](self, "setCancelButtonTitle:", v4);
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR))
      -[SKProductPageExtension _setCancelButtonTitle:].cold.1();
  }

}

- (void)_setRightBarButtonTitle:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setRightBarButtonTitle:](self, "setRightBarButtonTitle:", v4);
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR))
      -[SKProductPageExtension _setRightBarButtonTitle:].cold.1();
  }

}

- (void)_setShowsRightBarButton:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setShowsRightBarButton:](self, "setShowsRightBarButton:", v3);
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR))
      -[SKProductPageExtension _setShowsRightBarButton:].cold.1();
  }
}

- (void)_setPromptString:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setPromptString:](self, "setPromptString:", v4);
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR))
      -[SKProductPageExtension _setPromptString:].cold.1();
  }

}

- (void)_setAskToBuy:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setAskToBuy:](self, "setAskToBuy:", v3);
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR))
      -[SKProductPageExtension _setAskToBuy:].cold.1();
  }
}

- (void)_setUsageContext:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setUsageContext:](self, "setUsageContext:", v4);
  }
  else
  {
    if (SKLogHandleForCategory_onceToken != -1)
      dispatch_once(&SKLogHandleForCategory_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)SKLogHandleForCategory_logHandles_9, OS_LOG_TYPE_ERROR))
      -[SKProductPageExtension _setUsageContext:].cold.1();
  }

}

- (void)_setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[SKProductPageExtension _isClientEntitled](self, "_isClientEntitled"))
  {
    -[SKProductPageExtension setupWithClientBundleID:bagType:](self, "setupWithClientBundleID:bagType:", v7, a4);
  }
  else
  {
    -[SKProductPageExtension _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKProductPageExtension setupWithClientBundleID:bagType:](self, "setupWithClientBundleID:bagType:", v6, a4);

  }
}

- (BOOL)_isClientEntitled
{
  uint64_t v4;

  if (!_os_feature_enabled_impl())
    return 1;
  -[SKProductPageExtension _hostAuditToken](self, "_hostAuditToken");
  return +[SKEntitlementChecker isProcessEntitled:entitlementName:](SKEntitlementChecker, "isProcessEntitled:entitlementName:", &v4, CFSTR("com.apple.itunesstored.private"));
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (void)setShowsStoreButton:(BOOL)a3
{
  self->_showsStoreButton = a3;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (NSString)rightBarButtonTitle
{
  return self->_rightBarButtonTitle;
}

- (void)setRightBarButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)showsRightBarButton
{
  return self->_showsRightBarButton;
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  self->_showsRightBarButton = a3;
}

- (NSString)promptString
{
  return self->_promptString;
}

- (void)setPromptString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (void)setAskToBuy:(BOOL)a3
{
  self->_askToBuy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptString, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
}

- (void)_setShowsStoreButton:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "[%{public}@]: Client not entitled to show store button", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setCancelButtonTitle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "[%{public}@]: Client not entitled to set cancel button title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setRightBarButtonTitle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "[%{public}@]: Client not entitled to set bar button title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setShowsRightBarButton:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "[%{public}@]: Client not entitled to set right bar button", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setPromptString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "[%{public}@]: Client not entitled to set prompt string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setAskToBuy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "[%{public}@]: Client not entitled to set ATB", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_setUsageContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1ABFBE000, v0, v1, "[%{public}@]: Client not entitled to set usage context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
