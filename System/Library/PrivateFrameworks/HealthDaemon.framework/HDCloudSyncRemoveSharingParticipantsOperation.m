@implementation HDCloudSyncRemoveSharingParticipantsOperation

- (HDCloudSyncRemoveSharingParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncRemoveSharingParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 participantsToRemove:(id)a5
{
  id v8;
  HDCloudSyncRemoveSharingParticipantsOperation *v9;
  HDCloudSyncRemoveSharingParticipantsOperation *v10;
  uint64_t v11;
  NSSet *participantsToRemove;
  HDSynchronousTaskGroup *v13;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDCloudSyncRemoveSharingParticipantsOperation;
  v9 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v16, sel_initWithConfiguration_cloudState_, a3, a4);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_msgSend(v8, "copy");
    participantsToRemove = v10->_participantsToRemove;
    v10->_participantsToRemove = (NSSet *)v11;

    v13 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v10->_taskGroup;
    v10->_taskGroup = v13;

    -[HDSynchronousTaskGroup setDelegate:](v10->_taskGroup, "setDelegate:", v10);
  }

  return v10;
}

- (void)main
{
  HDCloudSyncRemoveSharingParticipantsOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t i;
  void *v13;
  NSSet *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  HDCloudSyncModifyRecordsOperation *v56;
  void *v57;
  HDCloudSyncModifyRecordsOperation *v58;
  uint64_t v59;
  id v60;
  id v61;
  NSObject *v62;
  void *v63;
  __int128 v64;
  HDCloudSyncRemoveSharingParticipantsOperation *v65;
  id obj;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  _BYTE v91[128];
  _QWORD v92[5];
  id v93;
  uint8_t v94[4];
  HDCloudSyncRemoveSharingParticipantsOperation *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  _BYTE buf[24];
  void *v101;
  HDCloudSyncRemoveSharingParticipantsOperation *v102;
  id v103;
  uint64_t v104;

  v2 = self;
  v104 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCKContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[HDCloudSyncOperation progress](v2, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTotalUnitCount:", v6);

  -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[HDCloudSyncOperation configuration](v2, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allCKContainers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v70 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  if (v70)
  {
    v69 = *(_QWORD *)v78;
    *(_QWORD *)&v11 = 138543618;
    v64 = v11;
    v65 = v2;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v78 != v69)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask", v64);
        v14 = v2->_participantsToRemove;
        v15 = v13;
        -[HDCloudSyncOperation configuration](v2, "configuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cachedCloudState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = 0;
        objc_msgSend(v17, "zonesByIdentifierWithError:", &v90);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v90;

        v71 = v18;
        if (v18 || !v19)
        {
          v67 = v19;
          v68 = i;
          v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          objc_msgSend(v18, "allValues");
          v76 = (id)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v87;
            v73 = *(_QWORD *)v87;
            v74 = v15;
            while (2)
            {
              v27 = 0;
              v75 = v25;
              do
              {
                if (*(_QWORD *)v87 != v26)
                  objc_enumerationMutation(v76);
                v28 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v27);
                objc_msgSend(v28, "zoneIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "containerIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "containerIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v30, "isEqualToString:", v31);

                if (v32)
                {
                  v85 = 0;
                  objc_msgSend(v28, "zoneShareWithError:", &v85);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = v85;
                  v35 = v34;
                  if (v33)
                    v36 = 1;
                  else
                    v36 = v34 == 0;
                  if (!v36)
                  {
                    _HKInitializeLogging();
                    v45 = (void *)*MEMORY[0x1E0CB5370];
                    v46 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR);
                    v2 = v65;
                    if (v46)
                    {
                      v62 = v45;
                      objc_msgSend(v28, "zoneIdentifier");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v94 = 138543874;
                      v95 = v65;
                      v96 = 2114;
                      v97 = v63;
                      v98 = 2114;
                      v99 = v35;
                      _os_log_error_impl(&dword_1B7802000, v62, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v94, 0x20u);

                    }
                    v21 = objc_retainAutorelease(v35);

                    v23 = 0;
                    v44 = v72;
                    goto LABEL_41;
                  }
                  v83 = 0u;
                  v84 = 0u;
                  v81 = 0u;
                  v82 = 0u;
                  objc_msgSend(v33, "participants");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
                  if (v38)
                  {
                    v39 = v38;
                    v40 = 0;
                    v41 = *(_QWORD *)v82;
                    do
                    {
                      for (j = 0; j != v39; ++j)
                      {
                        if (*(_QWORD *)v82 != v41)
                          objc_enumerationMutation(v37);
                        v43 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
                        if (-[NSSet containsObject:](v14, "containsObject:", v43))
                        {
                          objc_msgSend(v33, "removeParticipant:", v43);
                          v40 = 1;
                        }
                      }
                      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
                    }
                    while (v39);

                    v26 = v73;
                    v15 = v74;
                    if ((v40 & 1) != 0)
                      objc_msgSend(v72, "addObject:", v33);
                  }
                  else
                  {

                  }
                  v25 = v75;
                }
                ++v27;
              }
              while (v27 != v25);
              v25 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
              if (v25)
                continue;
              break;
            }
          }

          v44 = v72;
          v23 = v72;
          v21 = 0;
          v2 = v65;
LABEL_41:

          v22 = v67;
          i = v68;
        }
        else
        {
          _HKInitializeLogging();
          v20 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v64;
            *(_QWORD *)&buf[4] = v2;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v19;
            _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
          }
          v21 = objc_retainAutorelease(v19);
          v22 = v19;
          v23 = 0;
        }

        v47 = v21;
        v48 = v47;
        if (v23 || !v47)
        {
          if (objc_msgSend(v23, "count"))
          {
            v49 = i;
            v50 = v23;
            v51 = v15;
            _HKInitializeLogging();
            v52 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v53 = v52;
              v54 = objc_msgSend(v50, "count");
              objc_msgSend(v51, "containerIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v2;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v54;
              *(_WORD *)&buf[22] = 2114;
              v101 = v55;
              _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving %ld updated share records in %{public}@", buf, 0x20u);

            }
            v56 = [HDCloudSyncModifyRecordsOperation alloc];
            -[HDCloudSyncOperation configuration](v2, "configuration");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v56, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v57, v51, v50, 0);

            -[HDCloudSyncModifyRecordsOperation setTreatAnyErrorAsFatal:](v58, "setTreatAnyErrorAsFatal:", 1);
            v59 = MEMORY[0x1E0C809B0];
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke;
            v101 = &unk_1E6CEBAB0;
            v102 = v2;
            v60 = v51;
            v103 = v60;
            -[HDCloudSyncOperation setOnError:](v58, "setOnError:", buf);
            v92[0] = v59;
            v92[1] = 3221225472;
            v92[2] = __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke_189;
            v92[3] = &unk_1E6CE98F8;
            v92[4] = v2;
            v61 = v60;
            v93 = v61;
            -[HDCloudSyncOperation setOnSuccess:](v58, "setOnSuccess:", v92);
            -[HDCloudSyncOperation start](v58, "start");

            i = v49;
          }
          else
          {
            -[HDSynchronousTaskGroup finishTask](v2->_taskGroup, "finishTask");
          }
        }
        else
        {
          -[HDSynchronousTaskGroup failTaskWithError:](v2->_taskGroup, "failTaskWithError:", v47);
        }

      }
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    }
    while (v70);
  }

  -[HDSynchronousTaskGroup finishTask](v2->_taskGroup, "finishTask");
}

void __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v4;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update share records in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:", v4);

}

uint64_t __78__HDCloudSyncRemoveSharingParticipantsOperation__saveUpdatedShares_container___block_invoke_189(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated share records in %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_participantsToRemove, 0);
}

@end
