@implementation DKCloudUtilities

void __35___DKCloudUtilities_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

void __25___DKCloudUtilities_init__block_invoke(uint64_t a1)
{
  _DKThrottledActivity *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = [_DKThrottledActivity alloc];
  -[_DKCloudUtilities keyValueStore](*(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DKThrottledActivity initWithStore:namespace:](v2, "initWithStore:namespace:", v3, CFSTR("_DKCloudUtilities"));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

  -[_DKCloudUtilities _fetchCloudKitConfigurationAndStatus](*(_QWORD *)(a1 + 32));
}

void __39___DKCloudUtilities__accountDidChange___block_invoke(uint64_t a1)
{
  -[_DKCloudUtilities _fetchCloudKitConfigurationAndStatus](*(_QWORD *)(a1 + 32));
}

void __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke_2;
  v2[3] = &unk_1E26E3118;
  v2[4] = v1;
  -[_DKCloudUtilities _fetchAccountInfoWithCompletionHandler:](v1, v2);
}

void __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24))
    -[_DKCloudUtilities _updateNumberOfSyncedDevicesWithCompletionHandler:](v1, &__block_literal_global_9);
}

void __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_DKCloudUtilities _updateAccountInfo:error:]((uint64_t)WeakRetained, v6, v5);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke_cold_1();

}

void __46___DKCloudUtilities__updateAccountInfo_error___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_DKCloudSyncAvailablityChangedNotification"), 0);

}

void __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a4;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_2(v5);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[_DKCloudUtilities _performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:](v2, 1, *(void **)(a1 + 40));
}

uint64_t __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("metadata_device_type"));

  if (v5)
  {
    objc_msgSend(v3, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "arrayForKey:", CFSTR("_DKCloudSyncDevices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      if ((objc_msgSend(v8, "containsObject:", v7) & 1) != 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v9, "addObject:", v7);
      objc_msgSend(*(id *)(a1 + 32), "setArray:forKey:", v9, CFSTR("_DKCloudSyncDevices"));
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count", CFSTR("count")));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:userInfo:sender:", CFSTR("_DKCloudDeviceCountChangedNotification"), v12, *(_QWORD *)(a1 + 40));

    }
    else
    {
      v13 = *(void **)(a1 + 32);
      v17[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setArray:forKey:", v14, CFSTR("_DKCloudSyncDevices"));

      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:userInfo:sender:", CFSTR("_DKCloudDeviceCountChangedNotification"), &unk_1E272C0D0, *(_QWORD *)(a1 + 40));
    }

    goto LABEL_7;
  }
LABEL_8:

}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_399(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("metadata_device_type")))
  {
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "arrayForKey:", CFSTR("_DKCloudSyncDevices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v8, "removeObject:", v6);
      objc_msgSend(*(id *)(a1 + 32), "setArray:forKey:", v8, CFSTR("_DKCloudSyncDevices"));
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:userInfo:sender:", CFSTR("_DKCloudDeviceCountChangedNotification"), v11, *(_QWORD *)(a1 + 40));

    }
  }

}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setData:forKey:", v4, CFSTR("_DKCloudSyncMetadataChangeToken"));

  }
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t v24[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  NSObject *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_4;
    v29[3] = &unk_1E26E2F20;
    v30 = *(id *)(a1 + 32);
    +[_DKSyncSerializer performSyncBlock:](_DKSyncSerializer, "performSyncBlock:", v29);
    v9 = v30;
LABEL_29:

    goto LABEL_30;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_2(a1, v3, v4);

  if (objc_msgSend(v3, "code") == 2)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C947D8];
    v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

    if (v7)
    {
      objc_msgSend(v3, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v9 = objc_claimAutoreleasedReturnValue();

      -[NSObject allValues](v9, "allValues");
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (objc_msgSend(v15, "code") == 21)
            {
              objc_msgSend(v15, "domain");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v6);

              if ((v17 & 1) != 0)
              {

                goto LABEL_21;
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
          if (v12)
            continue;
          break;
        }
      }

      goto LABEL_29;
    }
  }
  if (objc_msgSend(v3, "code") != 21
    || (objc_msgSend(v3, "domain"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C947D8]),
        v18,
        !v19))
  {
LABEL_30:
    v23 = *(_QWORD *)(a1 + 72);
    if (v23)
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v3);
    goto LABEL_32;
  }
LABEL_21:
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_18DDBE000, v20, OS_LOG_TYPE_INFO, "Change token expired, may retry fetching number of synced devices", v24, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", CFSTR("_DKCloudSyncMetadataChangeToken"));
  v21 = *(_QWORD *)(a1 + 80);
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  v9 = v22;
  if (v21 > 2)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_1();
    goto LABEL_29;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "Will retry fetching number of synced devices", v24, 2u);
  }

  -[_DKCloudUtilities _performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:](*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80) + 1, *(_QWORD *)(a1 + 72));
LABEL_32:

}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "arrayForKey:", CFSTR("_DKCloudSyncDevices"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "count") >= 2)
  {
    +[_DKSyncPeerStatusTracker sharedInstance](_DKSyncPeerStatusTracker, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allPeers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1728000.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v10, "me", (_QWORD)v16) & 1) == 0)
          {
            objc_msgSend(v10, "lastSeenDate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (!v11
              || (objc_msgSend(v11, "timeIntervalSinceNow"),
                  v14 = v13,
                  objc_msgSend(v4, "timeIntervalSinceNow"),
                  v14 < v15))
            {
              objc_msgSend(v2, "setLastSeenDate:onPeer:", v4, v10);
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
}

void __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Finished fetching account info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Succesfully deleted zones", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_2(&dword_18DDBE000, v2, v3, "Failed to delete zones: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7_1();
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_ERROR, "Exceeded maximum retries, unable to fetch number of synced devices", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "domain");
  objc_claimAutoreleasedReturnValue();
  v7 = 138413058;
  v8 = v6;
  v9 = 2114;
  v10 = v3;
  v11 = 2048;
  v12 = OUTLINED_FUNCTION_6_3();
  v13 = 2112;
  v14 = a2;
  _os_log_debug_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_DEBUG, "Failed to fetch record zone changes for %@: %{public}@:%lld (%@)", (uint8_t *)&v7, 0x2Au);

}

@end
