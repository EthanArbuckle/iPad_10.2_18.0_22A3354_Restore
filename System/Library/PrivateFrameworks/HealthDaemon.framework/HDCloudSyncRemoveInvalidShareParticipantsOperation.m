@implementation HDCloudSyncRemoveInvalidShareParticipantsOperation

- (HDCloudSyncRemoveInvalidShareParticipantsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncRemoveInvalidShareParticipantsOperation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncRemoveInvalidShareParticipantsOperation;
  result = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v5, sel_initWithConfiguration_cloudState_, a3, a4);
  if (result)
    result->_requiredPermission = 3;
  return result;
}

- (void)setRequiredPermission:(int64_t)a3
{
  void *v6;

  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncRemoveInvalidShareParticipantsOperation.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  self->_requiredPermission = a3;
}

- (void)setParticipantsToCheck:(id)a3
{
  NSArray *v5;
  NSArray *participantsToCheck;
  void *v7;
  id v8;

  v8 = a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncRemoveInvalidShareParticipantsOperation.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  v5 = (NSArray *)objc_msgSend(v8, "copy");
  participantsToCheck = self->_participantsToCheck;
  self->_participantsToCheck = v5;

}

- (void)main
{
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v2;
  NSArray *participantsToCheck;
  HDSynchronousTaskGroup *v4;
  HDSynchronousTaskGroup *taskGroup;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
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
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  int64_t requiredPermission;
  id v46;
  uint64_t v47;
  uint64_t v48;
  NSArray *v50;
  NSObject *v51;
  void *v52;
  id v54;
  void *v55;
  HDCloudSyncModifyRecordsOperation *v56;
  void *v57;
  HDCloudSyncModifyRecordsOperation *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  uint64_t v67;
  void *v68;
  id v69;
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  void *v78;
  _QWORD v79[6];
  _QWORD v80[6];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  void *v102;
  uint8_t v103[4];
  HDCloudSyncRemoveInvalidShareParticipantsOperation *v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v2 = self;
  v107 = *MEMORY[0x1E0C80C00];
  participantsToCheck = self->_participantsToCheck;
  if (participantsToCheck && !-[NSArray count](participantsToCheck, "count"))
  {
    _HKInitializeLogging();
    v62 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v103 = 138543362;
      v104 = v2;
      _os_log_impl(&dword_1B7802000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: No participants to check; nothing to do.",
        v103,
        0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 1, 0);
  }
  else
  {
    v4 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v2->_taskGroup;
    v2->_taskGroup = v4;

    -[HDSynchronousTaskGroup setDelegate:](v2->_taskGroup, "setDelegate:", v2);
    -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask");
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "repository");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allCKContainers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
    if (v9)
    {
      v11 = v9;
      v12 = 0x1E0C99000uLL;
      v13 = *(_QWORD *)v82;
      *(_QWORD *)&v10 = 138543874;
      v63 = v10;
      v64 = *(_QWORD *)v82;
      v70 = v2;
      do
      {
        v14 = 0;
        v65 = v11;
        do
        {
          if (*(_QWORD *)v82 != v13)
            objc_enumerationMutation(obj);
          v67 = v14;
          v15 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v14);
          -[HDSynchronousTaskGroup beginTask](v2->_taskGroup, "beginTask", v63);
          v16 = v15;
          v69 = objc_alloc_init(*(Class *)(v12 + 3560));
          -[HDCloudSyncOperation configuration](v2, "configuration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "cachedCloudState");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = 0;
          objc_msgSend(v18, "zonesByIdentifierWithError:", &v94);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v94;

          v68 = v19;
          if (v19 || !v20)
          {
            v92 = 0u;
            v93 = 0u;
            v90 = 0u;
            v91 = 0u;
            objc_msgSend(v19, "allValues");
            v75 = (id)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v91;
              v71 = v16;
              v77 = v20;
              v73 = *(_QWORD *)v91;
              while (2)
              {
                v27 = 0;
                v74 = v25;
                do
                {
                  if (*(_QWORD *)v91 != v26)
                    objc_enumerationMutation(v75);
                  v28 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v27);
                  objc_msgSend(v28, "zoneIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "containerIdentifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "containerIdentifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v30, "isEqualToString:", v31);

                  v20 = v77;
                  if (v32)
                  {
                    v76 = v27;
                    v89 = 0;
                    objc_msgSend(v28, "zoneShareWithError:", &v89);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v89;
                    v35 = v34;
                    if (v33)
                      v36 = 1;
                    else
                      v36 = v34 == 0;
                    if (!v36)
                    {
                      _HKInitializeLogging();
                      v52 = (void *)*MEMORY[0x1E0CB5370];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                      {
                        v60 = v52;
                        objc_msgSend(v28, "zoneIdentifier");
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = v63;
                        v98 = v70;
                        v99 = 2114;
                        v100 = v61;
                        v101 = 2114;
                        v102 = v35;
                        _os_log_error_impl(&dword_1B7802000, v60, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached CKShare for zone %{public}@, %{public}@", buf, 0x20u);

                      }
                      v22 = objc_retainAutorelease(v35);

                      v23 = 0;
                      v11 = v65;
                      v12 = 0x1E0C99000;
                      v13 = v64;
                      v20 = v77;
                      goto LABEL_52;
                    }
                    if (v33)
                    {
                      v87 = 0u;
                      v88 = 0u;
                      v85 = 0u;
                      v86 = 0u;
                      objc_msgSend(v33, "participants");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = (void *)objc_msgSend(v37, "copy");

                      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
                      if (v39)
                      {
                        v40 = v39;
                        v78 = v33;
                        v72 = v35;
                        v41 = 0;
                        v42 = *(_QWORD *)v86;
                        do
                        {
                          for (i = 0; i != v40; ++i)
                          {
                            if (*(_QWORD *)v86 != v42)
                              objc_enumerationMutation(v38);
                            v44 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                            if (objc_msgSend(v44, "role") != 1)
                            {
                              requiredPermission = v70->_requiredPermission;
                              v46 = v44;
                              v47 = objc_msgSend(v46, "acceptanceStatus");
                              v48 = objc_msgSend(v46, "permission");

                              if (v47 != 2 || v48 != requiredPermission)
                              {
                                v50 = v70->_participantsToCheck;
                                if (!v50 || -[NSArray containsObject:](v50, "containsObject:", v46))
                                {
                                  _HKInitializeLogging();
                                  v51 = *MEMORY[0x1E0CB5370];
                                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_DWORD *)buf = 138543618;
                                    v98 = v70;
                                    v99 = 2114;
                                    v100 = v46;
                                    _os_log_impl(&dword_1B7802000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: Found invalid participant %{public}@, removing.", buf, 0x16u);
                                  }
                                  objc_msgSend(v78, "removeParticipant:", v46);
                                  v41 = 1;
                                }
                              }
                            }
                          }
                          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
                        }
                        while (v40);

                        v16 = v71;
                        v35 = v72;
                        v20 = v77;
                        v33 = v78;
                        if ((v41 & 1) != 0)
                          objc_msgSend(v69, "addObject:", v78);
                      }
                      else
                      {

                        v16 = v71;
                      }
                    }

                    v26 = v73;
                    v25 = v74;
                    v27 = v76;
                  }
                  ++v27;
                }
                while (v27 != v25);
                v25 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
                if (v25)
                  continue;
                break;
              }
            }

            v23 = v69;
            v22 = 0;
            v11 = v65;
            v12 = 0x1E0C99000;
            v13 = v64;
          }
          else
          {
            _HKInitializeLogging();
            v21 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v103 = 138543618;
              v104 = v70;
              v105 = 2114;
              v106 = v20;
              _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", v103, 0x16u);
            }
            v22 = objc_retainAutorelease(v20);
            v23 = 0;
          }
LABEL_52:

          v54 = v22;
          v55 = v54;
          if (v23 || !v54)
          {
            v2 = v70;
            if (objc_msgSend(v23, "count"))
            {
              v56 = [HDCloudSyncModifyRecordsOperation alloc];
              -[HDCloudSyncOperation configuration](v70, "configuration");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v56, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v57, v16, v23, 0);

              v59 = MEMORY[0x1E0C809B0];
              v80[0] = MEMORY[0x1E0C809B0];
              v80[1] = 3221225472;
              v80[2] = __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke;
              v80[3] = &unk_1E6CEBAB0;
              v80[4] = v70;
              v80[5] = v16;
              -[HDCloudSyncOperation setOnError:](v58, "setOnError:", v80);
              v79[0] = v59;
              v2 = v70;
              v79[1] = 3221225472;
              v79[2] = __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke_192;
              v79[3] = &unk_1E6CE98F8;
              v79[4] = v70;
              v79[5] = v16;
              -[HDCloudSyncOperation setOnSuccess:](v58, "setOnSuccess:", v79);
              -[HDCloudSyncOperation start](v58, "start");

            }
            else
            {
              -[HDSynchronousTaskGroup finishTask](v70->_taskGroup, "finishTask");
            }
          }
          else
          {
            v2 = v70;
            -[HDSynchronousTaskGroup failTaskWithError:](v70->_taskGroup, "failTaskWithError:", v54);
          }

          v14 = v67 + 1;
        }
        while (v67 + 1 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v95, 16);
      }
      while (v11);
    }

    -[HDSynchronousTaskGroup finishTask](v2->_taskGroup, "finishTask");
  }
}

void __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update shares in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "failTaskWithError:", v4);

}

uint64_t __58__HDCloudSyncRemoveInvalidShareParticipantsOperation_main__block_invoke_192(uint64_t a1)
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
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated share records for %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
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

- (int64_t)requiredPermission
{
  return self->_requiredPermission;
}

- (NSArray)participantsToCheck
{
  return self->_participantsToCheck;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsToCheck, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
