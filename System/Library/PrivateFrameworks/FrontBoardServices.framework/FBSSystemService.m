@implementation FBSSystemService

- (id)systemApplicationBundleIdentifier
{
  return -[FBSSystemAppProxy systemApplicationBundleIdentifier](self->_systemAppProxy, "systemApplicationBundleIdentifier");
}

uint64_t __27__FBSSystemService_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkin");
}

- (FBSSystemService)init
{
  return -[FBSSystemService initWithEndpoint:](self, "initWithEndpoint:", 0);
}

- (int)pidForApplication:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  if (!a3)
    return -1;
  v3 = (objc_class *)MEMORY[0x1E0CFE2F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "applicationInfoForApplication:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "intValue");
    else
      v9 = -1;

  }
  else
  {
    v9 = -1;
  }
  objc_msgSend(v5, "invalidate");

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultOpenApplicationService, 0);
  objc_storeStrong((id *)&self->_systemAppProxy, 0);
}

- (void)dealloc
{
  FBSSystemAppProxy *v3;
  NSObject *v4;
  FBSSystemAppProxy *v5;
  objc_super v6;
  _QWORD block[4];
  FBSSystemAppProxy *v8;

  v3 = self->_systemAppProxy;
  +[FBSSystemService clientCallbackQueue](FBSSystemService, "clientCallbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__FBSSystemService_dealloc__block_invoke;
  block[3] = &unk_1E38EAE78;
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)FBSSystemService;
  -[FBSSystemService dealloc](&v6, sel_dealloc);
}

+ (id)clientCallbackQueue
{
  if (clientCallbackQueue_onceToken != -1)
    dispatch_once(&clientCallbackQueue_onceToken, &__block_literal_global_50_0);
  return (id)clientCallbackQueue_queue;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_12);
  return (id)sharedService___SharedService;
}

- (FBSSystemService)initWithEndpoint:(id)a3
{
  id v4;
  FBSSystemService *v5;
  uint64_t v6;
  FBSSystemAppProxy *systemAppProxy;
  uint64_t v8;
  FBSOpenApplicationService *defaultOpenApplicationService;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBSSystemService;
  v5 = -[FBSSystemService init](&v11, sel_init);
  if (v5)
  {
    +[FBSSystemAppProxy checkoutProxyWithEndpoint:](FBSSystemAppProxy, "checkoutProxyWithEndpoint:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    systemAppProxy = v5->_systemAppProxy;
    v5->_systemAppProxy = (FBSSystemAppProxy *)v6;

    if (!v4)
    {
      +[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint");
      v8 = objc_claimAutoreleasedReturnValue();
      defaultOpenApplicationService = v5->_defaultOpenApplicationService;
      v5->_defaultOpenApplicationService = (FBSOpenApplicationService *)v8;

    }
  }

  return v5;
}

void __33__FBSSystemService_sharedService__block_invoke()
{
  FBSSystemService *v0;
  void *v1;

  v0 = objc_alloc_init(FBSSystemService);
  v1 = (void *)sharedService___SharedService;
  sharedService___SharedService = (uint64_t)v0;

}

- (BOOL)isPasscodeLockedOrBlocked
{
  return -[FBSSystemAppProxy isPasscodeLockedOrBlocked](self->_systemAppProxy, "isPasscodeLockedOrBlocked");
}

- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4
{
  FBSOpenApplicationService *defaultOpenApplicationService;

  defaultOpenApplicationService = self->_defaultOpenApplicationService;
  if (defaultOpenApplicationService)
    return -[FBSOpenApplicationService canOpenApplication:reason:](defaultOpenApplicationService, "canOpenApplication:reason:", a3, a4);
  if (a4)
    *a4 = 8;
  return 0;
}

- (void)openApplication:(id)a3 options:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[FBSSystemService openApplication:options:clientPort:withResult:](self, "openApplication:options:clientPort:withResult:", v10, v9, -[FBSSystemService createClientPort](self, "createClientPort"), v8);

}

- (void)sendActions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  FBSSystemService *v10;
  FBSSystemAppProxy *systemAppProxy;
  FBSSystemService *v12;
  id v13;
  _QWORD v14[4];
  FBSSystemService *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  FBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "fbs_singleLineDescriptionOfBSActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v9;
    _os_log_impl(&dword_19A6D4000, v8, OS_LOG_TYPE_DEFAULT, "[FBSSystemService] Sending action(s): %{public}@", buf, 0xCu);

  }
  v10 = self;
  systemAppProxy = v10->_systemAppProxy;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__FBSSystemService_sendActions_withResult___block_invoke;
  v14[3] = &unk_1E38EC7F0;
  v15 = v10;
  v16 = v7;
  v12 = v10;
  v13 = v7;
  -[FBSSystemAppProxy sendActions:withResult:](systemAppProxy, "sendActions:withResult:", v6, v14);

}

uint64_t __43__FBSSystemService_sendActions_withResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6
{
  -[FBSSystemService terminateApplication:forReason:andReport:withDescription:completion:](self, "terminateApplication:forReason:andReport:withDescription:completion:", a3, a4, a5, a6, 0);
}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  FBSSystemService *v13;
  FBSSystemAppProxy *systemAppProxy;
  FBSSystemService *v15;
  id v16;
  _QWORD v17[4];
  FBSSystemService *v18;
  id v19;

  v8 = a5;
  v12 = a7;
  v13 = self;
  systemAppProxy = v13->_systemAppProxy;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__FBSSystemService_terminateApplication_forReason_andReport_withDescription_completion___block_invoke;
  v17[3] = &unk_1E38EC818;
  v18 = v13;
  v19 = v12;
  v15 = v13;
  v16 = v12;
  -[FBSSystemAppProxy terminateApplication:forReason:andReport:withDescription:completion:](systemAppProxy, "terminateApplication:forReason:andReport:withDescription:completion:", a3, a4, v8, a6, v17);

}

uint64_t __88__FBSSystemService_terminateApplication_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6
{
  -[FBSSystemService terminateApplicationGroup:forReason:andReport:withDescription:completion:](self, "terminateApplicationGroup:forReason:andReport:withDescription:completion:", a3, a4, a5, a6, 0);
}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  FBSSystemService *v13;
  FBSSystemAppProxy *systemAppProxy;
  FBSSystemService *v15;
  id v16;
  _QWORD v17[4];
  FBSSystemService *v18;
  id v19;

  v8 = a5;
  v12 = a7;
  v13 = self;
  systemAppProxy = v13->_systemAppProxy;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__FBSSystemService_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke;
  v17[3] = &unk_1E38EC818;
  v18 = v13;
  v19 = v12;
  v15 = v13;
  v16 = v12;
  -[FBSSystemAppProxy terminateApplicationGroup:forReason:andReport:withDescription:completion:](systemAppProxy, "terminateApplicationGroup:forReason:andReport:withDescription:completion:", a3, a4, v8, a6, v17);

}

uint64_t __93__FBSSystemService_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)openApplication:(id)a3 options:(id)a4 clientPort:(unsigned int)a5 withResult:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  FBSOpenApplicationService *defaultOpenApplicationService;
  NSObject *v16;
  id *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!a5)
  {
    v14 = v13;
    defaultOpenApplicationService = self->_defaultOpenApplicationService;
    if (defaultOpenApplicationService)
    {
      +[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke;
      v21[3] = &unk_1E38EC840;
      v17 = &v22;
      v22 = v14;
      -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:](defaultOpenApplicationService, "_openApplication:withOptions:clientHandle:completion:", v11, v16, 0, v21);
    }
    else
    {
      if (!v13)
      {
LABEL_7:

        return;
      }
      +[FBSSystemService clientCallbackQueue](FBSSystemService, "clientCallbackQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke_2;
      block[3] = &unk_1E38EB3B8;
      v17 = &v20;
      v20 = v14;
      dispatch_async(v16, block);
    }

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("clientPort == 0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[FBSSystemService openApplication:options:clientPort:withResult:].cold.1(a2, (uint64_t)self, (uint64_t)v18);
  objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("FBSOpenApplicationServiceErrorDomain"));

  if (v5)
  {
    objc_msgSend(v11, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;

      v11 = v8;
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v11;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);
    v10 = v11;
  }

}

void __66__FBSSystemService_openApplication_options_clientPort_withResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  id v10;

  v8 = *(_QWORD *)(a1 + 32);
  FBSOpenApplicationErrorCreate((void *)8, CFSTR("This system service instance does not support \"openApplication\"), a3, a4, a5, a6, a7, a8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);

}

- (void)openURL:(id)a3 application:(id)a4 options:(id)a5 clientPort:(unsigned int)a6 withResult:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  void *v14;
  id v15;

  v8 = *(_QWORD *)&a6;
  v15 = a3;
  v12 = a4;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("__PayloadURL"));
  -[FBSSystemService openApplication:options:clientPort:withResult:](self, "openApplication:options:clientPort:withResult:", v12, v14, v8, v13);

}

- (unsigned)createClientPort
{
  return 0;
}

- (id)processHandleForApplication:(id)a3
{
  if (!a3)
    return 0;
  -[FBSSystemAppProxy processHandleForBundleID:](self->_systemAppProxy, "processHandleForBundleID:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)badgeValueForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(getUISApplicationStateClass()), "initWithBundleIdentifier:", v3);

  objc_msgSend(v4, "badgeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setBadgeValue:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_msgSend(objc_alloc(getUISApplicationStateClass()), "initWithBundleIdentifier:", v5);

  objc_msgSend(v7, "setBadgeValue:", v6);
}

- (void)dataResetWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)getDDRResetOptionsClass());
  objc_msgSend(v7, "setHideProgress:", ((unint64_t)objc_msgSend(v5, "options") >> 1) & 1);
  objc_msgSend(v7, "setEraseDataPlan:", objc_msgSend(v5, "options") & 1);
  v8 = objc_msgSend(v5, "mode") - 1;
  if (v8 > 3)
    v9 = 0;
  else
    v9 = qword_19A767F30[v8];
  v10 = objc_alloc((Class)getDDRResetRequestClass());
  objc_msgSend(v5, "reason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithMode:options:reason:", v9, v7, v11);

  objc_msgSend(getDDRResetServiceClass(), "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__FBSSystemService_dataResetWithRequest_completion___block_invoke;
  v15[3] = &unk_1E38EBC60;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "resetWithRequest:completion:", v12, v15);

}

uint64_t __52__FBSSystemService_dataResetWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

- (void)reboot
{
  FBSShutdownOptions *v3;

  v3 = -[FBSShutdownOptions initWithReason:]([FBSShutdownOptions alloc], "initWithReason:", CFSTR("GenericReboot"));
  -[FBSShutdownOptions setRebootType:](v3, "setRebootType:", 1);
  -[FBSSystemService shutdownWithOptions:](self, "shutdownWithOptions:", v3);

}

- (void)shutdown
{
  FBSShutdownOptions *v3;

  v3 = -[FBSShutdownOptions initWithReason:]([FBSShutdownOptions alloc], "initWithReason:", CFSTR("GenericShutdown"));
  -[FBSSystemService shutdownWithOptions:](self, "shutdownWithOptions:", v3);

}

- (void)shutdownWithOptions:(id)a3
{
  -[FBSSystemAppProxy shutdownWithOptions:](self->_systemAppProxy, "shutdownWithOptions:", a3);
}

- (void)setKeyboardFocusApplicationWithBundleID:(id)a3 pid:(int)a4 completion:(id)a5
{
  -[FBSSystemService setKeyboardFocusApplicationPID:completion:](self, "setKeyboardFocusApplicationPID:completion:", *(_QWORD *)&a4, a5);
}

- (void)setKeyboardFocusApplicationPID:(int)a3 deferringToken:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  FBSSystemService *v9;
  FBSSystemAppProxy *systemAppProxy;
  FBSSystemService *v11;
  id v12;
  _QWORD v13[4];
  FBSSystemService *v14;
  id v15;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = self;
  systemAppProxy = v9->_systemAppProxy;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__FBSSystemService_setKeyboardFocusApplicationPID_deferringToken_completion___block_invoke;
  v13[3] = &unk_1E38EC868;
  v14 = v9;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  -[FBSSystemAppProxy setKeyboardFocusApplication:deferringToken:completion:](systemAppProxy, "setKeyboardFocusApplication:deferringToken:completion:", v6, a4, v13);

}

uint64_t __77__FBSSystemService_setKeyboardFocusApplicationPID_deferringToken_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setKeyboardFocusApplicationPID:(int)a3 completion:(id)a4
{
  -[FBSSystemService setKeyboardFocusApplicationPID:deferringToken:completion:](self, "setKeyboardFocusApplicationPID:deferringToken:completion:", *(_QWORD *)&a3, 0, a4);
}

void __39__FBSSystemService_clientCallbackQueue__block_invoke()
{
  uint64_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)clientCallbackQueue_queue;
  clientCallbackQueue_queue = Serial;

}

- (void)openApplication:(uint64_t)a3 options:clientPort:withResult:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSSystemService.m");
  v16 = 1024;
  v17 = 186;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
