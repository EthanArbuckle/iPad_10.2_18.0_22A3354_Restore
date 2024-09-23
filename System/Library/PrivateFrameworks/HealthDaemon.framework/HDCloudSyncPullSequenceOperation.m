@implementation HDCloudSyncPullSequenceOperation

- (HDCloudSyncPullSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncPullSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequence:(id)a6 changes:(id)a7
{
  id v13;
  id v14;
  id v15;
  HDCloudSyncPullSequenceOperation *v16;
  HDCloudSyncPullSequenceOperation *v17;
  uint64_t v18;
  NSArray *changeRecords;
  objc_super v21;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncPullSequenceOperation;
  v16 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v21, sel_initWithConfiguration_cloudState_, a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_target, a5);
    objc_storeStrong((id *)&v17->_sequenceRecord, a6);
    v18 = objc_msgSend(v15, "copy");
    changeRecords = v17->_changeRecords;
    v17->_changeRecords = (NSArray *)v18;

  }
  return v17;
}

- (void)main
{
  void *v3;
  os_log_t *v4;
  void *v5;
  NSArray *changeRecords;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  os_log_t *v16;
  void *v17;
  void *v18;
  HDCloudSyncCompoundOperation *v19;
  void *v20;
  HDCloudSyncCompoundOperation *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  HDCloudSyncPullChangeRecordOperation *v27;
  void *v28;
  HDCloudSyncPullChangeRecordOperation *v29;
  NSArray *obj;
  NSArray *obja;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  _BYTE v42[24];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalUnitCount:", 0);

  _HKInitializeLogging();
  v4 = (os_log_t *)MEMORY[0x1E0CB5370];
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    changeRecords = self->_changeRecords;
    v7 = v5;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v42 = self;
    *(_WORD *)&v42[8] = 2048;
    *(_QWORD *)&v42[10] = -[NSArray count](changeRecords, "count");
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning pull for sequence with %ld required record(s).", buf, 0x16u);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_changeRecords;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        _HKInitializeLogging();
        v14 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          objc_msgSend(v13, "recordID");
          v16 = v4;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "decodedSyncAnchorRangeMap");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v42 = v10;
          *(_WORD *)&v42[4] = 2114;
          *(_QWORD *)&v42[6] = v17;
          *(_WORD *)&v42[14] = 2114;
          *(_QWORD *)&v42[16] = v18;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "\t%02d: %{public}@: %{public}@", buf, 0x1Cu);

          v4 = v16;
          ++v10;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v9);
  }

  v19 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v19, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v20, 0, CFSTR("Pull Changes"), 0);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obja = self->_changeRecords;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obja);
        v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        v27 = [HDCloudSyncPullChangeRecordOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[HDCloudSyncPullChangeRecordOperation initWithConfiguration:cloudState:target:sequenceRecord:changeRecord:](v27, "initWithConfiguration:cloudState:target:sequenceRecord:changeRecord:", v28, 0, self->_target, self->_sequenceRecord, v26);

        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v21, "addOperation:transitionHandler:", v29, 0);
      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v23);
  }

  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v21);
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncTarget)target
{
  return self->_target;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  return self->_sequenceRecord;
}

- (BOOL)hasAppliedChange
{
  return self->_hasAppliedChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_changeRecords, 0);
}

@end
