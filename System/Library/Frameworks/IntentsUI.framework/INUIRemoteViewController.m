@implementation INUIRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  INUIRemoteViewController *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INUIRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v7, sel_viewServiceDidTerminateWithError_, v4);
  v5 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v9 = "-[INUIRemoteViewController viewServiceDidTerminateWithError:]";
    v10 = 2114;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_1DC055000, v5, OS_LOG_TYPE_ERROR, "%s Widget remote view controller service did terminate for RVC: %{public}@ error: %{public}@", buf, 0x20u);
  }
  -[INUIRemoteViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "remoteViewControllerServiceDidTerminate:", self);

}

- (id)disconnect
{
  NSExtension *activeExtension;
  NSCopying *currentRequestIdentifier;
  objc_super v6;

  -[NSExtension cancelExtensionRequestWithIdentifier:](self->_activeExtension, "cancelExtensionRequestWithIdentifier:", self->_currentRequestIdentifier);
  activeExtension = self->_activeExtension;
  self->_activeExtension = 0;

  currentRequestIdentifier = self->_currentRequestIdentifier;
  self->_currentRequestIdentifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)INUIRemoteViewController;
  -[_UIRemoteViewController disconnect](&v6, sel_disconnect);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  -[INUIRemoteViewController setDelegate:completion:](self, "setDelegate:completion:", a3, 0);
}

- (void)setDelegate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v6)
  {
    objc_storeWeak((id *)&self->_delegate, v6);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__INUIRemoteViewController_setDelegate_completion___block_invoke;
    v9[3] = &unk_1EA43A588;
    v10 = v7;
    -[INUIRemoteViewController _updateExtensionContextStateWithCompletion:](self, "_updateExtensionContextStateWithCompletion:", v9);

  }
}

- (void)setNeedsStateUpdate:(BOOL)a3
{
  if (self->_needsStateUpdate != a3 && a3)
    -[INUIRemoteViewController _updateExtensionContextStateWithCompletion:](self, "_updateExtensionContextStateWithCompletion:", 0);
}

- (void)setIdealConfiguration:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(id, _QWORD);

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (-[INUIRemoteViewController isWidgetHost](self, "isWidgetHost"))
  {
    -[INUIRemoteViewController widgetDescriptor](self, "widgetDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredSize");
    -[INUIRemoteViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    v8[2](v8, 0);
  }
  else
  {
    objc_msgSend(v7, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INUIExtensionRequestInfo interaction](self->_requestInfo, "interaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "interactiveBehavior");
    v13 = objc_msgSend(v7, "hostedViewContext");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__INUIRemoteViewController_setIdealConfiguration_animated_completion___block_invoke;
    v14[3] = &unk_1EA43A5B0;
    v14[4] = self;
    v15 = v7;
    v16 = v8;
    -[INUIRemoteViewController configureForParameters:ofInteraction:interactiveBehavior:context:completion:](self, "configureForParameters:ofInteraction:interactiveBehavior:context:completion:", v10, v11, v12, v13, v14);

  }
}

- (void)requestCancellation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[INUIRemoteViewController extensionHostContext](self, "extensionHostContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_1111);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "viewWasCancelled");
    v4 = v5;
  }

}

- (void)desiresInteractivity:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, _QWORD))a3;
  -[INUIRemoteViewController extensionHostContext](self, "extensionHostContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "desiresInteractivity:", v4);
  else
    v4[2](v4, 0);

}

- (void)_queryRepresentedPropertiesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INUIRemoteViewController _errorHandlingServiceViewControllerProxy](self, "_errorHandlingServiceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryRepresentedPropertiesWithCompletion:", v4);

}

- (id)_errorHandlingServiceViewControllerProxy
{
  void *v2;
  void *v3;
  void *v4;

  -[INUIRemoteViewController extensionHostContext](self, "extensionHostContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_39);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateExtensionContextStateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _INUIExtensionContextState *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _INUIExtensionHostContext *extensionHostContext;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_needsStateUpdate = 1;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke;
  v19[3] = &unk_1EA43A748;
  objc_copyWeak(&v21, &location);
  v6 = v4;
  v20 = v6;
  v7 = MEMORY[0x1DF0BFCC0](v19);
  v8 = (void *)v7;
  if (self->_extensionHostContext)
  {
    v9 = objc_alloc_init(_INUIExtensionContextState);
    -[INUIRemoteViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_16:
      extensionHostContext = self->_extensionHostContext;
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke_53;
      v17[3] = &unk_1EA43A588;
      v18 = v8;
      -[_INUIExtensionHostContext setExtensionContextState:completion:](extensionHostContext, "setExtensionContextState:completion:", v9, v17);

      goto LABEL_17;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "minimumSizesBySystemVersionForRemoteViewController:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INUIExtensionContextState setHostedViewMinimumAllowedSizes:](v9, "setHostedViewMinimumAllowedSizes:", v11);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_9;
      objc_msgSend(v10, "minimumSizeForRemoteViewController:", self);
      v25 = &unk_1EA43F828;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INUIExtensionContextState setHostedViewMinimumAllowedSizes:](v9, "setHostedViewMinimumAllowedSizes:", v12);

    }
LABEL_9:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "maximumSizesBySystemVersionForRemoteViewController:", self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INUIExtensionContextState setHostedViewMaximumAllowedSizes:](v9, "setHostedViewMaximumAllowedSizes:", v13);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_14;
      objc_msgSend(v10, "maximumSizeForRemoteViewController:", self);
      v23 = &unk_1EA43F828;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INUIExtensionContextState setHostedViewMaximumAllowedSizes:](v9, "setHostedViewMaximumAllowedSizes:", v14);

    }
LABEL_14:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "interfaceSectionsForRemoteViewController:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INUIExtensionContextState setInterfaceSections:](v9, "setInterfaceSections:", v15);

    }
    goto LABEL_16;
  }
  (*(void (**)(uint64_t))(v7 + 16))(v7);
LABEL_17:

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)extensionHostContext:(id)a3 wantsToHandleIntent:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[INUIRemoteViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "remoteViewController:requestsHandlingOfIntent:", self, v6);

}

- (void)extensionHostContextWillBeginEditing:(id)a3
{
  id v4;

  -[INUIRemoteViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "remoteViewControllerWillBeginEditing:", self);

}

- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 errorHandlingCompletion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__INUIRemoteViewController_configureWithInteraction_context_errorHandlingCompletion___block_invoke;
  v10[3] = &unk_1EA43A798;
  v11 = v8;
  v9 = v8;
  -[INUIRemoteViewController configureForParameters:ofInteraction:interactiveBehavior:context:completion:](self, "configureForParameters:ofInteraction:interactiveBehavior:context:completion:", 0, a3, 0, a4, v10);

}

- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[4];
  id v43;

  v10 = a3;
  v11 = a4;
  v12 = a7;
  -[INUIRemoteViewController extensionHostContext](self, "extensionHostContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_auxiliaryConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke;
  v42[3] = &unk_1EA43A7E8;
  v15 = v12;
  v43 = v15;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v42);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 0;
    v17 = objc_alloc(MEMORY[0x1E0CBDD00]);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2;
    v37[3] = &unk_1EA43A810;
    v18 = v15;
    v38 = v18;
    v39 = v40;
    v19 = (void *)objc_msgSend(v17, "initWithTimeoutInterval:timeoutHandler:", v37, 10.0);
    objc_msgSend(v19, "start");
    -[INUIRemoteViewController extensionHostContext](self, "extensionHostContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_auxiliaryConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    if (v21)
      objc_msgSend(v21, "auditToken");
    objc_msgSend(v11, "intent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[INUIRemoteViewController activeExtension](self, "activeExtension");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_extensionBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v35;
    v34 = v36;
    objc_msgSend(v22, "trimDataAgainstTCCForAuditToken:bundle:", &v33, v24);

    v33 = v35;
    v34 = v36;
    INIssueSandboxExtensionsForFileURLEnumerableToProcess();
    objc_msgSend(v11, "intentResponse");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v33 = v35;
      v34 = v36;
      INIssueSandboxExtensionsForFileURLEnumerableToProcess();
    }
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_61;
    v29[3] = &unk_1EA43A860;
    v31 = v18;
    v32 = v40;
    v26 = v19;
    v30 = v26;
    objc_msgSend(v16, "configureForParameters:ofInteraction:interactiveBehavior:context:completion:", v10, v11, a5, a6, v29);

    _Block_object_dispose(v40, 8);
  }

}

- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__INUIRemoteViewController_configureWithInteraction_context_completion___block_invoke;
  v10[3] = &unk_1EA43A888;
  v11 = v8;
  v9 = v8;
  -[INUIRemoteViewController configureWithInteraction:context:errorHandlingCompletion:](self, "configureWithInteraction:context:errorHandlingCompletion:", a3, a4, v10);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (BOOL)needsStateUpdate
{
  return self->_needsStateUpdate;
}

- (INUIExtensionViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (INUIExtensionRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void)_setRequestInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (INUIRemoteViewControllerDelegate)delegate
{
  return (INUIRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isWidgetHost
{
  return self->_widgetHost;
}

- (void)setWidgetHost:(BOOL)a3
{
  self->_widgetHost = a3;
}

- (INWidgetDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (void)setWidgetDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_widgetDescriptor, a3);
}

- (_INUIExtensionHostContext)extensionHostContext
{
  return self->_extensionHostContext;
}

- (void)setExtensionHostContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionHostContext, a3);
}

- (NSExtension)activeExtension
{
  return self->_activeExtension;
}

- (void)setActiveExtension:(id)a3
{
  objc_storeStrong((id *)&self->_activeExtension, a3);
}

- (NSCopying)currentRequestIdentifier
{
  return self->_currentRequestIdentifier;
}

- (void)setCurrentRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_activeExtension, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __72__INUIRemoteViewController_configureWithInteraction_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[INUIRemoteViewController configureForParameters:ofInteraction:interactiveBehavior:context:completion:]_block_invoke";
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_1DC055000, v4, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", buf, 0x16u);
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_59;
    v6[3] = &unk_1EA43A7C0;
    v8 = v5;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD block[4];
  __int128 v4;

  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3;
    block[3] = &unk_1EA43A810;
    v2 = *(_OWORD *)(a1 + 32);
    v1 = (id)v2;
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_61(uint64_t a1, char a2, void *a3, void *a4, double a5, double a6)
{
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  char v21;

  v11 = a3;
  v12 = a4;
  if (*(_QWORD *)(a1 + 40))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2_62;
    v13[3] = &unk_1EA43A838;
    v18 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v21 = a2;
    v15 = v11;
    v19 = a5;
    v20 = a6;
    v16 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
}

uint64_t __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2_62(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "cancel");
    result = (*(uint64_t (**)(double, double))(*(_QWORD *)(v1 + 56) + 16))(*(double *)(v1 + 72), *(double *)(v1 + 80));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
  }
  return result;
}

void __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INUIRemoteViewControllerErrorDomain"), 1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[INUIRemoteViewController configureForParameters:ofInteraction:interactiveBehavior:context:completion:]_block_invoke_3";
      v6 = 2114;
      v7 = v2;
      _os_log_error_impl(&dword_1DC055000, v3, OS_LOG_TYPE_ERROR, "%s Timed out waiting for service view controller configuration: %{public}@", (uint8_t *)&v4, 0x16u);
    }
    (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
}

uint64_t __104__INUIRemoteViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

uint64_t __85__INUIRemoteViewController_configureWithInteraction_context_errorHandlingCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

void __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 1472) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }

}

uint64_t __71__INUIRemoteViewController__updateExtensionContextStateWithCompletion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__INUIRemoteViewController__errorHandlingServiceViewControllerProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[INUIRemoteViewController _errorHandlingServiceViewControllerProxy]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_error_impl(&dword_1DC055000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __49__INUIRemoteViewController_desiresInteractivity___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[INUIRemoteViewController desiresInteractivity:]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_error_impl(&dword_1DC055000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __47__INUIRemoteViewController_requestCancellation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[INUIRemoteViewController requestCancellation]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_error_impl(&dword_1DC055000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve service view controller: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __70__INUIRemoteViewController_setIdealConfiguration_animated_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, double a5, double a6)
{
  void *v11;
  id v12;
  void *v13;
  INUIExtensionViewControllerConfiguration *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a4;
  v11 = *(void **)(a1 + 32);
  v12 = a3;
  objc_msgSend(v11, "setPreferredContentSize:", a5, a6);
  v13 = *(void **)(a1 + 32);
  v14 = -[INUIExtensionViewControllerConfiguration initWithParameters:interactiveBehavior:hostedViewContext:]([INUIExtensionViewControllerConfiguration alloc], "initWithParameters:interactiveBehavior:hostedViewContext:", v12, objc_msgSend(*(id *)(a1 + 40), "interactiveBehavior"), objc_msgSend(*(id *)(a1 + 40), "hostedViewContext"));

  objc_msgSend(v13, "setConfiguration:", v14);
  v15 = *(_QWORD *)(a1 + 48);
  if (v17 || a2)
  {
    (*(void (**)(uint64_t))(v15 + 16))(v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("INUIRemoteViewControllerErrorDomain"), 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  }
}

uint64_t __51__INUIRemoteViewController_setDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (void)requestRemoteViewControllerWithRequestInfo:(id)a3 reply:(id)a4
{
  objc_msgSend(a1, "_requestRemoteViewControllerWithRequestInfo:delegate:reply:", a3, 0, a4);
}

+ (void)_requestRemoteViewControllerForSnippetExtensionInteraction:(id)a3 delegate:(id)a4 connectionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v8, "_snippet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB35D8];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __114__INUIRemoteViewController__requestRemoteViewControllerForSnippetExtensionInteraction_delegate_connectionHandler___block_invoke;
      v14[3] = &unk_1EA43A638;
      v15 = v8;
      v18 = v10;
      v19 = a1;
      v16 = v11;
      v17 = v9;
      objc_msgSend(v12, "_intents_matchSiriUISnippetExtensionsWithCompletion:", v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_INUIRemoteViewControllerErrorDomain"), 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);

    }
  }

}

+ (void)_requestRemoteViewControllerWithRequestInfo:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(id, _QWORD, void *);
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(v8, "interaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v12)
      goto LABEL_3;
LABEL_7:
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2938];
    v32[0] = CFSTR("No valid input intent for remote view controller");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("INUIRemoteViewControllerErrorDomain"), 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v21);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIdentifier:", v18);

  if (!v12)
    goto LABEL_7;
LABEL_3:
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke;
  v25 = &unk_1EA43A638;
  v14 = v12;
  v26 = v14;
  v29 = v10;
  v30 = a1;
  v27 = v9;
  v15 = v8;
  v28 = v15;
  v16 = (void *)MEMORY[0x1DF0BFCC0](&v22);
  if (objc_msgSend(v15, "requiresUserConsent", v22, v23, v24, v25) && objc_msgSend(v14, "_type") != 2)
    objc_msgSend(MEMORY[0x1E0CB35D8], "_intents_matchSiriUIExtensionsForIntent:completion:", v14, v16);
  else
    objc_msgSend(MEMORY[0x1E0CB35D8], "_intents_matchUIExtensionsForIntent:completion:", v14, v16);

  v20 = v26;
LABEL_10:

}

+ (void)_attemptToConnectToRemoteViewControllerForRemainingExtensions:(id)a3 delegate:(id)a4 connectionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke;
      v20[3] = &unk_1EA43A6B0;
      v14 = v11;
      v21 = v14;
      v24 = v10;
      v22 = v9;
      v15 = v8;
      v23 = v15;
      v25 = a1;
      v16 = (void *)MEMORY[0x1DF0BFCC0](v20);
      objc_msgSend(v15, "removeObject:", v14);
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_34;
      v18[3] = &unk_1EA43A6D8;
      v19 = v16;
      v17 = v16;
      objc_msgSend(v14, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v18);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }

  }
}

+ (void)_getWidgetHostingRemoteViewControllerWithIntent:(id)a3 extensionMatchingError:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  void (**v23)(id, _QWORD, id);
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  if (objc_msgSend(v8, "_type") != 2
    || (objc_msgSend(v8, "_codableDescription"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEligibleForWidgets"),
        v11,
        (v12 & 1) == 0))
  {
    v18 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "+[INUIRemoteViewController _getWidgetHostingRemoteViewControllerWithIntent:extensionMatchingError:completionHandler:]";
      v27 = 2112;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      v19 = "%s Error matching extensions for intent: %@ error: %{public}@";
      goto LABEL_15;
    }
LABEL_10:
    v10[2](v10, 0, v9);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CBDD10], "sharedProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptorForIntent:", v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v18 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "+[INUIRemoteViewController _getWidgetHostingRemoteViewControllerWithIntent:extensionMatchingError:completionHandler:]";
      v27 = 2112;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      v19 = "%s Error matching widget extensions for intent: %@ error: %{public}@";
LABEL_15:
      _os_log_error_impl(&dword_1DC055000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0x20u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v14, "preferredSizeClass") > 1)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __117__INUIRemoteViewController__getWidgetHostingRemoteViewControllerWithIntent_extensionMatchingError_completionHandler___block_invoke;
    v20[3] = &unk_1EA43A700;
    v24 = a1;
    v21 = v8;
    v22 = v14;
    v23 = v10;
    v14 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v20);

  }
  else
  {
    v15 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      objc_msgSend(v14, "extensionBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v26 = "+[INUIRemoteViewController _getWidgetHostingRemoteViewControllerWithIntent:extensionMatchingError:completionHandler:]";
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1DC055000, v16, OS_LOG_TYPE_INFO, "%s %@ extension is not able to render medium or large size classes", buf, 0x16u);

    }
    v10[2](v10, 0, v9);
  }

LABEL_11:
}

+ (void)_getWidgetHostingRemoteViewControllerWithIntent:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, INUIRemoteViewController *, _QWORD);
  INUIRemoteViewController *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, INUIRemoteViewController *, _QWORD))a5;
  v10 = objc_alloc_init(INUIRemoteViewController);
  -[INUIRemoteViewController setWidgetHost:](v10, "setWidgetHost:", 1);
  -[INUIRemoteViewController setWidgetDescriptor:](v10, "setWidgetDescriptor:", v8);
  v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v8, "preferredSize");
  v13 = v12;
  objc_msgSend(v8, "preferredSize");
  v15 = (void *)objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, v13, v14);
  -[INUIRemoteViewController setView:](v10, "setView:", v15);

  v16 = objc_msgSend(v8, "preferredSizeClass");
  if ((unint64_t)(v16 - 1) >= 4)
    v17 = 0;
  else
    v17 = v16;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v18 = (void *)getCHSWidgetClass_softClass;
  v43 = getCHSWidgetClass_softClass;
  if (!getCHSWidgetClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getCHSWidgetClass_block_invoke;
    v38 = &unk_1EA43A8B0;
    v39 = &v40;
    __getCHSWidgetClass_block_invoke((uint64_t)&v35);
    v18 = (void *)v41[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v40, 8);
  v20 = [v19 alloc];
  objc_msgSend(v8, "extensionBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kind");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v21, 0, v22, v17, v7);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v24 = (void *)getCHSWidgetMetricsClass_softClass;
  v43 = getCHSWidgetMetricsClass_softClass;
  if (!getCHSWidgetMetricsClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getCHSWidgetMetricsClass_block_invoke;
    v38 = &unk_1EA43A8B0;
    v39 = &v40;
    __getCHSWidgetMetricsClass_block_invoke((uint64_t)&v35);
    v24 = (void *)v41[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v40, 8);
  v26 = [v25 alloc];
  objc_msgSend(v8, "preferredSize");
  v27 = (void *)objc_msgSend(v26, "initWithSize:cornerRadius:");
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v28 = (void *)getCHUISAvocadoHostViewControllerClass_softClass;
  v43 = getCHUISAvocadoHostViewControllerClass_softClass;
  if (!getCHUISAvocadoHostViewControllerClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getCHUISAvocadoHostViewControllerClass_block_invoke;
    v38 = &unk_1EA43A8B0;
    v39 = &v40;
    __getCHUISAvocadoHostViewControllerClass_block_invoke((uint64_t)&v35);
    v28 = (void *)v41[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v40, 8);
  v30 = (void *)objc_msgSend([v29 alloc], "initWithWidget:metrics:widgetConfigurationIdentifier:", v23, v27, 0);
  -[INUIRemoteViewController addChildViewController:](v10, "addChildViewController:", v30);
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIRemoteViewController view](v10, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  objc_msgSend(v31, "setFrame:");

  -[INUIRemoteViewController view](v10, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  objc_msgSend(v30, "didMoveToParentViewController:", v10);
  v9[2](v9, v10, 0);

}

+ (void)requestRemoteViewControllerForInteraction:(id)a3 delegate:(id)a4 connectionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  INUIExtensionRequestInfo *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  if (v8)
  {
    v9 = a4;
    v10 = a3;
    v11 = -[INUIExtensionRequestInfo initWithInteraction:]([INUIExtensionRequestInfo alloc], "initWithInteraction:", v10);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__INUIRemoteViewController_requestRemoteViewControllerForInteraction_delegate_connectionHandler___block_invoke;
    v12[3] = &unk_1EA43A770;
    v13 = v8;
    objc_msgSend(a1, "_requestRemoteViewControllerWithRequestInfo:delegate:reply:", v11, v9, v12);

  }
}

uint64_t __97__INUIRemoteViewController_requestRemoteViewControllerForInteraction_delegate_connectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__INUIRemoteViewController__getWidgetHostingRemoteViewControllerWithIntent_extensionMatchingError_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "_getWidgetHostingRemoteViewControllerWithIntent:descriptor:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  char isKindOfClass;
  NSObject *v13;
  void *v14;
  id *v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v20 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v30 = "+[INUIRemoteViewController _attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connection"
            "Handler:]_block_invoke";
      v31 = 2114;
      v32 = v20;
      v33 = 2114;
      v34 = v9;
      _os_log_error_impl(&dword_1DC055000, v10, OS_LOG_TYPE_ERROR, "%s Error instantiating remote view controller for extension: %{public}@ error: %{public}@", buf, 0x20u);
    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_16:
    v11();
    v16 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = *MEMORY[0x1E0CBD670];
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v21 = v13;
      v22 = (void *)objc_opt_class();
      v23 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v30 = "+[INUIRemoteViewController _attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connection"
            "Handler:]_block_invoke_2";
      v31 = 2114;
      v32 = v22;
      v33 = 2114;
      v34 = v23;
      v24 = v22;
      _os_log_error_impl(&dword_1DC055000, v21, OS_LOG_TYPE_ERROR, "%s Remote view controller is of unexpected class: %{public}@ for extension: %{public}@", buf, 0x20u);

    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v14 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v30 = "+[INUIRemoteViewController _attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connectionHa"
          "ndler:]_block_invoke";
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v14;
    _os_log_impl(&dword_1DC055000, v13, OS_LOG_TYPE_INFO, "%s Instantiated remote view controller: %@ for extension: %@", buf, 0x20u);
  }
  v15 = (id *)v8;
  v16 = v15;
  v17 = *(void **)(a1 + 40);
  if (v17)
    objc_storeWeak(v15 + 187, v17);
  objc_msgSend(v16, "setActiveExtension:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v16, "setCurrentRequestIdentifier:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v16, "setExtensionHostContext:", v18),
        objc_msgSend(v16, "extensionHostContext"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "setExtensionHostContextDelegate:", v16),
        v19,
        *(_QWORD *)(a1 + 40)))
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_31;
    v25[3] = &unk_1EA43A688;
    v28 = *(id *)(a1 + 56);
    v26 = v16;
    v27 = 0;
    objc_msgSend(v26, "_updateExtensionContextStateWithCompletion:", v25);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

LABEL_17:
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
    objc_msgSend(*(id *)(a1 + 64), "_attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connectionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

uint64_t __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__INUIRemoteViewController__attemptToConnectToRemoteViewControllerForRemainingExtensions_delegate_connectionHandler___block_invoke_31(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _BYTE *v19;
  _BYTE buf[24];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 64), "_getWidgetHostingRemoteViewControllerWithIntent:extensionMatchingError:completionHandler:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 56));
    }
    else
    {
      v14 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "+[INUIRemoteViewController _requestRemoteViewControllerWithRequestInfo:delegate:reply:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2114;
        v21 = v6;
        _os_log_error_impl(&dword_1DC055000, v14, OS_LOG_TYPE_ERROR, "%s Error matching extensions for intent: %@ error: %{public}@", buf, 0x20u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = objc_msgSend(v5, "count");
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[INUIRemoteViewController _requestRemoteViewControllerWithRequestInfo:delegate:reply:]_block_invoke";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v21 = v10;
      _os_log_impl(&dword_1DC055000, v8, OS_LOG_TYPE_INFO, "%s Found %zd extensions for intent: %@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v21) = 0;
    v11 = *(void **)(a1 + 64);
    v12 = (void *)objc_msgSend(v5, "mutableCopy");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke_27;
    v16[3] = &unk_1EA43A660;
    v13 = *(_QWORD *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v19 = buf;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v11, "_attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connectionHandler:", v12, v13, v16);

    _Block_object_dispose(buf, 8);
  }

}

void __87__INUIRemoteViewController__requestRemoteViewControllerWithRequestInfo_delegate_reply___block_invoke_27(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "_setRequestInfo:", a1[4]);
  v6 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    *(_BYTE *)(v6 + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __114__INUIRemoteViewController__requestRemoteViewControllerForSnippetExtensionInteraction_delegate_connectionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0CBD670];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v20 = a1[4];
      *(_DWORD *)buf = 136315650;
      v22 = "+[INUIRemoteViewController _requestRemoteViewControllerForSnippetExtensionInteraction:delegate:connectionHan"
            "dler:]_block_invoke";
      v23 = 2112;
      v24 = v20;
      v25 = 2114;
      v26 = v6;
      _os_log_error_impl(&dword_1DC055000, v7, OS_LOG_TYPE_ERROR, "%s Error matching extensions for interaction: %@ error: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = objc_msgSend(v5, "count");
      v10 = (void *)a1[4];
      *(_DWORD *)buf = 136315650;
      v22 = "+[INUIRemoteViewController _requestRemoteViewControllerForSnippetExtensionInteraction:delegate:connectionHan"
            "dler:]_block_invoke";
      v23 = 2048;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1DC055000, v8, OS_LOG_TYPE_INFO, "%s Found %zd extensions for interaction: %@", buf, 0x20u);

    }
    v11 = (void *)MEMORY[0x1E0CB3880];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithFormat:", CFSTR("(attributes[%@] CONTAINS[c] %@)"), CFSTR("SAUISnippetSubclassNames"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      v16 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(attributes[%@] == nil)"), CFSTR("SAUISnippetSubclassNames"));
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "filteredArrayUsingPredicate:", v17);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (id)v17;
    }

    v18 = (void *)a1[8];
    v19 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v18, "_attemptToConnectToRemoteViewControllerForRemainingExtensions:delegate:connectionHandler:", v19, a1[6], a1[7]);

    v5 = v16;
  }

}

@end
