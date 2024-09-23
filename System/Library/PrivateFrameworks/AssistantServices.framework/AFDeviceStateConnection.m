@implementation AFDeviceStateConnection

- (void)fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[AFDeviceStateConnection fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion:]";
    _os_log_debug_impl(&dword_19AF50000, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  +[AFFlowServiceConnection sharedConnection](AFFlowServiceConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke;
  v10[3] = &unk_1E3A2CE88;
  v11 = v3;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E3A35B08;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "invokeMethodOnRemoteWithBlock:onError:", v10, v8);

}

- (void)getPersonalSettingsForSharedUserID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[AFDeviceStateConnection getPersonalSettingsForSharedUserID:completion:]";
    _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  +[AFFlowServiceConnection sharedConnection](AFFlowServiceConnection, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke;
  v14[3] = &unk_1E3A2CED8;
  v15 = v5;
  v16 = v6;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_3;
  v12[3] = &unk_1E3A35B08;
  v13 = v16;
  v10 = v16;
  v11 = v5;
  objc_msgSend(v8, "invokeMethodOnRemoteWithBlock:onError:", v14, v12);

}

void __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_2;
  v8[3] = &unk_1E3A2CEB0;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "getPersonalSettingsForSharedUserID:completion:", v6, v8);

}

void __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFDeviceStateConnection getPersonalSettingsForSharedUserID:completion:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __73__AFDeviceStateConnection_getPersonalSettingsForSharedUserID_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E3A2CE60;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a2, "fetchSiriKitApplicationsWithNotificationPreviewRestrictionsWithCompletion:", v7);

}

void __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[AFDeviceStateConnection fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __103__AFDeviceStateConnection_fetchSiriKitAppIdentifiersWithNotificationPreviewRestrictionsWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
