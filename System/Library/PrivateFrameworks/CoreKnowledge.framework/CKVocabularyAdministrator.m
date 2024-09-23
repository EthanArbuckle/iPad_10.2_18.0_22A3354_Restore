@implementation CKVocabularyAdministrator

- (CKVocabularyAdministrator)initWithAdminService:(id)a3 queue:(id)a4
{
  return -[CKVocabularyAdministrator initWithAdminService:timeout:queue:](self, "initWithAdminService:timeout:queue:", a3, a4, 30.0);
}

- (CKVocabularyAdministrator)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v9;
  id v10;
  CKVocabularyAdministrator *v11;
  CKVocabularyAdministrator *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKVocabularyAdministrator;
  v11 = -[CKVocabularyAdministrator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_adminService, a3);
    v12->_timeout = a4;
    objc_storeStrong((id *)&v12->_queue, a5);
  }

  return v12;
}

- (CKVocabularyAdministrator)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use +makeAdministrator factory method"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)triggerMigration:(id)a3
{
  -[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:](self, "_triggerMigration:completeAfterTrigger:completion:", 0, 1, a3);
}

- (void)triggerMigration:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t);
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v4 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[CKVocabularyAdministrator triggerMigration:completion:]";
      _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v8, 0xCu);
    }
    if (v6)
      v6[2](v6, 3);
  }
  else
  {
    -[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:](self, "_triggerMigration:completeAfterTrigger:completion:", v4, 0, v6);
  }

}

- (void)_triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  id v13;
  void *v14;
  CKVAdminService *adminService;
  id v16;
  dispatch_time_t v17;
  NSObject *queue;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[4];
  __CFString *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v9 = CFSTR("completed");
  if (v5)
    v9 = CFSTR("triggered");
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke;
  aBlock[3] = &unk_1E4D296C8;
  v26 = v27;
  v12 = v10;
  v24 = v12;
  v13 = v8;
  v25 = v13;
  v14 = _Block_copy(aBlock);
  adminService = self->_adminService;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_9;
  v21[3] = &unk_1E4D29718;
  v21[4] = self;
  v16 = v14;
  v22 = v16;
  -[CKVAdminService triggerMigration:completeAfterTrigger:completion:](adminService, "triggerMigration:completeAfterTrigger:completion:", v6, v5, v21);
  if (v5)
  {
    v17 = dispatch_time(0, 3000000000);
    queue = self->_queue;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_3;
    v19[3] = &unk_1E4D29740;
    v20 = v16;
    dispatch_after(v17, queue, v19);

  }
  _Block_object_dispose(v27, 8);

}

- (void)triggerMaintenance:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  CKVAdminService *adminService;
  _QWORD v7[4];
  void (**v8)(id, uint64_t);
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CKVocabularyAdministrator triggerMaintenance:]";
      _os_log_impl(&dword_1A48B3000, v5, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4)
      v4[2](v4, 3);
  }
  else
  {
    adminService = self->_adminService;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__CKVocabularyAdministrator_triggerMaintenance___block_invoke;
    v7[3] = &unk_1E4D29768;
    v8 = v4;
    -[CKVAdminService triggerMaintenance:](adminService, "triggerMaintenance:", v7);

  }
}

- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  CKVAdminService *adminService;
  _QWORD v10[4];
  void (**v11)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    v8 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CKVocabularyAdministrator captureVocabularySnapshot:completion:]";
      _os_log_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v7)
      v7[2](v7, 3, 0);
  }
  else
  {
    adminService = self->_adminService;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__CKVocabularyAdministrator_captureVocabularySnapshot_completion___block_invoke;
    v10[3] = &unk_1E4D29790;
    v11 = v7;
    -[CKVAdminService captureVocabularySnapshot:completion:](adminService, "captureVocabularySnapshot:completion:", v6, v10);

  }
}

- (void)captureVocabularySnapshot:(id)a3
{
  -[CKVocabularyAdministrator captureVocabularySnapshot:completion:](self, "captureVocabularySnapshot:completion:", 0, a3);
}

- (id)simulateEventHandling:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v7;
  CKVAdminService *adminService;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  NSObject *v15;
  __int128 *p_buf;
  uint8_t v17[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CKVocabularyAdministrator simulateEventHandling:]";
      _os_log_impl(&dword_1A48B3000, v5, OS_LOG_TYPE_INFO, "%s Event simulation is not supported on customer install.", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  else
  {
    v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__1845;
    v24 = __Block_byref_object_dispose__1846;
    v25 = 0;
    adminService = self->_adminService;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__CKVocabularyAdministrator_simulateEventHandling___block_invoke;
    v14[3] = &unk_1E4D297B8;
    p_buf = &buf;
    v14[4] = self;
    v9 = v7;
    v15 = v9;
    -[CKVAdminService startEventSimulation:completion:](adminService, "startEventSimulation:completion:", v3, v14);
    v10 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    if (dispatch_group_wait(v9, v10))
    {
      v11 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeout);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v17 = 136315394;
        v18 = "-[CKVocabularyAdministrator simulateEventHandling:]";
        v19 = 2112;
        v20 = v13;
        _os_log_error_impl(&dword_1A48B3000, v11, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service to start simulation. timeout: %@ seconds", v17, 0x16u);

      }
    }
    v12 = *(id *)(*((_QWORD *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    return v12;
  }
}

- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  CKVAdminService *adminService;
  NSObject *v9;
  _QWORD v10[4];
  void (**v11)(id, uint64_t);
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (!objc_msgSend(v6, "length"))
  {
    v9 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CKVocabularyAdministrator deleteAllItemsWithUserId:completion:]";
      _os_log_error_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_ERROR, "%s userId cannot be empty.", buf, 0xCu);
      if (!v7)
        goto LABEL_6;
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    v7[2](v7, 3);
    goto LABEL_6;
  }
  adminService = self->_adminService;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__CKVocabularyAdministrator_deleteAllItemsWithUserId_completion___block_invoke;
  v10[3] = &unk_1E4D29768;
  v11 = v7;
  -[CKVAdminService deleteAllItemsWithUserId:completion:](adminService, "deleteAllItemsWithUserId:completion:", v6, v10);

LABEL_6:
}

- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  CKVAdminService *adminService;
  NSObject *v12;
  const char *v13;
  _QWORD v14[4];
  void (**v15)(id, uint64_t);
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  if (!objc_msgSend(v8, "length"))
  {
    v12 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    v17 = "-[CKVocabularyAdministrator deleteAllItemsWithUserId:deviceId:completion:]";
    v13 = "%s userId cannot be empty.";
    goto LABEL_11;
  }
  if (!objc_msgSend(v9, "length"))
  {
    v12 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      if (!v10)
        goto LABEL_9;
LABEL_8:
      v10[2](v10, 3);
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v17 = "-[CKVocabularyAdministrator deleteAllItemsWithUserId:deviceId:completion:]";
    v13 = "%s deviceId cannot be empty.";
LABEL_11:
    _os_log_error_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  adminService = self->_adminService;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__CKVocabularyAdministrator_deleteAllItemsWithUserId_deviceId_completion___block_invoke;
  v14[3] = &unk_1E4D29768;
  v15 = v10;
  -[CKVAdminService deleteAllItemsWithUserId:deviceId:completion:](adminService, "deleteAllItemsWithUserId:deviceId:completion:", v8, v9, v14);

LABEL_9:
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v6;
  CKVAdminService *adminService;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  adminService = self->_adminService;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__CKVocabularyAdministrator_rebuildSpeechProfileForUserId_completion___block_invoke;
  v9[3] = &unk_1E4D29768;
  v10 = v6;
  v8 = v6;
  -[CKVAdminService rebuildSpeechProfileForUserId:completion:](adminService, "rebuildSpeechProfileForUserId:completion:", a3, v9);

}

- (id)rawSpeechProfileConverter
{
  return -[CKVEvaluationProfileBuilder initWithOmittedItemTypes:]([CKVEvaluationProfileBuilder alloc], "initWithOmittedItemTypes:", 0);
}

- (id)rawSpeechProfileConverterOmittingItemTypes:(id)a3
{
  id v3;
  CKVEvaluationProfileBuilder *v4;

  v3 = a3;
  v4 = -[CKVEvaluationProfileBuilder initWithOmittedItemTypes:]([CKVEvaluationProfileBuilder alloc], "initWithOmittedItemTypes:", v3);

  return v4;
}

- (void)beginEvaluation:(id)a3 options:(unsigned __int16)a4 completion:(id)a5
{
  int v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  CKVAdminService *adminService;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    v10 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]";
      _os_log_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
      if (!v9)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    if (v8)
    {
      v11 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]";
        v18 = 1024;
        v19 = v6;
        _os_log_impl(&dword_1A48B3000, v11, OS_LOG_TYPE_INFO, "%s Submitting request to begin evaluation with options: %X", buf, 0x12u);
      }
      adminService = self->_adminService;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__CKVocabularyAdministrator_beginEvaluation_options_completion___block_invoke;
      v14[3] = &unk_1E4D29768;
      v15 = v9;
      -[CKVAdminService beginEvaluation:clean:completion:](adminService, "beginEvaluation:clean:completion:", v8, (v6 & 1) == 0, v14);

      goto LABEL_12;
    }
    v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]";
      _os_log_error_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_ERROR, "%s Profile cannot be nil.", buf, 0xCu);
      if (!v9)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  if (v9)
LABEL_11:
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 3);
LABEL_12:

}

- (int64_t)beginEvaluation:(id)a3 options:(unsigned __int16)a4
{
  id v6;
  id v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;
  unsigned __int16 v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__CKVocabularyAdministrator_beginEvaluation_options___block_invoke;
  v10[3] = &unk_1E4D297E0;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  v8 = -[CKVocabularyAdministrator _synchronouslyWrapRequest:](self, "_synchronouslyWrapRequest:", v10);

  return v8;
}

- (void)endEvaluation:(id)a3
{
  void (**v4)(id, uint64_t);
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  CKVAdminService *adminService;
  _QWORD v9[4];
  void (**v10)(id, uint64_t);
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = +[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall");
  v6 = CKLogContextVocabulary;
  v7 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CKVocabularyAdministrator endEvaluation:]";
      _os_log_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4)
      v4[2](v4, 3);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CKVocabularyAdministrator endEvaluation:]";
      _os_log_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_INFO, "%s Submitting request to end evaluation", buf, 0xCu);
    }
    adminService = self->_adminService;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__CKVocabularyAdministrator_endEvaluation___block_invoke;
    v9[3] = &unk_1E4D29768;
    v10 = v4;
    -[CKVAdminService endEvaluation:](adminService, "endEvaluation:", v9);

  }
}

- (int64_t)endEvaluation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CKVocabularyAdministrator_endEvaluation__block_invoke;
  v3[3] = &unk_1E4D29808;
  v3[4] = self;
  return -[CKVocabularyAdministrator _synchronouslyWrapRequest:](self, "_synchronouslyWrapRequest:", v3);
}

- (void)executeEvaluationTask:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v6)(id, uint64_t);
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  CKVAdminService *adminService;
  _QWORD v17[4];
  void (**v18)(id, uint64_t);
  __int16 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  if (+[CKVAssistantSettingsBridge isCustomerInstall](CKVAssistantSettingsBridge, "isCustomerInstall"))
  {
    v7 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]";
      _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
LABEL_7:
    if (v6)
      v6[2](v6, 3);
    goto LABEL_15;
  }
  if (v4 >= 2)
  {
    v8 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = v8;
      objc_msgSend(v9, "numberWithUnsignedShort:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]";
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_INFO, "%s evaluationTaskId: %@ is not valid.", buf, 0x16u);

    }
    goto LABEL_7;
  }
  if ((_DWORD)v4)
    v12 = 4 * ((_DWORD)v4 == 1);
  else
    v12 = 2;
  v13 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    CKVTaskIdDescription(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]";
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_1A48B3000, v14, OS_LOG_TYPE_INFO, "%s Submitting request to execute task (%@)", buf, 0x16u);

  }
  adminService = self->_adminService;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__CKVocabularyAdministrator_executeEvaluationTask_completion___block_invoke;
  v17[3] = &unk_1E4D29830;
  v18 = v6;
  v19 = v12;
  -[CKVAdminService handleTask:reason:completion:](adminService, "handleTask:reason:completion:", v12, 17, v17);

LABEL_15:
}

- (int64_t)executeEvaluationTask:(unsigned __int16)a3
{
  _QWORD v4[5];
  unsigned __int16 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CKVocabularyAdministrator_executeEvaluationTask___block_invoke;
  v4[3] = &unk_1E4D29858;
  v4[4] = self;
  v5 = a3;
  return -[CKVocabularyAdministrator _synchronouslyWrapRequest:](self, "_synchronouslyWrapRequest:", v4);
}

- (int64_t)_synchronouslyWrapRequest:(id)a3
{
  void (**v4)(id, _QWORD *);
  dispatch_group_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  dispatch_time_t v10;
  NSObject *queue;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = (void (**)(id, _QWORD *))a3;
  v5 = dispatch_group_create();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke;
  aBlock[3] = &unk_1E4D297B8;
  v20 = &v21;
  aBlock[4] = self;
  v7 = v5;
  v19 = v7;
  v8 = _Block_copy(aBlock);
  dispatch_group_enter(v7);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_21;
  v16[3] = &unk_1E4D29718;
  v16[4] = self;
  v9 = v8;
  v17 = v9;
  v4[2](v4, v16);
  v10 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  if (dispatch_group_wait(v7, v10))
  {
    queue = self->_queue;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_3;
    v14[3] = &unk_1E4D29740;
    v15 = v9;
    dispatch_sync(queue, v14);

  }
  v12 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_adminService, 0);
}

void __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_QWORD *)(v2 + 24))
  {
    *(_QWORD *)(v2 + 24) = a2;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 4)
    {
      v4 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = *(double *)(*(_QWORD *)(a1 + 32) + 16);
        v7 = v4;
        objc_msgSend(v5, "numberWithDouble:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[CKVocabularyAdministrator _synchronouslyWrapRequest:]_block_invoke";
        v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service. timeout: %@ seconds", (uint8_t *)&v9, 0x16u);

      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_21(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_2;
  v5[3] = &unk_1E4D296F0;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__CKVocabularyAdministrator__synchronouslyWrapRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __51__CKVocabularyAdministrator_executeEvaluationTask___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeEvaluationTask:completion:", *(unsigned __int16 *)(a1 + 40), a2);
}

uint64_t __62__CKVocabularyAdministrator_executeEvaluationTask_completion___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    v4 = result;
    v5 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v6 = *(unsigned __int16 *)(v4 + 40);
      v7 = v5;
      CKVTaskIdDescription(v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("failed");
      v13 = "-[CKVocabularyAdministrator executeEvaluationTask:completion:]_block_invoke";
      v12 = 136315650;
      if (a2 == 1)
        v10 = CFSTR("completed");
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Task (%@) %@", (uint8_t *)&v12, 0x20u);

      v2 = *(_QWORD *)(v4 + 32);
    }
    if (a2 == 1)
      v11 = 1;
    else
      v11 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v11);
  }
  return result;
}

uint64_t __42__CKVocabularyAdministrator_endEvaluation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "endEvaluation:", a2);
}

uint64_t __43__CKVocabularyAdministrator_endEvaluation___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NOT ");
    if (a2 == 1)
      v5 = &stru_1E4D29D08;
    v8 = 136315394;
    v9 = "-[CKVocabularyAdministrator endEvaluation:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@deactivated", (uint8_t *)&v8, 0x16u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v7 = 1;
    else
      v7 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

uint64_t __53__CKVocabularyAdministrator_beginEvaluation_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginEvaluation:options:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48), a2);
}

uint64_t __64__CKVocabularyAdministrator_beginEvaluation_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NOT ");
    if (a2 == 1)
      v5 = &stru_1E4D29D08;
    v8 = 136315394;
    v9 = "-[CKVocabularyAdministrator beginEvaluation:options:completion:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@activated", (uint8_t *)&v8, 0x16u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v7 = 1;
    else
      v7 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

uint64_t __70__CKVocabularyAdministrator_rebuildSpeechProfileForUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __74__CKVocabularyAdministrator_deleteAllItemsWithUserId_deviceId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __65__CKVocabularyAdministrator_deleteAllItemsWithUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

void __51__CKVocabularyAdministrator_simulateEventHandling___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  CKVocabularyAdminEventSimulator *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = CKLogContextVocabulary;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[CKVocabularyAdministrator simulateEventHandling:]_block_invoke";
      _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s Successfuly start an event simulation.", (uint8_t *)&v11, 0xCu);
    }
    v4 = -[CKVocabularyAdminEventSimulator initWithAdminService:]([CKVocabularyAdminEventSimulator alloc], "initWithAdminService:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v3;
    objc_msgSend(v8, "numberWithInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[CKVocabularyAdministrator simulateEventHandling:]_block_invoke";
    v13 = 2112;
    v14 = v10;
    _os_log_error_impl(&dword_1A48B3000, v9, OS_LOG_TYPE_ERROR, "%s Failed to start an event simulation due to service error result: %@", (uint8_t *)&v11, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __66__CKVocabularyAdministrator_captureVocabularySnapshot_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __48__CKVocabularyAdministrator_triggerMaintenance___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke(uint64_t result, uint64_t a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v3 = (_QWORD *)result;
    if (a2 == 3)
    {
      v7 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)v3[4];
        v14 = 136315650;
        v15 = "-[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:]_block_invoke";
        v16 = 2112;
        v17 = &unk_1E4D31BB8;
        v18 = 2112;
        v19 = v8;
        _os_log_error_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_ERROR, "%s Timed out after %@s waiting for migration to be %@", (uint8_t *)&v14, 0x20u);
      }
    }
    else
    {
      if (a2 == 1)
      {
        v4 = CKLogContextVocabulary;
        v5 = 1;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          v6 = (void *)v3[4];
          v14 = 136315394;
          v15 = "-[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:]_block_invoke";
          v16 = 2112;
          v17 = v6;
          v5 = 1;
          _os_log_impl(&dword_1A48B3000, v4, OS_LOG_TYPE_INFO, "%s Successfuly %@ migration.", (uint8_t *)&v14, 0x16u);
        }
        goto LABEL_11;
      }
      v9 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)v3[4];
        v11 = (void *)MEMORY[0x1E0CB37E8];
        v12 = v9;
        objc_msgSend(v11, "numberWithInteger:", a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[CKVocabularyAdministrator _triggerMigration:completeAfterTrigger:completion:]_block_invoke";
        v16 = 2112;
        v17 = v10;
        v18 = 2112;
        v19 = v13;
        _os_log_error_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_ERROR, "%s Migration failed to be %@ due to service error result: %@", (uint8_t *)&v14, 0x20u);

      }
    }
    v5 = 2;
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 24) = v5;
    result = v3[5];
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(v3[6] + 8) + 24));
  }
  return result;
}

void __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_2;
  v5[3] = &unk_1E4D296F0;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__CKVocabularyAdministrator__triggerMigration_completeAfterTrigger_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)makeAdministrator
{
  void *v2;
  void *v3;

  +[CKVAdministratorFactory sharedAdministratorFactory](CKVAdministratorFactory, "sharedAdministratorFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "administrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)initialize
{
  if (CKLogInit_onceToken != -1)
    dispatch_once(&CKLogInit_onceToken, &__block_literal_global_469);
}

@end
