@implementation FAScreenTimeRequestProvider

- (void)cacheScreenTimeSettingToDiskWithDSID:(id)a3 screentimeObject:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  FASaveScreenTimeSettingsCacheRequest *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[FASaveScreenTimeSettingsCacheRequest initWithFamilyMemberDSID:screentimeObject:]([FASaveScreenTimeSettingsCacheRequest alloc], "initWithFamilyMemberDSID:screentimeObject:", v9, v8);

  -[FASaveScreenTimeSettingsCacheRequest startRequestWithCompletionHandler:](v10, "startRequestWithCompletionHandler:", v7);
}

- (void)enableScreenTimeSettingsForDSID:(id)a3 screentimeObject:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  FAEnableScreenTimeSettingsRequest *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[FAEnableScreenTimeSettingsRequest initWithFamilyMemberDSID:screentimeModelCache:]([FAEnableScreenTimeSettingsRequest alloc], "initWithFamilyMemberDSID:screentimeModelCache:", v9, v8);

  -[FAEnableScreenTimeSettingsRequest startRequestWithCompletionHandler:](v10, "startRequestWithCompletionHandler:", v7);
}

- (void)updateScreenTimeServerFlagSettingsForDSID:(id)a3 ephemeralAuthResults:(id)a4 enabled:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  FAUpdateFamilyMemberFlagRequest *v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[FAUpdateFamilyMemberFlagRequest initWithFamilyMemberDSID:ephemeralAuthResults:flag:enabled:]([FAUpdateFamilyMemberFlagRequest alloc], "initWithFamilyMemberDSID:ephemeralAuthResults:flag:enabled:", v11, v10, CFSTR("FAMemberFlagScreenTime"), v6);

  -[FAUpdateFamilyMemberFlagRequest startRequestWithCompletionHandler:](v12, "startRequestWithCompletionHandler:", v9);
}

- (void)forceRefreshScreenTimeForDSID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 *p_buf;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1CAEBA000, v7, OS_LOG_TYPE_DEFAULT, "Force screentime refresh dsid: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v8 = (void *)getSTPrivateServiceClientClass_softClass;
  v22 = getSTPrivateServiceClientClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getSTPrivateServiceClientClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getSTPrivateServiceClientClass_block_invoke;
    v18[3] = &unk_1E85620F8;
    v18[4] = &v19;
    __getSTPrivateServiceClientClass_block_invoke((uint64_t)v18);
    v8 = (void *)v20[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v19, 8);
  v27 = objc_alloc_init(v10);
  v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke;
  v14[3] = &unk_1E85626D0;
  v12 = v5;
  v15 = v12;
  v13 = v6;
  v16 = v13;
  p_buf = &buf;
  objc_msgSend(v11, "forceFamilyFetchWithCompletionHandler:", v14);

  _Block_object_dispose(&buf, 8);
}

void __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke_cold_1((uint64_t)a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v9 = 138477827;
    v10 = v6;
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "Completed screentime refresh. It is now aware of family member with dsid: %{private}@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(a1[5] + 16))();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (BOOL)isScreenTimeSetupForDSID:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v4 = (void *)getSTUserIDClass_softClass;
  v22 = getSTUserIDClass_softClass;
  if (!getSTUserIDClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getSTUserIDClass_block_invoke;
    v17 = &unk_1E85620F8;
    v18 = &v19;
    __getSTUserIDClass_block_invoke((uint64_t)&v14);
    v4 = (void *)v20[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v19, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithDSID:", v3);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v7 = (void *)getSTSetupClientClass_softClass;
  v22 = getSTSetupClientClass_softClass;
  if (!getSTSetupClientClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __getSTSetupClientClass_block_invoke;
    v17 = &unk_1E85620F8;
    v18 = &v19;
    __getSTSetupClientClass_block_invoke((uint64_t)&v14);
    v7 = (void *)v20[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v19, 8);
  v9 = (void *)objc_opt_new();
  v13 = 0;
  objc_msgSend(v9, "currentConfigurationForUser:error:", v6, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "screenTimeState") == 1;

  return v11;
}

void __79__FAScreenTimeRequestProvider_forceRefreshScreenTimeForDSID_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138478083;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_ERROR, "Error force refreshing screentime for %{private}@ %@", (uint8_t *)&v4, 0x16u);
}

@end
