@implementation CKVAdminServiceConnection

- (CKVAdminServiceConnection)initWithServiceQueue:(id)a3 taskManager:(id)a4 semAdministrator:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKVAdminServiceConnection *v12;
  CKVAdminServiceConnection *v13;
  uint64_t v14;
  CKVTaskSettings *settings;
  CKVAdminServiceConnection *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKVAdminServiceConnection;
  v12 = -[CKVAdminServiceConnection init](&v18, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_6;
  objc_storeStrong((id *)&v12->_serviceQueue, a3);
  if (!v13->_serviceQueue)
    goto LABEL_7;
  objc_storeStrong((id *)&v13->_taskManager, a4);
  if (v13->_taskManager
    && (objc_storeStrong((id *)&v13->_semAdministrator, a5), v13->_semAdministrator)
    && (-[CKVTaskManager settings](v13->_taskManager, "settings"),
        v14 = objc_claimAutoreleasedReturnValue(),
        settings = v13->_settings,
        v13->_settings = (CKVTaskSettings *)v14,
        settings,
        v13->_settings))
  {
LABEL_6:
    v16 = v13;
  }
  else
  {
LABEL_7:
    v16 = 0;
  }

  return v16;
}

- (void)startEventSimulation:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  id v13;

  v6 = a4;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0D42C00], "emptyProfile:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CKVAdminServiceConnection_startEventSimulation_completion___block_invoke;
  v10[3] = &unk_1E4D293E8;
  v12 = a3;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[CKVAdminServiceConnection beginEvaluation:clean:completion:](self, "beginEvaluation:clean:completion:", v7, 1, v10);

}

- (void)finishEventSimulation:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CKVAdminServiceConnection_finishEventSimulation___block_invoke;
  v6[3] = &unk_1E4D29718;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CKVAdminServiceConnection endEvaluation:](self, "endEvaluation:", v6);

}

- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  id v8;
  NSObject *serviceQueue;
  id v10;
  _QWORD block[5];
  id v12;
  unsigned __int16 v13;
  unsigned __int16 v14;

  v8 = a5;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke;
  block[3] = &unk_1E4D295E8;
  block[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  dispatch_async(serviceQueue, block);

}

- (void)triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5
{
  id v8;
  NSObject *serviceQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a5;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke;
  block[3] = &unk_1E4D29438;
  v13 = a3;
  v14 = a4;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(serviceQueue, block);

}

- (void)triggerMaintenance:(id)a3
{
  id v4;
  CKVTaskManager *taskManager;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  taskManager = self->_taskManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke;
  v7[3] = &unk_1E4D29500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CKVTaskManager handleTask:reason:shouldDefer:completion:](taskManager, "handleTask:reason:shouldDefer:completion:", 102, 15, 0, v7);

}

- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *serviceQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceQueue = self->_serviceQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__CKVAdminServiceConnection_captureVocabularySnapshot_completion___block_invoke;
  v11[3] = &unk_1E4D29500;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(serviceQueue, v11);

}

- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *serviceQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CKVAdminServiceConnection_deleteAllItemsWithUserId_completion___block_invoke;
  block[3] = &unk_1E4D29740;
  v9 = v5;
  v7 = v5;
  dispatch_async(serviceQueue, block);

}

- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *serviceQueue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CKVAdminServiceConnection_deleteAllItemsWithUserId_deviceId_completion___block_invoke;
  block[3] = &unk_1E4D29740;
  v10 = v6;
  v8 = v6;
  dispatch_async(serviceQueue, block);

}

- (BOOL)_isCustomerInstall:(id)a3
{
  void (**v3)(id, uint64_t);
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t))a3;
  v4 = +[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall");
  if (v4)
  {
    v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[CKVAdminServiceConnection _isCustomerInstall:]";
      _os_log_impl(&dword_1A48B3000, v5, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v7, 0xCu);
    }
    if (v3)
      v3[2](v3, 2);
  }

  return v4;
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *serviceQueue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CKVAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke;
  block[3] = &unk_1E4D29740;
  v9 = v5;
  v7 = v5;
  dispatch_async(serviceQueue, block);

}

- (void)beginEvaluation:(id)a3 clean:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *serviceQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke;
  v13[3] = &unk_1E4D29488;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(serviceQueue, v13);

}

- (void)endEvaluation:(id)a3
{
  id v4;
  NSObject *serviceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serviceQueue = self->_serviceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CKVAdminServiceConnection_endEvaluation___block_invoke;
  v7[3] = &unk_1E4D29500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serviceQueue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_semAdministrator, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

uint64_t __43__CKVAdminServiceConnection_endEvaluation___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_isCustomerInstall:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEvaluationEnabled") & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "endEvaluation");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setEvaluationEnabled:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setEvaluationWithProfile:", 0);
      result = *(_QWORD *)(a1 + 40);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
    }
    else
    {
      v3 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v4 = 136315138;
        v5 = "-[CKVAdminServiceConnection endEvaluation:]_block_invoke";
        _os_log_error_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_ERROR, "%s Evaluation is not enabled. Use beginEvaluation API to enable evaluation.", (uint8_t *)&v4, 0xCu);
      }
      result = *(_QWORD *)(a1 + 40);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
    }
  }
  return result;
}

void __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isCustomerInstall:", *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEvaluationEnabled");
    v3 = CKLogContextVocabulary;
    if (v2 && os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke";
      _os_log_error_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_ERROR, "%s Evaluation is already enabled. Resetting all state.", buf, 0xCu);
      v3 = CKLogContextVocabulary;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke";
      _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s Enabling evaluaton", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setEvaluationEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 40), "profileInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "datasetCount");

    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setEvaluationWithProfile:", 1);
    if (((*(_BYTE *)(a1 + 56) == 0) & ~v2) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clearAllState");
    v6 = *(void **)(a1 + 40);
    v20 = 0;
    objc_msgSend(v6, "serializedSets:", &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    if (v7)
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "beginEvaluationWithSerializedSets:", v7);
      v10 = CKLogContextVocabulary;
      if (v9 == 1)
      {
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke_2";
          _os_log_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_INFO, "%s Evaluation ready", buf, 0xCu);
        }
        v11 = *(_QWORD *)(a1 + 48);
        if (v11)
          (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke_2";
        v23 = 2112;
        v24 = v7;
        _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to begin SiriEntityMatcher evaluation with serialized sets: %@", buf, 0x16u);
      }
      v15 = *(void **)(a1 + 32);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_12;
      v16[3] = &unk_1E4D29768;
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v15, "endEvaluation:", v16);
      v14 = v17;
    }
    else
    {
      v12 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CKVAdminServiceConnection beginEvaluation:clean:completion:]_block_invoke";
        v23 = 2112;
        v24 = v8;
        _os_log_error_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to convert KVProfile to serialized sets: %@", buf, 0x16u);
      }
      v13 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_10;
      v18[3] = &unk_1E4D29768;
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v13, "endEvaluation:", v18);
      v14 = v19;
    }

LABEL_24:
  }
}

uint64_t __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

uint64_t __62__CKVAdminServiceConnection_beginEvaluation_clean_completion___block_invoke_12(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

uint64_t __70__CKVAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CKVAdminServiceConnection rebuildSpeechProfileForUserId:completion:]_block_invoke";
    _os_log_error_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_ERROR, "%s No longer supported", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

uint64_t __74__CKVAdminServiceConnection_deleteAllItemsWithUserId_deviceId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CKVAdminServiceConnection deleteAllItemsWithUserId:deviceId:completion:]_block_invoke";
    _os_log_error_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_ERROR, "%s deleteAllItemsWithUserId:deviceId:completion: no longer supported.", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

uint64_t __65__CKVAdminServiceConnection_deleteAllItemsWithUserId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CKVAdminServiceConnection deleteAllItemsWithUserId:completion:]_block_invoke";
    _os_log_error_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_ERROR, "%s deleteAllItemsWithUserId:completion: no longer supported.", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

void __66__CKVAdminServiceConnection_captureVocabularySnapshot_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    v2 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CKVAdminServiceConnection captureVocabularySnapshot:completion:]_block_invoke";
      _os_log_impl(&dword_1A48B3000, v2, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 2, 0);
  }
  else
  {
    +[CKVSnapshotManager sharedInstance](CKVSnapshotManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v13 = 0;
    objc_msgSend(v4, "captureToFileInDirectory:error:", v5, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;

    if (!v6)
    {
      v8 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" to directory: %@"), *(_QWORD *)(a1 + 32));
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = &stru_1E4D29D08;
        }
        *(_DWORD *)buf = 136315650;
        v15 = "-[CKVAdminServiceConnection captureVocabularySnapshot:completion:]_block_invoke";
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v7;
        _os_log_error_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to capture snapshot%@: %@", buf, 0x20u);
        if (v11)

      }
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      if (v6)
        v10 = 1;
      else
        v10 = 2;
      (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, v10, v6);
    }

  }
}

void __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke_2;
  v3[3] = &unk_1E4D29460;
  v4 = v1;
  objc_msgSend(v2, "triggerMaintenance:completion:", 0, v3);

}

uint64_t __48__CKVAdminServiceConnection_triggerMaintenance___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;

  if (!+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    +[CKVSnapshotManager sharedInstance](CKVSnapshotManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cleanup");

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v6 = 1;
    else
      v6 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v6);
  }
  return result;
}

void __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  char v9;
  char v10;

  v2 = *(_BYTE *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clearAllState");
    v2 = *(_BYTE *)(a1 + 48);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_2;
  v7[3] = &unk_1E4D29438;
  v7[1] = 3221225472;
  v7[4] = v3;
  v9 = v2;
  v10 = *(_BYTE *)(a1 + 49);
  v8 = v4;
  objc_msgSend(v5, "handleTask:reason:shouldDefer:completion:", 103, 15, 0, v7);
  if (*(_BYTE *)(a1 + 49))
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }

}

void __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_3;
  v4[3] = &unk_1E4D29410;
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4[1] = 3221225472;
  v6 = *(_BYTE *)(a1 + 49);
  v5 = v1;
  objc_msgSend(v2, "triggerMaintenance:completion:", v3, v4);

}

uint64_t __78__CKVAdminServiceConnection_triggerMigration_completeAfterTrigger_completion___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;

  if (!*(_BYTE *)(result + 40))
  {
    result = *(_QWORD *)(result + 32);
    if (result)
    {
      if (a2 == 1)
        v2 = 1;
      else
        v2 = 2;
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
    }
  }
  return result;
}

void __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isCustomerInstall:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEvaluationEnabled") & 1) != 0)
    {
      v2 = *(void **)(a1 + 40);
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v4 = *(unsigned __int16 *)(a1 + 48);
      v5 = *(unsigned __int16 *)(a1 + 50);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke_1;
      v12[3] = &unk_1E4D29740;
      v13 = v2;
      if ((objc_msgSend(v3, "handleTask:reason:shouldDefer:completion:", v4, v5, 0, v12) & 1) == 0)
      {
        v6 = *(_QWORD *)(a1 + 40);
        if (v6)
          (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 2);
      }

    }
    else
    {
      v7 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v9 = *(unsigned __int16 *)(a1 + 48);
        v10 = v7;
        CKVTaskIdDescription(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v15 = "-[CKVAdminServiceConnection handleTask:reason:completion:]_block_invoke";
        v16 = 2112;
        v17 = v11;
        _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Unable to handle task (%@) as evaluation is not enabled", buf, 0x16u);

      }
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
        (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 2);
    }
  }
}

uint64_t __58__CKVAdminServiceConnection_handleTask_reason_completion___block_invoke_1(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __51__CKVAdminServiceConnection_finishEventSimulation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enableSimulatedTasks:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __61__CKVAdminServiceConnection_startEventSimulation_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 == 1)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enableSimulatedTasks:", *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
