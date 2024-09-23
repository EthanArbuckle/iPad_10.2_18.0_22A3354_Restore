@implementation FBSystemAppProxyServiceServer

void __84__FBSystemAppProxyServiceServer__handleSystemApplicationBundleIdentifier_forClient___block_invoke(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  id v4;

  v2 = (const char *)*MEMORY[0x1E0D22ED8];
  v3 = a2;
  FBSystemAppBundleID();
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v3, v2, (const char *)objc_msgSend(v4, "UTF8String"));

}

+ (id)targetQueue
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global);
  return (id)sharedInstance___SharedInstance;
}

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = v9;
    switch(a4)
    {
      case 0:
        -[FBSystemAppProxyServiceServer _handleSystemApplicationBundleIdentifier:forClient:](self, "_handleSystemApplicationBundleIdentifier:forClient:", v12, v9);
        break;
      case 1:
        -[FBSystemAppProxyServiceServer _handleGetPasscodeLockedOrBlockedStatus:forClient:](self, "_handleGetPasscodeLockedOrBlockedStatus:forClient:", v12, v9);
        break;
      case 2:
        -[FBSystemAppProxyServiceServer _handleGetProcessHandle:forClient:](self, "_handleGetProcessHandle:forClient:", v12, v9);
        break;
      case 3:
        -[FBSystemAppProxyServiceServer _handleActions:forClient:](self, "_handleActions:forClient:", v12, v9);
        break;
      case 4:
        -[FBSystemAppProxyServiceServer _handleTerminateApplication:forClient:](self, "_handleTerminateApplication:forClient:", v12, v9);
        break;
      case 5:
        -[FBSystemAppProxyServiceServer _handleTerminateApplicationGroup:forClient:](self, "_handleTerminateApplicationGroup:forClient:", v12, v9);
        break;
      case 6:
        -[FBSystemAppProxyServiceServer _handleShutdown:forClient:](self, "_handleShutdown:forClient:", v12, v9);
        break;
      default:
        break;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("client"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSystemAppProxyServiceServer noteDidReceiveMessage:withType:fromClient:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)_handleSystemApplicationBundleIdentifier:(id)a3 forClient:(id)a4
{
  objc_msgSend(a3, "sendReplyMessageWithPacker:", &__block_literal_global_5, a4);
}

void __47__FBSystemAppProxyServiceServer_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  FBSystemAppProxyServiceServer *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D22FB0], "serial");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "serviceClass:", 25);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)BSDispatchQueueCreate();

  v2 = [FBSystemAppProxyServiceServer alloc];
  objc_msgSend(MEMORY[0x1E0D23258], "_queueWithSerialDispatchQueue:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FBSystemAppProxyServiceServer _initWithQueue:](v2, "_initWithQueue:", v3);
  v5 = (void *)sharedInstance___SharedInstance;
  sharedInstance___SharedInstance = v4;

}

- (id)_initWithQueue:(id)a3
{
  uint64_t v4;
  FBSystemAppProxyServiceServer *v5;
  FBServiceClientAuthenticator *v6;
  FBServiceClientAuthenticator *shutdownAuthenticator;
  objc_super v9;

  v4 = *MEMORY[0x1E0D22EB8];
  v9.receiver = self;
  v9.super_class = (Class)FBSystemAppProxyServiceServer;
  v5 = -[FBSServiceFacility initWithIdentifier:queue:](&v9, sel_initWithIdentifier_queue_, v4, a3);
  if (v5)
  {
    v6 = -[FBServiceClientAuthenticator initWithEntitlement:]([FBServiceClientAuthenticator alloc], "initWithEntitlement:", CFSTR("com.apple.frontboard.shutdown"));
    shutdownAuthenticator = v5->_shutdownAuthenticator;
    v5->_shutdownAuthenticator = v6;

  }
  return v5;
}

- (void)_handleGetPasscodeLockedOrBlockedStatus:(id)a3 forClient:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke;
  v9[3] = &unk_1E4A11FD0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performAsync:", v9);

}

void __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_2;
  v2[3] = &unk_1E4A11FA8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "isPasscodeLockedOrBlockedWithResult:", v2);

}

uint64_t __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_3;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __83__FBSystemAppProxyServiceServer__handleGetPasscodeLockedOrBlockedStatus_forClient___block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0D22EC8], *(_BYTE *)(a1 + 32));
}

- (void)_handleGetProcessHandle:(id)a3 forClient:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[32];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "processHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.frontboard.application-process-handle"));

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v5, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeStringFromXPCDictionaryWithKey();
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "processesForBundleIdentifier:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = (void *)MEMORY[0x1E0D87D68];
        objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleForPredicate:error:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          +[FBProcessManager sharedInstance](FBProcessManager, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "auditToken");
          objc_msgSend(v17, "registerProcessForAuditToken:", v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = 0;
        }

      }
    }
    else
    {
      v13 = 0;
    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__FBSystemAppProxyServiceServer__handleGetProcessHandle_forClient___block_invoke;
    v21[3] = &unk_1E4A11FF8;
    v22 = v13;
    v20 = v13;
    objc_msgSend(v5, "sendReplyMessageWithPacker:", v21);

  }
  else
  {
    FBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "processHandle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      FBSProcessPrettyDescription();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1A359A000, v10, OS_LOG_TYPE_DEFAULT, "[FBSystemService] %{public}@ is not permitted to acquire application process handles.", buf, 0xCu);

    }
  }

}

void __67__FBSystemAppProxyServiceServer__handleGetProcessHandle_forClient___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "handle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (void)_handleActions:(id)a3 forClient:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke;
  v17[3] = &unk_1E4A12068;
  v18 = v11;
  v19 = v8;
  v20 = v10;
  v21 = v5;
  v13 = v5;
  v14 = v10;
  v15 = v8;
  v16 = v11;
  objc_msgSend(v12, "performAsync:", v17);

}

void __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_2;
  v5[3] = &unk_1E4A12040;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleActions:source:withResult:", v3, v4, v5);

}

uint64_t __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_3;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v4[4] = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __58__FBSystemAppProxyServiceServer__handleActions_forClient___block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  int64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0D22EE0], v2);
}

- (void)_handleTerminateApplication:(id)a3 forClient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int int64;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.multitasking.termination")) & 1) != 0)
  {
    objc_msgSend(v5, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    BSDeserializeStringFromXPCDictionaryWithKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E0D22F08]);
      v11 = xpc_dictionary_get_BOOL(v8, (const char *)*MEMORY[0x1E0D22F10]);
      BSDeserializeStringFromXPCDictionaryWithKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      FBLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "pid");
        BSProcessDescriptionForPID();
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v14;
        v21 = 2114;
        v22 = v9;
        v23 = 2114;
        v24 = v12;
        _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Request received from %{public}@ to terminate application %{public}@: \"%{public}@\", buf, 0x20u);

      }
      +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_18;
      v17[3] = &unk_1E4A11FA8;
      v18 = v5;
      objc_msgSend(v15, "terminateApplication:forReason:andReport:withDescription:completion:", v9, int64, v11, v12, v17);

    }
    else
    {
      objc_msgSend(v5, "sendReplyMessageWithPacker:", &__block_literal_global_16);
    }

  }
  else
  {
    FBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = CFSTR("com.apple.multitasking.termination");
      _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "Entitlement %@ required to kill applications.", buf, 0xCu);
    }

    objc_msgSend(v5, "sendReplyMessageWithPacker:", &__block_literal_global_14);
  }

}

void __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke(uint64_t a1, void *a2)
{
  const char *v2;
  xpc_object_t xdict;

  v2 = (const char *)*MEMORY[0x1E0D22EE0];
  xdict = a2;
  xpc_dictionary_set_int64(xdict, v2, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0D22EF0], "client not entitled");

}

void __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v2;
  xpc_object_t xdict;

  v2 = (const char *)*MEMORY[0x1E0D22EE0];
  xdict = a2;
  xpc_dictionary_set_int64(xdict, v2, 22);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0D22EF0], "invalid bundle identifier");

}

uint64_t __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_18(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_2_19;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __71__FBSystemAppProxyServiceServer__handleTerminateApplication_forClient___block_invoke_2_19(uint64_t a1, void *a2)
{
  id v3;
  int64_t v4;
  xpc_object_t xdict;

  v3 = a2;
  if (*(_BYTE *)(a1 + 32))
    v4 = 0;
  else
    v4 = 3;
  xdict = v3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0D22EE0], v4);
  if (!*(_BYTE *)(a1 + 32))
    xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0D22EF0], "found nothing to terminate");

}

- (void)_handleTerminateApplicationGroup:(id)a3 forClient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int int64;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.multitasking.termination")) & 1) != 0)
  {
    objc_msgSend(v5, "payload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E0D22F00]);
    int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E0D22F08]);
    v11 = xpc_dictionary_get_BOOL(v8, (const char *)*MEMORY[0x1E0D22F10]);
    BSDeserializeStringFromXPCDictionaryWithKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "pid");
      BSProcessDescriptionForPID();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = (int)v9;
      FBSApplicationTerminationGroupDescription();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Request received from %{public}@ to terminate %{public}@: \"%{public}@\", buf, 0x20u);

    }
    else
    {
      v9 = (int)v9;
    }

    +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_22;
    v18[3] = &unk_1E4A11FA8;
    v19 = v5;
    objc_msgSend(v17, "terminateApplicationGroup:forReason:andReport:withDescription:completion:", v9, int64, v11, v12, v18);

  }
  else
  {
    FBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = CFSTR("com.apple.multitasking.termination");
      _os_log_impl(&dword_1A359A000, v16, OS_LOG_TYPE_DEFAULT, "Entitlement %@ required to kill applications.", buf, 0xCu);
    }

    objc_msgSend(v5, "sendReplyMessageWithPacker:", &__block_literal_global_21);
  }

}

void __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke(uint64_t a1, void *a2)
{
  const char *v2;
  xpc_object_t xdict;

  v2 = (const char *)*MEMORY[0x1E0D22EE0];
  xdict = a2;
  xpc_dictionary_set_int64(xdict, v2, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0D22EF0], "client not entitled");

}

uint64_t __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_22(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5 = a2;
  return objc_msgSend(v2, "sendReplyMessageWithPacker:", v4);
}

void __76__FBSystemAppProxyServiceServer__handleTerminateApplicationGroup_forClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int64_t v4;
  xpc_object_t xdict;

  v3 = a2;
  if (*(_BYTE *)(a1 + 32))
    v4 = 0;
  else
    v4 = 3;
  xdict = v3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0D22EE0], v4);
  if (!*(_BYTE *)(a1 + 32))
    xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0D22EF0], "found nothing to terminate");

}

- (void)_handleShutdown:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  FBServiceClientAuthenticator *shutdownAuthenticator;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  shutdownAuthenticator = self->_shutdownAuthenticator;
  v22 = 0;
  v9 = -[FBServiceClientAuthenticator authenticateClient:error:](shutdownAuthenticator, "authenticateClient:error:", v7, &v22);
  v10 = v22;
  if (v9)
  {
    +[FBSystemService sharedInstance](FBSystemService, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__FBSystemAppProxyServiceServer__handleShutdown_forClient___block_invoke;
    v18[3] = &unk_1E4A120D0;
    v19 = v6;
    v20 = v7;
    v21 = v11;
    v13 = v11;
    objc_msgSend(v12, "performAsync:", v18);

  }
  else
  {
    FBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "processHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      FBSProcessPrettyDescription();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CB2D68]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2114;
      v26 = v17;
      _os_log_impl(&dword_1A359A000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService] %{public}@ is not permitted to initate system shutdown: %{public}@", buf, 0x16u);

    }
  }

}

void __59__FBSystemAppProxyServiceServer__handleShutdown_forClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeBSXPCEncodableObjectFromXPCDictionary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  FBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1A359A000, v4, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Request received to shutdown system from client: %{public}@ with options: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  v6 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "processHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shutdownWithOptions:origin:", v3, v7);

}

- (void)noteClientDidConnect:(id)a3 withMessage:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D232D0];
  v6 = a3;
  objc_msgSend(v5, "messageWithPacker:", &__block_literal_global_24);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBSServiceFacility sendMessage:withType:toClients:](self, "sendMessage:withType:toClients:", v8, 0, v7);
}

void __66__FBSystemAppProxyServiceServer_noteClientDidConnect_withMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D23008];
  v3 = a2;
  objc_msgSend(v2, "processHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownAuthenticator, 0);
}

- (void)noteDidReceiveMessage:(const char *)a1 withType:(uint64_t)a2 fromClient:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("FBSystemAppProxyServiceServer.m");
  v16 = 1024;
  v17 = 252;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
