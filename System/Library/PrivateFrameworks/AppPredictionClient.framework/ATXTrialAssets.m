@implementation ATXTrialAssets

- (ATXTrialAssets)init
{
  ATXTrialAssets *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _PASLock *lock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXTrialAssets;
  v2 = -[ATXTrialAssets init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A85A4F90]();
    v4 = (id *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 105);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v4[1];
    v4[1] = (id)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v7;

    objc_msgSend(v4[1], "refresh");
    -[ATXTrialAssets fetchTrialExperimentIdentifiers](v2, "fetchTrialExperimentIdentifiers");

    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (id)client
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__ATXTrialAssets_client__block_invoke;
  v5[3] = &unk_1E4D577C8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__ATXTrialAssets_client__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 8), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)dictionaryForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[ATXTrialAssets filePathForResource:](self, "filePathForResource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    loadLazyOrRegularPlist(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_trial_assets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXTrialAssets dictionaryForResource:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v7 = 0;
  }

  return v7;
}

- (id)dictionaryForClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTrialAssets dictionaryForClassName:](self, "dictionaryForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryForClassName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[ATXTrialAssets filePathForClassName:](self, "filePathForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    loadLazyOrRegularPlist(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_trial_assets();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXTrialAssets dictionaryForClassName:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v7 = 0;
  }

  return v7;
}

- (id)filePathForClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTrialAssets filePathForClassName:](self, "filePathForClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)trialFactorName:(id)a3
{
  return (id)objc_msgSend(CFSTR("A"), "stringByAppendingString:", a3);
}

- (id)filePathForResource:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__ATXTrialAssets_filePathForResource___block_invoke;
  v9[3] = &unk_1E4D577F0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__ATXTrialAssets_filePathForResource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;

  v11 = a2;
  v3 = (void *)MEMORY[0x1A85A4F90]();
  v4 = (void *)v11[1];
  objc_msgSend(*(id *)(a1 + 32), "trialFactorName:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "levelForFactor:withNamespaceName:", v5, CFSTR("SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fileValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_autoreleasePoolPop(v3);
}

- (id)directoryPathForTrialResource:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__ATXTrialAssets_directoryPathForTrialResource___block_invoke;
  v9[3] = &unk_1E4D577F0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__ATXTrialAssets_directoryPathForTrialResource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;

  v11 = a2;
  v3 = (void *)MEMORY[0x1A85A4F90]();
  v4 = (void *)v11[1];
  objc_msgSend(*(id *)(a1 + 32), "trialFactorName:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "levelForFactor:withNamespaceName:", v5, CFSTR("SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "directoryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_autoreleasePoolPop(v3);
}

- (void)addUpdateHandlerWithBlock:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke;
  v7[3] = &unk_1E4D57840;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke_2;
  v4[3] = &unk_1E4D57818;
  v5 = *(id *)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS"), v4);

}

uint64_t __44__ATXTrialAssets_addUpdateHandlerWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTrialExperimentIdentifiers
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__ATXTrialAssets_fetchTrialExperimentIdentifiers__block_invoke;
  v3[3] = &unk_1E4D57868;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

void __49__ATXTrialAssets_fetchTrialExperimentIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  objc_msgSend(*(id *)(a2 + 8), "experimentIdentifiersWithNamespaceName:", CFSTR("SYSTEM_SPACE_INTELLIGENCE_SPOTLIGHT_SUGGESTIONS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "experimentId");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v5;

    objc_msgSend(v4, "treatmentId");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v8;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 32);
    *(_QWORD *)(v13 + 32) = v12;

  }
  else
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_INFO, "ATXTrialClientWrapper: Unable to fetch experimentId, deploymentId, treatmentId", v16, 2u);
    }

  }
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)dictionaryForResource:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not get file path for resource: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)dictionaryForClassName:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a2, a3, "Could not get file path for class: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
