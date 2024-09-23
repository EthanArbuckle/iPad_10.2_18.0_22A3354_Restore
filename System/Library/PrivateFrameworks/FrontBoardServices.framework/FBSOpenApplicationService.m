@implementation FBSOpenApplicationService

- (void)openApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(off_1E38E9E58, "processHandle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:](self, "_openApplication:withOptions:clientHandle:completion:", v10, v9, v11, v8);

}

- (void)_openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  FBSOpenApplicationService *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  FBSOpenApplicationService *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  if (v14)
  {
    NSClassFromString(CFSTR("BSProcessHandle"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSProcessHandleClass]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:].cold.3();
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EAB1CLL);
    }
  }

  v15 = v10;
  if (v15)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:].cold.2();
      objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EAB80);
    }
  }

  v16 = v11;
  if (v16)
  {
    NSClassFromString(CFSTR("FBSOpenApplicationOptions"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:FBSOpenApplicationOptionsClass]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:].cold.1();
      objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19A6EABE4);
    }
  }

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke;
  v37[3] = &unk_1E38ECF90;
  v17 = v15;
  v38 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AECA324](v37);
  -[FBSOpenApplicationService _remoteTarget](self, "_remoteTarget");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v30 = self;
    objc_msgSend(v16, "actions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#04x"), arc4random() % 0xFFFF);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "count");
    FBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        objc_msgSend(v20, "fbs_singleLineDescriptionOfBSActions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v21;
        v41 = 2114;
        v42 = v17;
        v43 = 2114;
        v44 = v25;
        _os_log_impl(&dword_19A6D4000, v23, OS_LOG_TYPE_DEFAULT, "[FBSSystemService][%{public}@] Sending request to open \"%{public}@\" with action(s): %{public}@", buf, 0x20u);

      }
    }
    else if (v24)
    {
      *(_DWORD *)buf = 138543618;
      v40 = v21;
      v41 = 2114;
      v42 = v17;
      _os_log_impl(&dword_19A6D4000, v23, OS_LOG_TYPE_DEFAULT, "[FBSSystemService][%{public}@] Sending request to open \"%{public}@\", buf, 0x16u);
    }

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_51;
    v31[3] = &unk_1E38ECFB8;
    v35 = v18;
    v32 = v21;
    v33 = v17;
    v36 = v13;
    v34 = v30;
    v26 = v21;
    objc_msgSend(v19, "openApplication:withOptions:originator:requestID:completion:", v33, v16, v14, v26, v31);

    goto LABEL_16;
  }
  if (v13)
  {
    ((void (**)(_QWORD, uint64_t, const __CFString *, _QWORD))v18)[2](v18, 5, CFSTR("System shell connection is invalid."), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v20);
LABEL_16:

  }
}

- (id)_remoteTarget
{
  void *v3;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[BSServiceConnection activate](self->_connection, "activate");
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)serviceName
{
  return +[FBSOpenApplicationServiceSpecification identifier](FBSOpenApplicationServiceSpecification, "identifier");
}

+ (FBSOpenApplicationService)serviceWithDefaultShellEndpoint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(off_1E38E9E20, "environmentAliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "defaultShellMachName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveMachService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBSOpenApplicationServiceSpecification identifier](FBSOpenApplicationServiceSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "endpointForMachName:service:instance:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[FBSOpenApplicationService _initWithEndpoint:]([FBSOpenApplicationService alloc], "_initWithEndpoint:", v6);
  else
    v7 = 0;

  return (FBSOpenApplicationService *)v7;
}

- (id)_initWithEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  FBSOpenApplicationService *v8;
  uint64_t v9;
  BSServiceConnection *connection;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *callbackQueue;
  BSServiceConnection *v16;
  id v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  FBSOpenApplicationService *v23;
  objc_super v24;

  v4 = a3;
  NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSOpenApplicationService _initWithEndpoint:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EF33CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSOpenApplicationService _initWithEndpoint:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A6EF3A0);
  }

  +[FBSOpenApplicationServiceSpecification identifier](FBSOpenApplicationServiceSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("service of endpoint is incorrect"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSOpenApplicationService _initWithEndpoint:].cold.2();
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)FBSOpenApplicationService;
  v8 = -[FBSOpenApplicationService init](&v24, sel_init);
  if (v8)
  {
    objc_msgSend(off_1E38E9E60, "connectionWithEndpoint:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    connection = v8->_connection;
    v8->_connection = (BSServiceConnection *)v9;

    +[FBSOpenApplicationServiceSpecification serviceQuality](FBSOpenApplicationServiceSpecification, "serviceQuality");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E38E9DF8, "serial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceClass:relativePriority:", objc_msgSend(v11, "serviceClass"), objc_msgSend(v11, "relativePriority"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSDispatchQueueCreate();
    callbackQueue = v8->_callbackQueue;
    v8->_callbackQueue = (OS_dispatch_queue *)v14;

    v16 = v8->_connection;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__FBSOpenApplicationService__initWithEndpoint___block_invoke;
    v21[3] = &unk_1E38ECF18;
    v22 = v11;
    v23 = v8;
    v17 = v11;
    -[BSServiceConnection configureConnection:](v16, "configureConnection:", v21);
    -[BSServiceConnection activate](v8->_connection, "activate");

  }
  return v8;
}

void __47__FBSOpenApplicationService__initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setServiceQuality:", v3);
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  +[FBSOpenApplicationServiceSpecification interface](FBSOpenApplicationServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_16);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FBSOpenApplicationService;
  -[FBSOpenApplicationService dealloc](&v3, sel_dealloc);
}

- (FBSOpenApplicationService)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  FBSOpenApplicationService *v8;
  void *v9;
  void *v10;

  objc_msgSend(off_1E38E9E20, "environmentAliases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "defaultShellMachName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveMachService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSOpenApplicationServiceSpecification identifier](FBSOpenApplicationServiceSpecification, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "endpointForMachName:service:instance:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (FBSOpenApplicationService *)-[FBSOpenApplicationService _initWithEndpoint:](self, "_initWithEndpoint:", v7);
  }
  else
  {
    +[FBSOpenApplicationServiceSpecification identifier](FBSOpenApplicationServiceSpecification, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E38E9E68, "nullEndpointForService:instance:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (FBSOpenApplicationService *)-[FBSOpenApplicationService _initWithEndpoint:](self, "_initWithEndpoint:", v10);

  }
  return v8;
}

+ (FBSOpenApplicationService)serviceWithEndpoint:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[FBSOpenApplicationService _initWithEndpoint:]([FBSOpenApplicationService alloc], "_initWithEndpoint:", v3);

  return (FBSOpenApplicationService *)v4;
}

+ (BOOL)currentProcessServicesDefaultShellEndpoint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(off_1E38E9E68, "defaultShellMachName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSOpenApplicationServiceSpecification identifier](FBSOpenApplicationServiceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E88, "bootstrapConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainForMachName:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceForIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bs_jobLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.lsd"));

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("what part about LaunchServices-only did you not understand?"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSOpenApplicationService openApplication:withOptions:clientHandle:completion:].cold.3();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A727FF4);
  }
  v16 = v11;
  NSClassFromString(CFSTR("BSProcessHandle"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSOpenApplicationService openApplication:withOptions:clientHandle:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A728058);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSProcessHandleClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSOpenApplicationService openApplication:withOptions:clientHandle:completion:].cold.1();
    goto LABEL_13;
  }

  -[FBSOpenApplicationService _openApplication:withOptions:clientHandle:completion:](self, "_openApplication:withOptions:clientHandle:completion:", v19, v10, v16, v12);
}

- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  if (v6)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[FBSOpenApplicationService _remoteTarget](self, "_remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __55__FBSOpenApplicationService_canOpenApplication_reason___block_invoke;
      v12[3] = &unk_1E38ECF40;
      v12[4] = self;
      v12[5] = &v13;
      objc_msgSend(v7, "canOpenApplication:completion:", v6, v12);
      v9 = v14;
      if (!a4)
      {
LABEL_5:
        v10 = v9[3] == 0;

        _Block_object_dispose(&v13, 8);
        goto LABEL_8;
      }
    }
    else
    {
      v9 = v14;
      v14[3] = 8;
      if (!a4)
        goto LABEL_5;
    }
    *a4 = v9[3];
    goto LABEL_5;
  }
  v10 = 0;
  if (a4)
    *a4 = 2;
LABEL_8:

  return v10;
}

void __55__FBSOpenApplicationService_canOpenApplication_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("FBSOpenApplicationErrorDomain"));

    if (v5)
      v6 = objc_msgSend(v7, "code");
    else
      v6 = 8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
    v3 = v7;
  }

}

id __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_2;
  v14[3] = &unk_1E38ECF68;
  v15 = *(id *)(a1 + 32);
  v16 = v7;
  v17 = v8;
  v18 = a2;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "bs_errorWithDomain:code:configuration:", CFSTR("FBSOpenApplicationServiceErrorDomain"), a2, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1[4];
  v8 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("The request to open \"%@\" failed."), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFailureDescription:", v5);

  if (a1[5])
    v6 = CFSTR("%@");
  else
    v6 = 0;
  objc_msgSend(v8, "setFailureReason:", v6, a1[5]);
  FBSOpenApplicationServiceErrorCodeToString(a1[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCodeDescription:", v7);

  objc_msgSend(v8, "setUnderlyingError:", a1[6]);
}

void __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_51(_QWORD *a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(CFSTR("FBSOpenApplicationServiceErrorDomain"), "isEqualToString:", v8);

    if (v9)
    {
      v10 = v7;
      goto LABEL_19;
    }
    if (objc_msgSend(v7, "isBSServiceConnectionError"))
    {
      objc_msgSend(off_1E38E9E60, "currentContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "remoteProcess");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        FBSProcessPrettyDescription(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("The system shell (%@) probably crashed."), v17);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = CFSTR("The system shell probably crashed.");
      }

    }
    else
    {
      v18 = 0;
    }
    (*(void (**)(void))(a1[7] + 16))();
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_19:
      FBLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_51_cold_1((uint64_t)a1, v10, v11);
      goto LABEL_21;
    }
  }
  else if ((int)-[__CFString pid](v5, "pid") >= 1 && (-[__CFString isValid](v5, "isValid") & 1) == 0)
  {
    (*(void (**)(void))(a1[7] + 16))();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_19;
  }
  FBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[4];
    v13 = CFSTR("(process was not provided)");
    if (v5)
      v13 = v5;
    *(_DWORD *)buf = 138543618;
    v21 = v12;
    v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_19A6D4000, v11, OS_LOG_TYPE_DEFAULT, "[FBSSystemService][%{public}@] Request successful: %{public}@", buf, 0x16u);
  }
  v10 = 0;
LABEL_21:

  v19 = a1[8];
  if (v19)
    (*(void (**)(uint64_t, __CFString *, id))(v19 + 16))(v19, v5, v10);

}

- (void)_initWithEndpoint:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithEndpoint:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)openApplication:withOptions:clientHandle:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)openApplication:withOptions:clientHandle:completion:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_openApplication:withOptions:clientHandle:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_openApplication:withOptions:clientHandle:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_openApplication:withOptions:clientHandle:completion:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __82__FBSOpenApplicationService__openApplication_withOptions_clientHandle_completion___block_invoke_51_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = v4;
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_ERROR, "[FBSSystemService][%{public}@] Error handling open request for %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);

}

@end
