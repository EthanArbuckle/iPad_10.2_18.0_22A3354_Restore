@implementation EMPrivacyProxyIsDisabledForNetwork

void __EMPrivacyProxyIsDisabledForNetwork_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  os_log_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.email.EMRemoteContentURLSchemeHandler.privacyProxyStatusQueue", v0);
  v2 = (void *)EMPrivacyProxyIsDisabledForNetwork_sPrivacyProxyStatusQueue;
  EMPrivacyProxyIsDisabledForNetwork_sPrivacyProxyStatusQueue = (uint64_t)v1;

  v3 = os_log_create("com.apple.email", "EMRemoteContentURLUtilities");
  v4 = (void *)EMPrivacyProxyIsDisabledForNetwork_sLog;
  EMPrivacyProxyIsDisabledForNetwork_sLog = (uint64_t)v3;

}

void __EMPrivacyProxyIsDisabledForNetwork_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = EMPrivacyProxyIsDisabledForNetwork_sLog;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)EMPrivacyProxyIsDisabledForNetwork_sLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_impl(&dword_1B99BB000, v7, OS_LOG_TYPE_DEFAULT, "Got service status: %{public}@", buf, 0xCu);
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v5, "networkStatuses", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "networkStatus"))
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            goto LABEL_6;
          break;
        }
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = (id)EMPrivacyProxyIsDisabledForNetwork_sLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __EMPrivacyProxyIsDisabledForNetwork_block_invoke_2_cold_1(v13, buf, v12);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __EMPrivacyProxyIsDisabledForNetwork_block_invoke_2_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Failed to get service status: %{public}@", buf, 0xCu);

}

@end
