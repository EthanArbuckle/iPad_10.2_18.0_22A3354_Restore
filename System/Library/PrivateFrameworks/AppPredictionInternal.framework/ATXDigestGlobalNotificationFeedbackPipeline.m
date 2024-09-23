@implementation ATXDigestGlobalNotificationFeedbackPipeline

- (ATXDigestGlobalNotificationFeedbackPipeline)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXDigestGlobalNotificationFeedbackPipeline *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "updateDatabase");
  v5 = (void *)objc_opt_new();
  v6 = -[ATXDigestGlobalNotificationFeedbackPipeline initWithFeedbackStore:notificationQuantityProvider:lastRunTimestampKey:constants:](self, "initWithFeedbackStore:notificationQuantityProvider:lastRunTimestampKey:constants:", v3, v4, CFSTR("digestGlobalNotficationFeedbackPipelineLastRunTime"), v5);

  return v6;
}

- (ATXDigestGlobalNotificationFeedbackPipeline)initWithFeedbackStore:(id)a3 notificationQuantityProvider:(id)a4 lastRunTimestampKey:(id)a5 constants:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXDigestGlobalNotificationFeedbackPipeline *v15;
  ATXDigestGlobalNotificationFeedbackPipeline *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXDigestGlobalNotificationFeedbackPipeline;
  v15 = -[ATXDigestGlobalNotificationFeedbackPipeline init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_feedbackStore, a3);
    objc_storeStrong((id *)&v16->_notificationQuantityProvider, a4);
    objc_storeStrong((id *)&v16->_lastRunTimestampUserDefaultsKey, a5);
    objc_storeStrong((id *)&v16->_c, a6);
  }

  return v16;
}

- (void)logGlobalNotificationStatisticsToDigestFeedbackWithXPCActivity:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  ATXNotificationDigestFeedbackProtocol *feedbackStore;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  double Current;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  ATXNotificationDigestFeedbackProtocol *v44;
  uint64_t v45;
  objc_class *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  ATXDigestGlobalNotificationFeedbackPipeline *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_notification_management();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v61 = v7;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "[%@] Starting pipeline", buf, 0xCu);

  }
  feedbackStore = self->_feedbackStore;
  -[ATXNotificationDigestRankingConstants dailyDecayFactor](self->_c, "dailyDecayFactor");
  -[ATXNotificationDigestFeedbackProtocol decayFeedbackByFactor:](feedbackStore, "decayFeedbackByFactor:");
  __atxlog_handle_notification_management();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v61 = v11;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_INFO, "[%@] Decayed digest feedback", buf, 0xCu);

  }
  v12 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v13 = (void *)objc_msgSend(v12, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v13, "objectForKey:", self->_lastRunTimestampUserDefaultsKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v13, "doubleForKey:", self->_lastRunTimestampUserDefaultsKey);
    v17 = v16;
  }
  else
  {
    v17 = 0.0;
  }
  if (objc_msgSend(v4, "didDefer"))
  {
    __atxlog_handle_notification_management();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = v20;
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);

    }
  }
  else
  {
    -[ATXNotificationQuantityProviderProtocol totalNotificationsPerAppFromStartTime:toEndTime:](self->_notificationQuantityProvider, "totalNotificationsPerAppFromStartTime:toEndTime:", v17, Current);
    v18 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "didDefer"))
    {
      __atxlog_handle_notification_management();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v61 = v23;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);

      }
    }
    else
    {
      -[ATXNotificationQuantityProviderProtocol messageNotificationsPerAppFromStartTime:toEndTime:](self->_notificationQuantityProvider, "messageNotificationsPerAppFromStartTime:toEndTime:", v17, Current);
      v21 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "didDefer"))
      {
        __atxlog_handle_notification_management();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v61 = v26;
          _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);

        }
      }
      else
      {
        -[ATXNotificationQuantityProviderProtocol timeSensitiveNonmessageNotificationsPerAppFromStartTime:toEndTime:](self->_notificationQuantityProvider, "timeSensitiveNonmessageNotificationsPerAppFromStartTime:toEndTime:", v17, Current);
        v24 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "didDefer"))
        {
          __atxlog_handle_notification_management();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v61 = v29;
            _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred.", buf, 0xCu);

          }
        }
        else
        {
          v52 = v24;
          v53 = v21;
          v54 = self;
          v49 = v13;
          v50 = v4;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v48 = v18;
          v30 = v18;
          v31 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
          if (v31)
          {
            v32 = v31;
            v51 = *(_QWORD *)v56;
            do
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v56 != v51)
                  objc_enumerationMutation(v30);
                v34 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
                -[NSObject objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", v34);
                v36 = objc_claimAutoreleasedReturnValue();
                v37 = (void *)v36;
                if (v36)
                  v38 = (void *)v36;
                else
                  v38 = &unk_1E83CD888;
                v39 = v38;

                -[NSObject objectForKeyedSubscript:](v52, "objectForKeyedSubscript:", v34);
                v40 = objc_claimAutoreleasedReturnValue();
                v41 = (void *)v40;
                if (v40)
                  v42 = (void *)v40;
                else
                  v42 = &unk_1E83CD888;
                v43 = v42;

                -[ATXNotificationDigestFeedbackProtocol logBasicNotificationsSentForBundleId:numNotifications:](v54->_feedbackStore, "logBasicNotificationsSentForBundleId:numNotifications:", v34, objc_msgSend(v35, "unsignedIntegerValue")- (objc_msgSend(v39, "unsignedIntegerValue")+ objc_msgSend(v43, "unsignedIntegerValue")));
                v44 = v54->_feedbackStore;
                v45 = objc_msgSend(v43, "unsignedIntegerValue");

                -[ATXNotificationDigestFeedbackProtocol logTimeSensitiveNotificationsSentForBundleId:numNotifications:](v44, "logTimeSensitiveNotificationsSentForBundleId:numNotifications:", v34, v45);
              }
              v32 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
            }
            while (v32);
          }

          v13 = v49;
          objc_msgSend(v49, "setDouble:forKey:", v54->_lastRunTimestampUserDefaultsKey, Current);
          __atxlog_handle_notification_management();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v61 = v47;
            _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_INFO, "[%@] Finished logging global notifications sent", buf, 0xCu);

          }
          v4 = v50;
          v18 = v48;
          v24 = v52;
          v21 = v53;
        }

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_lastRunTimestampUserDefaultsKey, 0);
  objc_storeStrong((id *)&self->_notificationQuantityProvider, 0);
  objc_storeStrong((id *)&self->_feedbackStore, 0);
}

@end
