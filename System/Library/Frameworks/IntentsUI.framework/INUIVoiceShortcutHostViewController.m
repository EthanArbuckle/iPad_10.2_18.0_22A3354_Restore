@implementation INUIVoiceShortcutHostViewController

- (void)setServiceContext:(id)a3
{
  INUIVoiceShortcutHostContext *v4;
  INUIVoiceShortcutHostContext *serviceContext;
  INUIVoiceShortcutHostContext *v6;

  v4 = (INUIVoiceShortcutHostContext *)a3;
  -[INUIVoiceShortcutHostContext setDelegate:](self->_serviceContext, "setDelegate:", 0);
  serviceContext = self->_serviceContext;
  self->_serviceContext = v4;
  v6 = v4;

  -[INUIVoiceShortcutHostContext setDelegate:](self->_serviceContext, "setDelegate:", self);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[INUIVoiceShortcutHostViewController mode](self, "mode");
  v6 = CFSTR("Unknown");
  if (v5 == 1)
    v6 = CFSTR("Add");
  if (v5 == 2)
    v6 = CFSTR("Edit");
  v7 = v6;
  v8 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[INUIVoiceShortcutHostViewController viewServiceDidTerminateWithError:]";
    v11 = 2112;
    v12 = v7;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1DC055000, v8, OS_LOG_TYPE_INFO, "%s VoiceShortcutUIExtension view service (for %@) terminated with error=%{public}@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[INUIVoiceShortcutHostViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "remoteViewControllerDidCreateVoiceShortcut:error:", v8, v6);

}

- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[INUIVoiceShortcutHostViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "remoteViewControllerDidUpdateVoiceShortcut:error:", v8, v6);

}

- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INUIVoiceShortcutHostViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:", v5);

}

- (void)remoteViewControllerDidCancel
{
  id v2;

  -[INUIVoiceShortcutHostViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "remoteViewControllerDidCancel");

}

- (INUIVoiceShortcutRemoteViewControllerDelegate)delegate
{
  return (INUIVoiceShortcutRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (INUIVoiceShortcutHostContext)serviceContext
{
  return self->_serviceContext;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

+ (id)_voiceShortcutUIExtension
{
  if (_voiceShortcutUIExtension_onceToken != -1)
    dispatch_once(&_voiceShortcutUIExtension_onceToken, &__block_literal_global);
  return (id)_voiceShortcutUIExtension_extension;
}

+ (void)getViewControllerForAddingShortcut:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  dispatch_group_t v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;

  v6 = a3;
  v7 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  v8 = v6;
  v36 = v8;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  v32 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = MEMORY[0x1E0C809B0];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke;
  v26 = &unk_1EA43A258;
  v11 = v8;
  v27 = v11;
  v29 = v31;
  v30 = v35;
  v28 = v9;
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler();
  dispatch_group_enter(v28);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_4;
  v19[3] = &unk_1EA43A280;
  v21 = v31;
  v22 = v33;
  v12 = v28;
  v20 = v12;
  objc_msgSend(a1, "getViewControllerCompletion:", v19);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_6;
  block[3] = &unk_1EA43A2A8;
  v15 = v7;
  v16 = v33;
  v17 = v35;
  v18 = v31;
  v13 = v7;
  dispatch_group_notify(v12, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
}

+ (void)getViewControllerForEditingVoiceShortcut:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__INUIVoiceShortcutHostViewController_getViewControllerForEditingVoiceShortcut_completion___block_invoke;
  v10[3] = &unk_1EA43A2D0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "getViewControllerCompletion:", v10);

}

+ (void)getViewControllerCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_voiceShortcutUIExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]";
      v22 = 2114;
      v23 = v5;
      _os_log_impl(&dword_1DC055000, v6, OS_LOG_TYPE_INFO, "%s Instantiating view controller from extension: %{public}@", buf, 0x16u);
    }
    v7 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "path");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "UTF8String");
    v11 = (const char *)sandbox_extension_issue_file();

    v18[0] = CFSTR("INUIVoiceShortcutExtensionItemBundleURL");
    v18[1] = CFSTR("INUIVoiceShortcutExtensionItemSandboxExtensionData");
    v19[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v11, strlen(v11) + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInfo:", v13);

    v17 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__INUIVoiceShortcutHostViewController_getViewControllerCompletion___block_invoke;
    v15[3] = &unk_1EA43A6D8;
    v16 = v4;
    objc_msgSend(v5, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", v14, 0, v15);

  }
  else
  {
    INIntentError();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v7);
  }

}

+ (id)exportedInterface
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerHostingInterface](INUIVoiceShortcutXPCInterface, "remoteViewControllerHostingInterface");
}

+ (id)serviceViewControllerInterface
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerServingInterface](INUIVoiceShortcutXPCInterface, "remoteViewControllerServingInterface");
}

void __67__INUIVoiceShortcutHostViewController_getViewControllerCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  char isKindOfClass;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v12 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]_block_invoke";
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_1DC055000, v12, OS_LOG_TYPE_ERROR, "%s Failed to instantiate view service: %{public}@", buf, 0x16u);
    }
    v13 = *(_QWORD *)(a1 + 32);
    INIntentError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);
    goto LABEL_12;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = *MEMORY[0x1E0CBD670];
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]_block_invoke";
      v19 = 2114;
      v20 = v8;
      _os_log_error_impl(&dword_1DC055000, v11, OS_LOG_TYPE_ERROR, "%s Unexpected remoteViewController class: %{public}@", buf, 0x16u);
    }
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected remoteViewController class: %@"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

LABEL_12:
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "+[INUIVoiceShortcutHostViewController getViewControllerCompletion:]_block_invoke";
    v19 = 2114;
    v20 = v8;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1DC055000, v11, OS_LOG_TYPE_INFO, "%s Got view controller %{public}@ identifier=%{public}@", buf, 0x20u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_13:

}

void __91__INUIVoiceShortcutHostViewController_getViewControllerForEditingVoiceShortcut_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setMode:", 2);
    objc_msgSend(v5, "remoteViewControllerProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildForEditingVoiceShortcut:", *(_QWORD *)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 136315650;
      v12 = "+[INUIVoiceShortcutHostViewController getViewControllerForAddingShortcut:completion:]_block_invoke";
      v13 = 2112;
      v14 = v10;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1DC055000, v8, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{publc}@: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    v9 = a1 + 48;
  }
  else
  {
    v9 = a1 + 56;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[INUIVoiceShortcutHostViewController getViewControllerForAddingShortcut:completion:]_block_invoke";
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1DC055000, v7, OS_LOG_TYPE_ERROR, "%s Error getting hosted view controller, error: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__INUIVoiceShortcutHostViewController_getViewControllerForAddingShortcut_completion___block_invoke_6(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "setMode:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "remoteViewControllerProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildForAddingShortcut:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  }
  (*(void (**)(void))(a1[4] + 16))();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

void __64__INUIVoiceShortcutHostViewController__voiceShortcutUIExtension__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.WorkflowUI.AddShortcutExtension"), &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)_voiceShortcutUIExtension_extension;
  _voiceShortcutUIExtension_extension = v0;

  if (!_voiceShortcutUIExtension_extension)
  {
    v3 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v6 = "+[INUIVoiceShortcutHostViewController _voiceShortcutUIExtension]_block_invoke";
      v7 = 2112;
      v8 = v1;
      _os_log_error_impl(&dword_1DC055000, v3, OS_LOG_TYPE_ERROR, "%s Could not get VoiceShortcutUI extension: %@", buf, 0x16u);
    }
  }

}

@end
