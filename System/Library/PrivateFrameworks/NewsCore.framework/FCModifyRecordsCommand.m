@implementation FCModifyRecordsCommand

+ (id)desiredKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCModifyRecordsCommand desiredKeys]";
    v9 = 2080;
    v10 = "FCModifyRecordsCommand.m";
    v11 = 1024;
    v12 = 50;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCModifyRecordsCommand desiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCModifyRecordsCommand)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCModifyRecordsCommand init]";
    v9 = 2080;
    v10 = "FCModifyRecordsCommand.m";
    v11 = 1024;
    v12 = 55;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCModifyRecordsCommand init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCModifyRecordsCommand)initWithLocalRecordsGenerator:(id)a3 merge:(BOOL)a4
{
  id v6;
  FCModifyRecordsCommand *v7;
  uint64_t v8;
  id localRecordsGenerator;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCModifyRecordsCommand;
  v7 = -[FCModifyRecordsCommand init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    localRecordsGenerator = v7->_localRecordsGenerator;
    v7->_localRecordsGenerator = (id)v8;

    v7->_merge = a4;
  }

  return v7;
}

- (FCModifyRecordsCommand)initWithLocalRecords:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  FCModifyRecordsCommand *v9;
  _QWORD aBlock[4];
  id v12;

  v4 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCModifyRecordsCommand_initWithLocalRecords_merge___block_invoke;
  aBlock[3] = &unk_1E4643BA0;
  v12 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = -[FCModifyRecordsCommand initWithLocalRecordsGenerator:merge:](self, "initWithLocalRecordsGenerator:merge:", v8, v4);

  return v9;
}

id __53__FCModifyRecordsCommand_initWithLocalRecords_merge___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (FCModifyRecordsCommand)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  FCModifyRecordsCommand *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("localRecords"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v8, objc_msgSend(v9, "BOOLValue"));
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 merge;
  void *v6;
  id v7;

  v7 = a3;
  -[FCModifyRecordsCommand localRecords](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("localRecords"));

  if (self)
    merge = self->_merge;
  else
    merge = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", merge);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("merge"));

}

- (_QWORD)localRecords
{
  _QWORD *v1;
  _QWORD *v2;
  void (*v3)(void);
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (_QWORD *)a1[3];
    if (!v2)
    {
      v2 = (_QWORD *)a1[2];
      if (v2)
      {
        v3 = (void (*)(void))v2[2];
        v4 = v2;
        v3();
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v1[3];
        v1[3] = v5;

        v2 = (_QWORD *)v1[3];
      }
    }
    a1 = v2;
  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCModifyRecordsCommand mergeLocalRecord:withRemoteRecord:]";
    v14 = 2080;
    v15 = "FCModifyRecordsCommand.m";
    v16 = 1024;
    v17 = 106;
    v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCModifyRecordsCommand mergeLocalRecord:withRemoteRecord:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  FCModifyRecordsCommand *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "networkReachability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCloudKitReachable");

  if (v11)
  {
    objc_msgSend(v8, "internalPrivateDataContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__FCModifyRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
    v17[3] = &unk_1E4643C80;
    v17[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = a5;
    objc_msgSend(v12, "prepareRecordZonesForUseWithCompletionHandler:", v17);

  }
  else
  {
    v13 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will not execute because CloudKit is not reachable", buf, 0x16u);

    }
    objc_msgSend(v9, "command:didFinishWithStatus:", self, 1);
  }

}

void __71__FCModifyRecordsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  FCArrayStream *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      v13 = v4;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138543874;
      v18 = v15;
      v19 = 2048;
      v20 = v16;
      v21 = 2114;
      v22 = v3;
      _os_log_error_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_ERROR, "<%{public}@ %p> failed to prepare zones for use with error: %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "statusForCloudKitError:", v3));
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[FCModifyRecordsCommand localRecords](*(_QWORD **)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = v6;
    else
      v8 = MEMORY[0x1E0C9AA60];
    v9 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v8, 1);

    v10 = -[FCArrayStream initWithArray:]([FCArrayStream alloc], "initWithArray:", v9);
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "internalPrivateDataContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyRecordsCommand handleLocalRecordsFromStream:internalPrivateDataContext:delegate:qualityOfService:](v11, v10, v12, *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

- (void)handleLocalRecordsFromStream:(void *)a3 internalPrivateDataContext:(void *)a4 delegate:(uint64_t)a5 qualityOfService:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke;
    aBlock[3] = &unk_1E4643CD0;
    aBlock[4] = a1;
    v17 = v10;
    v20 = a5;
    v12 = v9;
    v18 = v12;
    v19 = v11;
    v13 = _Block_copy(aBlock);
    FCDispatchQueueForQualityOfService(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v12, "fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:", 100, a5, v14, v13);

  }
}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = v6 && (!self || !self->_merge) && v6[8] == 0;
  return v7;
}

- (void)coalesceWithCommand:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  _QWORD *v38;
  void *v39;
  FCModifyRecordsCommand *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v41 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v40 = self;
  -[FCModifyRecordsCommand localRecords](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_dictionaryWithKeySelector:", sel_recordID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v6;
  -[FCModifyRecordsCommand localRecords](v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_dictionaryWithKeySelector:", sel_recordID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = MEMORY[0x1E0C9AA60];
  if (v12)
    v15 = v12;
  else
    v15 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v11, "addObjectsFromArray:", v15, v38);

  objc_msgSend(v10, "allKeys");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = v16;
  else
    v18 = v14;
  objc_msgSend(v11, "addObjectsFromArray:", v18);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v11;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    v43 = v19;
    v44 = v10;
    v42 = *(_QWORD *)v52;
    do
    {
      v23 = 0;
      v45 = v21;
      do
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v23);
        objc_msgSend(v8, "objectForKey:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (unint64_t)v26;
        if (v25)
          v28 = v26 == 0;
        else
          v28 = 1;
        if (!v28)
        {
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v26, "changedKeys");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v48 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                objc_msgSend((id)v27, "objectForKeyedSubscript:", v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v25, "setObject:forKeyedSubscript:", v35, v34);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            }
            while (v31);
          }

          v19 = v43;
          v10 = v44;
          v22 = v42;
          v21 = v45;
        }
        if (v25 | v27)
        {
          if (v25)
            v36 = v25;
          else
            v36 = v27;
          objc_msgSend(v19, "addObject:", v36);
        }

        ++v23;
      }
      while (v23 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v21);
  }

  if (v40)
    objc_setProperty_nonatomic_copy(v40, v37, v19, 24);

}

void __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  FCCKPrivateFetchRecordsOperation *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  _QWORD *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  _BYTE buf[24];
  void *v53;
  id v54;
  id v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = *(_BYTE **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(_QWORD *)(a1 + 64);
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke_2;
  v46 = &unk_1E4643CA8;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v47 = v8;
  v48 = v9;
  v49 = v10;
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v50 = v11;
  v51 = v12;
  v13 = a2;
  v14 = v4;
  v15 = &v43;
  if (v5)
  {
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v14, "privateDatabase");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5[8])
      {
        objc_msgSend(v13, "fc_dictionaryWithKeySelector:", sel_recordID);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
        objc_msgSend(v17, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKPrivateFetchRecordsOperation setRecordIDs:](v18, "setRecordIDs:", v19);

        -[FCOperation setQualityOfService:](v18, "setQualityOfService:", v7);
        v41 = v14;
        if (v7 == 9)
        {
          v20 = v16;
          v21 = -1;
        }
        else if (v7 == 33 || v7 == 25)
        {
          v20 = v16;
          v21 = 1;
        }
        else
        {
          v20 = v16;
          v21 = 0;
        }
        -[FCOperation setRelativePriority:](v18, "setRelativePriority:", v21, v41, v43, v44);
        objc_msgSend((id)objc_opt_class(), "desiredKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCKPrivateFetchRecordsOperation setDesiredKeys:](v18, "setDesiredKeys:", v27);

        -[FCOperation operationID](v18, "operationID");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2114;
          v53 = v28;
          _os_log_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform fetch operation, operationID=%{public}@", buf, 0x20u);

          v6 = MEMORY[0x1E0C809B0];
        }
        *(_QWORD *)buf = v6;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke;
        v53 = &unk_1E4643D20;
        v54 = v17;
        v55 = v5;
        v58 = v7;
        v57 = v15;
        v16 = v20;
        v33 = v20;
        v56 = v33;
        v34 = v17;
        -[FCCKPrivateFetchRecordsOperation setFetchRecordsCompletionBlock:](v18, "setFetchRecordsCompletionBlock:", buf);
        -[FCCKPrivateDatabase addOperation:]((uint64_t)v33, v18);

        v14 = v42;
      }
      else
      {
        v18 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
        -[FCCKPrivateFetchRecordsOperation setRecordsToSave:](v18, "setRecordsToSave:", v13);
        -[FCOperation setQualityOfService:](v18, "setQualityOfService:", v7);
        if (v7 == 9)
          v26 = -1;
        else
          v26 = v7 == 33 || v7 == 25;
        -[FCOperation setRelativePriority:](v18, "setRelativePriority:", v26);
        -[FCCKPrivateFetchRecordsOperation setSavePolicy:](v18, "setSavePolicy:", 1);
        -[FCOperation operationID](v18, "operationID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v6;
          v38 = v36;
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v5;
          *(_WORD *)&buf[22] = 2114;
          v53 = v35;
          _os_log_impl(&dword_1A1B90000, v38, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform save operation, operationID=%{public}@", buf, 0x20u);

          v6 = v37;
        }
        *(_QWORD *)buf = v6;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_29;
        v53 = &unk_1E4643CF8;
        v54 = v5;
        v55 = v35;
        v56 = v15;
        v28 = v35;
        -[FCCKPrivateFetchRecordsOperation setSaveRecordsCompletionBlock:](v18, "setSaveRecordsCompletionBlock:", buf);
        -[FCCKPrivateDatabase addOperation:]((uint64_t)v16, v18);

      }
    }
    else
    {
      v22 = (void *)FCCommandQueueLog;
      if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> skipping work because CloudKit is not available", buf, 0x16u);

      }
      v45((uint64_t)v15, 0);
    }
  }

}

uint64_t __108__FCModifyRecordsCommand_handleLocalRecordsFromStream_internalPrivateDataContext_delegate_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 || (objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 56), "command:didFinishWithStatus:", *(_QWORD *)(a1 + 40), a2);
  else
    return -[FCModifyRecordsCommand handleLocalRecordsFromStream:internalPrivateDataContext:delegate:qualityOfService:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  FCCKPrivateSaveRecordsOperation *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[5];
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "fc_isCKUnknownItemError"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (!v10)
      goto LABEL_15;
    v11 = v10;
    v12 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if (!objc_msgSend(*(id *)(a1 + 40), "mergeLocalRecord:withRemoteRecord:", v15, v16))
            goto LABEL_13;
          v17 = v8;
          v18 = v16;
        }
        else
        {
          v17 = v8;
          v18 = v15;
        }
        objc_msgSend(v17, "addObject:", v18);
LABEL_13:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (!v11)
      {
LABEL_15:

        v19 = (void *)FCCommandQueueLog;
        if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(a1 + 40);
          v24 = objc_msgSend(v5, "count");
          v25 = objc_msgSend(v8, "count");
          *(_DWORD *)buf = 138544130;
          v56 = v22;
          v57 = 2048;
          v58 = v23;
          v59 = 2048;
          v60 = v24;
          v61 = 2048;
          v62 = v25;
          _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> fetched %lu records, and has %lu records to save after merging", buf, 0x2Au);

        }
        if (objc_msgSend(v8, "count") == 1)
        {
          v26 = (void *)FCCommandQueueLog;
          if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v26;
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v8, "firstObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "changedKeys");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v56 = v29;
            v57 = 2048;
            v58 = v30;
            v59 = 2114;
            v60 = (uint64_t)v32;
            _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will save record with changed keys: %{public}@", buf, 0x20u);

          }
        }
        if (objc_msgSend(v8, "count"))
        {
          v33 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
          -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v33, "setRecordsToSave:", v8);
          -[FCOperation setQualityOfService:](v33, "setQualityOfService:", *(_QWORD *)(a1 + 64));
          v34 = *(_QWORD *)(a1 + 64);
          if (v34 == 9)
            v35 = -1;
          else
            v35 = v34 == 33 || v34 == 25;
          -[FCOperation setRelativePriority:](v33, "setRelativePriority:", v35);
          -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v33, "setSavePolicy:", 1);
          -[FCOperation operationID](v33, "operationID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)FCCommandQueueLog;
          if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
          {
            v39 = v38;
            v40 = (objc_class *)objc_opt_class();
            NSStringFromClass(v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            v56 = v41;
            v57 = 2048;
            v58 = v42;
            v59 = 2114;
            v60 = (uint64_t)v37;
            _os_log_impl(&dword_1A1B90000, v39, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> will perform save operation, operationID=%{public}@", buf, 0x20u);

          }
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_27;
          v48[3] = &unk_1E4643CF8;
          v48[4] = *(_QWORD *)(a1 + 40);
          v49 = v37;
          v50 = *(id *)(a1 + 56);
          v43 = v37;
          -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v33, "setSaveRecordsCompletionBlock:", v48);
          -[FCCKPrivateDatabase addOperation:](*(_QWORD *)(a1 + 48), v33);

        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }

        goto LABEL_35;
      }
    }
  }
  v36 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
  {
    v44 = v36;
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v56 = v46;
    v57 = 2048;
    v58 = v47;
    v59 = 2114;
    v60 = (uint64_t)v7;
    _os_log_error_impl(&dword_1A1B90000, v44, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error fetching records: %{public}@", buf, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "statusForCloudKitError:", v7));
LABEL_35:

}

void __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_27(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      v20 = 138543874;
      v21 = v10;
      v22 = 2048;
      v23 = v11;
      v24 = 2114;
      v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error saving records after merge: %{public}@", (uint8_t *)&v20, 0x20u);

    }
  }
  else
  {
    -[FCModifyRecordsCommand _didSaveRecords:](a1[4], v5);
  }
  v12 = objc_msgSend((id)a1[4], "statusForCloudKitError:", v6);
  v13 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a1[4];
    v18 = a1[5];
    FCCommandStatusDescription(v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v16;
    v22 = 2048;
    v23 = v17;
    v24 = 2114;
    v25 = v18;
    v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> did perform save operation, operationID=%{public}@, status=%{public}@", (uint8_t *)&v20, 0x2Au);

  }
  (*(void (**)(uint64_t, uint64_t))(a1[6] + 16))(a1[6], objc_msgSend((id)a1[4], "statusForCloudKitError:", v6));

}

- (void)_didSaveRecords:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news"));

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0C99E60];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __42__FCModifyRecordsCommand__didSaveRecords___block_invoke_2;
      v20[3] = &unk_1E463AE18;
      v21 = v3;
      objc_msgSend(v8, "fc_set:", v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            FCZoneLastModifiedExternallySharedPreferenceKey(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            NewsCoreUserDefaults();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v7, v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        }
        while (v11);
      }

    }
  }

}

void __107__FCModifyRecordsCommand_handleBatchOfLocalRecords_internalPrivateDataContext_qualityOfService_completion___block_invoke_29(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)FCCommandQueueLog;
    if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      v20 = 138543874;
      v21 = v10;
      v22 = 2048;
      v23 = v11;
      v24 = 2114;
      v25 = (uint64_t)v6;
      _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "<%{public}@ %p> encountered error saving records: %{public}@", (uint8_t *)&v20, 0x20u);

    }
  }
  else
  {
    -[FCModifyRecordsCommand _didSaveRecords:](a1[4], v5);
  }
  v12 = objc_msgSend((id)a1[4], "statusForCloudKitError:", v6);
  v13 = (void *)FCCommandQueueLog;
  if (os_log_type_enabled((os_log_t)FCCommandQueueLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = a1[4];
    v18 = a1[5];
    FCCommandStatusDescription(v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v16;
    v22 = 2048;
    v23 = v17;
    v24 = 2114;
    v25 = v18;
    v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> did perform save operation, operationID=%{public}@, status=%{public}@", (uint8_t *)&v20, 0x2Au);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __42__FCModifyRecordsCommand__didSaveRecords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "recordID", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "zoneID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "zoneName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecords, 0);
  objc_storeStrong(&self->_localRecordsGenerator, 0);
}

@end
