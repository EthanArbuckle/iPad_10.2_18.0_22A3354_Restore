@implementation CESRSpeechProfileAdminServiceConnection

- (CESRSpeechProfileAdminServiceConnection)initWithServiceQueue:(id)a3 speechProfileSiteManager:(id)a4
{
  id v7;
  id v8;
  CESRSpeechProfileAdminServiceConnection *v9;
  CESRSpeechProfileAdminServiceConnection *v10;
  CESRSpeechProfileAdminServiceConnection *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CESRSpeechProfileAdminServiceConnection;
  v9 = -[CESRSpeechProfileAdminServiceConnection init](&v13, sel_init);
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_serviceQueue, a3), v10->_serviceQueue)
    && (objc_storeStrong((id *)&v10->_speechProfileSiteManager, a4), v10->_speechProfileSiteManager))
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_clearAllState
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[CESRSpeechProfileAdminServiceConnection _clearAllState]";
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s Resetting all state across all modules.", (uint8_t *)&v4, 0xCu);
  }
  -[CESRSpeechProfileSiteManager clearAllState](self->_speechProfileSiteManager, "clearAllState");
}

- (int64_t)_deleteUserExclusiveSitesWithUserId:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v5 = 2;
      goto LABEL_8;
    }
    v12 = 136315394;
    v13 = "-[CESRSpeechProfileAdminServiceConnection _deleteUserExclusiveSitesWithUserId:]";
    v14 = 2112;
    v15 = v4;
    v7 = "%s Invalid userId: %@";
    v8 = v6;
    v9 = 22;
LABEL_10:
    _os_log_error_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v12, v9);
    goto LABEL_7;
  }
  if (!-[CESRSpeechProfileSiteManager clearSpeechProfileSiteWithUserId:](self->_speechProfileSiteManager, "clearSpeechProfileSiteWithUserId:", v4))
  {
    v10 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = 136315138;
    v13 = "-[CESRSpeechProfileAdminServiceConnection _deleteUserExclusiveSitesWithUserId:]";
    v7 = "%s Clear failed.";
    v8 = v10;
    v9 = 12;
    goto LABEL_10;
  }
  v5 = 1;
LABEL_8:

  return v5;
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
  v4 = +[CESRUtilities isCustomerInstall](CESRUtilities, "isCustomerInstall");
  if (v4)
  {
    v5 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[CESRSpeechProfileAdminServiceConnection _isCustomerInstall:]";
      _os_log_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", (uint8_t *)&v7, 0xCu);
    }
    if (v3)
      v3[2](v3, 2);
  }

  return v4;
}

- (id)_serializeSetsFromKVProfile:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void (**v22)(id, uint64_t);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t))a4;
  v28 = 0;
  objc_msgSend(a3, "serializedSets:", &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  if (!v6)
  {
    v20 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[CESRSpeechProfileAdminServiceConnection _serializeSetsFromKVProfile:completion:]";
      v32 = 2112;
      v33 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_ERROR, "%s Failed to extract data from profile, error: %@", buf, 0x16u);
      if (!v5)
        goto LABEL_20;
    }
    else if (!v5)
    {
LABEL_20:
      v18 = 0;
      goto LABEL_21;
    }
    v5[2](v5, 2);
    goto LABEL_20;
  }
  v22 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      v13 = 0;
      v14 = v7;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
        v16 = objc_alloc(MEMORY[0x1E0D0D400]);
        v23 = v14;
        v17 = (void *)objc_msgSend(v16, "initWithData:error:", v15, &v23);
        v7 = v23;

        if (!v17)
        {
          v19 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v31 = "-[CESRSpeechProfileAdminServiceConnection _serializeSetsFromKVProfile:completion:]";
            v32 = 2112;
            v33 = v7;
            _os_log_error_impl(&dword_1B3E5F000, v19, OS_LOG_TYPE_ERROR, "%s Failed to initialize serialized set from data, error: %@", buf, 0x16u);
          }
          v5 = v22;
          if (v22)
            v22[2](v22, 2);

          v18 = 0;
          goto LABEL_16;
        }
        objc_msgSend(v8, "addObject:", v17);

        ++v13;
        v14 = v7;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v11)
        continue;
      break;
    }
  }

  v18 = v8;
  v5 = v22;
LABEL_16:

LABEL_21:
  return v18;
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  NSObject *serviceQueue;
  id v8;
  void (**v9)(id, uint64_t);
  _QWORD block[5];

  v4 = a3;
  v8 = a4;
  v6 = (void *)os_transaction_create();
  if (v4)
  {
    serviceQueue = self->_serviceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CESRSpeechProfileAdminServiceConnection_triggerMaintenance_completion___block_invoke;
    block[3] = &unk_1E6734990;
    block[4] = self;
    dispatch_sync(serviceQueue, block);
  }
  -[CESRSpeechProfileSiteManager performMaintenance:](self->_speechProfileSiteManager, "performMaintenance:", 0, v8);
  if (v9)
    v9[2](v9, 1);

}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *serviceQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create();
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__CESRSpeechProfileAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke;
  v13[3] = &unk_1E6734BA0;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  dispatch_async(serviceQueue, v13);

}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *serviceQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)os_transaction_create();
  serviceQueue = self->_serviceQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CESRSpeechProfileAdminServiceConnection_beginEvaluation_completion___block_invoke;
  v13[3] = &unk_1E6734BA0;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v8;
  v12 = v7;
  dispatch_async(serviceQueue, v13);

}

- (void)endEvaluation:(id)a3
{
  id v4;
  void *v5;
  NSObject *serviceQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CESRSpeechProfileAdminServiceConnection_endEvaluation___block_invoke;
  block[3] = &unk_1E6734AC0;
  v10 = v5;
  v11 = v4;
  block[4] = self;
  v7 = v5;
  v8 = v4;
  dispatch_async(serviceQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileSiteManager, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

uint64_t __57__CESRSpeechProfileAdminServiceConnection_endEvaluation___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_isCustomerInstall:", *(_QWORD *)(a1 + 48));
  if ((result & 1) == 0)
  {
    +[CESRSpeechProfileEvaluationStatus sharedStatus](CESRSpeechProfileEvaluationStatus, "sharedStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEvaluationEnabled");

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_clearAllState");
      +[CESRSpeechProfileEvaluationStatus sharedStatus](CESRSpeechProfileEvaluationStatus, "sharedStatus");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEvaluationEnabled:", 0);

      result = *(_QWORD *)(a1 + 48);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
    }
    else
    {
      v6 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        v7 = 136315138;
        v8 = "-[CESRSpeechProfileAdminServiceConnection endEvaluation:]_block_invoke";
        _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s Evaluation is not enabled. Use the beginEvaluation API to enable evaluation.", (uint8_t *)&v7, 0xCu);
      }
      result = *(_QWORD *)(a1 + 48);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
    }
  }
  return result;
}

void __70__CESRSpeechProfileAdminServiceConnection_beginEvaluation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isCustomerInstall:", *(_QWORD *)(a1 + 56)) & 1) == 0)
  {
    +[CESRSpeechProfileEvaluationStatus sharedStatus](CESRSpeechProfileEvaluationStatus, "sharedStatus");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEvaluationEnabled");

    if (v3)
    {
      v4 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[CESRSpeechProfileAdminServiceConnection beginEvaluation:completion:]_block_invoke";
        _os_log_error_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_ERROR, "%s Evaluation is already enabled. Use the endEvaluation API to disable evaluation.", buf, 0xCu);
      }
      v5 = *(_QWORD *)(a1 + 56);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_serializeSetsFromKVProfile:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        +[CESRSpeechProfileEvaluationStatus sharedStatus](CESRSpeechProfileEvaluationStatus, "sharedStatus");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setEvaluationEnabled:", 1);

        v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "rebuildAllSpeechProfilesWithSerializedSets:", v10);
        v8 = *(_QWORD *)(a1 + 56);
        if (v8)
        {
          if (v7)
            v9 = 1;
          else
            v9 = 2;
          (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);
        }
      }

    }
  }
}

uint64_t __84__CESRSpeechProfileAdminServiceConnection_rebuildSpeechProfileForUserId_completion___block_invoke(_QWORD *a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1[4] + 16), "rebuildSpeechProfileSiteWithUserId:", a1[5]);
  result = a1[7];
  if (result)
  {
    if (v2)
      v4 = 1;
    else
      v4 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

uint64_t __73__CESRSpeechProfileAdminServiceConnection_triggerMaintenance_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearAllState");
}

@end
