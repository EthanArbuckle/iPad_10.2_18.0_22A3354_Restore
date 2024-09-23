@implementation HDCloudSyncPipeline

- (id)initForContext:(id)a3 repository:(id)a4 accessibilityAssertion:(id)a5 queue:(id)a6
{
  id v11;
  HDCloudSyncPipeline *v12;
  uint64_t v13;
  HDCloudSyncContext *context;
  uint64_t v15;
  NSUUID *identifier;
  void *v17;
  uint64_t v18;
  NSString *shortPipelineIdentifier;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  id *v25;
  HDAssertion *accessibilityAssertion;
  NSObject *v27;
  uint64_t v28;
  HDPowerAssertion *powerAssertion;
  NSMutableArray *v30;
  NSMutableArray *stages;
  id v32;
  void *v33;
  uint64_t v34;
  HDAssertion *inProgressDownloadDirAssertion;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  CKOperationGroup *operationGroup;
  HDCloudSyncOperationConfiguration *v42;
  CKOperationGroup *v43;
  void *v44;
  HDAssertion *v45;
  NSUUID *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  HDCloudSyncOperationConfiguration *operationConfiguration;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  uint64_t v60;
  objc_super v61;
  _BYTE location[12];
  __int16 v63;
  HDCloudSyncPipeline *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v11 = a4;
  v55 = a5;
  v54 = a6;
  v61.receiver = self;
  v61.super_class = (Class)HDCloudSyncPipeline;
  v12 = -[HDCloudSyncPipeline init](&v61, sel_init);
  if (v12)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("HDCloudSyncPipeline.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("repository"));

    }
    v12->_status = 0;
    v13 = objc_msgSend(v56, "copy");
    context = v12->_context;
    v12->_context = (HDCloudSyncContext *)v13;

    objc_storeStrong((id *)&v12->_repository, a4);
    objc_storeStrong((id *)&v12->_queue, a6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;

    -[NSUUID UUIDString](v12->_identifier, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringToIndex:", 4);
    v18 = objc_claimAutoreleasedReturnValue();
    shortPipelineIdentifier = v12->_shortPipelineIdentifier;
    v12->_shortPipelineIdentifier = (NSString *)v18;

    v12->_pipelineResult = 1;
    -[HDCloudSyncRepository profile](v12->_repository, "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      v60 = 0;
      objc_msgSend(v21, "cloneAccessibilityAssertion:ownerIdentifier:error:", v55, v23, &v60);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (id *)&v60;
    }
    else
    {
      v59 = 0;
      objc_msgSend(v21, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v23, &v59, 600.0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (id *)&v59;
    }
    v53 = *v25;
    accessibilityAssertion = v12->_accessibilityAssertion;
    v12->_accessibilityAssertion = (HDAssertion *)v24;

    if (!v12->_accessibilityAssertion)
    {
      _HKInitializeLogging();
      v27 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = v11;
        v63 = 2114;
        v64 = v12;
        v65 = 2114;
        v66 = v53;
        _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to acquire database accessibility assertion for cloud sync in repo: %{public}@, with error: %{public}@", location, 0x20u);
      }
    }
    objc_initWeak((id *)location, v12);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __78__HDCloudSyncPipeline_initForContext_repository_accessibilityAssertion_queue___block_invoke;
    v57[3] = &unk_1E6CECE78;
    objc_copyWeak(&v58, (id *)location);
    +[HDPowerAssertion powerAssertionWithIdentifier:timeout:timeoutHandler:](HDPowerAssertion, "powerAssertionWithIdentifier:timeout:timeoutHandler:", CFSTR("Health Sync"), v57, 600.0);
    v28 = objc_claimAutoreleasedReturnValue();
    powerAssertion = v12->_powerAssertion;
    v12->_powerAssertion = (HDPowerAssertion *)v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stages = v12->_stages;
    v12->_stages = v30;

    v32 = objc_alloc(MEMORY[0x1E0D29800]);
    -[NSUUID UUIDString](v12->_identifier, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("HDCloudSyncDownloadDirectoryAssertionIdentifier"), v33);
    inProgressDownloadDirAssertion = v12->_inProgressDownloadDirAssertion;
    v12->_inProgressDownloadDirAssertion = (HDAssertion *)v34;

    objc_msgSend(v11, "profile");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "cloudSyncManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "assetDownloadStagingManagerWithAssertion:", v12->_inProgressDownloadDirAssertion);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "syncCircleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncPipeline operationGroupForContext:syncCircleIdentifier:assetDownloadStagingManager:](HDCloudSyncPipeline, "operationGroupForContext:syncCircleIdentifier:assetDownloadStagingManager:", v56, v39, v38);
    v40 = objc_claimAutoreleasedReturnValue();
    operationGroup = v12->_operationGroup;
    v12->_operationGroup = (CKOperationGroup *)v40;

    v42 = [HDCloudSyncOperationConfiguration alloc];
    v43 = v12->_operationGroup;
    objc_msgSend(v11, "syncCircleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v12->_accessibilityAssertion;
    v46 = v12->_identifier;
    objc_msgSend(v56, "unitTest_syncDateOverride");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (!v47)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v49 = -[HDCloudSyncOperationConfiguration initWithRepository:operationGroup:syncContainerPrefix:context:accessibilityAssertion:syncIdentifier:syncDate:](v42, "initWithRepository:operationGroup:syncContainerPrefix:context:accessibilityAssertion:syncIdentifier:syncDate:", v11, v43, v44, v56, v45, v46, v48);
    operationConfiguration = v12->_operationConfiguration;
    v12->_operationConfiguration = (HDCloudSyncOperationConfiguration *)v49;

    if (!v47)
    objc_destroyWeak(&v58);
    objc_destroyWeak((id *)location);

  }
  return v12;
}

void __78__HDCloudSyncPipeline_initForContext_repository_accessibilityAssertion_queue___block_invoke(uint64_t a1)
{
  NSObject *v1;
  id WeakRetained;
  uint8_t buf[4];
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v1 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_1B7802000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: Power assertion has expired.", buf, 0xCu);
    }
  }

}

- (void)dealloc
{
  NSObject *cloudKitOperationDelayTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  -[HDPowerAssertion invalidate](self->_powerAssertion, "invalidate");
  -[HDAssertion invalidate](self->_accessibilityAssertion, "invalidate");
  -[HDAssertion invalidate](self->_inProgressDownloadDirAssertion, "invalidate");
  cloudKitOperationDelayTimer = self->_cloudKitOperationDelayTimer;
  if (cloudKitOperationDelayTimer)
  {
    dispatch_source_cancel(cloudKitOperationDelayTimer);
    v4 = self->_cloudKitOperationDelayTimer;
    self->_cloudKitOperationDelayTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncPipeline;
  -[HDCloudSyncPipeline dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  NSString *shortPipelineIdentifier;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  shortPipelineIdentifier = self->_shortPipelineIdentifier;
  -[HDCloudSyncOperationConfiguration shortSyncIdentifier](self->_operationConfiguration, "shortSyncIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("    ");
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncContext reason](self->_context, "reason");
  HKCloudSyncReasonToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncOperationStatusToString(self->_status);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<[%@:%@] %@ (%@) %@>"), shortPipelineIdentifier, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)analyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *analyticsCloudKitIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[9];
  _QWORD v18[11];

  v18[9] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("syncIdentifier");
  -[HDCloudSyncOperationConfiguration syncIdentifier](self->_operationConfiguration, "syncIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("pipelineIdentifier");
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("syncCircleIdentifier");
  -[HDCloudSyncRepository syncCircleIdentifier](self->_repository, "syncCircleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  v17[3] = CFSTR("primaryContainerIdentifier");
  -[HDCloudSyncRepository primaryCKContainer](self->_repository, "primaryCKContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  analyticsCloudKitIdentifier = &stru_1E6D11BB8;
  if (self->_analyticsCloudKitIdentifier)
    analyticsCloudKitIdentifier = (const __CFString *)self->_analyticsCloudKitIdentifier;
  v18[3] = v7;
  v18[4] = analyticsCloudKitIdentifier;
  v17[4] = CFSTR("cloudKitIdentifier");
  v17[5] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDCloudSyncContext reason](self->_context, "reason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v10;
  v17[6] = CFSTR("options");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HDCloudSyncContext options](self->_context, "options"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v11;
  v17[7] = CFSTR("operationType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDCloudSyncContext purpose](self->_context, "purpose"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v12;
  v17[8] = CFSTR("purpose");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDCloudSyncContext purpose](self->_context, "purpose"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)addStage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (self->_status)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncPipeline.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_status == HDCloudSyncOperationStatusPending"));

    v5 = v7;
  }
  -[NSMutableArray addObject:](self->_stages, "addObject:", v5);

}

- (id)beginWithTaskTree:(id)a3
{
  id v5;
  uint64_t v6;
  NSProgress *v7;
  NSProgress *progress;
  OS_dispatch_queue *queue;
  NSProgress *v10;
  void *v12;
  _QWORD v13[5];

  v5 = a3;
  if (self->_status)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncPipeline.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_status == HDCloudSyncOperationStatusPending"));

  }
  self->_status = 1;
  v6 = -[NSMutableArray count](self->_stages, "count");
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100 * v6 + 15);
  v7 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v7;

  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke;
  v13[3] = &unk_1E6CED9C0;
  v13[4] = self;
  objc_msgSend(v5, "addTaskOnQueue:task:", queue, v13);
  v10 = self->_progress;

  return v10;
}

void __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  id v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id obj;
  _QWORD v57[5];
  _QWORD v58[5];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  id v65;
  _BYTE buf[24];
  void *v67;
  _BYTE v68[10];
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v55 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hk_map:", &__block_literal_global_89);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 8);
    v10 = v7;
    v11 = objc_msgSend(v9, "count");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "profileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessibilityAssertion");
    v15 = a1;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    v67 = v13;
    *(_WORD *)v68 = 2114;
    *(_QWORD *)&v68[2] = v14;
    v69 = 2114;
    v70 = v16;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting %ld-stage pipeline for %{public}@: %{public}@ with assertion: %{public}@", buf, 0x34u);

    a1 = v15;
  }
  v54 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v17 + 88))
  {
    objc_msgSend(*(id *)(v17 + 112), "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cloudSyncManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v20 = objc_msgSend(v19, "canPerformCloudSyncWithError:", &v59);
    v21 = v59;

    if ((v20 & 1) == 0)
    {
      v49 = v55;
      (*((void (**)(id, uint64_t, id))v55 + 2))(v55, 2, v21);

      goto LABEL_17;
    }

    v17 = *(_QWORD *)(a1 + 32);
  }
  v22 = MEMORY[0x1E0C809B0];
  v23 = *(_QWORD *)(v17 + 128);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke;
  v67 = &unk_1E6CED9C0;
  *(_QWORD *)v68 = v17;
  v24 = v5;
  objc_msgSend(v24, "addTaskOnQueue:task:", v23, buf);
  v25 = *(_QWORD *)(v17 + 128);
  *(_QWORD *)&v60 = v22;
  *((_QWORD *)&v60 + 1) = 3221225472;
  *(_QWORD *)&v61 = __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_3;
  *((_QWORD *)&v61 + 1) = &unk_1E6CED9C0;
  *(_QWORD *)&v62 = v17;
  objc_msgSend(v24, "addTaskOnQueue:task:", v25, &v60);

  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(_QWORD *)(v26 + 128);
  v58[0] = v22;
  v58[1] = 3221225472;
  v58[2] = __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_234;
  v58[3] = &unk_1E6CF7218;
  v58[4] = v26;
  objc_msgSend(v24, "addCheckpointTaskOnQueue:task:", v27, v58);
  v28 = *(_QWORD *)(a1 + 32);
  v52 = a1;
  v53 = v5;
  v51 = v24;
  if (v28)
  {
    v29 = *(NSObject **)(v28 + 128);
    v30 = v24;
    dispatch_assert_queue_V2(v29);
    v31 = *(_QWORD *)(v28 + 128);
    v32 = v22;
    *(_QWORD *)buf = v22;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke;
    v67 = &unk_1E6CED9C0;
    *(_QWORD *)v68 = v28;
    objc_msgSend(v30, "addTaskOnQueue:task:", v31, buf);

    v33 = *(_QWORD *)(a1 + 32);
    v34 = v30;
    if (v33)
    {
      v35 = v34;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v33 + 128));
      v63 = 0u;
      v61 = 0u;
      v62 = 0u;
      v60 = 0u;
      obj = *(id *)(v33 + 8);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v61 != v38)
              objc_enumerationMutation(obj);
            v40 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * i);
            v41 = *(NSObject **)(v33 + 128);
            v42 = v35;
            dispatch_assert_queue_V2(v41);
            v43 = *(_QWORD *)(v33 + 128);
            v64[0] = v32;
            v64[1] = 3221225472;
            v64[2] = __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke;
            v64[3] = &unk_1E6CED9E8;
            v64[4] = v33;
            v44 = v40;
            v65 = v44;
            objc_msgSend(v42, "addTaskOnQueue:task:", v43, v64);

          }
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, buf, 16);
        }
        while (v37);
      }

    }
  }
  else
  {
    v32 = v22;
    v50 = v24;
  }

  v45 = *(_QWORD *)(v52 + 32);
  v46 = *(_QWORD *)(v45 + 128);
  *(_QWORD *)buf = v32;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __63__HDCloudSyncPipeline__queue_reportFinalAnalyticsWithTaskTree___block_invoke;
  v67 = &unk_1E6CF7218;
  *(_QWORD *)v68 = v45;
  objc_msgSend(v51, "addCheckpointTaskOnQueue:task:", v46, buf);
  v47 = *(_QWORD *)(v52 + 32);
  v48 = *(_QWORD *)(v47 + 128);
  v57[0] = v32;
  v57[1] = 3221225472;
  v57[2] = __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_236;
  v57[3] = &unk_1E6CF7218;
  v57[4] = v47;
  objc_msgSend(v51, "addCheckpointTaskOnQueue:task:", v48, v57);
  v49 = v55;
  (*((void (**)(id, _QWORD, _QWORD))v55 + 2))(v55, 0, 0);
  v5 = v53;
LABEL_17:

}

NSString *__41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_2()
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

uint64_t __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_234(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished computing configuration and beginning pipeline stages", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setCompletedUnitCount:", 10);
}

void __41__HDCloudSyncPipeline_beginWithTaskTree___block_invoke_236(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "totalUnitCount"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 56);
  if (v5)
  {
    if (v5 == 1)
    {
      *(_QWORD *)(v4 + 96) = 2;
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v7;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Pipeline finished.", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    *(_QWORD *)(v4 + 96) = 3;
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = v8;
      objc_msgSend(v3, "allErrors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Pipeline failed: %{public}@.", (uint8_t *)&v15, 0x16u);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 72);
  *(_QWORD *)(v13 + 72) = 0;

}

- (id)beginWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  HDCloudSyncPipeline *v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D29810]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __43__HDCloudSyncPipeline_beginWithCompletion___block_invoke;
  v13 = &unk_1E6CF7240;
  v14 = self;
  v15 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithDescription:completion:", CFSTR("Sync pipeline"), &v10);
  -[HDCloudSyncPipeline beginWithTaskTree:](self, "beginWithTaskTree:", v7, v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "begin");

  return v8;
}

uint64_t __43__HDCloudSyncPipeline_beginWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)cancel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HDCloudSyncPipeline_cancel__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__HDCloudSyncPipeline_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void (**v3)(void *, uint64_t, void *);
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138543362;
    v12 = v10;
    _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Pipeline cancellation requested.", (uint8_t *)&v11, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "cancelAllOperations");
  v3 = (void (**)(void *, uint64_t, void *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 728, CFSTR("Pipeline cancelled while waiting for CloudKit operation delay."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 2, v6);

  }
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

  }
}

void __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_2;
  v7[3] = &unk_1E6CE77F0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "cacheAllOwnerIdentifiersWithCompletion:", v7);

}

uint64_t __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__HDCloudSyncPipeline__queue_computeConfigurationWithTaskTree___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 128));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = *(id *)(v4 + 8);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v12 = objc_msgSend(*(id *)(v4 + 144), "expectedSendSize");
          v13 = objc_msgSend(v11, "expectedSendSize");
          if (v12 <= v13)
            v14 = v13;
          else
            v14 = v12;
          objc_msgSend(*(id *)(v4 + 144), "setExpectedSendSize:", v14);
          v15 = objc_msgSend(*(id *)(v4 + 144), "expectedReceiveSize");
          v16 = objc_msgSend(v11, "expectedReceiveSize");
          if (v15 <= v16)
            v17 = v16;
          else
            v17 = v15;
          objc_msgSend(*(id *)(v4 + 144), "setExpectedReceiveSize:", v17);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }

  }
  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(v18, "primaryCKContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cachedOwnerIdentifierForContainer:", v19);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "cloudKitIdentifier");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 64);
  *(_QWORD *)(v21 + 64) = v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "profile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "daemon");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "analyticsSubmissionCoordinator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cloudSync_reportPipelineStarted:", *(_QWORD *)(a1 + 32));

  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
}

void __63__HDCloudSyncPipeline__queue_reportFinalAnalyticsWithTaskTree___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void (**v31)(void *, uint64_t, uint64_t, void *);
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v45 = v3;
  if (*(_QWORD *)(v4 + 56) == 1)
  {
    objc_msgSend(*(id *)(v4 + 112), "profile");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "daemon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "analyticsSubmissionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudSync_reportPipelineFinished:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "allErrors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hd_errorSurfacingFatalCloudKitPartialFailureForAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v5 = v10;
    }
    else
    {
      objc_msgSend(v45, "allErrors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "analyticsSubmissionCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudSync_reportPipelineFailed:error:", *(_QWORD *)(a1 + 32), v5);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "analyticsSubmissionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(a1 + 32);
  objc_msgSend(v17, "operationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cachedCloudState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cloudCache_reportCacheSyncAnalyticsForPipeline:operationCount:", v17, objc_msgSend(v19, "operationCountForAnalytics"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "profile");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "daemon");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "analyticsSubmissionCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(a1 + 32);
  objc_msgSend(v21, "operationConfiguration");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "cachedCloudState");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v41, "changedZonesCount");
  objc_msgSend(*(id *)(a1 + 32), "operationConfiguration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "cachedCloudState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "deletedZonesCount");
  objc_msgSend(*(id *)(a1 + 32), "operationConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "cachedCloudState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "changedRecordsCount");
  objc_msgSend(*(id *)(a1 + 32), "operationConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "cachedCloudState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cloudCache_reportCacheFetchAndUpdateAnalyticsForPipeline:changedZonesCount:deletedZonesCount:changedRecordsCount:deletedRecordsCount:", v21, v39, v23, v26, objc_msgSend(v28, "deletedRecordsCount"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "invalidate");
  v29 = *(_QWORD *)(a1 + 32);
  v30 = *(void **)(v29 + 136);
  *(_QWORD *)(v29 + 136) = 0;

  v31 = (void (**)(void *, uint64_t, uint64_t, void *))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 168));
  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 168);
  *(_QWORD *)(v32 + 168) = 0;

  if (v31)
  {
    v34 = *(_QWORD *)(a1 + 32);
    v35 = *(_QWORD *)(v34 + 48);
    v36 = *(_QWORD *)(v34 + 56);
    objc_msgSend(v45, "allErrors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2](v31, v35, v36, v38);

  }
}

void __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(id, uint64_t, void *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(id, uint64_t, void *);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  uint64_t v20;
  void (**v21)(id, uint64_t, void *);
  uint64_t v22;
  _QWORD v23[5];
  void (**v24)(id, uint64_t, void *);
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 728, CFSTR("Pipeline canceled."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 2, v6);

  }
  else
  {
    v7 = objc_msgSend(*(id *)(v5 + 8), "indexOfObject:", *(_QWORD *)(a1 + 40)) + 1;
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v27 = v9;
      v28 = 2048;
      v29 = v7;
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Starting...", buf, 0x20u);
    }
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_248;
    v23[3] = &unk_1E6CF7268;
    v23[4] = *(_QWORD *)(a1 + 32);
    v25 = v7;
    v12 = v4;
    v24 = v12;
    objc_msgSend(*(id *)(a1 + 40), "setOnSuccess:", v23);
    v16 = v11;
    v17 = 3221225472;
    v18 = __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_250;
    v19 = &unk_1E6CF7290;
    v20 = *(_QWORD *)(a1 + 32);
    v22 = v7;
    v21 = v12;
    objc_msgSend(*(id *)(a1 + 40), "setOnError:", &v16);
    objc_msgSend(*(id *)(a1 + 40), "setCloudState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v16, v17, v18, v19, v20);
    objc_msgSend(*(id *)(a1 + 40), "start");
    v13 = *(void **)(a1 + 40);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    objc_msgSend(v13, "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addChild:withPendingUnitCount:", v15, 100);

  }
}

void __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_248(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6];
    v10 = 138543874;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Finished successfully.", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(v3, "cloudState");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = a1[4];
  v9 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = v7;

  (*(void (**)(void))(a1[5] + 16))();
}

void __48__HDCloudSyncPipeline__queue_runStage_taskTree___block_invoke_250(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hd_cloudKitRetryDelay");
  if (v7 > 0.0)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "repository");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudSyncCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delayNextCloudKitOperation:", v8);

  }
  if (objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 701))
  {
    v13 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 88);
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 48);
        v27 = 138543874;
        v28 = v16;
        v29 = 2048;
        v30 = v17;
        v31 = 2114;
        v32 = v5;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Detected cloud sync disabled but pipeline is configured to continue anyway.", (uint8_t *)&v27, 0x20u);
      }
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0);
    }
    else
    {
      if (v15)
      {
        v23 = *(_QWORD *)(a1 + 32);
        v24 = *(_QWORD *)(a1 + 48);
        v27 = 138543874;
        v28 = v23;
        v29 = 2048;
        v30 = v24;
        v31 = 2114;
        v32 = v5;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Detected cloud sync disabled; disabling locally and failing pipeline.",
          (uint8_t *)&v27,
          0x20u);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
      v25 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 701, CFSTR("Sync has been disabled for this account."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v25 + 16))(v25, 2, v26);

    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 48);
      v27 = 138544130;
      v28 = v19;
      v29 = 2048;
      v30 = v20;
      v31 = 2114;
      v32 = v5;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Stage %ld: %{public}@: Finished with error: %{public}@", (uint8_t *)&v27, 0x2Au);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v21 = *(_QWORD *)(a1 + 40);
    if (objc_msgSend(v5, "criticalFailureOnError"))
      v22 = 2;
    else
      v22 = 1;
    (*(void (**)(uint64_t, uint64_t, id))(v21 + 16))(v21, v22, v6);
  }

}

void __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  dispatch_source_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  dispatch_time_t v26;
  NSObject *v27;
  _QWORD handler[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextCloudKitOperationDelay");
  v9 = v8;

  if (v9 <= 0.0)
  {
LABEL_5:
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_6;
  }
  v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 89);
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5370];
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 2048;
      v33 = v9;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %0.2lfs CloudKit operation delay because this pipeline has ignoreCloudKitOperationDelay=YES", buf, 0x16u);
    }
    goto LABEL_5;
  }
  if (v12)
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v31 = v14;
    v32 = 2048;
    v33 = v9;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting %0.2lfs for the CloudKit operation delay before beginning pipeline.", buf, 0x16u);
  }
  v15 = *(_QWORD **)(a1 + 32);
  v16 = v15[4];
  if (v16)
  {
    dispatch_source_cancel(v16);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 32);
    *(_QWORD *)(v17 + 32) = 0;

    v15 = *(_QWORD **)(a1 + 32);
  }
  objc_initWeak((id *)buf, v15);
  v19 = _Block_copy(v4);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  v22 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 128));
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 32);
  *(_QWORD *)(v23 + 32) = v22;

  v25 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v26 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_source_set_timer(v25, v26, 0xFFFFFFFFFFFFFFFFLL, 0);
  v27 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke_254;
  handler[3] = &unk_1E6CECE78;
  objc_copyWeak(&v29, (id *)buf);
  dispatch_source_set_event_handler(v27, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
LABEL_6:

}

void __72__HDCloudSyncPipeline__queue_waitForCloudKitOperationDelayWithTaskTree___block_invoke_254(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  void *v2;
  dispatch_queue_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  NSObject *v6;
  dispatch_queue_t *v7;
  uint8_t buf[4];
  dispatch_queue_t *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[16]);
    v2 = _Block_copy(v7[5]);
    v3 = v7[5];
    v7[5] = 0;

    v4 = v7[4];
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v7[4];
      v7[4] = 0;

    }
    if (v2)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v9 = v7;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished waiting for CloudKit operation delay.", buf, 0xCu);
      }
      (*((void (**)(void *, _QWORD, _QWORD))v2 + 2))(v2, 0, 0);
    }

    WeakRetained = v7;
  }

}

- (id)stages
{
  return (id)-[NSMutableArray copy](self->_stages, "copy");
}

+ (id)operationGroupForContext:(id)a3 syncCircleIdentifier:(id)a4 assetDownloadStagingManager:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  void *v18;
  id v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  id v29;
  uint64_t v30;

  v7 = a3;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C94F88];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  v12 = (void *)MEMORY[0x1E0CB3940];
  HDCloudSyncContextPurposeToString(objc_msgSend(v7, "purpose"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("CloudSync-%@-%@-%zd"), v10, v13, objc_msgSend(v7, "reason"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setName:", v14);
  objc_msgSend(v11, "setQuantity:", objc_msgSend(v7, "options"));
  v15 = 1;
  objc_msgSend(v11, "setExpectedSendSize:", 1);
  objc_msgSend(v11, "setExpectedReceiveSize:", 1);
  v16 = v7;
  objc_opt_self();
  if ((objc_msgSend(v16, "options") & 0x400) == 0)
  {
    v17 = objc_msgSend(v16, "reason");
    if (v17 <= 0x20)
      v15 = (0x4FFFFFD2uLL >> v17) & 1;
    else
      v15 = 0;
  }

  objc_msgSend(v11, "defaultConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsCellularAccess:", v15);

  v19 = v16;
  objc_opt_self();
  v20 = objc_msgSend(v19, "reason");

  if (v20 <= 0x20 && ((1 << v20) & 0x1B000012DLL) != 0)
  {
    objc_msgSend(v11, "defaultConfiguration");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject setQualityOfService:](v21, "setQualityOfService:", 17);
  }
  else
  {
    HKCreateSerialDispatchQueueWithQOSClass();
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__HDCloudSyncPipeline_operationGroupForContext_syncCircleIdentifier_assetDownloadStagingManager___block_invoke;
    block[3] = &unk_1E6CE8058;
    v29 = v11;
    v30 = 25;
    dispatch_async_and_wait(v21, block);

  }
  objc_msgSend(v19, "xpcActivity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v11, "defaultConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "xpcActivity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "currentActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setXPCActivity:", v25);

  }
  if (v8)
  {
    objc_msgSend(v11, "defaultConfiguration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAssetDownloadStagingManager:", v8);

  }
  return v11;
}

void __97__HDCloudSyncPipeline_operationGroupForContext_syncCircleIdentifier_assetDownloadStagingManager___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "defaultConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQualityOfService:", v1);

}

- (int64_t)status
{
  return self->_status;
}

- (HDCloudSyncContext)context
{
  return self->_context;
}

- (HDCloudSyncRepository)repository
{
  return self->_repository;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (void)setOperationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroup, a3);
}

- (HDCloudSyncOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)continueWhenSyncDisabled
{
  return self->_continueWhenSyncDisabled;
}

- (void)setContinueWhenSyncDisabled:(BOOL)a3
{
  self->_continueWhenSyncDisabled = a3;
}

- (BOOL)ignoreCloudKitOperationDelay
{
  return self->_ignoreCloudKitOperationDelay;
}

- (void)setIgnoreCloudKitOperationDelay:(BOOL)a3
{
  self->_ignoreCloudKitOperationDelay = a3;
}

- (id)pipelineCompletionHandler
{
  return self->_pipelineCompletionHandler;
}

- (void)setPipelineCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pipelineCompletionHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_operationConfiguration, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_repository, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_inProgressDownloadDirAssertion, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_analyticsCloudKitIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudState, 0);
  objc_storeStrong(&self->_delayTimerCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cloudKitOperationDelayTimer, 0);
  objc_storeStrong((id *)&self->_shortPipelineIdentifier, 0);
  objc_storeStrong((id *)&self->_stages, 0);
}

@end
