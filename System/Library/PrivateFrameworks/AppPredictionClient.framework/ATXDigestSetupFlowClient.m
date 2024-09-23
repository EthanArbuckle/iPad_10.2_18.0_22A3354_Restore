@implementation ATXDigestSetupFlowClient

- (ATXDigestSetupFlowClient)init
{
  ATXDigestSetupFlowClient *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  ATXNotificationDigestRankerClient *xpcClient;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXDigestSetupFlowClient;
  v2 = -[ATXDigestSetupFlowClient init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("ATXDigestSetupFlowClient.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    xpcClient = v2->_xpcClient;
    v2->_xpcClient = (ATXNotificationDigestRankerClient *)v6;

  }
  return v2;
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__ATXDigestSetupFlowClient_appsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke;
  v8[3] = &unk_1E4D5BE90;
  v9 = v6;
  v7 = v6;
  -[ATXDigestSetupFlowClient _helperAppsSortedByNotificationsReceivedInPreviousNumDays:completionHandler:](self, "_helperAppsSortedByNotificationsReceivedInPreviousNumDays:completionHandler:", a3, v8);

}

uint64_t __97__ATXDigestSetupFlowClient_appsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_helperAppsSortedByNotificationsReceivedInPreviousNumDays:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  ATXNotificationDigestRankerClient *xpcClient;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  SEL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v20 = 0;
  v21 = &v20;
  if (v7)
    v9 = v7;
  else
    v9 = &unk_1E4DC1A40;
  v22 = 0x2020000000;
  v23 = 0;
  v23 = objc_msgSend(v9, "unsignedIntegerValue");
  __atxlog_handle_notification_management();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (id)objc_opt_class();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXDigestSetupFlowClient _helperAppsSortedByNotificationsReceivedInPreviousNumDays:completionHandler:].cold.1(v11, v12, buf, v10);
  }

  xpcClient = self->_xpcClient;
  v14 = v21[3];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke;
  v16[3] = &unk_1E4D5BEE0;
  v18 = &v20;
  v19 = a2;
  v16[4] = self;
  v15 = v8;
  v17 = v15;
  -[ATXNotificationDigestRankerClient appsSortedByNotificationsReceivedInPreviousNumDays:reply:](xpcClient, "appsSortedByNotificationsReceivedInPreviousNumDays:reply:", v14, v16);

  _Block_object_dispose(&v20, 8);
}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, unint64_t a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  _WORD v25[17];

  *(_QWORD *)&v25[13] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  if (v10)
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_2(a1, (uint64_t)v10, v11);

  }
  __atxlog_handle_notification_management();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = (uint64_t)v13;
    v24 = 2048;
    *(_QWORD *)v25 = a4;
    _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "%@: Number of days of data = %lu", buf, 0x16u);

  }
  if (a4)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_QWORD *)(v14 + 24) > a4)
      *(_QWORD *)(v14 + 24) = a4;
  }
  else
  {
    __atxlog_handle_notification_management();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_1(a1, v15);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3;
  v21[3] = &unk_1E4D5BEB8;
  v21[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_management();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v16, "count");
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 134218496;
    v23 = v18;
    v24 = 1024;
    *(_DWORD *)v25 = a3;
    v25[2] = 2048;
    *(_QWORD *)&v25[3] = v19;
    _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "Returning %ld apps with notification counts, containsMessageAndTimeSensitiveData=%{BOOL}d, numberOfDays=%ld", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "sortDigestResponseWithNoNotificationVolume:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

ATXDigestSetupResponse *__104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t v11;
  ATXDigestSetupResponse *v12;
  void *v13;
  ATXDigestSetupResponse *v14;

  v3 = a2;
  v4 = objc_msgSend(v3, "numBasicNotifications");
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = objc_msgSend(v3, "numMessageNotifications");
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v8 = objc_msgSend(v3, "numTimeSensitiveNonMessageNotifications");
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  __atxlog_handle_notification_management();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3_cold_1(v3, v10);
  v11 = v4 / v5;

  v12 = [ATXDigestSetupResponse alloc];
  objc_msgSend(v3, "bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXDigestSetupResponse initWithBundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:numBasicNotifications:numMessageNotifications:numTimeSensitiveNonMessageNotifications:](v12, "initWithBundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:numBasicNotifications:numMessageNotifications:numTimeSensitiveNonMessageNotifications:", v13, v11, v6 / v7, v8 / v9, objc_msgSend(v3, "numBasicNotifications"), objc_msgSend(v3, "numMessageNotifications"), objc_msgSend(v3, "numTimeSensitiveNonMessageNotifications"));

  return v14;
}

- (id)sortDigestResponseWithNoNotificationVolume:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v28 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = 0x1E4D53000uLL;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        if (objc_msgSend(v11, "numBasicNotifications")
          || objc_msgSend(v11, "numMessageNotifications")
          || objc_msgSend(v11, "numTimeSensitiveNonMessageNotifications"))
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          v12 = *(void **)(v9 + 2096);
          objc_msgSend(v11, "bundleId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedNameForBundle:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            v17 = *(void **)(v9 + 2096);
            objc_msgSend(v11, "bundleId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "localizedShortnameForBundle:", v18);
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v16, v11);
          objc_msgSend(v28, "addObject:", v19);

          v9 = 0x1E4D53000;
        }
        ++v10;
      }
      while (v7 != v10);
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      v7 = v20;
    }
    while (v20);
  }

  objc_msgSend(v28, "sortUsingComparator:", &__block_literal_global_72);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v28;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "second");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  return v4;
}

uint64_t __71__ATXDigestSetupFlowClient_sortDigestResponseWithNoNotificationVolume___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_helperAppsSortedByNotificationsReceivedInPreviousNumDays:(uint8_t *)buf completionHandler:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1A49EF000, log, OS_LOG_TYPE_DEBUG, "[%@ %@] Fetching sorted apps", buf, 0x16u);

}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "%@: Received number of days of data = 0", (uint8_t *)&v4, 0xCu);

}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_ERROR, "Error in %@: %@", (uint8_t *)&v6, 0x16u);

}

void __104__ATXDigestSetupFlowClient__helperAppsSortedByNotificationsReceivedInPreviousNumDays_completionHandler___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138413058;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a1, "numBasicNotifications");
  v9 = 2048;
  v10 = objc_msgSend(a1, "numMessageNotifications");
  v11 = 2048;
  v12 = objc_msgSend(a1, "numTimeSensitiveNonMessageNotifications");
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "%@: %lu / %lu / %lu", (uint8_t *)&v5, 0x2Au);

}

@end
