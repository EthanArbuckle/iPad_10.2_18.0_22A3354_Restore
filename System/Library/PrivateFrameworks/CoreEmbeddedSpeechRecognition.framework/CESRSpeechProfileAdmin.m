@implementation CESRSpeechProfileAdmin

- (CESRSpeechProfileAdmin)initWithAdminService:(id)a3 queue:(id)a4
{
  return -[CESRSpeechProfileAdmin initWithAdminService:timeout:queue:](self, "initWithAdminService:timeout:queue:", a3, a4, 30.0);
}

- (CESRSpeechProfileAdmin)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v9;
  id v10;
  CESRSpeechProfileAdmin *v11;
  CESRSpeechProfileAdmin *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CESRSpeechProfileAdmin;
  v11 = -[CESRSpeechProfileAdmin init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_adminService, a3);
    v12->_timeout = a4;
    objc_storeStrong((id *)&v12->_queue, a5);
  }

  return v12;
}

- (CESRSpeechProfileAdmin)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use +makeAdmin factory method"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, uint64_t);
  NSObject *v7;
  CESRSpeechProfileAdminService *adminService;
  _QWORD v9[4];
  void (**v10)(id, uint64_t);
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a4;
  if (+[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall"))
  {
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CESRSpeechProfileAdmin triggerMaintenance:completion:]";
      _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v6)
      v6[2](v6, 3);
  }
  else
  {
    adminService = self->_adminService;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__CESRSpeechProfileAdmin_triggerMaintenance_completion___block_invoke;
    v9[3] = &unk_1E67345D8;
    v10 = v6;
    -[CESRSpeechProfileAdminService triggerMaintenance:completion:](adminService, "triggerMaintenance:completion:", v4, v9);

  }
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v6;
  CESRSpeechProfileAdminService *adminService;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  adminService = self->_adminService;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CESRSpeechProfileAdmin_rebuildSpeechProfileForUserId_completion___block_invoke;
  v9[3] = &unk_1E67345D8;
  v10 = v6;
  v8 = v6;
  -[CESRSpeechProfileAdminService rebuildSpeechProfileForUserId:completion:](adminService, "rebuildSpeechProfileForUserId:completion:", a3, v9);

}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  CESRSpeechProfileAdminService *adminService;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall"))
  {
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]";
      _os_log_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
      if (!v7)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v9 = *MEMORY[0x1E0CFE6C0];
    v10 = *MEMORY[0x1E0CFE6C0];
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]";
        _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Submitting request to begin evaluation.", buf, 0xCu);
      }
      adminService = self->_adminService;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53__CESRSpeechProfileAdmin_beginEvaluation_completion___block_invoke;
      v12[3] = &unk_1E67345D8;
      v13 = v7;
      -[CESRSpeechProfileAdminService beginEvaluation:completion:](adminService, "beginEvaluation:completion:", v6, v12);

      goto LABEL_12;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]";
      _os_log_error_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_ERROR, "%s Profile cannot be nil.", buf, 0xCu);
      if (!v7)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  if (v7)
LABEL_11:
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 3);
LABEL_12:

}

- (int64_t)beginEvaluation:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__CESRSpeechProfileAdmin_beginEvaluation___block_invoke;
  v8[3] = &unk_1E6734600;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = -[CESRSpeechProfileAdmin _synchronouslyWrapRequest:](self, "_synchronouslyWrapRequest:", v8);

  return v6;
}

- (void)endEvaluation:(id)a3
{
  void (**v4)(id, uint64_t);
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  CESRSpeechProfileAdminService *adminService;
  _QWORD v9[4];
  void (**v10)(id, uint64_t);
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = +[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall");
  v6 = *MEMORY[0x1E0CFE6C0];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CESRSpeechProfileAdmin endEvaluation:]";
      _os_log_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4)
      v4[2](v4, 3);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CESRSpeechProfileAdmin endEvaluation:]";
      _os_log_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_INFO, "%s Submitting request to end evaluation", buf, 0xCu);
    }
    adminService = self->_adminService;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__CESRSpeechProfileAdmin_endEvaluation___block_invoke;
    v9[3] = &unk_1E67345D8;
    v10 = v4;
    -[CESRSpeechProfileAdminService endEvaluation:](adminService, "endEvaluation:", v9);

  }
}

- (int64_t)endEvaluation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__CESRSpeechProfileAdmin_endEvaluation__block_invoke;
  v3[3] = &unk_1E6734628;
  v3[4] = self;
  return -[CESRSpeechProfileAdmin _synchronouslyWrapRequest:](self, "_synchronouslyWrapRequest:", v3);
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
  aBlock[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke;
  aBlock[3] = &unk_1E6734650;
  v20 = &v21;
  aBlock[4] = self;
  v7 = v5;
  v19 = v7;
  v8 = _Block_copy(aBlock);
  dispatch_group_enter(v7);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_10;
  v16[3] = &unk_1E67346A0;
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
    v14[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_3;
    v14[3] = &unk_1E6734CB8;
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

void __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke(uint64_t a1, uint64_t a2)
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
      v4 = (void *)*MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = *(double *)(*(_QWORD *)(a1 + 32) + 16);
        v7 = v4;
        objc_msgSend(v5, "numberWithDouble:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[CESRSpeechProfileAdmin _synchronouslyWrapRequest:]_block_invoke";
        v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service. Timeout: %@ seconds", (uint8_t *)&v9, 0x16u);

      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_10(uint64_t a1, uint64_t a2)
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
  v5[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_2;
  v5[3] = &unk_1E6734678;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __39__CESRSpeechProfileAdmin_endEvaluation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "endEvaluation:", a2);
}

uint64_t __40__CESRSpeechProfileAdmin_endEvaluation___block_invoke(uint64_t a1, uint64_t a2)
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
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NOT ");
    if (a2 == 1)
      v5 = &stru_1E67359A8;
    v8 = 136315394;
    v9 = "-[CESRSpeechProfileAdmin endEvaluation:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@deactivated", (uint8_t *)&v8, 0x16u);
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

uint64_t __42__CESRSpeechProfileAdmin_beginEvaluation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginEvaluation:completion:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __53__CESRSpeechProfileAdmin_beginEvaluation_completion___block_invoke(uint64_t a1, uint64_t a2)
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
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NOT ");
    if (a2 == 1)
      v5 = &stru_1E67359A8;
    v8 = 136315394;
    v9 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@activated", (uint8_t *)&v8, 0x16u);
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

uint64_t __67__CESRSpeechProfileAdmin_rebuildSpeechProfileForUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t __56__CESRSpeechProfileAdmin_triggerMaintenance_completion___block_invoke(uint64_t a1, uint64_t a2)
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

+ (id)makeAdmin
{
  void *v2;
  void *v3;

  +[CESRSpeechProfileAdminFactory sharedAdminFactory](CESRSpeechProfileAdminFactory, "sharedAdminFactory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "admin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
