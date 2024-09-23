@implementation HDCloudSyncPipelineStagePull

+ (id)operationTagDependencies
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  v3[1] = 0x1E6D4D5B8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDCloudSyncPipelineStagePull)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncPipelineStagePull *v4;
  HDCloudSyncPipelineStagePull *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDCloudSyncPipelineStagePull;
  v4 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v7, sel_initWithConfiguration_cloudState_, a3, a4);
  v5 = v4;
  if (v4)
    -[HDCloudSyncPipelineStage setExpectedReceiveSize:](v4, "setExpectedReceiveSize:", 2);
  return v5;
}

- (void)main
{
  void *v3;
  void *v4;
  char v5;
  HDCloudSyncCompoundOperation *v6;
  void *v7;
  void *v8;
  HDCloudSyncCompoundOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  HDCloudSyncPullStoreOperation *v19;
  void *v20;
  void *v21;
  HDCloudSyncPullStoreOperation *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id obj;
  _QWORD v31[5];
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  HDCloudSyncPipelineStagePull *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "options");

  if ((v5 & 2) != 0)
  {
    _HKInitializeLogging();
    v29 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v39 = self;
      _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping due to pipeline options.", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
  else
  {
    v6 = [HDCloudSyncCompoundOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v6, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v7, v8, CFSTR("Pull"), 1);

    -[HDCloudSyncOperation configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "computedState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pullTargets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_224);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v13;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17);
          v19 = [HDCloudSyncPullStoreOperation alloc];
          -[HDCloudSyncOperation configuration](self, "configuration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncOperation cloudState](self, "cloudState");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[HDCloudSyncPullStoreOperation initWithConfiguration:cloudState:target:](v19, "initWithConfiguration:cloudState:target:", v20, v21, v18);

          -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v9, "addOperation:transitionHandler:", v22, 0);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v15);
    }

    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __36__HDCloudSyncPipelineStagePull_main__block_invoke_2;
    v32[3] = &unk_1E6CE7778;
    v32[4] = self;
    -[HDCloudSyncOperation setOnSuccess:](v9, "setOnSuccess:", v32);
    v31[0] = v23;
    v31[1] = 3221225472;
    v31[2] = __36__HDCloudSyncPipelineStagePull_main__block_invoke_3;
    v31[3] = &unk_1E6CE77A0;
    v31[4] = self;
    -[HDCloudSyncOperation setOnError:](v9, "setOnError:", v31);
    -[HDCloudSyncCompoundOperation start](v9, "start");
    -[HDCloudSyncOperation progress](v9, "progress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "totalUnitCount");

    -[HDCloudSyncOperation progress](self, "progress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTotalUnitCount:", objc_msgSend(v26, "totalUnitCount") + v25);

    -[HDCloudSyncOperation progress](self, "progress");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation progress](v9, "progress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addChild:withPendingUnitCount:", v28, v25);

  }
}

uint64_t __36__HDCloudSyncPipelineStagePull_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "storeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __36__HDCloudSyncPipelineStagePull_main__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  HDCloudSyncUpdateLastPullDateOperation *v27;
  _BOOL4 v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v1 = a1;
  v64 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncPipelineStagePull _reportLastPulledUpdateDate](*(void **)(a1 + 32));
  v2 = *(void **)(v1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v1 + 32), "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "syncDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "legacyRepositoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HDCloudSyncKeyValueDomainWithProfile(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryCKContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncLastSuccessfulPullKeyForContainerIdentifier((uint64_t)v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v11;
    v59 = 0;
    objc_msgSend(v8, "dateForKey:error:", v11, &v59);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v59;
    v15 = v14;
    v56 = (void *)v13;
    if (v13 || !v14)
    {
      if (!v13 && objc_msgSend(v7, "profileType") == 1)
      {
        v51 = v12;
        v53 = v2;
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEBUG, "Generating AWD event for first successful pull", buf, 2u);
        }
        v18 = v7;
        v19 = v57;
        HDCloudSyncRestorePhaseSyncCompleteEndDate(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HDCloudSyncRestorePhaseSyncCompleteStartDate(v18);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (!v20 && v21)
        {
          objc_msgSend(v19, "timeIntervalSinceDate:", v21);
          v24 = v23;
          objc_msgSend(v18, "daemon");
          v49 = v5;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "analyticsSubmissionCoordinator");
          v47 = v8;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "cloudSync_reportRestoreForProfile:startDate:endDate:duration:finishedJournalMerge:", v18, v22, v19, 0, v24);

          v8 = v47;
          v5 = v49;
          HDSetCloudSyncRestorPhaseSyncCompleteEndDate(v19, v18);
        }

        v12 = v51;
        v2 = v53;
      }
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v15;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Unable to determine whether or not this is the first successful pull: %{public}@.", buf, 0xCu);
      }
    }
    v27 = -[HDCloudSyncUpdateLastPullDateOperation initWithPullCompleteDate:lastSuccessfulPullKey:]([HDCloudSyncUpdateLastPullDateOperation alloc], "initWithPullCompleteDate:lastSuccessfulPullKey:", v57, v12);
    v58 = v15;
    v28 = -[HDJournalableOperation performOrJournalWithProfile:error:](v27, "performOrJournalWithProfile:error:", v7, &v58);
    v55 = v58;

    if (v28)
    {
      if (-[HDJournalableOperation didJournal](v27, "didJournal"))
      {
        _HKInitializeLogging();
        v29 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v61 = v2;
          v62 = 2114;
          v63 = v7;
          _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Journals are present, last pull date will be updated after cloud sync journals are ingested %{public}@", buf, 0x16u);
        }
      }
    }
    if (objc_msgSend(v7, "profileType") == 3)
    {
      v52 = v12;
      v54 = v2;
      v48 = v8;
      v50 = v5;
      v30 = v56;
      v45 = v7;
      v31 = v7;
      v32 = v57;
      HDCloudSyncLastPulledUpdateDate(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = (void *)MEMORY[0x1E0CB37E8];
        v35 = v32;
        objc_msgSend(v32, "timeIntervalSinceDate:", v33);
        objc_msgSend(v34, "numberWithDouble:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = v32;
        v36 = 0;
      }
      v46 = v1;
      if (v56)
      {
        v37 = (void *)MEMORY[0x1E0CB37E8];
        v38 = v35;
        objc_msgSend(v35, "timeIntervalSinceDate:", v30);
        objc_msgSend(v37, "numberWithDouble:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
        v38 = v35;
      }
      objc_msgSend(v31, "daemon");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "analyticsSubmissionCoordinator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "configuration");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "tinker_syncFinishedWithLatency:timeSinceLastSuccessfullPull:configuration:", v36, v39, v42);

      v1 = v46;
      v8 = v48;
      v5 = v50;
      v12 = v52;
      v7 = v45;
    }
    HDUpdateOldestSampleStartDateForProfile(v7);

    v43 = *(void **)(v1 + 32);
  }
  else
  {
    v43 = 0;
  }
  return objc_msgSend(v43, "finishWithSuccess:error:", 1, 0);
}

- (void)_reportLastPulledUpdateDate
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "repository");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legacyRepositoryProfile");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    HDCloudSyncLastPulledUpdateDate(v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudSyncManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didCompleteSuccessfulPullOfUpdateWithDate:", v4);

  }
}

void __36__HDCloudSyncPipelineStagePull_main__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HDCloudSyncPipelineStagePull _reportLastPulledUpdateDate](*(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "profileType");

  if (v5 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "analyticsSubmissionCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tinker_syncFailedWithError:configuration:", v10, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_firstPullOperationError, 0);
}

@end
