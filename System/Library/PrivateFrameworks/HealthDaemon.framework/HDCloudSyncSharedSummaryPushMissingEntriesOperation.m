@implementation HDCloudSyncSharedSummaryPushMissingEntriesOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  HDCloudSyncCompoundOperation *v17;
  void *v18;
  HDCloudSyncCompoundOperation *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HDCloudSyncCompoundOperation *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[5];
  HDCloudSyncCompoundOperation *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryPushMissingEntriesOperation *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSyncSummarySharingPush");

  if ((v6 & 1) != 0)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedCloudState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "repository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryCKContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v8, "privateMetadataZoneForContainerID:error:", v12, &v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v31;

    if (v13)
    {
      v30 = 0;
      objc_msgSend(v13, "recordsForClass:error:", objc_opt_class(), &v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v30;
      if (v15)
      {
        objc_msgSend(v15, "hk_mapToSet:", &__block_literal_global_3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [HDCloudSyncCompoundOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v17, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v18, 0, CFSTR("Push Pending Invitations"), 0);

        -[HDCloudSyncOperation configuration](self, "configuration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "repository");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "cloudSyncShimProvider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "summarySharingEntryShim");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[HDCloudSyncOperation configuration](self, "configuration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __59__HDCloudSyncSharedSummaryPushMissingEntriesOperation_main__block_invoke_2;
        v28[3] = &unk_1E6CE8848;
        v28[4] = self;
        v29 = v19;
        v25 = v19;
        objc_msgSend(v23, "authorizationIdentifiersForEntriesNotExistingParticipants:configuration:completion:", v27, v24, v28);

      }
      else
      {
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v16);
      }

    }
    else
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 724, CFSTR("Private metadata zone not present."));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v14);
    }

  }
  else
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping operation because platform/profile does not support summary sharing", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

uint64_t __59__HDCloudSyncSharedSummaryPushMissingEntriesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __59__HDCloudSyncSharedSummaryPushMissingEntriesOperation_main__block_invoke_2(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v15;
  void *v16;
  void *v17;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if ((a3 & 1) != 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v7, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v12 = MEMORY[0x1E0C9AA60];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = [HDCloudSyncSharedSummaryUpdateParticipantOperation alloc];
          objc_msgSend(*(id *)(a1 + 32), "configuration");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[HDCloudSyncSharedSummaryUpdateParticipantOperation initWithConfiguration:codableEntry:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:](v15, "initWithConfiguration:codableEntry:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:", v16, v14, v17, v12);

          objc_msgSend(*(id *)(a1 + 40), "addOperation:transitionHandler:", v18, 0);
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegateToOperation:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a4);
  }

}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

@end
