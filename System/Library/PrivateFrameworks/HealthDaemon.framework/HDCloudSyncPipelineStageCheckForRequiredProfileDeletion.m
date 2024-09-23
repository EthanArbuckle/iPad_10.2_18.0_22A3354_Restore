@implementation HDCloudSyncPipelineStageCheckForRequiredProfileDeletion

- (void)main
{
  void *v3;
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  HDCloudSyncPipelineStageCheckForRequiredProfileDeletion *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "options");

  if ((v5 & 0x200) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "totalUnitCount"));
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "legacyRepositoryProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "profileType") != 3 && objc_msgSend(v10, "profileType") != 2)
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
      goto LABEL_17;
    }
    -[HDCloudSyncOperation configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cachedCloudState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v12, "zonesByIdentifierWithError:", &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;

    if (v13 || !v14)
    {
      if (!objc_msgSend(v13, "count"))
      {
        objc_msgSend(v10, "triggerDeletion");
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 714, CFSTR("Profile does not have any zones. Deleting profile: %@"), v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v20);

        goto LABEL_15;
      }
      v16 = self;
      v17 = 1;
      v18 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v23 = self;
        v24 = 2114;
        v25 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", buf, 0x16u);
      }
      v16 = self;
      v17 = 0;
      v18 = v14;
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](v16, "finishWithSuccess:error:", v17, v18);
LABEL_15:

LABEL_17:
    return;
  }
  _HKInitializeLogging();
  v19 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping stale profile deletion due to pipeline options.", buf, 0xCu);
  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
}

@end
