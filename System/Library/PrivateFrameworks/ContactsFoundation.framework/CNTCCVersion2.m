@implementation CNTCCVersion2

id __30__CNTCCVersion2_isUnitTesting__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[7];
  if (!v3)
  {
    objc_msgSend(v2, "isUnitTestingImpl");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  return v3;
}

- (id)isUnitTestingImpl
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executablePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("CNTestsHostiOS")) & 1) != 0
    || (objc_msgSend(v3, "hasSuffix:", CFSTR("CNTestsHostiOS_XPC")) & 1) != 0
    || (objc_msgSend(v3, "hasSuffix:", CFSTR("otest")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("xctest"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)checkAuthorizationStatusOfAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  -[CNTCCVersion2 simulateStatus](self, "simulateStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNTCCVersion2 simulateStatus](self, "simulateStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
  }
  else
  {
    if (-[CNTCCVersion2 isUnitTesting](self, "isUnitTesting"))
    {
      v10 = 3;
      goto LABEL_4;
    }
    -[CNTCCVersion2 credentialForAuditToken:assumedIdentity:](self, "credentialForAuditToken:assumedIdentity:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 0;
      -[CNTCCVersion2 messageOptionsForSyncNoPrompt](self, "messageOptionsForSyncNoPrompt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __70__CNTCCVersion2_checkAuthorizationStatusOfAuditToken_assumedIdentity___block_invoke;
      v13[3] = &unk_1E29BB1D8;
      v13[4] = &v14;
      -[CNTCCVersion2 requestAuthorizationWithCredential:messageOptions:completionHandler:](self, "requestAuthorizationWithCredential:messageOptions:completionHandler:", v9, v12, v13);

      v10 = v15[3];
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      v10 = 0;
    }
  }

LABEL_4:
  return v10;
}

- (BOOL)isAuthorizationRestricted
{
  void *v3;

  -[CNTCCVersion2 simulateStatus](self, "simulateStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && !-[CNTCCVersion2 isUnitTesting](self, "isUnitTesting") && TCCAccessRestricted() != 0;
}

- (BOOL)isUnitTesting
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CNTCCVersion2_isUnitTesting__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)simulateStatus
{
  return self->_simulateStatus;
}

- (void)requestAuthorizationWithCredential:(id)a3 messageOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNTCCVersion2 server](self, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTCCVersion2 service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  v17 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  tcc_server_message_request_authorization();

}

- (OS_tcc_service)service
{
  return self->_service;
}

- (OS_tcc_server)server
{
  return self->_server;
}

- (OS_tcc_message_options)messageOptionsForSyncNoPrompt
{
  return self->_messageOptionsForSyncNoPrompt;
}

- (id)credentialForAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "audit_token");
    v8 = tcc_credential_create_for_process_with_audit_token_and_assumed_identity();
  }
  else if (v5)
  {
    objc_msgSend(v5, "audit_token");
    v8 = tcc_credential_create_for_process_with_audit_token();
  }
  else if (v6)
  {
    v8 = tcc_credential_create_for_self_with_assumed_identity();
  }
  else
  {
    tcc_credential_singleton_for_self();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (CNTCCVersion2)init
{
  CNTCCVersion2 *v2;
  uint64_t v3;
  OS_tcc_server *server;
  uint64_t v5;
  OS_tcc_service *service;
  uint64_t v7;
  OS_tcc_message_options *messageOptionsForSyncNoPrompt;
  uint64_t v9;
  OS_tcc_message_options *messageOptionsForAsyncPrompt;
  void *v11;
  CNTCCVersion2 *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CNTCCVersion2;
  v2 = -[CNTCCVersion2 init](&v14, sel_init);
  if (v2)
  {
    v3 = tcc_server_create();
    server = v2->_server;
    v2->_server = (OS_tcc_server *)v3;

    tcc_service_singleton_for_CF_name();
    v5 = objc_claimAutoreleasedReturnValue();
    service = v2->_service;
    v2->_service = (OS_tcc_service *)v5;

    v7 = tcc_message_options_create();
    messageOptionsForSyncNoPrompt = v2->_messageOptionsForSyncNoPrompt;
    v2->_messageOptionsForSyncNoPrompt = (OS_tcc_message_options *)v7;

    tcc_message_options_set_reply_handler_policy();
    tcc_message_options_set_request_prompt_policy();
    v9 = tcc_message_options_create();
    messageOptionsForAsyncPrompt = v2->_messageOptionsForAsyncPrompt;
    v2->_messageOptionsForAsyncPrompt = (OS_tcc_message_options *)v9;

    tcc_message_options_set_reply_handler_policy();
    tcc_message_options_set_request_prompt_rights_mask();
    v2->_shouldRepromptUponForegrounding = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_appWillGoForeground_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);

    v12 = v2;
  }

  return v2;
}

uint64_t __70__CNTCCVersion2_checkAuthorizationStatusOfAuditToken_assumedIdentity___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __85__CNTCCVersion2_requestAuthorizationWithCredential_messageOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;

  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __85__CNTCCVersion2_requestAuthorizationWithCredential_messageOptions_completionHandler___block_invoke_cold_1(a3, v5, v6, v7, v8, v9, v10, v11);

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v13 = +[CNTCCAppAuthorizationRecord authorizationStatusFromAuthorizationRight:](CNTCCAppAuthorizationRecord, "authorizationStatusFromAuthorizationRight:", tcc_authorization_record_get_authorization_right());
    +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "featureFlags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isFeatureEnabled:", 20);

    if (v16)
      v17 = (v13 & 0xFFFFFFFFFFFFFFFBLL) == 0;
    else
      v17 = 0;
    if (v17)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
      v18 = _Block_copy(*(const void **)(a1 + 56));
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 72);
      *(_QWORD *)(v19 + 72) = v18;

      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 48));
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMessagesForReprompt, 0);
  objc_storeStrong(&self->_cachedCallbackForReprompt, 0);
  objc_storeStrong((id *)&self->_cachedCredentialForReprompt, 0);
  objc_storeStrong((id *)&self->_isUnitTestingCachedValue, 0);
  objc_storeStrong((id *)&self->_simulateStatus, 0);
  objc_storeStrong((id *)&self->_messageOptionsForAsyncPrompt, 0);
  objc_storeStrong((id *)&self->_messageOptionsForSyncNoPrompt, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_8 != -1)
    dispatch_once(&os_log_cn_once_token_1_8, &__block_literal_global_45);
  return (id)os_log_cn_once_object_1_8;
}

void __23__CNTCCVersion2_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNTCCVersion2");
  v1 = (void *)os_log_cn_once_object_1_8;
  os_log_cn_once_object_1_8 = (uint64_t)v0;

}

- (int64_t)checkAuthorizationStatusOfCurrentProcess
{
  return -[CNTCCVersion2 checkAuthorizationStatusOfAuditToken:assumedIdentity:](self, "checkAuthorizationStatusOfAuditToken:assumedIdentity:", 0, 0);
}

- (int64_t)checkAuthorizationStatusOfCurrentProcessUsingAssumedIdentity:(id)a3
{
  return -[CNTCCVersion2 checkAuthorizationStatusOfAuditToken:assumedIdentity:](self, "checkAuthorizationStatusOfAuditToken:assumedIdentity:", 0, a3);
}

- (void)requestAuthorization:(int64_t)a3 auditToken:(id)a4 assumedIdentity:(id)a5 completionHandler:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = a5;
  v10 = (void (**)(id, uint64_t))a6;
  -[CNTCCVersion2 simulateStatus](self, "simulateStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CNTCCVersion2 simulateStatus](self, "simulateStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, objc_msgSend(v12, "integerValue"));

  }
  else if (-[CNTCCVersion2 isUnitTesting](self, "isUnitTesting"))
  {
    v10[2](v10, 3);
  }
  else
  {
    -[CNTCCVersion2 credentialForAuditToken:assumedIdentity:](self, "credentialForAuditToken:assumedIdentity:", v15, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[CNTCCVersion2 messageOptionsForAsyncPrompt](self, "messageOptionsForAsyncPrompt");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNTCCVersion2 requestAuthorizationWithCredential:messageOptions:completionHandler:](self, "requestAuthorizationWithCredential:messageOptions:completionHandler:", v13, v14, v10);

    }
    else
    {
      v10[2](v10, 0);
    }

  }
}

- (id)bundleIdentifierForAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  -[CNTCCVersion2 credentialForAuditToken:assumedIdentity:](self, "credentialForAuditToken:assumedIdentity:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    v19 = 0;
    -[CNTCCVersion2 server](self, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNTCCVersion2 messageOptionsForSyncNoPrompt](self, "messageOptionsForSyncNoPrompt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    tcc_server_message_get_identity_for_credential();

    if (v15[5])
    {
      objc_msgSend((id)objc_opt_class(), "bundleIdentifierForIdentity:", v15[5], v13, 3221225472, __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke, &unk_1E29BB228, self, &v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke_cold_1(a3, v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

+ (id)bundleIdentifierForIdentity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t type;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithUTF8String:", tcc_identity_get_identifier());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = tcc_identity_get_type();

  if (type)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CNTCCVersion2 bundleIdentifierForIdentity:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    v14 = 0;
  }
  else
  {
    v14 = v5;
  }

  return v14;
}

- (id)authorizationRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTCCVersion2 server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTCCVersion2 messageOptionsForSyncNoPrompt](self, "messageOptionsForSyncNoPrompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTCCVersion2 service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  tcc_server_message_get_authorization_records_by_service();

  return v8;
}

void __37__CNTCCVersion2_authorizationRecords__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNTCCAppAuthorizationRecord *v4;

  if (a2)
  {
    v3 = a2;
    v4 = -[CNTCCAppAuthorizationRecord initWithTCCAuthorizationRecord:]([CNTCCAppAuthorizationRecord alloc], "initWithTCCAuthorizationRecord:", v3);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
}

- (id)authorizationRecordForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNTCCVersion2 authorizationRecords](self, "authorizationRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CNTCCVersion2_authorizationRecordForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E29BB278;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __56__CNTCCVersion2_authorizationRecordForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)saveAuthorizationRecord:(id)a3
{
  -[CNTCCVersion2 saveAuthorizationRecord:dontKillApp:](self, "saveAuthorizationRecord:dontKillApp:", a3, 0);
}

- (void)saveAuthorizationRecord:(id)a3 dontKillApp:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "authorizationStatus");
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CNTCCVersion2 setAuthorizationStatus:forBundleIdentifier:noKillApp:](self, "setAuthorizationStatus:forBundleIdentifier:noKillApp:", v7, v8, v4);
}

- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v11 = (id)tcc_identity_create();
  +[CNTCCAppAuthorizationRecord authorizationRightFromAuthorizationStatus:](CNTCCAppAuthorizationRecord, "authorizationRightFromAuthorizationStatus:", a3);
  -[CNTCCVersion2 messageOptionsForSyncNoPrompt](self, "messageOptionsForSyncNoPrompt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    tcc_message_options_set_nokill_policy();
  -[CNTCCVersion2 server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTCCVersion2 service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_server_message_set_authorization_value();

}

- (void)appWillGoForeground:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled:", 20);

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = -[CNTCCVersion2 shouldRepromptUponForegrounding](self, "shouldRepromptUponForegrounding");
      _os_log_impl(&dword_18F80C000, v7, OS_LOG_TYPE_DEFAULT, "CNTCCVersion2, app is coming into the foreground. reprompt? %d", (uint8_t *)v11, 8u);
    }

    if (-[CNTCCVersion2 shouldRepromptUponForegrounding](self, "shouldRepromptUponForegrounding"))
    {
      self->_shouldRepromptUponForegrounding = 0;
      -[CNTCCVersion2 cachedCredentialForReprompt](self, "cachedCredentialForReprompt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNTCCVersion2 cachedMessagesForReprompt](self, "cachedMessagesForReprompt");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNTCCVersion2 cachedCallbackForReprompt](self, "cachedCallbackForReprompt");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNTCCVersion2 requestAuthorizationWithCredential:messageOptions:completionHandler:](self, "requestAuthorizationWithCredential:messageOptions:completionHandler:", v8, v9, v10);

    }
  }
}

- (void)simulateStatus:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNTCCVersion2 setSimulateStatus:](self, "setSimulateStatus:", v4);

}

- (void)stopSimulation
{
  -[CNTCCVersion2 setSimulateStatus:](self, "setSimulateStatus:", 0);
}

- (OS_tcc_message_options)messageOptionsForAsyncPrompt
{
  return self->_messageOptionsForAsyncPrompt;
}

- (void)setSimulateStatus:(id)a3
{
  objc_storeStrong((id *)&self->_simulateStatus, a3);
}

- (NSNumber)isUnitTestingCachedValue
{
  return self->_isUnitTestingCachedValue;
}

- (void)setIsUnitTestingCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isUnitTestingCachedValue, a3);
}

- (BOOL)shouldRepromptUponForegrounding
{
  return self->_shouldRepromptUponForegrounding;
}

- (void)setShouldRepromptUponForegrounding:(BOOL)a3
{
  self->_shouldRepromptUponForegrounding = a3;
}

- (OS_tcc_credential)cachedCredentialForReprompt
{
  return self->_cachedCredentialForReprompt;
}

- (void)setCachedCredentialForReprompt:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCredentialForReprompt, a3);
}

- (id)cachedCallbackForReprompt
{
  return self->_cachedCallbackForReprompt;
}

- (void)setCachedCallbackForReprompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_tcc_message_options)cachedMessagesForReprompt
{
  return self->_cachedMessagesForReprompt;
}

void __85__CNTCCVersion2_requestAuthorizationWithCredential_messageOptions_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "TCC request authorization failed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

void __63__CNTCCVersion2_bundleIdentifierForAuditToken_assumedIdentity___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "TCC get identity for credential failed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)bundleIdentifierForIdentity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_18F80C000, a2, a3, "TCC identity is not a bundle identifier: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

@end
