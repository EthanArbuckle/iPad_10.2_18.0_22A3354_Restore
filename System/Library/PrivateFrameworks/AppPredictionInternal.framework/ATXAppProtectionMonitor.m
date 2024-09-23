@implementation ATXAppProtectionMonitor

void __42___ATXAppProtectionMonitor_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_46;
  sharedInstance__pasExprOnceResult_46 = v1;

  objc_autoreleasePoolPop(v0);
}

void __73___ATXAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  ATXAppProtectionLockedOrHidden *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "appProtectionSubjectMonitorSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_pas_mappedArrayWithTransform:", &__block_literal_global_8_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v34;
      *(_QWORD *)&v6 = 138412290;
      v32 = v6;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
          if ((objc_msgSend(v10, "isHidden", v32) & 1) != 0 || objc_msgSend(v10, "isLocked"))
          {
            v11 = (void *)objc_opt_new();
            v12 = (void *)objc_opt_new();
            if (objc_msgSend(v10, "isLocked"))
            {
              __atxlog_handle_default();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v10, "bundleIdentifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v38 = v14;
                _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is locked", buf, 0xCu);

              }
              objc_msgSend(v10, "bundleIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v15);

            }
            if (objc_msgSend(v10, "isHidden"))
            {
              __atxlog_handle_default();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v10, "bundleIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v38 = v17;
                _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is hidden", buf, 0xCu);

              }
              objc_msgSend(v10, "bundleIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v18);

            }
            v19 = -[ATXAppProtectionLockedOrHidden initWithLockedApps:hiddenApps:]([ATXAppProtectionLockedOrHidden alloc], "initWithLockedApps:hiddenApps:", v11, v12);
            __atxlog_handle_default();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "bundleIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v32;
              v38 = v21;
              _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: Sending internal notification for locked/hidden app: %@", buf, 0xCu);

            }
            +[ATXInternalLockedOrHiddenAppNotification postNotificationWithLockedOrHiddenApps:](ATXInternalLockedOrHiddenAppNotification, "postNotificationWithLockedOrHiddenApps:", v19);
LABEL_20:

            goto LABEL_21;
          }
          if (!objc_msgSend(v10, "isHidden") || (objc_msgSend(v10, "isLocked") & 1) == 0)
          {
            v11 = (void *)objc_opt_new();
            v12 = (void *)objc_opt_new();
            if ((objc_msgSend(v10, "isLocked") & 1) == 0)
            {
              __atxlog_handle_default();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v10, "bundleIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v38 = v23;
                _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is no longer locked", buf, 0xCu);

              }
              objc_msgSend(v10, "bundleIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v24);

            }
            if ((objc_msgSend(v10, "isHidden") & 1) == 0)
            {
              __atxlog_handle_default();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v10, "bundleIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v38 = v26;
                _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: %@ is no longer hidden", buf, 0xCu);

              }
              objc_msgSend(v10, "bundleIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v27);

            }
            __atxlog_handle_default();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "bundleIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v32;
              v38 = v29;
              _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: Sending internal notification for unlocked/unhidden app: %@", buf, 0xCu);

            }
            v19 = -[ATXAppProtectionUnLockedOrUnHidden initWithUnLockedApps:unHiddenApps:]([ATXAppProtectionUnLockedOrUnHidden alloc], "initWithUnLockedApps:unHiddenApps:", v11, v12);
            +[ATXInternalUnLockedOrUnHiddenAppNotification postNotificationWithUnLockedOrUnHiddenApps:](ATXInternalUnLockedOrUnHiddenAppNotification, "postNotificationWithUnLockedOrUnHiddenApps:", v19);
            goto LABEL_20;
          }
LABEL_21:
          ++v9;
        }
        while (v7 != v9);
        v30 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        v7 = v30;
      }
      while (v30);
    }
    __atxlog_handle_default();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v4;
      _os_log_impl(&dword_1C9A3B000, v31, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor: Received App Protection change:  %@. Refreshing blending layer suggestions immediately", buf, 0xCu);
    }

    ATXUpdatePredictionsImmediatelyWithReason(21);
  }
}

id __73___ATXAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  Class v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = NSClassFromString(CFSTR("APApplication"));
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

@end
