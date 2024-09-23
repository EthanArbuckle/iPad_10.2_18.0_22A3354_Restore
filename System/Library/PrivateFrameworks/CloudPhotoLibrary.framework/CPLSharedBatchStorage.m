@implementation CPLSharedBatchStorage

- (CPLSharedBatchStorage)initWithTransientRepository:(id)a3 scope:(id)a4 sharedScope:(id)a5 merger:(id)a6
{
  id v10;
  id v11;
  id v12;
  CPLSharedBatchStorage *v13;
  CPLSharedBatchStorage *v14;
  void *v15;
  uint64_t v16;
  CPLEngineCloudCache *cloudCache;
  uint64_t v18;
  CPLEngineIgnoredRecords *ignoredRecords;
  uint64_t v20;
  CPLEngineRemappedRecords *remappedRecords;
  NSDate *v22;
  NSDate *now;
  objc_super v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CPLSharedBatchStorage;
  v13 = -[CPLEngineTransientRepositoryBatchStorage initWithTransientRepository:scope:](&v25, sel_initWithTransientRepository_scope_, v10, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sharedScope, a5);
    objc_storeStrong((id *)&v14->_merger, a6);
    objc_msgSend(v10, "engineStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cloudCache");
    v16 = objc_claimAutoreleasedReturnValue();
    cloudCache = v14->_cloudCache;
    v14->_cloudCache = (CPLEngineCloudCache *)v16;

    objc_msgSend(v15, "ignoredRecords");
    v18 = objc_claimAutoreleasedReturnValue();
    ignoredRecords = v14->_ignoredRecords;
    v14->_ignoredRecords = (CPLEngineIgnoredRecords *)v18;

    objc_msgSend(v15, "remappedRecords");
    v20 = objc_claimAutoreleasedReturnValue();
    remappedRecords = v14->_remappedRecords;
    v14->_remappedRecords = (CPLEngineRemappedRecords *)v20;

    v22 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    now = v14->_now;
    v14->_now = v22;

  }
  return v14;
}

- (id)_targetForPrivateScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetForRecordWithScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CPLEngineCloudCache targetForRecordWithCloudScopedIdentifier:trustRecordChangeData:](self->_cloudCache, "targetForRecordWithCloudScopedIdentifier:trustRecordChangeData:", v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addKnownTarget:forRecordWithScopedIdentifier:", v6, v4);

  }
  return v6;
}

- (id)_targetForSharedScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetForRecordWithOtherScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CPLEngineCloudCache targetForRecordWithSharedCloudScopedIdentifier:trustRecordChangeData:](self->_cloudCache, "targetForRecordWithSharedCloudScopedIdentifier:trustRecordChangeData:", v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addKnownTarget:forRecordWithScopedIdentifier:", v6, v8);

  }
  return v6;
}

- (id)_privateScopedIdentifierForSharedScopedIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CPLSharedBatchStorage _targetForSharedScopedIdentifier:](self, "_targetForSharedScopedIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)stashChange:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  objc_msgSend(a3, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLSharedBatchStorage _targetForPrivateScopedIdentifier:](self, "_targetForPrivateScopedIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scopedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "stashChangeWithScopedIdentifier:error:", v9, a4);

  if (v10)
  {
    objc_msgSend(v7, "otherScopedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "otherScopedIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "stashChangeWithScopedIdentifier:error:", v12, a4);

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isRecordWithScopedIdentifierStashed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[CPLSharedBatchStorage _targetForPrivateScopedIdentifier:](self, "_targetForPrivateScopedIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasStashedRecordWithScopedIdentifier:", v6);

  if ((v7 & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_msgSend(v4, "otherScopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "otherScopedIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v5, "hasStashedRecordWithScopedIdentifier:", v9);

    }
  }

  return (char)v8;
}

- (id)_remapSharedRecord:(id)a3 target:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "%@ should have a target here", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v19, 106, CFSTR("%@ should have a target here"), v7);

    abort();
  }
  v9 = v8;
  v23 = 0;
  objc_msgSend(v7, "translateToClientChangeUsingIDMapping:error:", self, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  if (!v10)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v7;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Failed to remap shared record %@: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v22, 109, CFSTR("Failed to remap shared record %@: %@"), v7, v11);

    abort();
  }
  objc_msgSend(v10, "scopedIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scopedIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v9, "scopedIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setScopedIdentifier:", v15);

    objc_msgSend(v10, "awakeFromStorage");
  }

  return v10;
}

- (id)_sharedRecordAsPrivateRecord:(id)a3 target:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[CPLSharedBatchStorage _remapSharedRecord:target:](self, "_remapSharedRecord:target:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordChangeData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingRecordChangeData:", v8);

  objc_msgSend(v7, "setRecordChangeData:", 0);
  objc_msgSend(v6, "scopedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharingScopeIdentifier:", v10);

  return v7;
}

- (id)_correctPrivateScopedIdentifierForSharedScopedIdentifier:(id)a3 currentPrivateScopedIdentifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  CPLScopedIdentifier *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CPLEngineRemappedRecords scopedIdentifiersRemappedToScopedIdentifier:](self->_remappedRecords, "scopedIdentifiersRemappedToScopedIdentifier:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
LABEL_3:
    v12 = 0;
    v13 = v10;
    while (1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
      v15 = [CPLScopedIdentifier alloc];
      objc_msgSend(v14, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v15, "initRelativeToScopedIdentifier:identifier:", v6, v16);

      if (-[CPLEngineCloudCache hasRecordWithScopedIdentifier:](self->_cloudCache, "hasRecordWithScopedIdentifier:", v10))
      {
        break;
      }

      ++v12;
      v13 = v10;
      if (v9 == v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_13;
      }
    }

    if (v10)
      goto LABEL_15;
  }
  else
  {
    v10 = 0;
LABEL_13:

    v13 = v10;
  }
  v13 = v13;
  v10 = v13;
LABEL_15:
  if (v10)
    v17 = v10;
  else
    v17 = v6;
  v18 = v17;

  return v18;
}

- (id)_mergedRecordWithPrivateChange:(id)a3 sharedScopedIdentifier:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CPLRecordTarget *v12;
  CPLScopedIdentifier *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  CPLRecordTarget *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  CPLRecordTarget *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  CPLScopedIdentifier *v39;
  void *v40;
  void *v41;
  void *v42;
  CPLScopedIdentifier *v43;
  int v44;
  CPLRecordTarget *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  char v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  void *v58;
  CPLRecordTarget *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  CPLRecordTarget *v63;
  CPLEngineCloudCache *cloudCache;
  void *v65;
  CPLRecordTarget *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  CPLRecordTarget *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  CPLRecordTarget *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  CPLRecordTarget *v91;
  uint64_t v92;
  void *v93;
  int v94;
  CPLRecordTarget *v95;
  CPLRecordTarget *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  CPLRecordTarget *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  SEL v108;
  id v109;
  CPLScopedIdentifier *v110;
  CPLScopedIdentifier *v111;
  id v112;
  uint8_t buf[4];
  id v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  id v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  id v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alreadyProcessedChanges, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    goto LABEL_57;
  }
  -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetForRecordWithScopedIdentifier:", v8);
  v12 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

  v108 = a2;
  if (objc_msgSend(v7, "isMasterChange"))
  {
    v13 = [CPLScopedIdentifier alloc];
    -[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v13, "initWithScopeIdentifier:identifier:", v14, v15);

    -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (id)v16;
    objc_msgSend(v17, "unmingledChangeWithScopedIdentifier:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
LABEL_5:
      v19 = objc_msgSend(v18, "isDelete");
      v20 = objc_msgSend(v7, "isDelete");
      v21 = [CPLRecordTarget alloc];
      if (v19)
      {
        v22 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v21, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v16, v20 ^ 1u);

        v23 = v7;
        objc_msgSend(v23, "setSharingRecordChangeData:", 0);
LABEL_25:

        v28 = 0;
LABEL_37:
        v25 = (void *)v22;
        goto LABEL_38;
      }
      if (v20)
      {
        v22 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v21, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v16, 2);

        -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](self, "_sharedRecordAsPrivateRecord:target:", v18, v22);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRecordChangeData:", 0);
        goto LABEL_25;
      }
      v22 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v21, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v16, 3);

      -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](self, "_sharedRecordAsPrivateRecord:target:", v18, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordChangeData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRecordChangeData:", v40);

      v28 = v7;
LABEL_36:

      goto LABEL_37;
    }
    -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v8, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = v30;
      objc_msgSend(v30, "sharingRecordChangeData");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v114 = v31;
            v115 = 2112;
            v116 = v16;
            _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_DEFAULT, "Upgrading %@ in cloud cache to shared master %@", buf, 0x16u);
          }

        }
        v18 = (void *)objc_msgSend(v31, "copy");

        objc_msgSend(v18, "setScopedIdentifier:", v16);
        objc_msgSend(v18, "awakeFromStorage");
        objc_msgSend(v18, "sharingRecordChangeData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRecordChangeData:", v34);

        objc_msgSend(v18, "setSharingRecordChangeData:", 0);
        if (v18)
          goto LABEL_5;
      }
      else
      {

      }
    }
    v58 = v12;
    if (!v12)
    {
      -[CPLSharedBatchStorage _targetForPrivateScopedIdentifier:](self, "_targetForPrivateScopedIdentifier:", v8);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = v58;
    switch(objc_msgSend(v58, "targetState"))
    {
      case 0:
        v59 = [CPLRecordTarget alloc];
        v60 = v8;
        v61 = v16;
        v62 = 1;
        goto LABEL_63;
      case 1:
        if (objc_msgSend(v7, "isDelete"))
        {
          v63 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v16, 0);

          v25 = v63;
        }
        goto LABEL_123;
      case 2:
        if (objc_msgSend(v7, "isDelete"))
        {
          cloudCache = self->_cloudCache;
          goto LABEL_69;
        }
        v28 = (id)objc_msgSend(v7, "copy");
        v91 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v16, 3);

        -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v8, 0);
        v92 = objc_claimAutoreleasedReturnValue();
        if (v92)
        {
          v23 = (id)v92;
          objc_msgSend(v7, "recordChangeData");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setRecordChangeData:", v93);

        }
        else
        {
          v23 = v7;
        }
        v25 = v91;
        goto LABEL_38;
      case 3:
        if (!objc_msgSend(v7, "isDelete"))
        {
          v28 = (id)objc_msgSend(v7, "copy");
          v23 = v7;
          goto LABEL_38;
        }
        -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v8, 0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v65)
          goto LABEL_123;
        v23 = v65;
        objc_msgSend(v65, "setRecordChangeData:", 0);
        v66 = [CPLRecordTarget alloc];
        v67 = v8;
        v68 = v16;
        break;
      default:
        v28 = 0;
        v23 = 0;
        goto LABEL_38;
    }
LABEL_75:
    v29 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v66, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v67, v68, 2);

LABEL_76:
    v28 = 0;
LABEL_14:
    v25 = v29;
    goto LABEL_38;
  }
  if (!objc_msgSend(v7, "supportsSharingScopedIdentifier"))
  {
    v29 = -[CPLRecordTarget initWithScopedIdentifier:]([CPLRecordTarget alloc], "initWithScopedIdentifier:", v8);

    v23 = v7;
    v28 = 0;
    v109 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "isDelete"))
  {
    -[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v7, "isSharedInScopeWithIdentifier:", v35);

    if (!v36)
    {
      -[CPLRecordTarget otherScopedIdentifier](v12, "otherScopedIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v43 = v41;
      }
      else
      {
        v111 = [CPLScopedIdentifier alloc];
        -[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v111, "initWithScopeIdentifier:identifier:", v84, v85);

      }
      -[CPLEngineRemappedRecords realScopedIdentifierForRemappedScopedIdentifier:](self->_remappedRecords, "realScopedIdentifierForRemappedScopedIdentifier:", v43);
      v86 = objc_claimAutoreleasedReturnValue();
      v87 = (void *)v86;
      if (v86)
        v88 = (void *)v86;
      else
        v88 = v43;
      v89 = v88;

      -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = v89;
      objc_msgSend(v90, "unmingledChangeWithScopedIdentifier:", v89);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "isDelete"))
      {

        v28 = 0;
      }
      v29 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v89, 1);

      v23 = v7;
      goto LABEL_14;
    }
    objc_msgSend(v7, "sharingRecordScopedIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = v37;
    }
    else
    {
      v110 = [CPLScopedIdentifier alloc];
      -[CPLEngineScope scopeIdentifier](self->_sharedScope, "scopeIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v110, "initWithScopeIdentifier:identifier:", v69, v70);

    }
    -[CPLEngineRemappedRecords realScopedIdentifierForRemappedScopedIdentifier:](self->_remappedRecords, "realScopedIdentifierForRemappedScopedIdentifier:", v39);
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = (void *)v71;
    if (v71)
      v73 = (void *)v71;
    else
      v73 = v39;
    v74 = v73;

    v75 = v74;
    -[CPLSharedBatchStorage _correctPrivateScopedIdentifierForSharedScopedIdentifier:currentPrivateScopedIdentifier:](self, "_correctPrivateScopedIdentifierForSharedScopedIdentifier:currentPrivateScopedIdentifier:", v74, v8);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v76, "isEqual:", v8) & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v114 = v8;
          v115 = 2112;
          v116 = (uint64_t)v75;
          v117 = 2112;
          v118 = v76;
          _os_log_impl(&dword_1B03C2000, v82, OS_LOG_TYPE_DEFAULT, "Sparse private %@ is pointing to %@ but the private sparse should be %@ - ignoring", buf, 0x20u);
        }

      }
      v83 = -[CPLRecordTarget initWithScopedIdentifier:]([CPLRecordTarget alloc], "initWithScopedIdentifier:", v8);

      v23 = (id)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", v8);
      v28 = 0;
      v109 = 0;
      goto LABEL_113;
    }
    v77 = v76;
    v78 = v12;
    -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
    v79 = v75;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "unmingledChangeWithScopedIdentifier:", v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    v109 = v79;
    if (v81)
    {
      v28 = 0;
    }
    else
    {
      -[CPLEngineIgnoredRecords recordWithScopedIdentifier:](self->_ignoredRecords, "recordWithScopedIdentifier:", v79);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v81 = v28;
      if (!v28)
      {
        v100 = v12;
        if (!v12)
        {
          -[CPLSharedBatchStorage _targetForPrivateScopedIdentifier:](self, "_targetForPrivateScopedIdentifier:", v8);
          v100 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
        }
        v83 = v100;
        v76 = v77;
        if ((-[CPLRecordTarget targetState](v100, "targetState") & 0xFFFFFFFFFFFFFFFELL) != 2
          || (-[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v8, 0), (v101 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v81 = 0;
          v28 = 0;
          goto LABEL_111;
        }
        v102 = (void *)v101;
        v96 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v109, 3);

        v81 = 0;
        v28 = 0;
        v99 = 0;
        v98 = v102;
        goto LABEL_106;
      }
    }
    v94 = objc_msgSend(v81, "isDelete");
    v95 = [CPLRecordTarget alloc];
    if (v94)
    {
      v83 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v95, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v109, 0);

LABEL_110:
      v76 = v77;
LABEL_111:
      v23 = (id)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", v8);
      goto LABEL_112;
    }
    v96 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v95, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v109, 3);

    -[CPLSharedBatchStorage _remapSharedRecord:target:](self, "_remapSharedRecord:target:", v81, v96);
    v97 = objc_claimAutoreleasedReturnValue();
    if (!v97)
    {
      v83 = v96;
      goto LABEL_110;
    }
    v98 = (void *)v97;
    v99 = 1;
    v76 = v77;
LABEL_106:
    -[CPLSharedRecordMerger mergeRecord:isSharedRecord:inPrivateRecord:](self->_merger, "mergeRecord:isSharedRecord:inPrivateRecord:", v98, v99, v7);
    v23 = v7;

    v83 = v96;
LABEL_112:

LABEL_113:
    v25 = v83;

    goto LABEL_38;
  }
  v24 = v12;
  if (!v12)
  {
    -[CPLSharedBatchStorage _targetForPrivateScopedIdentifier:](self, "_targetForPrivateScopedIdentifier:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  objc_msgSend(v24, "otherScopedIdentifier");
  v26 = objc_claimAutoreleasedReturnValue();
  -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "unmingledChangeWithScopedIdentifier:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = (id)v26;
  if (v18)
  {
    v28 = 0;
    goto LABEL_33;
  }
  -[CPLEngineIgnoredRecords recordWithScopedIdentifier:](self->_ignoredRecords, "recordWithScopedIdentifier:", v26);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (v28)
  {
LABEL_33:
    v44 = objc_msgSend(v18, "isDelete");
    v45 = [CPLRecordTarget alloc];
    if (v44)
    {
      v22 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v45, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v26, 0);

      v23 = v7;
    }
    else
    {
      v22 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v45, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v8, v26, 2);

      -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](self, "_sharedRecordAsPrivateRecord:target:", v18, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRecordChangeData:", 0);
    }
    goto LABEL_36;
  }
  switch(objc_msgSend(v25, "targetState"))
  {
    case 0:
    case 1:
      v59 = [CPLRecordTarget alloc];
      v60 = v8;
      v61 = v26;
      v62 = 0;
LABEL_63:
      v29 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v59, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v60, v61, v62);

      v23 = v7;
      goto LABEL_76;
    case 2:
      cloudCache = self->_cloudCache;
LABEL_69:
      -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](cloudCache, "recordWithScopedIdentifier:isFinal:", v8, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (!v23)
        v23 = v7;
      objc_msgSend(v23, "setRecordChangeData:", 0);
      goto LABEL_124;
    case 3:
      -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v8, 0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      if (v103)
      {
        v23 = v103;
        objc_msgSend(v103, "setRecordChangeData:", 0);
        v66 = [CPLRecordTarget alloc];
        v67 = v8;
        v68 = v26;
        goto LABEL_75;
      }
LABEL_123:
      v23 = v7;
LABEL_124:
      v28 = 0;
      break;
    default:
      v28 = 0;
      v23 = 0;
      break;
  }
LABEL_38:
  if (!v25)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v7;
        _os_log_impl(&dword_1B03C2000, v104, OS_LOG_TYPE_ERROR, "Target for %@ should have been determined by now", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "handleFailureInMethod:object:file:lineNumber:description:", v108, self, v106, 419, CFSTR("Target for %@ should have been determined by now"), v7);
LABEL_136:

    abort();
  }
  -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTarget:forRecordWithScopedIdentifier:", v25, v8);

  if (!v23)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain();
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v7;
        _os_log_impl(&dword_1B03C2000, v107, OS_LOG_TYPE_ERROR, "failed to create merged private record from %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "handleFailureInMethod:object:file:lineNumber:description:", v108, self, v106, 422, CFSTR("failed to create merged private record from %@"), v7);
    goto LABEL_136;
  }
  v47 = v25;
  v48 = v109;
  if (a4)
  {
    v49 = objc_retainAutorelease(v109);
    *a4 = v49;
    if (v49)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_alreadyProcessedChanges, "setObject:forKeyedSubscript:", v23, v49);
  }
  objc_msgSend(v23, "setSharingRecordIdentifier:", 0);
  v112 = 0;
  v50 = objc_msgSend(v23, "validateChangeWithError:", &v112);
  v51 = v112;
  if ((v50 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138413314;
        v114 = v53;
        v115 = 2112;
        v116 = (uint64_t)v8;
        v117 = 2112;
        v118 = v23;
        v119 = 2112;
        v120 = v47;
        v121 = 2112;
        v122 = v51;
        v54 = v53;
        _os_log_impl(&dword_1B03C2000, v52, OS_LOG_TYPE_ERROR, "Failed to merge incoming private <%@ %@>: %@ (%@): %@", buf, 0x34u);

        v48 = v109;
      }

    }
    -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v8, 0);
    v55 = objc_claimAutoreleasedReturnValue();

    v23 = (id)v55;
    if (!v55)
      v23 = (id)objc_msgSend((id)objc_opt_class(), "newDeleteChangeWithScopedIdentifier:", v8);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_alreadyProcessedChanges, "setObject:forKeyedSubscript:", v23, v8);
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v114 = v8;
      v115 = 2112;
      v116 = (uint64_t)v48;
      v117 = 2112;
      v118 = v23;
      v119 = 2112;
      v120 = v48;
      _os_log_impl(&dword_1B03C2000, v56, OS_LOG_TYPE_DEBUG, "Merging private record %@/%@ to %@ (%@)", buf, 0x2Au);
    }

  }
  if (v28)
    objc_msgSend(v23, "_setIgnoredRecord:", v28);
  v10 = v23;

LABEL_57:
  return v10;
}

- (id)_updatePrivateScopedIdentifierForUnknownTarget:(id)a3
{
  CPLRecordTarget *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  CPLRecordTarget *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (CPLRecordTarget *)a3;
  -[CPLRecordTarget otherScopedIdentifier](v4, "otherScopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordTarget scopedIdentifier](v4, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CPLSharedBatchStorage _correctPrivateScopedIdentifierForSharedScopedIdentifier:currentPrivateScopedIdentifier:](self, "_correctPrivateScopedIdentifierForSharedScopedIdentifier:currentPrivateScopedIdentifier:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412546;
          v12 = v5;
          v13 = 2112;
          v14 = v7;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Automatically found private scoped identifier of %@ to be %@", (uint8_t *)&v11, 0x16u);
        }

      }
      v9 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v7, v5, -[CPLRecordTarget targetState](v4, "targetState"));

      v4 = v9;
    }

  }
  return v4;
}

- (id)_mergedRecordWithSharedChange:(id)a3 target:(id)a4
{
  id v6;
  CPLRecordTarget *v7;
  void *v8;
  void *v9;
  CPLRecordTarget *v10;
  CPLRecordTarget *v11;
  void *v12;
  void *v13;
  CPLRecordTarget *v14;
  CPLRecordTarget *v15;
  void *v16;
  CPLRecordTarget *v17;
  CPLRecordTarget *v18;
  int v19;
  uint64_t v20;
  CPLEngineCloudCache *cloudCache;
  void *v22;
  CPLRecordTarget *v23;
  char v24;
  uint64_t v25;
  CPLRecordTarget *v26;
  CPLEngineRemappedRecords *remappedRecords;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  CPLEngineCloudCache *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  CPLRecordTarget *v39;
  void *v40;
  void *v41;
  void *v42;
  CPLSharedBatchStorage *v43;
  id v44;
  CPLRecordTarget *v45;
  NSObject *v46;
  const char *v47;
  CPLRecordTarget *v48;
  void *v49;
  void *v50;
  void *v51;
  CPLRecordTarget *v52;
  char v53;
  id v54;
  NSObject *v55;
  CPLEngineCloudCache *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v63;
  CPLRecordTarget *v64;
  void *v65;
  void *v66;
  void *v67;
  CPLEngineCloudCache *v68;
  void *v69;
  CPLSharedRecordMerger *merger;
  void *v71;
  void *v72;
  CPLRecordTarget *v73;
  void *v74;
  CPLRecordTarget *v75;
  void *v76;
  CPLRecordTarget *v77;
  void *v78;
  void *v79;
  CPLSharedBatchStorage *v80;
  id v81;
  CPLRecordTarget *v82;
  CPLRecordTarget *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  id v88;
  uint8_t buf[4];
  id v90;
  __int16 v91;
  CPLRecordTarget *v92;
  __int16 v93;
  CPLRecordTarget *v94;
  __int16 v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (CPLRecordTarget *)a4;
  objc_msgSend(v6, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_alreadyProcessedChanges, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (!objc_msgSend(v6, "isMasterChange"))
    {
      v19 = objc_msgSend(v6, "isDelete");
      v20 = -[CPLRecordTarget targetState](v7, "targetState");
      if (v19)
      {
        switch(v20)
        {
          case 0:
            goto LABEL_26;
          case 1:
            cloudCache = self->_cloudCache;
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](cloudCache, "recordWithScopedIdentifier:isFinal:", v22, 0);
            v23 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              v18 = v23;
              -[CPLRecordTarget setSharingRecordChangeData:](v18, "setSharingRecordChangeData:", 0);
              goto LABEL_44;
            }
            v75 = [CPLRecordTarget alloc];
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v75, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v76, v8, 0);

            -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setTarget:forRecordWithScopedIdentifier:", v77, v79);

            v80 = self;
            v81 = v6;
            v82 = v7;
            break;
          case 2:
            if (_CPLSilentLogging)
              goto LABEL_41;
            __CPLStorageOSLogDomain();
            v46 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              goto LABEL_40;
            *(_DWORD *)buf = 138412290;
            v90 = v6;
            v47 = "%@ has been unshared";
            goto LABEL_39;
          case 3:
            if (_CPLSilentLogging)
              goto LABEL_41;
            __CPLStorageOSLogDomain();
            v46 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              goto LABEL_40;
            *(_DWORD *)buf = 138412290;
            v90 = v6;
            v47 = "%@ has been unshared (will need to clean-up sparse record) ";
LABEL_39:
            _os_log_impl(&dword_1B03C2000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);
LABEL_40:

LABEL_41:
            v48 = [CPLRecordTarget alloc];
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v48, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v49, v8, 0);

            -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setTarget:forRecordWithScopedIdentifier:", v23, v51);

            v43 = self;
            v44 = v6;
            v45 = v7;
            goto LABEL_42;
          default:
            goto LABEL_25;
        }
LABEL_74:
        -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](v80, "_sharedRecordAsPrivateRecord:target:", v81, v82);
        v18 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (!v20)
        {
          -[CPLSharedBatchStorage _updatePrivateScopedIdentifierForUnknownTarget:](self, "_updatePrivateScopedIdentifierForUnknownTarget:", v7);
          v26 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

          remappedRecords = self->_remappedRecords;
          -[CPLRecordTarget scopedIdentifier](v26, "scopedIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLEngineRemappedRecords realScopedIdentifierForRemappedScopedIdentifier:](remappedRecords, "realScopedIdentifierForRemappedScopedIdentifier:", v28);
          v14 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

          -[CPLRecordTarget identifier](v14, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordTarget scopedIdentifier](v26, "scopedIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v29, "isEqualToString:", v31);

          if (!v32)
          {
            if (!_CPLSilentLogging)
            {
              __CPLStorageOSLogDomain();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                -[CPLRecordTarget scopedIdentifier](v26, "scopedIdentifier");
                v64 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v90 = v6;
                v91 = 2112;
                v92 = v64;
                v93 = 2112;
                v94 = v14;
                _os_log_impl(&dword_1B03C2000, v63, OS_LOG_TYPE_DEFAULT, "%@'s private counterpart %@ is remapped to %@ - ignoring shared record for now", buf, 0x20u);

              }
            }
            v65 = (void *)objc_opt_class();
            -[CPLRecordTarget scopedIdentifier](v26, "scopedIdentifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (CPLRecordTarget *)objc_msgSend(v65, "newRecordWithScopedIdentifier:", v66);

            -[CPLRecordTarget identifier](v14, "identifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLRecordTarget setRealIdentifier:](v11, "setRealIdentifier:", v67);

            -[CPLRecordTarget _setIgnoredRecord:](v11, "_setIgnoredRecord:", v6);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_alreadyProcessedChanges, "setObject:forKeyedSubscript:", v11, v8);
            v10 = 0;
            v7 = v26;
            goto LABEL_60;
          }

          v7 = v26;
        }
        switch(-[CPLRecordTarget targetState](v7, "targetState"))
        {
          case 0:
            goto LABEL_32;
          case 1:
            v33 = self->_cloudCache;
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](v33, "recordWithScopedIdentifier:isFinal:", v34, 0);
            v18 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v14 = (CPLRecordTarget *)v6;
              goto LABEL_46;
            }
LABEL_32:
            v39 = [CPLRecordTarget alloc];
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v39, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v40, v8, 2);

            -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setTarget:forRecordWithScopedIdentifier:", v23, v42);

            v43 = self;
            v44 = v6;
            v45 = v23;
LABEL_42:
            -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](v43, "_sharedRecordAsPrivateRecord:target:", v44, v45);
            v52 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
            goto LABEL_43;
          case 2:
LABEL_26:
            -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](self, "_sharedRecordAsPrivateRecord:target:", v6, v7);
            v18 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
            goto LABEL_45;
          case 3:
            v68 = self->_cloudCache;
            -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](v68, "recordWithScopedIdentifier:isFinal:", v69, 0);
            v23 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {
              v83 = [CPLRecordTarget alloc];
              -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:](v83, "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v84, v8, 2);

              -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "setTarget:forRecordWithScopedIdentifier:", v77, v86);

              v80 = self;
              v81 = v6;
              v82 = v77;
              goto LABEL_74;
            }
            merger = self->_merger;
            -[CPLSharedBatchStorage _remapSharedRecord:target:](self, "_remapSharedRecord:target:", v6, v7);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLSharedRecordMerger mergeRecord:isSharedRecord:inPrivateRecord:](merger, "mergeRecord:isSharedRecord:inPrivateRecord:", v71, 1, v23);

            objc_msgSend(v8, "scopeIdentifier");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[CPLRecordTarget setSharingScopeIdentifier:](v23, "setSharingScopeIdentifier:", v72);

            v52 = v23;
LABEL_43:
            v18 = v52;
            break;
          default:
LABEL_25:
            v14 = 0;
            v18 = 0;
            goto LABEL_46;
        }
      }
LABEL_44:

LABEL_45:
      v14 = 0;
LABEL_46:
      v88 = 0;
      v53 = -[CPLRecordTarget validateChangeWithError:](v18, "validateChangeWithError:", &v88, v87);
      v54 = v88;
      if ((v53 & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            v90 = v6;
            v91 = 2112;
            v92 = v18;
            v93 = 2112;
            v94 = v7;
            v95 = 2112;
            v96 = v54;
            _os_log_impl(&dword_1B03C2000, v55, OS_LOG_TYPE_ERROR, "Failed to merge incoming shared %@: %@ (%@): %@", buf, 0x2Au);
          }

        }
        v56 = self->_cloudCache;
        -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](v56, "recordWithScopedIdentifier:isFinal:", v57, 0);
        v58 = objc_claimAutoreleasedReturnValue();

        v18 = (CPLRecordTarget *)v58;
        if (!v58)
        {
          v59 = (void *)objc_opt_class();
          -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (CPLRecordTarget *)objc_msgSend(v59, "newDeleteChangeWithScopedIdentifier:", v60);

        }
      }
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v90 = v6;
          v91 = 2112;
          v92 = v7;
          v93 = 2112;
          v94 = v18;
          _os_log_impl(&dword_1B03C2000, v61, OS_LOG_TYPE_DEFAULT, "Merging record with shared change %@ - %@ -> %@", buf, 0x20u);
        }

      }
      if (v14)
        -[CPLRecordTarget _setIgnoredRecord:](v18, "_setIgnoredRecord:", v14);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_alreadyProcessedChanges, "setObject:forKeyedSubscript:", v18, v8);
      v10 = v18;

      v11 = v10;
LABEL_60:

      goto LABEL_61;
    }
    -[CPLRecordTarget scopedIdentifier](v7, "scopedIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineIgnoredRecords recordWithScopedIdentifier:](self->_ignoredRecords, "recordWithScopedIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (CPLRecordTarget *)objc_msgSend(v13, "copy");
    if (objc_msgSend(v6, "isDelete"))
    {
      if (!v13)
      {
        switch(-[CPLRecordTarget targetState](v7, "targetState"))
        {
          case 0:
          case 2:
            v15 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v12, v8, 0);
            -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setTarget:forRecordWithScopedIdentifier:", v15, v12);

            -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](self, "_sharedRecordAsPrivateRecord:target:", v6, v7);
            v17 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          case 1:
          case 3:
            -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v12, 0);
            v73 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
            if (v73)
            {
              v18 = v73;
              -[CPLRecordTarget setSharingRecordChangeData:](v73, "setSharingRecordChangeData:", 0);
              v15 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v12, v8, 1);
              -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
              v87 = 56;
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "setTarget:forRecordWithScopedIdentifier:", v15, v12);

              goto LABEL_30;
            }
            -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](self, "_sharedRecordAsPrivateRecord:target:", v6, v7);
            v18 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
            break;
          default:
            v18 = 0;
            goto LABEL_31;
        }
        goto LABEL_31;
      }
      v15 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v12, v8, objc_msgSend(v13, "isDelete") ^ 1);
      -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTarget:forRecordWithScopedIdentifier:", v15, v12);

      v17 = v13;
LABEL_7:
      v18 = v17;
LABEL_30:

LABEL_31:
      goto LABEL_46;
    }
    v87 = 56;
    if (!v14)
    {
      if (-[CPLRecordTarget targetState](v7, "targetState") != 1
        || (-[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:](self->_cloudCache, "recordWithScopedIdentifier:isFinal:", v12, 1), (v36 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v14 = 0;
        v24 = 1;
        v25 = 2;
LABEL_28:
        v15 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]([CPLRecordTarget alloc], "initWithScopedIdentifier:otherScopedIdentifier:targetState:", v12, v8, v25);
        -[CPLEngineTransientRepositoryBatchStorage targetMapping](self, "targetMapping");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setTarget:forRecordWithScopedIdentifier:", v15, v12);

        -[CPLSharedBatchStorage _sharedRecordAsPrivateRecord:target:](self, "_sharedRecordAsPrivateRecord:target:", v6, v7);
        v18 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue();
        if ((v24 & 1) == 0)
        {
          -[CPLRecordTarget recordChangeData](v14, "recordChangeData");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordTarget setRecordChangeData:](v18, "setRecordChangeData:", v38);

        }
        goto LABEL_30;
      }
      v14 = (CPLRecordTarget *)v36;
    }
    v24 = 0;
    v25 = 3;
    goto LABEL_28;
  }
  v10 = v9;
  v11 = v10;
LABEL_61:

  return v11;
}

- (id)_unionEnumerationWithPrivateRecordEnumeratorGenerator:(id)a3 sharedRecordGenerator:(id)a4
{
  id v6;
  id v7;
  id v8;
  CPLUnionEnumerator *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  CPLUnionEnumerator *v18;
  _QWORD v20[4];
  id v21;
  CPLSharedBatchStorage *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = [CPLUnionEnumerator alloc];
  v10 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke;
  v24[3] = &unk_1E60D7380;
  v26 = v6;
  v24[4] = self;
  v11 = v8;
  v25 = v11;
  v12 = v6;
  v13 = (void *)MEMORY[0x1B5E08DC4](v24);
  v27[0] = v13;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_3;
  v20[3] = &unk_1E60D7380;
  v22 = self;
  v23 = v7;
  v21 = v11;
  v14 = v11;
  v15 = v7;
  v16 = (void *)MEMORY[0x1B5E08DC4](v20);
  v27[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CPLUnionEnumerator initWithEnumeratorGenerators:](v9, "initWithEnumeratorGenerators:", v17);

  return v18;
}

- (id)_allChangesMatchingChangeType:(unint64_t)a3 enumerator:(id)a4
{
  id v7;
  void *v8;
  CPLMapEnumerator *v9;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  if (a3 == 1024)
  {
    v8 = &__block_literal_global_111;
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLRecordChange descriptionForChangeType:](CPLRecordChange, "descriptionForChangeType:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 723, CFSTR("Trying to extract batches using change type %@"), v13);

      abort();
    }
    v8 = &__block_literal_global_18;
  }
  v9 = -[CPLMapEnumerator initWithEnumerator:map:]([CPLMapEnumerator alloc], "initWithEnumerator:map:", v7, v8);

  return v9;
}

- (id)allChangesWithClass:(Class)a3 relatedScopedIdentifier:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  CPLUnionEnumerator *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  CPLUnionEnumerator *v27;
  objc_super v29;
  _QWORD v30[4];
  id v31;
  CPLSharedBatchStorage *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  Class v39;
  _QWORD v40[5];
  id v41;
  Class v42;
  _QWORD v43[2];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  Class v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v45 = v9;
      v46 = 2112;
      v47 = a3;
      v48 = 2112;
      v49 = v7;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ %@", buf, 0x20u);

    }
  }
  objc_msgSend(v7, "scopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scopeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke;
    v40[3] = &unk_1E60D73E8;
    v40[4] = self;
    v42 = a3;
    v16 = v7;
    v41 = v16;
    v17 = (void *)MEMORY[0x1B5E08DC4](v40);
    v37[0] = v15;
    v37[1] = 3221225472;
    v37[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_2;
    v37[3] = &unk_1E60D7410;
    v37[4] = self;
    v38 = v16;
    v39 = a3;
    v18 = (void *)MEMORY[0x1B5E08DC4](v37);
    v19 = [CPLUnionEnumerator alloc];
    v34[0] = v15;
    v34[1] = 3221225472;
    v34[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_3;
    v34[3] = &unk_1E60D7380;
    v36 = v17;
    v34[4] = self;
    v20 = v14;
    v35 = v20;
    v21 = v17;
    v22 = (void *)MEMORY[0x1B5E08DC4](v34);
    v43[0] = v22;
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_5;
    v30[3] = &unk_1E60D7380;
    v32 = self;
    v33 = v18;
    v31 = v20;
    v23 = v20;
    v24 = v18;
    v25 = (void *)MEMORY[0x1B5E08DC4](v30);
    v43[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[CPLUnionEnumerator initWithEnumeratorGenerators:](v19, "initWithEnumeratorGenerators:", v26);

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)CPLSharedBatchStorage;
    -[CPLEngineTransientRepositoryBatchStorage allChangesWithClass:relatedScopedIdentifier:](&v29, sel_allChangesWithClass_relatedScopedIdentifier_, a3, v7);
    v27 = (CPLUnionEnumerator *)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 changeType:(unint64_t)a5
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[6];
  _QWORD v22[5];
  id v23;
  Class v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  Class v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLRecordChange descriptionForChangeType:](CPLRecordChange, "descriptionForChangeType:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v11;
      v27 = 2112;
      v28 = a3;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "%@ %@ %@ %@", buf, 0x2Au);

    }
  }
  -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scopeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v9, "isEqualToString:", v14);

  if (v15)
  {
    v16 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke;
    v22[3] = &unk_1E60D73E8;
    v22[4] = self;
    v24 = a3;
    v23 = v9;
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke_2;
    v21[3] = &unk_1E60D7438;
    v21[4] = self;
    v21[5] = a3;
    -[CPLSharedBatchStorage _unionEnumerationWithPrivateRecordEnumeratorGenerator:sharedRecordGenerator:](self, "_unionEnumerationWithPrivateRecordEnumeratorGenerator:sharedRecordGenerator:", v22, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLSharedBatchStorage _allChangesMatchingChangeType:enumerator:](self, "_allChangesMatchingChangeType:enumerator:", a5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CPLSharedBatchStorage;
    -[CPLEngineTransientRepositoryBatchStorage allChangesWithClass:scopeIdentifier:changeType:](&v20, sel_allChangesWithClass_scopeIdentifier_changeType_, a3, v9, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)allChangesWithClass:(Class)a3 scopeIdentifier:(id)a4 trashed:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 797, CFSTR("Trying to extract batches using unsupported %@"), v10);

  abort();
}

- (id)allChangesWithClass:(Class)a3 secondaryScopedIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 801, CFSTR("Trying to extract batches using unsupported %@"), v9);

  abort();
}

- (id)allChangesWithScopeIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", buf, 0x16u);

    }
  }
  -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scopeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke;
    v16[3] = &unk_1E60D7460;
    v16[4] = self;
    v17 = v5;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke_2;
    v15[3] = &unk_1E60D8178;
    v15[4] = self;
    -[CPLSharedBatchStorage _unionEnumerationWithPrivateRecordEnumeratorGenerator:sharedRecordGenerator:](self, "_unionEnumerationWithPrivateRecordEnumeratorGenerator:sharedRecordGenerator:", v16, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CPLSharedBatchStorage;
    -[CPLEngineTransientRepositoryBatchStorage allChangesWithScopeIdentifier:](&v14, sel_allChangesWithScopeIdentifier_, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)allNonDeletedChangesWithClass:(Class)a3 scopeIdentifier:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[6];
  _QWORD v19[5];
  id v20;
  Class v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  Class v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v9;
      v24 = 2112;
      v25 = a3;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "%@ %@ %@", buf, 0x20u);

    }
  }
  -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke;
    v19[3] = &unk_1E60D73E8;
    v19[4] = self;
    v21 = a3;
    v20 = v7;
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke_2;
    v18[3] = &unk_1E60D7438;
    v18[4] = self;
    v18[5] = a3;
    -[CPLSharedBatchStorage _unionEnumerationWithPrivateRecordEnumeratorGenerator:sharedRecordGenerator:](self, "_unionEnumerationWithPrivateRecordEnumeratorGenerator:sharedRecordGenerator:", v19, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLSharedBatchStorage _allChangesMatchingChangeType:enumerator:](self, "_allChangesMatchingChangeType:enumerator:", 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CPLSharedBatchStorage;
    -[CPLEngineTransientRepositoryBatchStorage allNonDeletedChangesWithClass:scopeIdentifier:](&v17, sel_allNonDeletedChangesWithClass_scopeIdentifier_, a3, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "%@ %@", (uint8_t *)&v16, 0x16u);

    }
  }
  -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unmingledChangeWithScopedIdentifier:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CPLSharedBatchStorage _mergedRecordWithPrivateChange:sharedScopedIdentifier:](self, "_mergedRecordWithPrivateChange:sharedScopedIdentifier:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CPLSharedBatchStorage _targetForPrivateScopedIdentifier:](self, "_targetForPrivateScopedIdentifier:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "otherScopedIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (-[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "unmingledChangeWithScopedIdentifier:", v12),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      -[CPLSharedBatchStorage _mergedRecordWithSharedChange:target:](self, "_mergedRecordWithSharedChange:target:", v14, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)effectiveResourceSizeToUploadForUploadIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 850, CFSTR("%@ should not be used on %@"), v8, objc_opt_class());

  abort();
}

- (BOOL)hasChangesInScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = a3;
  -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasUnmingledChangesForScope:", v9) & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(v8, "hasUnmingledChangesForScope:", self->_sharedScope);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CPLSharedBatchStorage;
    v10 = -[CPLEngineTransientRepositoryBatchStorage hasChangesInScopeWithIdentifier:](&v12, sel_hasChangesInScopeWithIdentifier_, v4);
  }

  return v10;
}

- (BOOL)_transferIgnoredRecordToTransientPullRepository:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  CPLChangeBatch *v9;
  void *v10;
  char v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "scopedIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Automatically mingling previously ignored record %@", (uint8_t *)&v13, 0xCu);

    }
  }
  v9 = objc_alloc_init(CPLChangeBatch);
  -[CPLChangeBatch addRecord:](v9, "addRecord:", v6);
  -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "appendBatch:alreadyMingled:countOfAssetChanges:error:", v9, 1, 0, a4);

  return v11;
}

- (BOOL)_keepIgnoredRecord:(id)a3 shadowingRecord:(id)a4 inScope:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  CPLIgnoredDateForRecord(v10, a4, self->_now);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "scopedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v12, self->_now);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Keeping ignored record %{public}@ with ignored date %{public}@", (uint8_t *)&v18, 0x16u);

    }
  }
  v16 = -[CPLEngineIgnoredRecords addIgnoredRecord:ignoredDate:otherScopeIndex:error:](self->_ignoredRecords, "addIgnoredRecord:ignoredDate:otherScopeIndex:error:", v10, v12, objc_msgSend(v11, "cloudIndex"), a6);

  return v16;
}

- (BOOL)removeChange:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  int v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CPLSharedBatchStorage;
  if (-[CPLEngineTransientRepositoryBatchStorage removeChange:error:](&v34, sel_removeChange_error_, v7, a4))
  {
    objc_msgSend(v7, "scopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLSharedBatchStorage _targetForPrivateScopedIdentifier:](self, "_targetForPrivateScopedIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "otherScopedIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v17 = 1;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v7, "_ignoredRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(v7, "isMasterChange");
      objc_msgSend(v11, "scopedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12)
      {
        objc_msgSend(v9, "scopedIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "scopedIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v36 = v11;
              v37 = 2112;
              v38 = v25;
              _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "%@ is incorrectly ignored for %@", buf, 0x16u);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "scopedIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v27, 887, CFSTR("%@ is incorrectly ignored for %@"), v11, v28);

          abort();
        }
        if (objc_msgSend(v9, "targetState") == 1)
        {
          if (!-[CPLSharedBatchStorage _transferIgnoredRecordToTransientPullRepository:error:](self, "_transferIgnoredRecordToTransientPullRepository:error:", v11, a4))goto LABEL_8;
        }
        else if (!-[CPLSharedBatchStorage _keepIgnoredRecord:shadowingRecord:inScope:error:](self, "_keepIgnoredRecord:shadowingRecord:inScope:error:", v11, v7, self->_sharedScope, a4))
        {
          goto LABEL_8;
        }
      }
      else
      {
        v18 = objc_msgSend(v13, "isEqual:", v10);

        if ((v18 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "scopedIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v36 = v11;
              v37 = 2112;
              v38 = v30;
              v39 = 2112;
              v40 = v10;
              _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_ERROR, "%@ is incorrectly ignored for %@ - it should be %@", buf, 0x20u);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "scopedIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v32, 895, CFSTR("%@ is incorrectly ignored for %@ - it should be %@"), v11, v33, v10);

          abort();
        }
        if (objc_msgSend(v9, "shouldUploadToOtherRecord"))
        {
          v17 = -[CPLSharedBatchStorage _transferIgnoredRecordToTransientPullRepository:error:](self, "_transferIgnoredRecordToTransientPullRepository:error:", v11, a4);
          goto LABEL_22;
        }
        -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[CPLSharedBatchStorage _keepIgnoredRecord:shadowingRecord:inScope:error:](self, "_keepIgnoredRecord:shadowingRecord:inScope:error:", v11, v7, v19, a4);

        if (!v20)
        {
LABEL_8:
          v17 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
    }
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEBUG, "Automatically mingling %@", buf, 0xCu);
      }

    }
    -[CPLEngineTransientRepositoryBatchStorage transientRepository](self, "transientRepository");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v22, "markUnmingledChangeWithScopedIdentifierAsMingled:error:", v10, a4);

    goto LABEL_22;
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (void)beginExtractingBatch
{
  NSMutableDictionary *v3;
  NSMutableDictionary *alreadyProcessedChanges;
  NSObject *v5;
  void *v6;
  CPLEngineScope *sharedScope;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  CPLEngineScope *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CPLSharedBatchStorage;
  -[CPLEngineTransientRepositoryBatchStorage beginExtractingBatch](&v8, sel_beginExtractingBatch);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  alreadyProcessedChanges = self->_alreadyProcessedChanges;
  self->_alreadyProcessedChanges = v3;

  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      sharedScope = self->_sharedScope;
      *(_DWORD *)buf = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = sharedScope;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Begin extracting batch for %@/%@", buf, 0x16u);

    }
  }
}

- (void)cleanupAfterExtractingBatch
{
  NSObject *v3;
  void *v4;
  CPLEngineScope *sharedScope;
  NSMutableDictionary *alreadyProcessedChanges;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  CPLEngineScope *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      -[CPLEngineTransientRepositoryBatchStorage scope](self, "scope");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      sharedScope = self->_sharedScope;
      *(_DWORD *)buf = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = sharedScope;
      _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "Finished extracting batch for %@/%@", buf, 0x16u);

    }
  }
  alreadyProcessedChanges = self->_alreadyProcessedChanges;
  self->_alreadyProcessedChanges = 0;

  v7.receiver = self;
  v7.super_class = (Class)CPLSharedBatchStorage;
  -[CPLEngineTransientRepositoryBatchStorage cleanupAfterExtractingBatch](&v7, sel_cleanupAfterExtractingBatch);
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 929, CFSTR("%@ should not be used here"), v14);

  abort();
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 933, CFSTR("%@ should not be used here"), v9);

  abort();
}

- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 937, CFSTR("%@ should not be used here"), v8);

  abort();
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  if (a4)
    *a4 = 1;
  return -[CPLSharedBatchStorage _privateScopedIdentifierForSharedScopedIdentifier:](self, "_privateScopedIdentifierForSharedScopedIdentifier:", a3);
}

- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLSharedBatchStorage.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 953, CFSTR("%@ should not be used here"), v14);

  abort();
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (CPLSharedRecordMerger)merger
{
  return self->_merger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merger, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_alreadyProcessedChanges, 0);
  objc_storeStrong((id *)&self->_ignoredRecords, 0);
  objc_storeStrong((id *)&self->_remappedRecords, 0);
  objc_storeStrong((id *)&self->_cloudCache, 0);
}

id __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "transientRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnmingledChangesWithClass:scopeIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __71__CPLSharedBatchStorage_allNonDeletedChangesWithClass_scopeIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "transientRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnmingledChangesWithClass:scopeIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "transientRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnmingledChangesWithScopeIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__CPLSharedBatchStorage_allChangesWithScopeIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "transientRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "scopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnmingledChangesWithScopeIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "transientRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnmingledChangesWithClass:scopeIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __72__CPLSharedBatchStorage_allChangesWithClass_scopeIdentifier_changeType___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "transientRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "scopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnmingledChangesWithClass:scopeIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "transientRepository");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnmingledChangesWithClass:relatedScopedIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_targetForPrivateScopedIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "targetState") == 1
    || (objc_msgSend(v2, "otherScopedIdentifier"), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "transientRepository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allUnmingledChangesWithClass:relatedScopedIdentifier:", *(_QWORD *)(a1 + 48), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

CPLMapEnumerator *__69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_3(_QWORD *a1)
{
  CPLMapEnumerator *v2;
  void *v3;
  void *v4;
  CPLMapEnumerator *v5;
  _QWORD v7[5];
  id v8;

  v2 = [CPLMapEnumerator alloc];
  (*(void (**)(void))(a1[6] + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_4;
  v7[3] = &unk_1E60D7358;
  v4 = (void *)a1[5];
  v7[4] = a1[4];
  v8 = v4;
  v5 = -[CPLMapEnumerator initWithEnumerator:map:](v2, "initWithEnumerator:map:", v3, v7);

  return v5;
}

CPLMapEnumerator *__69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_5(uint64_t a1)
{
  CPLMapEnumerator *v2;
  void *v3;
  id v4;
  uint64_t v5;
  CPLMapEnumerator *v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = [CPLMapEnumerator alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_6;
  v8[3] = &unk_1E60D7358;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = -[CPLMapEnumerator initWithEnumerator:map:](v2, "initWithEnumerator:map:", v3, v8);

  return v6;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_targetForSharedScopedIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "supportsSharingScopedIdentifier"))
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 40), "transientRepository");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unmingledChangeWithScopedIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(void **)(a1 + 40);
      v13 = v4;
      objc_msgSend(v10, "_mergedRecordWithPrivateChange:sharedScopedIdentifier:", v9, &v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;

      v4 = v11;
    }
    else
    {
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "_mergedRecordWithSharedChange:target:", v3, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

id __69__CPLSharedBatchStorage_allChangesWithClass_relatedScopedIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = 0;
  objc_msgSend(v3, "_mergedRecordWithPrivateChange:sharedScopedIdentifier:", a2, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  return v4;
}

id __66__CPLSharedBatchStorage__allChangesMatchingChangeType_enumerator___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "isDelete"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id __66__CPLSharedBatchStorage__allChangesMatchingChangeType_enumerator___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "isFullRecord"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

CPLMapEnumerator *__101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke(_QWORD *a1)
{
  CPLMapEnumerator *v2;
  void *v3;
  void *v4;
  CPLMapEnumerator *v5;
  _QWORD v7[5];
  id v8;

  v2 = [CPLMapEnumerator alloc];
  (*(void (**)(void))(a1[6] + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_2;
  v7[3] = &unk_1E60D7358;
  v4 = (void *)a1[5];
  v7[4] = a1[4];
  v8 = v4;
  v5 = -[CPLMapEnumerator initWithEnumerator:map:](v2, "initWithEnumerator:map:", v3, v7);

  return v5;
}

CPLMapEnumerator *__101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_3(uint64_t a1)
{
  CPLMapEnumerator *v2;
  void *v3;
  id v4;
  uint64_t v5;
  CPLMapEnumerator *v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = [CPLMapEnumerator alloc];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_4;
  v8[3] = &unk_1E60D7358;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = -[CPLMapEnumerator initWithEnumerator:map:](v2, "initWithEnumerator:map:", v3, v8);

  return v6;
}

id __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_targetForSharedScopedIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_mergedRecordWithSharedChange:target:", v3, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __101__CPLSharedBatchStorage__unionEnumerationWithPrivateRecordEnumeratorGenerator_sharedRecordGenerator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = 0;
  objc_msgSend(v3, "_mergedRecordWithPrivateChange:sharedScopedIdentifier:", a2, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  return v4;
}

@end
