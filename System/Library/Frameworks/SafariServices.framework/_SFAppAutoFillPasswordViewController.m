@implementation _SFAppAutoFillPasswordViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFAppAutoFillPasswordViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      -[_SFPasswordViewController remoteViewControllerWillDismiss:](self, "remoteViewControllerWillDismiss:", self->_remoteViewController);
  }

}

- (void)_setUpServiceProxyIfNeeded
{
  SFQueueingServiceViewControllerProxy *v3;
  SFPasswordPickerServiceViewControllerProtocol *serviceProxy;

  if (!self->_serviceProxy)
  {
    v3 = -[SFQueueingServiceViewControllerProxy initWithProtocol:]([SFQueueingServiceViewControllerProxy alloc], "initWithProtocol:", &unk_1EE75D540);
    serviceProxy = self->_serviceProxy;
    self->_serviceProxy = (SFPasswordPickerServiceViewControllerProtocol *)v3;

    -[SFPasswordPickerServiceViewControllerProtocol setDelegate:](self->_serviceProxy, "setDelegate:", self);
  }
}

- (id)_connectToServiceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController _connectToServiceWithCompletion:].cold.1((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72___SFAppAutoFillPasswordViewController__connectToServiceWithCompletion___block_invoke;
  v15[3] = &unk_1E4AC0D40;
  v15[4] = self;
  v16 = v4;
  v12 = v4;
  +[SFPasswordRemoteViewController requestViewControllerWithConnectionHandler:](SFPasswordPickerRemoteViewController, "requestViewControllerWithConnectionHandler:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAppAutoFillPasswordViewController;
  -[_SFAppAutoFillPasswordViewController viewDidLoad](&v4, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], 0);

  -[_SFPasswordViewController _addRemoteViewAsChild](self, "_addRemoteViewAsChild");
}

- (void)authenticateToPresentInPopover:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0D8ABF0];
  v7 = a4;
  objc_msgSend(v6, "defaultContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFAppAutoFillPasswordViewController authenticateToPresentInPopover:savedAccountContext:completion:](self, "authenticateToPresentInPopover:savedAccountContext:completion:", v4, v8, v7);

}

- (void)authenticateToPresentInPopover:(BOOL)a3 savedAccountContext:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SFPasswordPickerServiceViewControllerProtocol *serviceProxy;
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController authenticateToPresentInPopover:savedAccountContext:completion:].cold.1((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
  serviceProxy = self->_serviceProxy;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102___SFAppAutoFillPasswordViewController_authenticateToPresentInPopover_savedAccountContext_completion___block_invoke;
  v19[3] = &unk_1E4AC18A0;
  v19[4] = self;
  v20 = v8;
  v18 = v8;
  -[SFPasswordPickerServiceViewControllerProtocol authenticateToPresentInPopover:savedAccountContext:completion:](serviceProxy, "authenticateToPresentInPopover:savedAccountContext:completion:", v6, v9, v19);

}

- (void)setWebViewURL:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController setWebViewURL:].cold.1();
  -[SFPasswordPickerServiceViewControllerProtocol setWebViewURL:](self->_serviceProxy, "setWebViewURL:", v4);

}

- (void)setRemoteAppID:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController setRemoteAppID:].cold.1();
  -[SFPasswordPickerServiceViewControllerProtocol setRemoteAppID:](self->_serviceProxy, "setRemoteAppID:", v4);

}

- (void)setRemoteLocalizedAppName:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController setRemoteLocalizedAppName:].cold.1();
  -[SFPasswordPickerServiceViewControllerProtocol setRemoteLocalizedAppName:](self->_serviceProxy, "setRemoteLocalizedAppName:", v4);

}

- (void)setRemoteUnlocalizedAppName:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController setRemoteUnlocalizedAppName:].cold.1();
  -[SFPasswordPickerServiceViewControllerProtocol setRemoteUnlocalizedAppName:](self->_serviceProxy, "setRemoteUnlocalizedAppName:", v4);

}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:].cold.1();
  -[SFPasswordPickerServiceViewControllerProtocol setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:](self->_serviceProxy, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:", v4);

}

- (void)setAuthenticationGracePeriod:(double)a3
{
  NSObject *v5;

  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController setAuthenticationGracePeriod:].cold.1((uint64_t)self, v5, a3);
  -[SFPasswordPickerServiceViewControllerProtocol setAuthenticationGracePeriod:](self->_serviceProxy, "setAuthenticationGracePeriod:", a3);
}

- (void)setPageID:(id)a3 frameID:(id)a4 credentialType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  _SFAppAutoFillPasswordViewController *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134218754;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_debug_impl(&dword_1A3B2D000, v11, OS_LOG_TYPE_DEBUG, "In-process view controller %p setPageID: %@ frameID: %@ credentialType: %@", (uint8_t *)&v12, 0x2Au);
  }
  -[SFPasswordPickerServiceViewControllerProtocol setPageID:frameID:credentialType:](self->_serviceProxy, "setPageID:frameID:credentialType:", v8, v9, v10);

}

- (id)_remoteViewController
{
  return self->_remoteViewController;
}

- (void)setSystemAutoFillDocumentTraits:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAppAutoFillPasswordViewController setSystemAutoFillDocumentTraits:].cold.1();
  -[SFPasswordPickerServiceViewControllerProtocol setSystemAutoFillDocumentTraits:](self->_serviceProxy, "setSystemAutoFillDocumentTraits:", v4);

}

- (void)remoteViewController:(id)a3 selectedCredential:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_SFPasswordViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "passwordViewController:selectedCredential:", self, v6);

}

- (void)remoteViewController:(id)a3 fillUsername:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_SFPasswordViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "passwordViewController:fillUsername:", self, v6);

}

- (void)remoteViewController:(id)a3 fillPassword:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_SFPasswordViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "passwordViewController:fillPassword:", self, v6);

}

- (void)remoteViewController:(id)a3 fillVerificationCode:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_SFPasswordViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "passwordViewController:fillVerificationCode:", self, v6);

}

- (void)remoteViewController:(id)a3 fillText:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[_SFPasswordViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "passwordViewController:fillText:", self, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

- (void)_connectToServiceWithCompletion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, a2, a3, "In-process view controller %p attempting to get remote password picker view controller", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)authenticateToPresentInPopover:(uint64_t)a3 savedAccountContext:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, a2, a3, "In-process view controller %p attempting to authenticate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)setWebViewURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "In-process view controller %p setWebViewURL: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setRemoteAppID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "In-process view controller %p setRemoteAppID: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setRemoteLocalizedAppName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "In-process view controller %p setRemoteLocalizedAppName: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setRemoteUnlocalizedAppName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "In-process view controller %p setRemoteUnlocalizedAppName: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "In-process view controller %p setExternallyVerifiedAndApprovedSharedWebCredentialsDomains: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setAuthenticationGracePeriod:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_DEBUG, "In-process view controller %p setAuthenticationGracePeriod: %f", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3_2();
}

- (void)setSystemAutoFillDocumentTraits:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "In-process view controller %p setSystemAutoFillDocumentTraits: %@");
  OUTLINED_FUNCTION_3_2();
}

@end
