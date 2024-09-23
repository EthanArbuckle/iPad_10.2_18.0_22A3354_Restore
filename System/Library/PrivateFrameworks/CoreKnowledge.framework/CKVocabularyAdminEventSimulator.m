@implementation CKVocabularyAdminEventSimulator

- (CKVocabularyAdminEventSimulator)initWithAdminService:(id)a3
{
  return -[CKVocabularyAdminEventSimulator initWithAdminService:timeout:](self, "initWithAdminService:timeout:", a3, 30.0);
}

- (CKVocabularyAdminEventSimulator)initWithAdminService:(id)a3 timeout:(double)a4
{
  id v7;
  CKVocabularyAdminEventSimulator *v8;
  CKVocabularyAdminEventSimulator *v9;
  CKVocabularyAdminEventSimulator *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKVocabularyAdminEventSimulator;
  v8 = -[CKVocabularyAdminEventSimulator init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adminService, a3);
    if (!v9->_adminService)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v9->_timeout = a4;
    v9->_simulationFinished = 0;
  }
  v10 = v9;
LABEL_6:

  return v10;
}

- (void)dealloc
{
  id v2;
  objc_super v3;

  if (!self->_simulationFinished)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("[CKVocabularyAdminEventSimulator finish] was not called"), MEMORY[0x1E0C9AA70]);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  v3.receiver = self;
  v3.super_class = (Class)CKVocabularyAdminEventSimulator;
  -[CKVocabularyAdminEventSimulator dealloc](&v3, sel_dealloc);
}

- (int64_t)finish
{
  NSObject *v3;
  CKVAdminService *adminService;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  int64_t v8;
  void *v10;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 2;
  adminService = self->_adminService;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__CKVocabularyAdminEventSimulator_finish__block_invoke;
  v11[3] = &unk_1E4D297B8;
  v13 = &v14;
  v11[4] = self;
  v5 = v3;
  v12 = v5;
  -[CKVAdminService finishEventSimulation:](adminService, "finishEventSimulation:", v11);
  v6 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  if (dispatch_group_wait(v5, v6))
  {
    v7 = (id)CKLogContextVocabulary;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeout);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[CKVocabularyAdminEventSimulator finish]";
      v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service to finish simulation. timeout: %@ seconds", buf, 0x16u);

    }
  }
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  CKVAdminService *adminService;
  id v10;
  _QWORD v11[4];
  id v12;
  __int16 v13;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  adminService = self->_adminService;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CKVocabularyAdminEventSimulator_handleTask_reason_completion___block_invoke;
  v11[3] = &unk_1E4D29830;
  v13 = v6;
  v12 = v8;
  v10 = v8;
  -[CKVAdminService handleTask:reason:completion:](adminService, "handleTask:reason:completion:", v6, v5, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adminService, 0);
}

uint64_t __64__CKVocabularyAdminEventSimulator_handleTask_reason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t result;
  uint64_t (*v8)(void);
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CKLogContextVocabulary;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v4 = *(unsigned __int16 *)(a1 + 40);
      v5 = v3;
      CKVTaskIdDescription(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[CKVocabularyAdminEventSimulator handleTask:reason:completion:]_block_invoke";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1A48B3000, v5, OS_LOG_TYPE_INFO, "%s Successfuly handle %@ simulated event.", (uint8_t *)&v14, 0x16u);

    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v10 = *(unsigned __int16 *)(a1 + 40);
      v11 = v3;
      CKVTaskIdDescription(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[CKVocabularyAdminEventSimulator handleTask:reason:completion:]_block_invoke";
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_1A48B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to handle %@ simulated event due to service error result: %@", (uint8_t *)&v14, 0x20u);

    }
    result = *(_QWORD *)(a1 + 32);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

void __41__CKVocabularyAdminEventSimulator_finish__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = CKLogContextVocabulary;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[CKVocabularyAdminEventSimulator finish]_block_invoke";
      _os_log_impl(&dword_1A48B3000, v3, OS_LOG_TYPE_INFO, "%s Successfuly finish event simulation.", (uint8_t *)&v8, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = v3;
    objc_msgSend(v5, "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CKVocabularyAdminEventSimulator finish]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_1A48B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to finish event simulation due to service error result: %@", (uint8_t *)&v8, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end
