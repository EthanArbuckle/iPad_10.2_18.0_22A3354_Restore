@implementation HDCloudSyncPipelineStageRemoveSharingParticipants

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSSet *participantsToRemove;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  NSObject *v29;
  void *v30;
  HDCloudSyncPipelineStageRemoveSharingParticipants *v31;
  id v32;
  void *v33;
  id obj;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t v47[128];
  uint8_t buf[4];
  HDCloudSyncPipelineStageRemoveSharingParticipants *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (self->_removeAllParticipants)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[HDCloudSyncOperation configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedCloudState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v5, "zonesByIdentifierWithError:", &v46);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v46;

    if (v6 || !v7)
    {
      v31 = self;
      v32 = v7;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v33 = v6;
      objc_msgSend(v6, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v12)
      {
        v13 = v12;
        v35 = *(id *)v43;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(id *)v43 != v35)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            v41 = 0;
            objc_msgSend(v15, "zoneShareWithError:", &v41);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v41;
            v18 = v17;
            if (v16)
              v19 = 1;
            else
              v19 = v17 == 0;
            if (!v19)
            {
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                v29 = v27;
                objc_msgSend(v15, "zoneIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v49 = v31;
                v50 = 2114;
                v51 = v30;
                v52 = 2114;
                v53 = v18;
                _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", buf, 0x20u);

              }
              -[HDCloudSyncOperation finishWithSuccess:error:](v31, "finishWithSuccess:error:", 0, v18);

              goto LABEL_34;
            }
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(v16, "participants");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v38;
              do
              {
                for (j = 0; j != v22; ++j)
                {
                  if (*(_QWORD *)v38 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                  if (objc_msgSend(v25, "role") != 1)
                    objc_msgSend(v3, "addObject:", v25);
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
              }
              while (v22);
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
          if (v13)
            continue;
          break;
        }
      }

      v26 = -[HDCloudSyncPipelineStageRemoveSharingParticipants _delegateToOperationForRemoveSharingParticipants:](v31, v3);
LABEL_34:
      v7 = v32;
      v6 = v33;
    }
    else
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v49 = self;
        v50 = 2114;
        v51 = v7;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v7);
    }

  }
  else
  {
    participantsToRemove = self->_participantsToRemove;
    if (participantsToRemove)
    {
      v11 = -[HDCloudSyncPipelineStageRemoveSharingParticipants _delegateToOperationForRemoveSharingParticipants:](self, participantsToRemove);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("_participantsToRemove"), objc_opt_class(), a2);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0);

    }
  }
}

- (HDCloudSyncRemoveSharingParticipantsOperation)_delegateToOperationForRemoveSharingParticipants:(void *)a1
{
  id v3;
  HDCloudSyncRemoveSharingParticipantsOperation *v4;
  void *v5;
  void *v6;
  HDCloudSyncRemoveSharingParticipantsOperation *v7;

  if (a1)
  {
    v3 = a2;
    v4 = [HDCloudSyncRemoveSharingParticipantsOperation alloc];
    objc_msgSend(a1, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cloudState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HDCloudSyncRemoveSharingParticipantsOperation initWithConfiguration:cloudState:participantsToRemove:](v4, "initWithConfiguration:cloudState:participantsToRemove:", v5, v6, v3);

    objc_msgSend(a1, "delegateToOperation:", v7);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)removeAllParticipants
{
  return self->_removeAllParticipants;
}

- (void)setRemoveAllParticipants:(BOOL)a3
{
  self->_removeAllParticipants = a3;
}

- (NSSet)participantsToRemove
{
  return self->_participantsToRemove;
}

- (void)setParticipantsToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsToRemove, 0);
}

@end
