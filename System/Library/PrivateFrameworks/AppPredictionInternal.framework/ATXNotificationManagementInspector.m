@implementation ATXNotificationManagementInspector

- (BOOL)clearAllNotificationData:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "deleteAllEvents");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "deleteAllEvents");

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "deleteAllEvents");

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "deleteAllData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v8 == 0;
}

- (id)fetchSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  id obj;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v8 = a3;
  v9 = a4;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__68;
  v46 = __Block_byref_object_dispose__68;
  v47 = 0;
  v41 = 0;
  -[ATXNotificationManagementInspector fetchNotificationsFromFileData:outError:](self, "fetchNotificationsFromFileData:outError:", v8, &v41);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v47, v41);
  if (a5 && (v11 = v43[5]) != 0)
  {
    v12 = 0;
    *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__68;
    v39 = __Block_byref_object_dispose__68;
    v40 = 0;
    -[ATXNotificationManagementInspector constructStacksForNotifications:](self, "constructStacksForNotifications:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CF8F98]);
    +[ATXNotificationDigestRankerServer sharedInstance](ATXNotificationDigestRankerServer, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithDigestRankerClient:", v15);

    v17 = dispatch_semaphore_create(0);
    v18 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke;
    v31[3] = &unk_1E82E6710;
    v33 = &v42;
    v34 = &v35;
    v19 = v17;
    v32 = v19;
    objc_msgSend(v16, "generateDigestForNotificationArrays:reply:", v13, v31);
    v20 = (double)(unint64_t)*MEMORY[0x1E0CF9380];
    v29[4] = self;
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_2;
    v30[3] = &unk_1E82DAC38;
    v30[4] = self;
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_37;
    v29[3] = &unk_1E82DAC38;
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v19, v30, v29, v20);
    if (a5 && (v21 = v43[5]) != 0)
    {
      v12 = 0;
      *a5 = objc_retainAutorelease(v21);
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend((id)v36[5], "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v43;
      obj = v43[5];
      objc_msgSend(v22, "dataWithJSONObject:options:error:", v23, 1, &obj);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v24 + 5, obj);

      if (a5 && (v26 = v43[5]) != 0)
      {
        v12 = 0;
        *a5 = objc_retainAutorelease(v26);
      }
      else
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v25, 4);
      }

    }
    _Block_object_dispose(&v35, 8);

  }
  _Block_object_dispose(&v42, 8);

  return v12;
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    v6 = objc_msgSend(a3, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = v5;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_37()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_37_cold_1();

}

- (id)fetchSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  uint64_t v24;
  NSObject *v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  id v32;
  void *v34;
  id v35;
  id obj;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  id v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v9 = a7;
  v14 = a3;
  v35 = a4;
  v15 = a5;
  v16 = a6;
  v50 = 0;
  v51 = (id *)&v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__68;
  v54 = __Block_byref_object_dispose__68;
  v55 = 0;
  v49 = 0;
  -[ATXNotificationManagementInspector fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:](self, "fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:", v14, v15, v16, v9, &v49);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v55, v49);
  if (a8 && (v18 = v51[5]) != 0)
  {
    v19 = 0;
    *a8 = objc_retainAutorelease(v18);
  }
  else
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__68;
    v47 = __Block_byref_object_dispose__68;
    v48 = 0;
    -[ATXNotificationManagementInspector constructStacksForNotifications:](self, "constructStacksForNotifications:", v17);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0CF8F98]);
    +[ATXNotificationDigestRankerServer sharedInstance](ATXNotificationDigestRankerServer, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithDigestRankerClient:", v21);

    v23 = dispatch_semaphore_create(0);
    v24 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke;
    v39[3] = &unk_1E82E6710;
    v41 = &v50;
    v42 = &v43;
    v25 = v23;
    v40 = v25;
    objc_msgSend(v22, "generateDigestForNotificationArrays:reply:", v34, v39);
    v26 = (double)(unint64_t)*MEMORY[0x1E0CF9380];
    v37[4] = self;
    v38[0] = v24;
    v38[1] = 3221225472;
    v38[2] = __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2;
    v38[3] = &unk_1E82DAC38;
    v38[4] = self;
    v37[0] = v24;
    v37[1] = 3221225472;
    v37[2] = __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_40;
    v37[3] = &unk_1E82DAC38;
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v25, v38, v37, v26);
    if (a8 && (v27 = v51[5]) != 0)
    {
      v19 = 0;
      *a8 = objc_retainAutorelease(v27);
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend((id)v44[5], "jsonRepresentation", v34);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v51;
      obj = v51[5];
      objc_msgSend(v28, "dataWithJSONObject:options:error:", v29, 1, &obj);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v30 + 5, obj);

      if (a8 && (v32 = v51[5]) != 0)
      {
        v19 = 0;
        *a8 = objc_retainAutorelease(v32);
      }
      else
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v31, 4);
      }

    }
    _Block_object_dispose(&v43, 8);

  }
  _Block_object_dispose(&v50, 8);

  return v19;
}

void __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    v6 = objc_msgSend(a3, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = v5;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_40()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_37_cold_1();

}

- (id)fetchSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[ATXNotificationManagementInspector fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:](self, "fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:", a3, a5, a6, a7, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a8)
  {
    v11 = 0;
  }
  else
  {
    v12 = (void *)objc_opt_new();
    -[ATXNotificationManagementInspector constructStacksGroupedByAppForNotifications:](self, "constructStacksGroupedByAppForNotifications:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:outError:", v13, 2, 2, a8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (*a8)
    {
      v11 = 0;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dataWithJSONObject:options:error:", v16, 1, a8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (*a8)
        v11 = 0;
      else
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);

    }
  }

  return v11;
}

- (id)fetchSerializedMissedNotificationRankingFromFileData:(id)a3 modeString:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  dispatch_semaphore_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  void *v28;
  id obj;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id v42;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a4;
  v43 = 0;
  v44 = (id *)&v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__68;
  v47 = __Block_byref_object_dispose__68;
  v48 = 0;
  v42 = 0;
  -[ATXNotificationManagementInspector fetchNotificationsFromFileData:outError:](self, "fetchNotificationsFromFileData:outError:", v8, &v42);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v48, v42);
  if (a5 && (v11 = v44[5]) != 0)
  {
    v12 = 0;
    *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    -[ATXNotificationManagementInspector constructStacksForNotifications:](self, "constructStacksForNotifications:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0CF8F98]);
    +[ATXNotificationDigestRankerServer sharedInstance](ATXNotificationDigestRankerServer, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithDigestRankerClient:", v14);

    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__68;
    v40 = __Block_byref_object_dispose__68;
    v41 = 0;
    v16 = dispatch_semaphore_create(0);
    v17 = ATXStringToMode();
    v18 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke;
    v32[3] = &unk_1E82E6738;
    v34 = &v43;
    v35 = &v36;
    v19 = v16;
    v33 = v19;
    objc_msgSend(v15, "generateMissedNotificationRankingForNotificationArrays:atxMode:reply:", v28, v17, v32);
    v20 = (double)(unint64_t)*MEMORY[0x1E0CF9380];
    v30[4] = self;
    v31[0] = v18;
    v31[1] = 3221225472;
    v31[2] = __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_2;
    v31[3] = &unk_1E82DAC38;
    v31[4] = self;
    v30[0] = v18;
    v30[1] = 3221225472;
    v30[2] = __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_43;
    v30[3] = &unk_1E82DAC38;
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v19, v31, v30, v20);
    if (a5 && (v21 = v44[5]) != 0)
    {
      v12 = 0;
      *a5 = objc_retainAutorelease(v21);
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend((id)v37[5], "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v44;
      obj = v44[5];
      objc_msgSend(v22, "dataWithJSONObject:options:error:", v23, 1, &obj);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v24 + 5, obj);

      if (a5 && (v26 = v44[5]) != 0)
      {
        v12 = 0;
        *a5 = objc_retainAutorelease(v26);
      }
      else
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v25, 4);
      }

    }
    _Block_object_dispose(&v36, 8);

  }
  _Block_object_dispose(&v43, 8);

  return v12;
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    v6 = objc_msgSend(a3, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = v5;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_43()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_43_cold_1();

}

- (id)fetchSerializedMissedNotificationRankingFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  dispatch_semaphore_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  void *v38;
  id v39;
  id v40;
  id obj;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[4];
  NSObject *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  id v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v9 = a7;
  v14 = a3;
  v40 = a4;
  v15 = a5;
  v16 = a6;
  v55 = 0;
  v56 = (id *)&v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__68;
  v59 = __Block_byref_object_dispose__68;
  v60 = 0;
  v54 = 0;
  v39 = v14;
  -[ATXNotificationManagementInspector fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:](self, "fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:", v14, v15, v16, v9, &v54);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v60, v54);
  if (a8 && (v18 = v56[5]) != 0)
  {
    v19 = 0;
    *a8 = objc_retainAutorelease(v18);
    v20 = v14;
  }
  else
  {
    v38 = v17;
    -[ATXNotificationManagementInspector constructStacksForNotifications:](self, "constructStacksForNotifications:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0CF8F98]);
    +[ATXNotificationDigestRankerServer sharedInstance](ATXNotificationDigestRankerServer, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithDigestRankerClient:", v23);

    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__68;
    v52 = __Block_byref_object_dispose__68;
    v53 = 0;
    v25 = dispatch_semaphore_create(0);
    v26 = ATXStringToMode();
    v27 = (void *)v24;
    v28 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke;
    v44[3] = &unk_1E82E6738;
    v46 = &v55;
    v47 = &v48;
    v29 = v25;
    v45 = v29;
    objc_msgSend(v27, "generateMissedNotificationRankingForNotificationArrays:atxMode:reply:", v21, v26, v44);
    v30 = (double)(unint64_t)*MEMORY[0x1E0CF9380];
    v42[4] = self;
    v43[0] = v28;
    v43[1] = 3221225472;
    v43[2] = __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2;
    v43[3] = &unk_1E82DAC38;
    v43[4] = self;
    v42[0] = v28;
    v42[1] = 3221225472;
    v42[2] = __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_44;
    v42[3] = &unk_1E82DAC38;
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v29, v43, v42, v30);
    if (a8 && (v31 = v56[5]) != 0)
    {
      v19 = 0;
      *a8 = objc_retainAutorelease(v31);
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend((id)v49[5], "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v56;
      obj = v56[5];
      objc_msgSend(v32, "dataWithJSONObject:options:error:", v33, 1, &obj);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v34 + 5, obj);

      if (a8 && (v36 = v56[5]) != 0)
      {
        v19 = 0;
        *a8 = objc_retainAutorelease(v36);
      }
      else
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v35, 4);
      }

    }
    v17 = v38;
    v20 = v39;

    _Block_object_dispose(&v48, 8);
  }

  _Block_object_dispose(&v55, 8);
  return v19;
}

void __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    v6 = objc_msgSend(a3, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = v5;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);

  }
}

void __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_44()
{
  NSObject *v0;

  __atxlog_handle_notification_management();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_43_cold_1();

}

- (id)fetchSerializedNotificationsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldInferMessages:(BOOL)a6 outError:(id *)a7
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[ATXNotificationManagementInspector fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:](self, "fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_152);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 1, a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);

  return v11;
}

uint64_t __124__ATXNotificationManagementInspector_fetchSerializedNotificationsFromSource_startDate_endDate_shouldInferMessages_outError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonRepresentation");
}

- (id)fetchNotificationsFromFileData:(id)a3 outError:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 2, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 && *a4)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_47_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __78__ATXNotificationManagementInspector_fetchNotificationsFromFileData_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CF91D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initFromJSON:", v3);

  return v4;
}

- (id)fetchNotificationsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldInferMessages:(BOOL)a6 outError:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v8 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  if (v14)
  {
    v17 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("biome")))
  {
    v40 = 0;
    -[ATXNotificationManagementInspector fetchNotificationsFromBiomeFromStartDate:endDate:outError:](self, "fetchNotificationsFromBiomeFromStartDate:endDate:outError:", v16, v18, &v40);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v40;
    if (!a7)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("db")))
  {
    -[ATXNotificationManagementInspector logAndCreateErrorForString:](self, "logAndCreateErrorForString:", CFSTR("Unknown source specified"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C9AA60];
    if (!a7)
      goto LABEL_15;
    goto LABEL_14;
  }
  -[ATXNotificationManagementInspector fetchNotificationsFromDbFromStartDate:endDate:](self, "fetchNotificationsFromDbFromStartDate:endDate:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  if (a7)
LABEL_14:
    *a7 = objc_retainAutorelease(v20);
LABEL_15:
  if (v8)
  {
    v32 = v18;
    v33 = v16;
    v34 = v13;
    v35 = v12;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E83D0430);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v19;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v27, "bundleID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v21, "containsObject:", v28);

          if (v29)
            objc_msgSend(v27, "setIsMessage:", 1);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v24);
    }

    v13 = v34;
    v12 = v35;
    v18 = v32;
    v16 = v33;
    v19 = v31;
  }

  return v19;
}

- (id)logAndCreateErrorForString:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ATXNotificationManagementInspector logAndCreateErrorForString:].cold.1();

  v5 = *MEMORY[0x1E0CB2D60];
  v9[0] = *MEMORY[0x1E0CB2938];
  v9[1] = v5;
  v10[0] = v3;
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATXNotificationManagementInspector"), 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchNotificationsFromBiomeFromStartDate:(id)a3 endDate:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  BOOL (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94E8]), "initWithMaxSize:", 200);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "publisherFromStartTime:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__68;
  v29 = __Block_byref_object_dispose__68;
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke;
  v24[3] = &unk_1E82E67E0;
  v24[4] = self;
  v24[5] = &v25;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_63;
  v21 = &unk_1E82E6808;
  v13 = v9;
  v22 = v13;
  v14 = v10;
  v23 = v14;
  v15 = (id)objc_msgSend(v12, "sinkWithCompletion:shouldContinue:", v24, &v18);
  if (a5)
    *a5 = objc_retainAutorelease((id)v26[5]);
  objc_msgSend(v14, "toArray", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_cold_1(a1, v3);

    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

BOOL __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v7 = v6;
  if (v5 <= v6)
  {
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isReceiveEvent"))
    {
      objc_msgSend(v8, "notification");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v8, "notification");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

      }
    }

  }
  return v5 <= v7;
}

- (id)fetchNotificationsFromDbFromStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "updateDatabase");
  objc_msgSend(v7, "allNotificationsBetweenStartTimestamp:endTimestamp:limit:", v6, v5, 200);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)constructStacksForNotifications:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "threadID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("(%@, %@)"), v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)constructStacksGroupedByAppForNotifications:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[ATXNotificationManagementInspector constructStacksForNotifications:](self, "constructStacksForNotifications:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    *(_QWORD *)&v7 = 138412290;
    v21 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "firstObject", v21, (_QWORD)v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v15 = (void *)objc_opt_new();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v16 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v16, "addObject:", v11);
        }
        else
        {
          __atxlog_handle_notification_management();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v27 = v18;
            _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "[%@] Missing bundle ID for stack", buf, 0xCu);

          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_37_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "%@ - timed out trying to get digest", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_43_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "%@ - timed out trying to get missed notification ranking", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)logAndCreateErrorForString:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "[%@] Error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v6, v7, "[%@] Failed to fetch Biome events with error %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
