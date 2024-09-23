@implementation DOCRemoteViewController

+ (id)instantiateRemoteViewControllerWithConfiguration:(id)a3 transparent:(BOOL)a4 errorHandler:(id)a5 hostProxy:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  DOCWeakProxy *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  DOCWeakProxy *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  DOCWeakProxy *v36;
  id v37;
  id v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v10 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[DOCWeakProxy initWithTarget:]([DOCWeakProxy alloc], "initWithTarget:", v14);
  objc_msgSend(a1, "serviceExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke;
  v34[3] = &unk_24C0F11E8;
  v18 = v13;
  v37 = v18;
  v39 = a1;
  v19 = v12;
  v35 = v19;
  v20 = v15;
  v38 = v20;
  v21 = v16;
  v36 = v21;
  +[_UIResilientRemoteViewContainerViewController instantiateWithExtension:completion:](DOCResilientRemoteContainerViewController, "instantiateWithExtension:completion:", v17, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v22, "view", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "subviews");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v28++), "setBackgroundColor:", 0);
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v26);
    }

  }
  return v22;
}

void __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v16[1] = MEMORY[0x24BDAC760];
    v16[2] = 3221225472;
    v16[3] = __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_2;
    v16[4] = &unk_24C0F0738;
    v10 = &v18;
    v18 = *(id *)(a1 + 48);
    v17 = v9;
    DOCRunInMainThread();
    v11 = v17;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "serviceExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_extensionContextForUUID:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHostContext:", v13);

    objc_msgSend(v8, "setConfiguration:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "hostContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_3;
    v15[3] = &unk_24C0F0930;
    v10 = (id *)v16;
    v16[0] = *(id *)(a1 + 48);
    objc_msgSend(v14, "serviceProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  DOCRunInMainThread();

}

uint64_t __129__DOCRemoteViewController_instantiateRemoteViewControllerWithConfiguration_transparent_errorHandler_hostProxy_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)instantiateRemoteDocumentBrowserViewControllerWithHostProxy:(id)a3 configuration:(id)a4 initialUIPBrowserState:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  v14 = v10;
  v35 = v14;
  v15 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke;
  v31[3] = &unk_24C0F1238;
  v16 = v13;
  v32 = v16;
  v33 = v34;
  v17 = (void *)MEMORY[0x20BD0CEF0](v31);
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_3;
  v27[3] = &unk_24C0F1288;
  v18 = v11;
  v28 = v18;
  v19 = v12;
  v29 = v19;
  v20 = v17;
  v30 = v20;
  v21 = (void *)MEMORY[0x20BD0CEF0](v27);
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_5;
  v25[3] = &unk_24C0F0930;
  v22 = v20;
  v26 = v22;
  objc_msgSend(a1, "instantiateRemoteViewControllerWithConfiguration:transparent:errorHandler:hostProxy:completionHandler:", v18, 1, v25, v14, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v34, 8);
  return v23;
}

void __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a2;
  v11 = a3;
  v12 = a4;
  v13 = *(id *)(a1 + 32);
  v8 = v12;
  v9 = v11;
  v10 = v7;
  DOCRunInMainThread();

}

void __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_4;
  v12[3] = &unk_24C0F1260;
  v10 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = v10;
  v11 = v7;
  objc_msgSend(a4, "configureAsDocumentBrowserWithHostProxy:configuration:initialUIPBrowserState:completionBlock:", a3, v8, v9, v12);

}

uint64_t __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, 0);
}

uint64_t __140__DOCRemoteViewController_instantiateRemoteDocumentBrowserViewControllerWithHostProxy_configuration_initialUIPBrowserState_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[DOCRemoteViewController hostContext](self, "hostContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateEditingTo:animated:", v5, v4);

}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
  -[DOCRemoteViewController updateAppearance:shouldFlushCA:completionBlock:](self, "updateAppearance:shouldFlushCA:completionBlock:", a3, 0, a4);
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  -[DOCRemoteViewController updateAppearance:shouldFlushCA:requiresAck:completionBlock:](self, "updateAppearance:shouldFlushCA:requiresAck:completionBlock:", a3, a4, 0, a5);
}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 requiresAck:(BOOL)a5 completionBlock:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v10 = a6;
  v8 = v10;
  v9 = v7;
  DOCRunInMainThread();

}

void __86__DOCRemoteViewController_updateAppearance_shouldFlushCA_requiresAck_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  _QWORD block[4];
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isEqual:", v3))
  {

    goto LABEL_7;
  }
  v4 = *(unsigned __int8 *)(a1 + 56);

  if (v4)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "setLastAppearance:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "hostContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateAppearance:shouldFlushCA:completionBlock:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));

    return;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__DOCRemoteViewController_updateAppearance_shouldFlushCA_requiresAck_completionBlock___block_invoke_2;
    block[3] = &unk_24C0F06E8;
    v7 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __86__DOCRemoteViewController_updateAppearance_shouldFlushCA_requiresAck_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)serviceExtension
{
  if (serviceExtension_onceToken != -1)
    dispatch_once(&serviceExtension_onceToken, &__block_literal_global_43);
  return (id)serviceExtension_browserExtension;
}

void __43__DOCRemoteViewController_serviceExtension__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject **v3;
  NSObject *v4;
  id v5;

  v0 = *MEMORY[0x24BE2DEA8];
  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v0, &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5;
  if (v2)
  {
    v3 = (NSObject **)MEMORY[0x24BE2DF90];
    v4 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__DOCRemoteViewController_serviceExtension__block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)&serviceExtension_browserExtension, v1);
  }

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id *v9;
  id *v10;
  id v11;
  dispatch_time_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD block[4];
  void *v17;
  id v18;

  v4 = a3;
  v5 = (NSObject **)MEMORY[0x24BE2DF90];
  v6 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[DOCRemoteViewController viewServiceDidTerminateWithError:].cold.1();
  -[DOCRemoteViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DOCRemoteViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)objc_opt_class(), "disableWorkaroundFor132033602") & 1) != 0)
    {
      v9 = &v14;
      v14 = v8;
      v10 = &v15;
      v15 = v4;
      v11 = v8;
      DOCRunInMainThread();
    }
    else
    {
      v12 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__DOCRemoteViewController_viewServiceDidTerminateWithError___block_invoke;
      block[3] = &unk_24C0F0648;
      v9 = &v17;
      v17 = v8;
      v10 = &v18;
      v18 = v4;
      v13 = v8;
      dispatch_after(v12, MEMORY[0x24BDAC9B8], block);
    }

  }
}

uint64_t __60__DOCRemoteViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remoteViewControllerDidTerminateViewServiceWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__DOCRemoteViewController_viewServiceDidTerminateWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remoteViewControllerDidTerminateViewServiceWithError:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)disableWorkaroundFor132033602
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableWorkaroundFor132033602"));

  return v3;
}

- (DOCRemoteViewControllerDelegate)delegate
{
  return (DOCRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DOCRemoteContext)hostContext
{
  return (DOCRemoteContext *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setHostContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1488);
}

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_getProperty(self, a2, 1496, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1496);
}

- (BOOL)isBrowserViewController
{
  return self->_isBrowserViewController;
}

- (void)setIsBrowserViewController:(BOOL)a3
{
  self->_isBrowserViewController = a3;
}

- (DOCAppearance)lastAppearance
{
  return (DOCAppearance *)objc_getProperty(self, a2, 1504, 1);
}

- (void)setLastAppearance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1504);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppearance, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __43__DOCRemoteViewController_serviceExtension__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "Failed to get the DocumentManager extension with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)viewServiceDidTerminateWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "The view service did terminate with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
