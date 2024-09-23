@implementation ATXDailyNotificationsAccumulator

- (BOOL)successfullyAccumulatedNotificationEvents
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[5];
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allInstalledAppsKnownToSpringBoard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Usage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v8, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__46;
  v24[3] = __Block_byref_object_dispose__46;
  v25 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke;
  v22[3] = &unk_1E82DB658;
  v22[4] = &v23;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke_2;
  v19[3] = &unk_1E82DCD98;
  v13 = v7;
  v20 = v13;
  v14 = v3;
  v21 = v14;
  v15 = (id)objc_msgSend(v12, "sinkWithCompletion:receiveInput:", v22, v19);
  v16 = *(_QWORD *)(v24[0] + 40);
  if (v16)
  {
    __atxlog_handle_usage_insights();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXDailyNotificationsAccumulator successfullyAccumulatedNotificationEvents].cold.1((uint64_t)v24, v17);
  }
  else
  {
    objc_storeStrong((id *)&self->_allDeliveredNotifications, v3);
    __atxlog_handle_usage_insights();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[ATXDailyNotificationsAccumulator successfullyAccumulatedNotificationEvents]";
      _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_INFO, "%s: Successfully accumulated notification events", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v23, 8);
  return v16 == 0;
}

void __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __77__ATXDailyNotificationsAccumulator_successfullyAccumulatedNotificationEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v37 = v3;
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v6);

  if ((_DWORD)v4)
  {
    objc_msgSend(v37, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "usageType");

    if (v8 == 17)
    {
      objc_msgSend(v37, "eventBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      v13 = *(void **)(a1 + 40);
      v14 = objc_alloc(MEMORY[0x1E0CF9188]);
      objc_msgSend(v37, "eventBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "absoluteTimestamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "eventBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contactIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "eventBody");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isGroupMessage");
      v23 = v14;
      v24 = v16;
      v25 = v12;
      v26 = v18;
      v27 = v20;
      v28 = 1;
LABEL_6:
      v36 = (void *)objc_msgSend(v23, "initWithBundleID:category:eventTime:contactIDs:isGroupMessage:deliveryType:", v24, v25, v26, v27, v22, v28);
      objc_msgSend(v13, "addObject:", v36);

      goto LABEL_7;
    }
    objc_msgSend(v37, "eventBody");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "usageType");

    if (v30 == 18)
    {
      objc_msgSend(v37, "eventBody");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "bundleID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "unsignedIntegerValue");

      v13 = *(void **)(a1 + 40);
      v35 = objc_alloc(MEMORY[0x1E0CF9188]);
      objc_msgSend(v37, "eventBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "absoluteTimestamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "eventBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contactIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "eventBody");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isGroupMessage");
      v23 = v35;
      v24 = v16;
      v25 = v34;
      v26 = v18;
      v27 = v20;
      v28 = 2;
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (NSArray)allDeliveredNotifications
{
  return self->_allDeliveredNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDeliveredNotifications, 0);
}

- (void)successfullyAccumulatedNotificationEvents
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 136315394;
  v4 = "-[ATXDailyNotificationsAccumulator successfullyAccumulatedNotificationEvents]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading notifications stream: %@", (uint8_t *)&v3, 0x16u);
}

@end
