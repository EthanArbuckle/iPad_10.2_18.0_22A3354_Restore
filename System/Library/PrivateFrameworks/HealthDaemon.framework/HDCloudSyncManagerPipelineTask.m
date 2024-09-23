@implementation HDCloudSyncManagerPipelineTask

- (HDCloudSyncManagerPipelineTask)initWithManager:(id)a3 context:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncManagerPipelineTask)initWithManager:(id)a3 context:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDCloudSyncManagerPipelineTask *v13;
  HDCloudSyncManagerPipelineTask *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  id v20;
  HDAssertion *accessibilityAssertion;
  uint64_t v22;
  id completion;
  id v25;
  objc_super v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HDCloudSyncManagerPipelineTask;
  v13 = -[HDCloudSyncManagerRepositoryTask initWithManager:context:](&v26, sel_initWithManager_context_, v10, a4);
  v14 = v13;
  if (v13)
  {
    v13->_lock._os_unfair_lock_opaque = 0;
    if (v11)
    {
      objc_msgSend(v10, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v16, "cloneAccessibilityAssertion:ownerIdentifier:error:", v11, v18, &v25);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v25;
      accessibilityAssertion = v14->_accessibilityAssertion;
      v14->_accessibilityAssertion = (HDAssertion *)v19;

    }
    v22 = objc_msgSend(v12, "copy");
    completion = v14->_completion;
    v14->_completion = (id)v22;

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertion invalidate](self->_accessibilityAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDCloudSyncManagerPipelineTask;
  -[HDCloudSyncManagerPipelineTask dealloc](&v3, sel_dealloc);
}

- (void)mainWithRepositories:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HDCloudSyncManagerPipelineTask *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  uint8_t buf[4];
  HDCloudSyncManagerPipelineTask *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  id v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      v55[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncManagerPipelineTask didFailWithErrors:](self, "didFailWithErrors:", v36);

    }
    else
    {
      -[HDCloudSyncManagerPipelineTask didFailWithErrors:](self, "didFailWithErrors:", MEMORY[0x1E0C9AA60]);
    }
    v37 = self;
    v38 = 0;
    v39 = v9;
    goto LABEL_23;
  }
  v10 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke;
  v48[3] = &unk_1E6D11540;
  v48[4] = self;
  objc_msgSend(v7, "hk_map:", v48);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerPipelineTask setPipelines:](self, "setPipelines:", v11);

  -[HDCloudSyncManagerPipelineTask pipelines](self, "pipelines");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    -[HDCloudSyncManagerPipelineTask didFinishWithSuccess](self, "didFinishWithSuccess");
    v37 = self;
    v38 = 1;
    v39 = 0;
LABEL_23:
    -[HDCloudSyncManagerPipelineTask callCompletionWithSuccess:error:](v37, "callCompletionWithSuccess:error:", v38, v39);
    -[HDCloudSyncManagerTask finish](self, "finish");
    goto LABEL_24;
  }
  if (-[HDCloudSyncManagerPipelineTask requiresExistingShareOwnerParticipant](self, "requiresExistingShareOwnerParticipant"))
  {
    -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v14, "shareOwnerParticipantWithError:", &v47);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v47;

    if (v15)
    {

      goto LABEL_6;
    }
    _HKInitializeLogging();
    v40 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v50 = self;
      _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Sync unavailable before setting a source share participant for this profile.", buf, 0xCu);
      if (v16)
        goto LABEL_28;
    }
    else if (v16)
    {
LABEL_28:
      v54 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncManagerPipelineTask didFailWithErrors:](self, "didFailWithErrors:", v41);

      -[HDCloudSyncManagerPipelineTask callCompletionWithSuccess:error:](self, "callCompletionWithSuccess:error:", 0, v16);
      -[HDCloudSyncManagerTask finish](self, "finish");

      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:class:selector:format:", 729, objc_opt_class(), a2, CFSTR("Sync unavailable before setting a source share participant for this profile."));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_6:
  -[HDCloudSyncManagerPipelineTask pipelines](self, "pipelines");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 100 * objc_msgSend(v17, "count");
  -[HDCloudSyncManagerTask progress](self, "progress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTotalUnitCount:", v18);

  v20 = objc_alloc(MEMORY[0x1E0D29810]);
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v10;
  v46[1] = 3221225472;
  v46[2] = __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke_193;
  v46[3] = &unk_1E6D11568;
  v46[4] = self;
  v23 = (void *)objc_msgSend(v20, "initWithDescription:completion:", v22, v46);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HDCloudSyncManagerPipelineTask pipelines](self, "pipelines", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (-[HDCloudSyncManagerTask priority](self, "priority") == 100)
          objc_msgSend(v29, "setIgnoreCloudKitOperationDelay:", 1);
        objc_msgSend(v29, "beginWithTaskTree:", v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncManagerTask progress](self, "progress");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addChild:withPendingUnitCount:", v30, 100);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v26);
  }

  _HKInitializeLogging();
  v32 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    -[HDCloudSyncManagerPipelineTask pipelines](self, "pipelines");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");
    *(_DWORD *)buf = 138543618;
    v50 = self;
    v51 = 2048;
    v52 = v35;
    _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning %ld pipelines.", buf, 0x16u);

  }
  objc_msgSend(v23, "begin");

LABEL_24:
}

id __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "pipelineForRepository:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "runWhenSyncProhibited"))
    objc_msgSend(v3, "setContinueWhenSyncDisabled:", 1);
  return v3;
}

void __61__HDCloudSyncManagerPipelineTask_mainWithRepositories_error___block_invoke_193(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "invalidate");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (!a3)
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = 138543362;
        v17 = v15;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished successfully.", (uint8_t *)&v16, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "didFinishWithSuccess");
      objc_msgSend(*(id *)(a1 + 32), "callCompletionWithSuccess:error:", 1, 0);
    }
  }
  else
  {
    objc_msgSend(v5, "allErrors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = v9;
      v16 = 138543874;
      v17 = v10;
      v18 = 2048;
      v19 = objc_msgSend(v8, "count");
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed with %ld errors: %{public}@.", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "didFailWithErrors:", v8);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v8, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "callCompletionWithSuccess:error:", 0, v13);

  }
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

- (id)pipelineForRepository:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)cancel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HDCloudSyncManagerPipelineTask pipelines](self, "pipelines", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)callCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void (**v6)(void *, HDCloudSyncManagerPipelineTask *, _BOOL8, id);
  id completion;
  id v8;

  v4 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void (**)(void *, HDCloudSyncManagerPipelineTask *, _BOOL8, id))_Block_copy(self->_completion);
  completion = self->_completion;
  self->_completion = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
    v6[2](v6, self, v4, v8);

}

- (BOOL)requiresExistingShareOwnerParticipant
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "profileType") == 3)
  {
    v5 = 1;
  }
  else
  {
    -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "profileType") == 2;

  }
  return v5;
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (void)setAccessibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, a3);
}

- (NSArray)pipelines
{
  return self->_pipelines;
}

- (void)setPipelines:(id)a3
{
  objc_storeStrong((id *)&self->_pipelines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelines, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
