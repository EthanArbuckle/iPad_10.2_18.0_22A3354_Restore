@implementation CCUIContentModuleContext

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

+ (void)performWithoutAnimationWhileHiddenInWindow:(id)a3 actions:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v6)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (objc_msgSend(a1, "areAnimationsPermittedInWindow:", v7))
      v6[2](v6);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
  }

}

+ (BOOL)areAnimationsPermittedInWindow:(id)a3
{
  id v3;
  int v4;
  BOOL v5;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v3)
  {
    v4 = objc_msgSend(v3, "_contextId");
    v5 = v4 != __animationsDisabledContextID;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sensorActivityDataForActiveSensorType:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[CCUIContentModuleContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentModuleContext:requestsSensorActivityDataForActiveSensorType:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CCUIContentModuleContextDelegate)delegate
{
  return (CCUIContentModuleContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
}

+ (id)_sharedOpenAppService
{
  if (_sharedOpenAppService_onceToken != -1)
    dispatch_once(&_sharedOpenAppService_onceToken, &__block_literal_global_1);
  return (id)_sharedOpenAppService___openAppService;
}

void __49__CCUIContentModuleContext__sharedOpenAppService__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sharedOpenAppService___openAppService;
  _sharedOpenAppService___openAppService = v0;

}

+ (id)_sharedOpenApplicationOptions
{
  if (_sharedOpenApplicationOptions_onceToken != -1)
    dispatch_once(&_sharedOpenApplicationOptions_onceToken, &__block_literal_global_2);
  return (id)_sharedOpenApplicationOptions___options;
}

void __57__CCUIContentModuleContext__sharedOpenApplicationOptions__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D22DA8];
  v3[0] = *MEMORY[0x1E0D22D88];
  v3[1] = v0;
  v4[0] = MEMORY[0x1E0C9AAB0];
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[2] = *MEMORY[0x1E0D22D58];
  v4[2] = CFSTR("CCUIAppLaunchOriginControlCenter");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_sharedOpenApplicationOptions___options;
  _sharedOpenApplicationOptions___options = v1;

}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
}

void __38__CCUIContentModuleContext_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ControlCenter.Module", "AppLauncher");
  v1 = (void *)kApplicationLauncherLog;
  kApplicationLauncherLog = (uint64_t)v0;

}

- (CCUIContentModuleContext)initWithModuleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  CCUIContentModuleContext *v8;
  uint64_t v9;
  NSUUID *uniqueIdentifier;
  uint64_t v11;
  NSString *moduleIdentifier;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CCUIContentModuleContext;
  v8 = -[CCUIContentModuleContext init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSUUID *)v9;

    v11 = objc_msgSend(v6, "copy");
    moduleIdentifier = v8->_moduleIdentifier;
    v8->_moduleIdentifier = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "autoreleaseFrequency:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serviceClass:", 25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = BSDispatchQueueCreate();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v16;

  }
  return v8;
}

- (void)requestAuthenticationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[CCUIContentModuleContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CCUIContentModuleContext_requestAuthenticationWithCompletionHandler___block_invoke;
  block[3] = &unk_1E8E20A78;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __71__CCUIContentModuleContext_requestAuthenticationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  SBSRequestPasscodeUnlockAlertUI();

}

uint64_t __71__CCUIContentModuleContext_requestAuthenticationWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_sharedOpenApplicationOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleContext queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke;
  block[3] = &unk_1E8E20AA0;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, block);

}

void __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = a1[5];
  v10 = 0;
  v5 = objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, v4, &v10);
  v6 = v10;

  v7 = kApplicationLauncherLog;
  if ((_DWORD)v5)
  {
    if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D02ED000, v7, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_ERROR))
  {
    __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke_cold_1(a1 + 4, (uint64_t)v6, v7);
  }
  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v5);

}

- (void)openApplication:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedOpenApplicationOptions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleContext openApplication:withOptions:completionHandler:](self, "openApplication:withOptions:completionHandler:", v7, v8, v6);

}

- (void)openApplication:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "_sharedOpenAppService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke;
  v14[3] = &unk_1E8E20AC8;
  v15 = v7;
  v16 = v8;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "openApplication:withOptions:completion:", v13, v11, v14);

}

void __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = kApplicationLauncherLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_ERROR))
      __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke_cold_1(a1, v7);
  }
  else if (os_log_type_enabled((os_log_t)kApplicationLauncherLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D02ED000, v7, OS_LOG_TYPE_DEFAULT, "Launched application %{public}@", (uint8_t *)&v10, 0xCu);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, v6 == 0);

}

- (void)enqueueStatusUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__CCUIContentModuleContext_enqueueStatusUpdate___block_invoke;
  v6[3] = &unk_1E8E20708;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __48__CCUIContentModuleContext_enqueueStatusUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentModuleContext:enqueueStatusUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setHomeGestureDismissalAllowed:(BOOL)a3
{
  BSDispatchMain();
}

void __59__CCUIContentModuleContext_setHomeGestureDismissalAllowed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "contentModuleContext:didUpdateHomeGestureDismissalAllowed:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)requestExpandModule
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CCUIContentModuleContext_requestExpandModule__block_invoke;
  block[3] = &unk_1E8E20590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __47__CCUIContentModuleContext_requestExpandModule__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestExpandModuleForContentModuleContext:", *(_QWORD *)(a1 + 32));

}

- (void)dismissModule
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CCUIContentModuleContext_dismissModule__block_invoke;
  block[3] = &unk_1E8E20590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __41__CCUIContentModuleContext_dismissModule__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissExpandedViewForContentModuleContext:", *(_QWORD *)(a1 + 32));

}

- (void)dismissControlCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CCUIContentModuleContext_dismissControlCenter__block_invoke;
  block[3] = &unk_1E8E20590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __48__CCUIContentModuleContext_dismissControlCenter__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissControlCenterForContentModuleContext:", *(_QWORD *)(a1 + 32));

}

- (void)requestLayoutSizeUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CCUIContentModuleContext_requestLayoutSizeUpdate__block_invoke;
  block[3] = &unk_1E8E20590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__CCUIContentModuleContext_requestLayoutSizeUpdate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "requestModuleLayoutSizeUpdateForContentModuleContext:", *(_QWORD *)(a1 + 32));

}

- (CCUISensorActivityData)sensorActivityDataEligibleForInactiveMicModeSelection
{
  void *v3;
  void *v4;

  -[CCUIContentModuleContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CCUISensorActivityData *)v4;
}

- (CCUIModuleLayoutSize)moduleLayoutSizeForOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  CCUIModuleLayoutSize result;

  -[CCUIContentModuleContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "moduleLayoutSizeForContentModuleContext:forOrientation:", self, a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }

  v9 = v6;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (BOOL)isDevicePasscodeLocked
{
  void *v3;
  char v4;

  -[CCUIContentModuleContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isDevicePasscodeLockedForContentModuleContext:", self);
  else
    v4 = 0;

  return v4;
}

+ (void)setAnimationsPermitted:(BOOL)a3 inWindow:(id)a4
{
  int v7;
  void *v8;
  id v9;

  v9 = a4;
  if (!v9 && !a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CCUIContentModuleContext.m"), 217, CFSTR("A window is required in order to disable animations"));

  }
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (a3)
    v7 = 0;
  else
    v7 = objc_msgSend(v9, "_contextId");
  __animationsDisabledContextID = v7;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

void __54__CCUIContentModuleContext_openURL_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D02ED000, log, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __74__CCUIContentModuleContext_openApplication_withOptions_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D02ED000, a2, OS_LOG_TYPE_ERROR, "Failed to launch application %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
