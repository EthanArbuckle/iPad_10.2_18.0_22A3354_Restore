@implementation CPLPushSessionUpdate

- (CPLPushSessionUpdate)initWithPushSessionTracker:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  CPLPushSessionUpdate *v24;
  void *v25;
  void *v26;
  CPLPushSessionUpdate *v27;
  uint64_t v28;
  NSDictionary *pushContexts;
  uint64_t v30;
  NSArray *addedRecords;
  uint64_t v32;
  NSArray *updatedRecords;
  uint64_t v34;
  NSArray *deletedRecordScopedIdentifiers;
  uint64_t v36;
  NSSet *unquarantinedRecordScopedIdentifiers;
  uint64_t v38;
  NSDictionary *recordWithStatusChangesToNotify;
  uint64_t v40;
  NSArray *revertedChanges;
  NSArray *v42;
  CPLPushSessionUpdate *v43;
  NSObject *v45;
  void *v46;
  void *v47;
  SEL v48;
  id *v49;
  id obj;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "resourcesToUpload");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outgoingResources");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v6;
  objc_msgSend(v6, "diffedBatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v8;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  v54 = v10;
  if (v11)
  {
    v12 = v11;
    v48 = a2;
    v49 = a4;
    v57 = 0;
    v13 = *(_QWORD *)v61;
    v53 = v9;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v61 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v15, "_pushContext");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          if (!_CPLSilentLogging)
          {
            __CPLGenericOSLogDomain();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v15;
              _os_log_impl(&dword_1B03C2000, v45, OS_LOG_TYPE_ERROR, "%@ should have a push context", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangeSessionUpdate.m");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", v48, self, v47, 104, CFSTR("%@ should have a push context"), v15);

          abort();
        }
        v17 = (void *)v16;
        objc_msgSend(v15, "scopedIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "supportsResources")
          && objc_msgSend(v15, "hasChangeType:", 8))
        {
          objc_msgSend(v56, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = objc_msgSend(v15, "isAssetChange");
            objc_msgSend(v17, "pushContextAddingUploadIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "_setPushContext:", v21);
            objc_msgSend(v21, "uploadIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v57;
            LODWORD(v20) = objc_msgSend(v55, "storeResourcesToUpload:withUploadIdentifier:shouldCheckResources:error:", v19, v22, v20, &v59);
            v23 = v59;

            if (!(_DWORD)v20)
            {

              v9 = v53;
              if (v49)
              {
                v23 = objc_retainAutorelease(v23);
                v24 = 0;
                *v49 = v23;
              }
              else
              {
                v24 = 0;
              }
              v25 = v51;
              v43 = self;
              goto LABEL_25;
            }
            v17 = v21;
            v57 = v23;
            v9 = v53;
            v10 = v54;
          }

        }
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v57 = 0;
  }

  v25 = v51;
  objc_msgSend(v51, "store");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58.receiver = self;
  v58.super_class = (Class)CPLPushSessionUpdate;
  v27 = -[CPLChangeSessionUpdate initWithStore:](&v58, sel_initWithStore_, v26);

  if (v27)
  {
    v28 = objc_msgSend(v9, "copy");
    pushContexts = v27->_pushContexts;
    v27->_pushContexts = (NSDictionary *)v28;

    objc_storeStrong((id *)&v27->_diffBatch, obj);
    objc_msgSend(v51, "addedRecords");
    v30 = objc_claimAutoreleasedReturnValue();
    addedRecords = v27->_addedRecords;
    v27->_addedRecords = (NSArray *)v30;

    objc_msgSend(v51, "updatedRecords");
    v32 = objc_claimAutoreleasedReturnValue();
    updatedRecords = v27->_updatedRecords;
    v27->_updatedRecords = (NSArray *)v32;

    objc_msgSend(v51, "deletedRecordScopedIdentifiers");
    v34 = objc_claimAutoreleasedReturnValue();
    deletedRecordScopedIdentifiers = v27->_deletedRecordScopedIdentifiers;
    v27->_deletedRecordScopedIdentifiers = (NSArray *)v34;

    objc_msgSend(v51, "unquarantinedRecordScopedIdentifiers");
    v36 = objc_claimAutoreleasedReturnValue();
    unquarantinedRecordScopedIdentifiers = v27->_unquarantinedRecordScopedIdentifiers;
    v27->_unquarantinedRecordScopedIdentifiers = (NSSet *)v36;

    objc_msgSend(v51, "recordWithStatusChangesToNotify");
    v38 = objc_claimAutoreleasedReturnValue();
    recordWithStatusChangesToNotify = v27->_recordWithStatusChangesToNotify;
    v27->_recordWithStatusChangesToNotify = (NSDictionary *)v38;

    objc_msgSend(v51, "revertedChanges");
    v40 = objc_claimAutoreleasedReturnValue();
    revertedChanges = v27->_revertedChanges;
    v27->_revertedChanges = (NSArray *)v40;

    if (!-[NSArray count](v27->_revertedChanges, "count"))
    {
      v42 = v27->_revertedChanges;
      v27->_revertedChanges = 0;

    }
  }
  v43 = v27;
  v24 = v43;
  v23 = v57;
LABEL_25:

  return v24;
}

- (CPLPushSessionUpdate)initWithCoder:(id)a3
{
  id v4;
  CPLPushSessionUpdate *v5;
  uint64_t v6;
  NSDictionary *pushContexts;
  uint64_t v8;
  NSDictionary *v9;
  uint64_t v10;
  CPLChangeBatch *diffBatch;
  uint64_t v12;
  NSArray *addedRecords;
  uint64_t v14;
  NSArray *updatedRecords;
  uint64_t v16;
  NSArray *deletedRecordScopedIdentifiers;
  uint64_t v18;
  NSSet *unquarantinedRecordScopedIdentifiers;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  NSSet *v23;
  uint64_t v24;
  NSDictionary *recordWithStatusChangesToNotify;
  uint64_t v26;
  NSArray *revertedChanges;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CPLPushSessionUpdate;
  v5 = -[CPLChangeSessionUpdate initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_2837);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__pushContextsClasses, CFSTR("pc"));
    v6 = objc_claimAutoreleasedReturnValue();
    pushContexts = v5->_pushContexts;
    v5->_pushContexts = (NSDictionary *)v6;

    if (!v5->_pushContexts)
    {
      +[CPLRecordPushContext pushContextsFromStoredUploadIdentifiersInCoder:key:](CPLRecordPushContext, "pushContextsFromStoredUploadIdentifiersInCoder:key:", v4, CFSTR("ul"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_pushContexts;
      v5->_pushContexts = (NSDictionary *)v8;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
    v10 = objc_claimAutoreleasedReturnValue();
    diffBatch = v5->_diffBatch;
    v5->_diffBatch = (CPLChangeBatch *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__recordsClasses, CFSTR("n"));
    v12 = objc_claimAutoreleasedReturnValue();
    addedRecords = v5->_addedRecords;
    v5->_addedRecords = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__recordsClasses, CFSTR("u"));
    v14 = objc_claimAutoreleasedReturnValue();
    updatedRecords = v5->_updatedRecords;
    v5->_updatedRecords = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__deletedIdentifiersClasses, CFSTR("d"));
    v16 = objc_claimAutoreleasedReturnValue();
    deletedRecordScopedIdentifiers = v5->_deletedRecordScopedIdentifiers;
    v5->_deletedRecordScopedIdentifiers = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__unquarantinedRecordIdentifiersClasses, CFSTR("q"));
    v18 = objc_claimAutoreleasedReturnValue();
    unquarantinedRecordScopedIdentifiers = v5->_unquarantinedRecordScopedIdentifiers;
    v5->_unquarantinedRecordScopedIdentifiers = (NSSet *)v18;

    +[CPLScopedIdentifier scopedIdentifiersFromArrayOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromArrayOfUnknownIdentifiers:", v5->_deletedRecordScopedIdentifiers);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v5->_deletedRecordScopedIdentifiers;
    v5->_deletedRecordScopedIdentifiers = (NSArray *)v20;

    +[CPLScopedIdentifier scopedIdentifiersFromSetOfUnknownIdentifiers:](CPLScopedIdentifier, "scopedIdentifiersFromSetOfUnknownIdentifiers:", v5->_unquarantinedRecordScopedIdentifiers);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v5->_unquarantinedRecordScopedIdentifiers;
    v5->_unquarantinedRecordScopedIdentifiers = (NSSet *)v22;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__recordWithStatusChangesToNotifyClasses, CFSTR("notify"));
    v24 = objc_claimAutoreleasedReturnValue();
    recordWithStatusChangesToNotify = v5->_recordWithStatusChangesToNotify;
    v5->_recordWithStatusChangesToNotify = (NSDictionary *)v24;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__recordsClasses, CFSTR("reverted"));
    v26 = objc_claimAutoreleasedReturnValue();
    revertedChanges = v5->_revertedChanges;
    v5->_revertedChanges = (NSArray *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPushSessionUpdate;
  v4 = a3;
  -[CPLChangeSessionUpdate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pushContexts, CFSTR("pc"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_diffBatch, CFSTR("b"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_addedRecords, CFSTR("n"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_updatedRecords, CFSTR("u"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deletedRecordScopedIdentifiers, CFSTR("d"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_unquarantinedRecordScopedIdentifiers, CFSTR("q"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordWithStatusChangesToNotify, CFSTR("notify"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_revertedChanges, CFSTR("reverted"));

}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSUInteger v10;
  NSArray *v11;
  NSSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  CPLChangeBatch *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  CPLRecordPushContext *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  _BOOL4 v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  CPLPushSessionUpdate *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  NSDictionary *recordWithStatusChangesToNotify;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  CPLChangeBatch *obj;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  CPLPushSessionUpdate *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  objc_super v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  NSUInteger v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v105.receiver = self;
  v105.super_class = (Class)CPLPushSessionUpdate;
  if (-[CPLChangeSessionUpdate applyToStore:error:](&v105, sel_applyToStore_error_, v6, a4))
  {
    objc_msgSend(v6, "statusCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSSet count](self->_unquarantinedRecordScopedIdentifiers, "count"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLPushSessionOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = -[NSSet count](self->_unquarantinedRecordScopedIdentifiers, "count");
          *(_DWORD *)buf = 134217984;
          v114 = v10;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Unquarantining %lu records", buf, 0xCu);
        }

      }
      objc_msgSend(v6, "quarantinedRecords");
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v12 = self->_unquarantinedRecordScopedIdentifiers;
      v13 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v102;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v102 != v15)
              objc_enumerationMutation(v12);
            if (!-[NSArray removeQuarantinedRecordWithScopedIdentifier:notify:error:](v11, "removeQuarantinedRecordWithScopedIdentifier:notify:error:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i), 0, a4))
            {
              LOBYTE(v28) = 0;
              goto LABEL_38;
            }
          }
          v14 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
          if (v14)
            continue;
          break;
        }
      }

    }
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v11 = self->_deletedRecordScopedIdentifiers;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
    v75 = self;
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v98;
LABEL_18:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v98 != v19)
          objc_enumerationMutation(v11);
        v21 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * v20);
        if (!objc_msgSend(v8, "addDeleteEventForRecordWithLocalScopedIdentifier:direction:error:", v21, 1, a4)|| !objc_msgSend(v7, "discardNotificationForRecordWithScopedIdentifier:error:", v21, a4))
        {
          goto LABEL_36;
        }
        if (v18 == ++v20)
        {
          v18 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
          self = v75;
          if (v18)
            goto LABEL_18;
          break;
        }
      }
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v11 = self->_addedRecords;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v94;
LABEL_27:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v94 != v24)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * v25), "scopedIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v8, "addAddEventForRecordWithLocalScopedIdentifier:direction:error:", v26, 1, a4);

        if (!v27)
          break;
        if (v23 == ++v25)
        {
          v23 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
          if (v23)
            goto LABEL_27;
          goto LABEL_33;
        }
      }
LABEL_36:
      LOBYTE(v28) = 0;
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
LABEL_33:

    if (__CPLPushSessionAutoCancelSync)
      v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    else
      v11 = 0;
    v68 = v6;
    v69 = v8;
    v67 = v7;
    objc_msgSend(v6, "pushRepository");
    v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v74 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v65 = 24;
    v30 = v75->_diffBatch;
    v72 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
    v31 = 0;
    if (v72)
    {
      obj = v30;
      v71 = *(_QWORD *)v90;
LABEL_45:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v90 != v71)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v32);
        v34 = objc_msgSend(v33, "changeType", v65);
        objc_msgSend(v33, "scopedIdentifier");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "scopeIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "addObject:", v36);

        -[NSDictionary objectForKeyedSubscript:](v75->_pushContexts, "objectForKeyedSubscript:", v35);
        v37 = (CPLRecordPushContext *)objc_claimAutoreleasedReturnValue();
        if (!v37)
          v37 = -[CPLRecordPushContext initWithUploadIdentifier:flags:priority:]([CPLRecordPushContext alloc], "initWithUploadIdentifier:flags:priority:", 0, 0, 0);
        if (-[NSSet containsObject:](v75->_unquarantinedRecordScopedIdentifiers, "containsObject:", v35))
          objc_msgSend(v33, "_setShouldNotTrustCloudCache:", 1);
        if (!-[NSSet storeChange:pushContext:error:](v12, "storeChange:pushContext:error:", v33, v37, a4))
          goto LABEL_107;
        if (__CPLPushSessionAutoCancelSync
          && objc_msgSend(v33, "supportsResources")
          && ((objc_msgSend(v33, "isDelete") & 1) != 0 || objc_msgSend(v33, "hasChangeType:", 8)))
        {
          -[NSArray addObject:](v11, "addObject:", v35);
        }
        v31 |= v34;

        if (v72 == ++v32)
        {
          v30 = obj;
          v72 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
          if (v72)
            goto LABEL_45;
          break;
        }
      }
    }

    v8 = v69;
    if (__CPLPushSessionAutoCancelSync)
    {
      if (-[NSArray count](v11, "count"))
      {
        -[NSSet storedExtractedBatch](v12, "storedExtractedBatch");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v73 = v38;
          objc_msgSend(v38, "batch");
          v76 = (id)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v85, v108, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v86;
            while (2)
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v86 != v41)
                  objc_enumerationMutation(v76);
                v43 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
                if (objc_msgSend(v43, "supportsResources", v65))
                {
                  if (objc_msgSend(v43, "hasChangeType:", 8))
                  {
                    objc_msgSend(v43, "scopedIdentifier");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = -[NSArray containsObject:](v11, "containsObject:", v44);

                    v8 = v69;
                    if (v45)
                    {
                      if (!_CPLSilentLogging)
                      {
                        __CPLPushSessionOSLogDomain();
                        v46 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          v114 = (NSUInteger)v43;
                          _os_log_impl(&dword_1B03C2000, v46, OS_LOG_TYPE_DEFAULT, "Relaunching sync session because currently uploading %@ has been overwritten", buf, 0xCu);
                        }

                      }
                      objc_msgSend(v68, "engineLibrary");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "syncManager");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "cancelCurrentSyncSession");

                      goto LABEL_79;
                    }
                  }
                }
              }
              v40 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v85, v108, 16);
              if (v40)
                continue;
              break;
            }
          }
LABEL_79:

        }
      }
    }
    v49 = v74;
    v50 = v75;
    if (objc_msgSend(v74, "count", v65))
    {
      objc_msgSend(v68, "scopes");
      obj = (CPLChangeBatch *)objc_claimAutoreleasedReturnValue();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v35 = v74;
      v51 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v82;
LABEL_83:
        v54 = 0;
        while (1)
        {
          if (*(_QWORD *)v82 != v53)
            objc_enumerationMutation(v35);
          -[CPLChangeBatch scopeWithIdentifier:](obj, "scopeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v54));
          v37 = (CPLRecordPushContext *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            if (!-[CPLChangeBatch setScopeHasChangesToPushToTransport:changeTypes:error:](obj, "setScopeHasChangesToPushToTransport:changeTypes:error:", v37, v31, a4))break;
          }

          if (v52 == ++v54)
          {
            v52 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
            if (v52)
              goto LABEL_83;
            goto LABEL_90;
          }
        }
LABEL_107:

        LOBYTE(v28) = 0;
        v7 = v67;
        v6 = v68;
        v8 = v69;
LABEL_38:

        goto LABEL_39;
      }
LABEL_90:

      v8 = v69;
      v49 = v74;
      v50 = v75;
    }

    v6 = v68;
    v11 = -[CPLSimpleMergeHelper initWithEngineStore:]([CPLSimpleMergeHelper alloc], "initWithEngineStore:", v68);
    -[NSArray mergerForBatch:error:](v11, "mergerForBatch:error:", *(Class *)((char *)&v50->super.super.isa + v66), a4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v55;
    if (!v55)
    {
      v7 = v67;
      goto LABEL_39;
    }
    v56 = objc_msgSend(v55, "mergeConflictsWithError:", a4);

    v7 = v67;
    if (!v56
      || objc_msgSend(*(id *)((char *)&v50->super.super.isa + v66), "count")
      && (objc_msgSend(v68, "quarantinedRecords"),
          v57 = (void *)objc_claimAutoreleasedReturnValue(),
          v58 = objc_msgSend(v57, "resetRejectedRecordsWithError:", a4),
          v57,
          !v58)
      || (recordWithStatusChangesToNotify = v50->_recordWithStatusChangesToNotify) != 0
      && !+[CPLPushSessionTracker notifyClientOfStore:ofStatusChanges:error:](CPLPushSessionTracker, "notifyClientOfStore:ofStatusChanges:error:", v68, recordWithStatusChangesToNotify, a4))
    {
      LOBYTE(v28) = 0;
      goto LABEL_40;
    }
    if (!-[NSArray count](v50->_revertedChanges, "count"))
    {
      LOBYTE(v28) = 1;
      goto LABEL_40;
    }
    objc_msgSend(v68, "revertRecords");
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v12 = v50->_revertedChanges;
    v60 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v77, v106, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v78;
LABEL_100:
      v63 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v62)
          objc_enumerationMutation(v12);
        v28 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v63);
        objc_msgSend(v28, "scopedIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v28) = -[NSArray addRecordsToRevertWithLocalScopedIdentifier:class:error:](v11, "addRecordsToRevertWithLocalScopedIdentifier:class:error:", v64, objc_msgSend(v28, "recordClass"), a4);

        if (!(_DWORD)v28)
          break;
        if (v61 == ++v63)
        {
          v61 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v77, v106, 16);
          LOBYTE(v28) = 1;
          if (v61)
            goto LABEL_100;
          break;
        }
      }
      v7 = v67;
    }
    else
    {
      LOBYTE(v28) = 1;
    }
    goto LABEL_38;
  }
  LOBYTE(v28) = 0;
LABEL_41:

  return (char)v28;
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSDictionary *pushContexts;
  id v9;
  int v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CPLPushSessionUpdate;
  if (-[CPLChangeSessionUpdate discardFromStore:error:](&v27, sel_discardFromStore_error_, v6, a4))
  {
    objc_msgSend(v6, "outgoingResources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 1;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__2826;
    v21 = __Block_byref_object_dispose__2827;
    pushContexts = self->_pushContexts;
    v22 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__CPLPushSessionUpdate_discardFromStore_error___block_invoke;
    v13[3] = &unk_1E60D7F70;
    v15 = &v23;
    v9 = v7;
    v14 = v9;
    v16 = &v17;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](pushContexts, "enumerateKeysAndObjectsUsingBlock:", v13);
    v10 = *((unsigned __int8 *)v24 + 24);
    if (a4 && !*((_BYTE *)v24 + 24))
    {
      *a4 = objc_retainAutorelease((id)v18[5]);
      v10 = *((unsigned __int8 *)v24 + 24);
    }
    v11 = v10 != 0;

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)objc_msgSend(a3, "pushRepository");
}

- (id)statusDescription
{
  return -[CPLChangeBatch summaryDescription](self->_diffBatch, "summaryDescription");
}

- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray containsObject:](self->_deletedRecordScopedIdentifiers, "containsObject:", v4))
  {
    v5 = +[CPLRecordChange newDeleteChangeWithScopedIdentifier:](CPLRecordChange, "newDeleteChangeWithScopedIdentifier:", v4);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_updatedRecords;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "scopedIdentifier", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if ((v13 & 1) != 0)
          {
            v5 = v11;

            goto LABEL_13;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (CPLChangeBatch)diffBatch
{
  return self->_diffBatch;
}

- (NSDictionary)pushContexts
{
  return self->_pushContexts;
}

- (NSArray)addedRecords
{
  return self->_addedRecords;
}

- (NSArray)updatedRecords
{
  return self->_updatedRecords;
}

- (NSArray)deletedRecordScopedIdentifiers
{
  return self->_deletedRecordScopedIdentifiers;
}

- (NSSet)unquarantinedRecordScopedIdentifiers
{
  return self->_unquarantinedRecordScopedIdentifiers;
}

- (NSDictionary)recordWithStatusChangesToNotify
{
  return self->_recordWithStatusChangesToNotify;
}

- (NSArray)revertedChanges
{
  return self->_revertedChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revertedChanges, 0);
  objc_storeStrong((id *)&self->_recordWithStatusChangesToNotify, 0);
  objc_storeStrong((id *)&self->_unquarantinedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_deletedRecordScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedRecords, 0);
  objc_storeStrong((id *)&self->_addedRecords, 0);
  objc_storeStrong((id *)&self->_pushContexts, 0);
  objc_storeStrong((id *)&self->_diffBatch, 0);
}

void __47__CPLPushSessionUpdate_discardFromStore_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id obj;

  objc_msgSend(a3, "uploadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)a1[4];
    v8 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v8 + 40);
    v9 = objc_msgSend(v7, "deleteResourcesToUploadWithUploadIdentifier:error:", v6, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
      *a4 = 1;
  }

}

void __38__CPLPushSessionUpdate_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)initWithCoder__pushContextsClasses;
  initWithCoder__pushContextsClasses = v3;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)initWithCoder__deletedIdentifiersClasses;
  initWithCoder__deletedIdentifiersClasses = v8;

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)initWithCoder__recordsClasses;
  initWithCoder__recordsClasses = v12;

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)initWithCoder__unquarantinedRecordIdentifiersClasses;
  initWithCoder__unquarantinedRecordIdentifiersClasses = v17;

  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)initWithCoder__recordWithStatusChangesToNotifyClasses;
  initWithCoder__recordWithStatusChangesToNotifyClasses = v22;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
