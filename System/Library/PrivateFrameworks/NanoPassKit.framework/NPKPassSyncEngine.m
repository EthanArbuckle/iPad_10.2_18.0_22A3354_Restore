@implementation NPKPassSyncEngine

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPassSyncEngine)initWithRole:(unint64_t)a3
{
  NPKPassSyncEngine *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPassSyncEngine;
  result = -[NPKPassSyncEngine init](&v5, sel_init);
  if (result)
  {
    result->_engineRole = a3;
    result->_requireAppleAccountForPaymentPasses = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  NPKPassSyncState *libraryState;
  id v5;
  const __CFString *v6;
  id v7;

  libraryState = self->_libraryState;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", libraryState, CFSTR("libraryState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reconciledState, CFSTR("reconciledState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backupState, CFSTR("backupState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_candidateState, CFSTR("candidateState"));
  v7 = (id)-[NPKPassSyncChange copy](self->_candidateChange, "copy");
  objc_msgSend(v7, "setPassData:", 0);
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("candidateChange"));
  if (self->_engineRole)
    v6 = CFSTR("Companion");
  else
    v6 = CFSTR("Watch");
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("engineRole"));

}

- (NPKPassSyncEngine)initWithCoder:(id)a3
{
  id v4;
  NPKPassSyncEngine *v5;
  uint64_t v6;
  NPKPassSyncState *libraryState;
  uint64_t v8;
  NPKPassSyncState *reconciledState;
  uint64_t v10;
  NPKPassSyncState *backupState;
  uint64_t v12;
  NPKPassSyncState *candidateState;
  uint64_t v14;
  NPKPassSyncChange *candidateChange;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NPKPassSyncEngine;
  v5 = -[NPKPassSyncEngine init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryState"));
    v6 = objc_claimAutoreleasedReturnValue();
    libraryState = v5->_libraryState;
    v5->_libraryState = (NPKPassSyncState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reconciledState"));
    v8 = objc_claimAutoreleasedReturnValue();
    reconciledState = v5->_reconciledState;
    v5->_reconciledState = (NPKPassSyncState *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backupState"));
    v10 = objc_claimAutoreleasedReturnValue();
    backupState = v5->_backupState;
    v5->_backupState = (NPKPassSyncState *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidateState"));
    v12 = objc_claimAutoreleasedReturnValue();
    candidateState = v5->_candidateState;
    v5->_candidateState = (NPKPassSyncState *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidateChange"));
    v14 = objc_claimAutoreleasedReturnValue();
    candidateChange = v5->_candidateChange;
    v5->_candidateChange = (NPKPassSyncChange *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("engineRole"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_engineRole = objc_msgSend(v16, "isEqualToString:", CFSTR("Companion"));

  }
  return v5;
}

- (NSString)engineName
{
  if (self->_engineRole)
    return (NSString *)CFSTR("Companion");
  else
    return (NSString *)CFSTR("Watch");
}

- (void)syncIfNecessary
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[NPKPassSyncEngine libraryState](self, "libraryState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();
  pk_Sync_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      pk_Sync_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Sync engine (%@): No sync necessary.", (uint8_t *)&v12, 0xCu);

      }
    }
  }
  else
  {
    if (v7)
    {
      pk_Sync_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v11;
        v14 = 2112;
        v15 = v3;
        v16 = 2112;
        v17 = v4;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sync is necessary.\n libraryState:%@\n reconciledState:%@", (uint8_t *)&v12, 0x20u);

      }
    }
    -[NPKPassSyncEngine _sendNextStateChange](self, "_sendNextStateChange");
  }

}

- (void)handleStateChange:(id)a3
{
  -[NPKPassSyncEngine _handleStateChange:attemptRecoverReconcileStateVersionMismatch:](self, "_handleStateChange:attemptRecoverReconcileStateVersionMismatch:", a3, 1);
}

- (void)_handleStateChange:(id)a3 attemptRecoverReconcileStateVersionMismatch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  BOOL v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void (**v45)(_QWORD, _QWORD);
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(_QWORD, _QWORD);
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  _BOOL4 v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  _BOOL4 v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  _BOOL4 v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  NSObject *v84;
  _BOOL4 v85;
  NSObject *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  _BOOL4 v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  NPKPassSyncEngine *v97;
  void *v98;
  _BOOL4 v99;
  id v100;
  uint64_t v101;
  void *v102;
  void (**v103)(_QWORD);
  void *v104;
  void *v105;
  void (**v106)(_QWORD, _QWORD, _QWORD);
  void *v107;
  _QWORD v108[5];
  id v109;
  void (**v110)(_QWORD, _QWORD, _QWORD);
  void (**v111)(_QWORD);
  char v112;
  __int16 v113;
  _QWORD v114[5];
  id v115;
  id v116;
  unint64_t v117;
  _QWORD v118[5];
  id v119;
  id v120;
  unint64_t v121;
  _QWORD v122[5];
  id v123;
  uint8_t buf[4];
  void *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  __int16 v132;
  uint64_t v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  void *v143;
  uint64_t v144;

  v4 = a4;
  v144 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  pk_Sync_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Sync_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "changeUUID");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reconciledStateHash");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "hexEncoding");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v6, "reconciledStateVersion");
      NPKPassSyncChangeTypeToString(objc_msgSend(v6, "changeType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueID");
      v97 = self;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "syncStateItem");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "passData");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "npkDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "baseManifestHashForPartialUpdate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hexEncoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteAssetsForPartialUpdate");
      v99 = v4;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414594;
      v125 = v105;
      v126 = 2112;
      v127 = v102;
      v128 = 2112;
      v129 = (uint64_t)v10;
      v130 = 2048;
      v131 = v95;
      v132 = 2112;
      v133 = (uint64_t)v11;
      v134 = 2112;
      v135 = v12;
      v136 = 2112;
      v137 = v94;
      v138 = 2112;
      v139 = v13;
      v140 = 2112;
      v141 = v15;
      v142 = 2112;
      v143 = v16;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received state change\n\tChange UUID: %@\n\tReconciled state hash: %@\n\tVersion:%lu\n\tChange type: %@\n\tunique ID: %@\n\tsync state item: %@\n\tpass data: %@\n\tbase manifest hash for partial update: %@\n\t remote assets for partial update: %@", buf, 0x66u);

      v4 = v99;
      self = v97;

    }
  }
  -[NPKPassSyncEngine backupState](self, "backupState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "syncStateHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncEngine reconciledState](self, "reconciledState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "syncStateHash");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "reconciledStateHash");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (PKEqualObjects())
    {

    }
    else
    {
      objc_msgSend(v6, "reconciledStateHash");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = PKEqualObjects();

      if (v24)
      {
        pk_Sync_log();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

        if (v26)
        {
          pk_Sync_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            -[NPKPassSyncEngine engineName](self, "engineName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v125 = v28;
            v126 = 2112;
            v127 = v19;
            v128 = 2112;
            v129 = (uint64_t)v21;
            _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): State change based on backup hash (%@), not reconciled hash (%@); moving "
              "backup to reconciled",
              buf,
              0x20u);

          }
        }
        -[NPKPassSyncEngine setReconciledState:](self, "setReconciledState:", v18);
        -[NPKPassSyncEngine setBackupState:](self, "setBackupState:", 0);
        -[NPKPassSyncEngine _unexpectedEventOccurred](self, "_unexpectedEventOccurred");
      }
    }

  }
  objc_msgSend(v6, "reconciledStateHash");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "syncStateHash");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKEqualObjects() & 1) != 0)
  {
    v32 = objc_msgSend(v6, "reconciledStateVersion");
    -[NPKPassSyncEngine reconciledState](self, "reconciledState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v4;
    v35 = objc_msgSend(v33, "version");

    v36 = v32 == v35;
    v4 = v34;
    if (!v36)
      goto LABEL_27;
    v37 = objc_msgSend(v6, "changeType");
    objc_msgSend(v6, "uniqueID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x24BDAC760];
    v122[0] = MEMORY[0x24BDAC760];
    v122[1] = 3221225472;
    v122[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke;
    v122[3] = &unk_24CFEA9F8;
    v122[4] = self;
    v40 = v6;
    v123 = v40;
    v106 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B6780](v122);
    v118[0] = v39;
    v118[1] = 3221225472;
    v118[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_50;
    v118[3] = &unk_24CFE8A28;
    v121 = v37;
    v118[4] = self;
    v41 = v40;
    v119 = v41;
    v42 = v38;
    v120 = v42;
    v103 = (void (**)(_QWORD))MEMORY[0x2199B6780](v118);
    v114[0] = v39;
    v114[1] = 3221225472;
    v114[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_52;
    v114[3] = &unk_24CFEAA20;
    v117 = v37;
    v114[4] = self;
    v43 = v41;
    v115 = v43;
    v44 = v42;
    v116 = v44;
    v45 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B6780](v114);
    v113 = 0;
    if (v37 >= 2)
    {
      if (v37 != 2)
        goto LABEL_50;
      v113 = 257;
    }
    else
    {
      -[NPKPassSyncEngine libraryState](self, "libraryState");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "syncStateItems");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKey:", v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      -[NPKPassSyncEngine reconciledState](self, "reconciledState");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "syncStateItems");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKey:", v44);
      v100 = v44;
      v51 = v45;
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      -[NPKPassSyncEngine candidateChange](self, "candidateChange");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "syncStateItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassSyncEngine _shouldProcessAddOrUpdateChangeOfType:changeSyncStateItem:librarySyncStateItem:reconciledSyncStateItem:candidateChange:shouldApplyToPassLibrary:shouldApplyToReconciledState:](self, "_shouldProcessAddOrUpdateChangeOfType:changeSyncStateItem:librarySyncStateItem:reconciledSyncStateItem:candidateChange:shouldApplyToPassLibrary:shouldApplyToReconciledState:", v37, v54, v48, v52, v53, (char *)&v113 + 1, &v113);

      v45 = v51;
      v44 = v100;

      if (!HIBYTE(v113))
      {
        if ((_BYTE)v113)
        {
          pk_Sync_log();
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);

          if (v56)
          {
            pk_Sync_log();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              -[NPKPassSyncEngine engineName](self, "engineName");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "changeUUID");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v125 = v58;
              v126 = 2112;
              v127 = v59;
              _os_log_impl(&dword_213518000, v57, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Not applying change to pass library, but applying to reconciled state and accepting\n\tChange UUID: %@", buf, 0x16u);

            }
          }
          v60 = v103;
          v103[2](v103);
          v61 = v106;
          v106[2](v106, 1, 0);
LABEL_55:

          goto LABEL_56;
        }
LABEL_50:
        pk_Sync_log();
        v89 = objc_claimAutoreleasedReturnValue();
        v90 = os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);

        if (v90)
        {
          pk_Sync_log();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            -[NPKPassSyncEngine engineName](self, "engineName");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "changeUUID");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v125 = v92;
            v126 = 2112;
            v127 = v93;
            _os_log_impl(&dword_213518000, v91, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Rejecting change\n\tChange UUID: %@", buf, 0x16u);

          }
        }
        v61 = v106;
        v106[2](v106, 0, 0);
        v60 = v103;
        goto LABEL_55;
      }
    }
    pk_Sync_log();
    v84 = objc_claimAutoreleasedReturnValue();
    v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT);

    if (v85)
    {
      pk_Sync_log();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "changeUUID");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v125 = v87;
        v126 = 2112;
        v127 = v88;
        _os_log_impl(&dword_213518000, v86, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to pass library\n\tChange UUID: %@", buf, 0x16u);

      }
    }
    -[NPKPassSyncEngine setProcessingChange:](self, "setProcessingChange:", v43);
    v108[0] = MEMORY[0x24BDAC760];
    v108[1] = 3221225472;
    v108[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_55;
    v108[3] = &unk_24CFEAA48;
    v108[4] = self;
    v109 = v43;
    v61 = v106;
    v110 = v106;
    v112 = v113;
    v60 = v103;
    v111 = v103;
    ((void (**)(_QWORD, _QWORD *))v45)[2](v45, v108);

    goto LABEL_55;
  }

LABEL_27:
  v62 = objc_msgSend(v6, "reconciledStateVersion");
  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "version");

  pk_Sync_log();
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);

  if (!v4 || v64 == v62)
  {
    if (v66)
    {
      pk_Sync_log();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reconciledStateHash");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "hexEncoding");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v6, "reconciledStateVersion");
        -[NPKPassSyncEngine reconciledState](self, "reconciledState");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "syncStateHash");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "hexEncoding");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKPassSyncEngine reconciledState](self, "reconciledState");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "version");
        *(_DWORD *)buf = 138413314;
        v125 = v75;
        v126 = 2112;
        v127 = v76;
        v128 = 2048;
        v129 = v101;
        v130 = 2112;
        v131 = (uint64_t)v78;
        v132 = 2048;
        v133 = v80;
        _os_log_impl(&dword_213518000, v74, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Unrecognized reconciled state hash %@ version:%lu, current state hash:%@ version:%lu", buf, 0x34u);

      }
    }
    objc_msgSend(v6, "reconciledStateHash");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v6, "reconciledStateVersion");
    -[NPKPassSyncEngine reconciledState](self, "reconciledState");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncEngine _sendReconciledStateUnrecognizedWithHash:version:currentPassSyncState:](self, "_sendReconciledStateUnrecognizedWithHash:version:currentPassSyncState:", v81, v82, v83);

    -[NPKPassSyncEngine _unexpectedEventOccurred](self, "_unexpectedEventOccurred");
  }
  else
  {
    if (v66)
    {
      pk_Sync_log();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v125 = v68;
        _os_log_impl(&dword_213518000, v67, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Attempt to recover from mismatch reconcile state", buf, 0xCu);

      }
    }
    -[NPKPassSyncEngine setMinSyncStateVersion:](self, "setMinSyncStateVersion:", objc_msgSend(v6, "reconciledStateVersion"));
    pk_Sync_log();
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);

    if (v70)
    {
      pk_Sync_log();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueID");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v125 = v72;
        v126 = 2112;
        v127 = v73;
        _os_log_impl(&dword_213518000, v71, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): handle second time change with UUID:%@", buf, 0x16u);

      }
    }
    -[NPKPassSyncEngine _handleStateChange:attemptRecoverReconcileStateVersionMismatch:](self, "_handleStateChange:attemptRecoverReconcileStateVersionMismatch:", v6, 0);
  }
LABEL_56:

}

void __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Sync_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "changeUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "reconciledState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138413314;
      v15 = v9;
      v16 = 1024;
      v17 = a2;
      v18 = 1024;
      v19 = a3;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): State change processed\n\tChange accepted: %d\n\tFull pass required: %d\n\tChange UUID: %@\n\tNew reconciled state: %@", (uint8_t *)&v14, 0x2Cu);

    }
  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "changeUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_sendStateChangeProcessedWithUUID:changeAccepted:fullPassRequired:", v13, a2, a3);

}

void __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_50(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 2)
  {
    if (v2 != 2)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "reconciledState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passSyncStateByRemovingPassWithUniqueID:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "reconciledState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "syncStateItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passSyncStateByAddingOrUpdatingSyncStateItem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "reconciledState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Sync_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Sync_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "syncStateHash");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hexEncoding");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "syncStateHash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hexEncoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Setting new backup and reconciled state\n\tBackup state hash: %@\n\tReconciled state hash: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setBackupState:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setReconciledState:", v5);

}

void __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  switch(v5)
  {
    case 2:
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 48);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_3;
      v17[3] = &unk_24CFE9328;
      v18 = v3;
      objc_msgSend(v10, "_requestRemovePassWithUniqueID:completion:", v11, v17);
      v9 = v18;
      goto LABEL_6;
    case 1:
      v12 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "passData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "syncStateItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "baseManifestHashForPartialUpdate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "remoteAssetsForPartialUpdate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_requestUpdatePassData:forSyncStateItem:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:completion:", v13, v14, v15, v16, v4);

      break;
    case 0:
      v6 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "passData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "syncStateItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_2;
      v19[3] = &unk_24CFE9328;
      v20 = v4;
      objc_msgSend(v6, "_requestAddPassData:forSyncStateItem:completion:", v7, v8, v19);

      v9 = v20;
LABEL_6:

      break;
  }

}

uint64_t __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __84__NPKPassSyncEngine__handleStateChange_attemptRecoverReconcileStateVersionMismatch___block_invoke_55(uint64_t a1, char a2)
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void (*v17)(void);
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "processingChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setProcessingChange:", 0);
  if ((a2 & 1) != 0)
  {
    v6 = *(unsigned __int8 *)(a1 + 64);
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v8)
      {
        pk_Sync_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "engineName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "changeUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412546;
          v23 = v10;
          v24 = 2112;
          v25 = v11;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to reconciled state and accepting\n\tChange UUID: %@", (uint8_t *)&v22, 0x16u);

        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else if (v8)
    {
      pk_Sync_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "changeUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Not applying change to reconciled state and accepting\n\tChange UUID: %@", (uint8_t *)&v22, 0x16u);

      }
    }
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    pk_Sync_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      pk_Sync_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "syncStateItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Not applying change to reconciled state because we failed to apply it to the pass library\n\tSync state item: %@", (uint8_t *)&v22, 0x16u);

      }
    }
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v17();
  return objc_msgSend(*(id *)(a1 + 32), "_finishedProcessingChange:", *(_QWORD *)(a1 + 40));
}

- (void)handleStateChangeProcessedWithUUID:(id)a3 changeAccepted:(BOOL)a4 fullPassRequired:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  _BOOL4 v51;
  NSObject *v52;
  void *v53;
  _BYTE v54[22];
  __int16 v55;
  _BYTE v56[14];
  __int16 v57;
  void *v58;
  uint64_t v59;

  v5 = a5;
  v6 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[NPKPassSyncEngine candidateChange](self, "candidateChange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Sync_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Sync_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v54 = 138413314;
      v14 = CFSTR("no");
      *(_QWORD *)&v54[4] = v13;
      *(_WORD *)&v54[12] = 2112;
      if (v5)
        v14 = CFSTR("yes");
      *(_QWORD *)&v54[14] = v8;
      v55 = 1024;
      *(_DWORD *)v56 = v6;
      *(_WORD *)&v56[4] = 2112;
      *(_QWORD *)&v56[6] = v14;
      v57 = 2112;
      v58 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received state change processed\n\tChange UUID: %@\n\tAccepted: %d\n\tFull pass required: %@\n\tOur candidate change: %@", v54, 0x30u);

    }
  }
  objc_msgSend(v9, "changeUUID", *(_OWORD *)v54);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKEqualObjects())
  {
    if (v6)
    {
      v16 = objc_msgSend(v9, "changeType");
      -[NPKPassSyncEngine reconciledState](self, "reconciledState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 > 1)
      {
        objc_msgSend(v9, "uniqueID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "passSyncStateByRemovingPassWithUniqueID:", v18);
      }
      else
      {
        objc_msgSend(v9, "syncStateItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "passSyncStateByAddingOrUpdatingSyncStateItem:", v18);
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[NPKPassSyncEngine setReconciledState:](self, "setReconciledState:", v32);
      -[NPKPassSyncEngine setCandidateChange:](self, "setCandidateChange:", 0);
      pk_Sync_log();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        pk_Sync_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKPassSyncEngine engineName](self, "engineName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v54 = 138412546;
          *(_QWORD *)&v54[4] = v36;
          *(_WORD *)&v54[12] = 2112;
          *(_QWORD *)&v54[14] = v32;
          _os_log_impl(&dword_213518000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Reconciled state after state change processed: %@", v54, 0x16u);

        }
      }

      -[NPKPassSyncEngine _receivedStateChangeProcessed:changeAccepted:](self, "_receivedStateChangeProcessed:changeAccepted:", v9, 1);
LABEL_30:
      -[NPKPassSyncEngine _sendNextStateChange](self, "_sendNextStateChange");
      goto LABEL_47;
    }
    objc_msgSend(v9, "uniqueID");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v5)
    {
      objc_msgSend(v9, "baseManifestHashForPartialUpdate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        pk_Sync_log();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

        if (v47)
        {
          pk_Sync_log();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            -[NPKPassSyncEngine engineName](self, "engineName");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v54 = 138412290;
            *(_QWORD *)&v54[4] = v49;
            _os_log_impl(&dword_213518000, v48, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): got request for full pass, but we sent the full pass last time", v54, 0xCu);

          }
        }
        -[NPKPassSyncEngine _unexpectedEventOccurred](self, "_unexpectedEventOccurred");
        goto LABEL_46;
      }
      v26 = objc_msgSend(v9, "copy");
      -[NSObject setBaseManifestHashForPartialUpdate:](v26, "setBaseManifestHashForPartialUpdate:", 0);
      -[NSObject setRemoteAssetsForPartialUpdate:](v26, "setRemoteAssetsForPartialUpdate:", 0);
      -[NPKPassSyncEngine dataSource](self, "dataSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "passSyncEngine:dataForPassWithUniqueID:", self, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPassData:](v26, "setPassData:", v28);

      pk_Sync_log();
      v29 = objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

      if ((_DWORD)v28)
      {
        pk_Sync_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKPassSyncEngine engineName](self, "engineName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v54 = 138412546;
          *(_QWORD *)&v54[4] = v31;
          *(_WORD *)&v54[12] = 2112;
          *(_QWORD *)&v54[14] = v26;
          _os_log_impl(&dword_213518000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Resending change with full pass\n\tFull pass change: %@", v54, 0x16u);

        }
      }
      -[NPKPassSyncEngine setCandidateChange:](self, "setCandidateChange:", v26);
      -[NPKPassSyncEngine _sendStateChange:](self, "_sendStateChange:", v26);
      goto LABEL_23;
    }
    if (!v23)
    {
      pk_Sync_log();
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);

      if (!v51)
        goto LABEL_46;
      pk_Sync_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_ERROR, "Error: Candidate change has no unique ID!", v54, 2u);
      }
LABEL_23:

LABEL_46:
      -[NPKPassSyncEngine _receivedStateChangeProcessed:changeAccepted:](self, "_receivedStateChangeProcessed:changeAccepted:", v9, 0);
      goto LABEL_47;
    }
    -[NPKPassSyncEngine libraryState](self, "libraryState");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "syncStateItems");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", v24);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "syncStateItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = PKEqualObjects();
    pk_Sync_log();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

    if ((v41 & 1) != 0)
    {
      if (v43)
      {
        pk_Sync_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKPassSyncEngine engineName](self, "engineName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v54 = 138412802;
          *(_QWORD *)&v54[4] = v45;
          *(_WORD *)&v54[12] = 2112;
          *(_QWORD *)&v54[14] = v39;
          v55 = 2112;
          *(_QWORD *)v56 = v40;
          _os_log_impl(&dword_213518000, v44, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): change not being accepted is unexpected\n\tCurrent library sync state item: %@\n\tChange sync state item: %@", v54, 0x20u);

        }
      }
      -[NPKPassSyncEngine _unexpectedEventOccurred](self, "_unexpectedEventOccurred");
    }
    else if (v43)
    {
      pk_Sync_log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v54 = 138412802;
        *(_QWORD *)&v54[4] = v53;
        *(_WORD *)&v54[12] = 2112;
        *(_QWORD *)&v54[14] = v39;
        v55 = 2112;
        *(_QWORD *)v56 = v40;
        _os_log_impl(&dword_213518000, v52, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): change not being accepted is expected because current library sync state item (%@) no longer matches change sync state item (%@)", v54, 0x20u);

      }
    }
    -[NPKPassSyncEngine setCandidateChange:](self, "setCandidateChange:", 0);

    -[NPKPassSyncEngine _receivedStateChangeProcessed:changeAccepted:](self, "_receivedStateChangeProcessed:changeAccepted:", v9, 0);
    if ((v41 & 1) == 0)
      goto LABEL_30;
  }
  else
  {
    pk_Sync_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      pk_Sync_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v54 = 138412802;
        *(_QWORD *)&v54[4] = v22;
        *(_WORD *)&v54[12] = 2112;
        *(_QWORD *)&v54[14] = v8;
        v55 = 2112;
        *(_QWORD *)v56 = v15;
        _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Did not recognize change UUID (%@) in change state accepted message; candidat"
          "e change UUID is %@",
          v54,
          0x20u);

      }
    }
    -[NPKPassSyncEngine _unexpectedEventOccurred](self, "_unexpectedEventOccurred");
  }
LABEL_47:

}

- (void)handleReconciledStateUnrecognizedWithHash:(id)a3 version:(unint64_t)a4 passSyncState:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Sync_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Sync_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hexEncoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138413058;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      v26 = 2048;
      v27 = a4;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received reconciled state unrecognized\n\tReconciled state hash: %@\n\tversion:%lu\n\tPass sync state: %@", (uint8_t *)&v22, 0x2Au);

    }
  }
  v15 = objc_msgSend(v9, "version");
  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "version");

  if (v17 == v15)
  {
    -[NPKPassSyncEngine reconciledState](self, "reconciledState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NPKPassSyncEngine setMinSyncStateVersion:](self, "setMinSyncStateVersion:", v15);
    -[NPKPassSyncEngine reconciledState](self, "reconciledState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncEngine libraryState](self, "libraryState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "commonBaselinePassSyncStateWithState:version:", v20, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NPKPassSyncEngine setCandidateState:](self, "setCandidateState:", 0);
  -[NPKPassSyncEngine setReconciledState:](self, "setReconciledState:", 0);
  if (v9)
  {
    objc_msgSend(v18, "commonBaselinePassSyncStateWithState:version:", v9, objc_msgSend(v18, "version"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncEngine setCandidateState:](self, "setCandidateState:", v21);
    -[NPKPassSyncEngine _sendProposedReconciledState:](self, "_sendProposedReconciledState:", v21);

  }
}

- (void)handleProposedReconciledState:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received proposed reconciled state\n\tProposed pass sync state: %@", buf, 0x16u);

    }
  }
  v9 = objc_msgSend(v4, "version");
  -[NPKPassSyncEngine libraryState](self, "libraryState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != objc_msgSend(v10, "version"))
  {

    goto LABEL_9;
  }
  -[NPKPassSyncEngine candidateState](self, "candidateState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine libraryState](self, "libraryState", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "stateIsSubsetOfUnionOfPassSyncStates:", v13);

  if (!v14)
  {
LABEL_9:
    objc_msgSend(v4, "syncStateHash");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncEngine _sendReconciledStateUnrecognizedWithHash:version:currentPassSyncState:](self, "_sendReconciledStateUnrecognizedWithHash:version:currentPassSyncState:", v15, objc_msgSend(v4, "version"), 0);
    goto LABEL_10;
  }
  -[NPKPassSyncEngine setBackupState:](self, "setBackupState:", 0);
  -[NPKPassSyncEngine setReconciledState:](self, "setReconciledState:", v4);
  objc_msgSend(v4, "syncStateHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine _sendReconciledStateAcceptedWithHash:](self, "_sendReconciledStateAcceptedWithHash:", v15);
LABEL_10:

}

- (void)handleReconciledStateAcceptedWithHash:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hexEncoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Received proposed reconciled state accepted\n\tReconciled state hash: %@", (uint8_t *)&v19, 0x16u);

    }
  }
  -[NPKPassSyncEngine candidateState](self, "candidateState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncStateHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PKEqualObjects();

  if (v12)
  {
    -[NPKPassSyncEngine setReconciledState:](self, "setReconciledState:", v10);
    -[NPKPassSyncEngine setCandidateState:](self, "setCandidateState:", 0);
    -[NPKPassSyncEngine _sendNextStateChange](self, "_sendNextStateChange");
  }
  else
  {
    pk_Sync_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Sync_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hexEncoding");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "syncStateHash");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412802;
        v20 = v16;
        v21 = 2112;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): Did not recognize hash (%@) in reconciled state accepted message; reconciled "
          "state hash is %@",
          (uint8_t *)&v19,
          0x20u);

      }
    }
    -[NPKPassSyncEngine _unexpectedEventOccurred](self, "_unexpectedEventOccurred");
  }

}

- (void)setMinSyncStateVersion:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NPKPassSyncState *backupState;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  NPKPassSyncState *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  int v33;
  unint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[NPKPassSyncEngine libraryState](self, "libraryState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "version");

  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");

  backupState = self->_backupState;
  if (backupState)
    v10 = -[NPKPassSyncState version](backupState, "version");
  else
    v10 = v8;
  if (v8 != a3 || v6 != a3 || v6 != v8 || v8 != v10)
  {
    pk_Sync_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Sync_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 134217984;
        v34 = a3;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Requested to move to sync state version:%lu", (uint8_t *)&v33, 0xCu);
      }

    }
    +[NPKPassSyncState setMinRemoteDevicePassSyncStateVersionSupport:](NPKPassSyncState, "setMinRemoteDevicePassSyncStateVersionSupport:", a3);
    -[NPKPassSyncEngine dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "passSyncEngineNeedsUpdatedPassLibraryState:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "passSyncStateWithVersion:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncEngine setLibraryState:](self, "setLibraryState:", v16);
    pk_Sync_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Sync_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        v34 = (unint64_t)v20;
        v35 = 2112;
        v36 = v16;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): updated library state to match expected version:%@", (uint8_t *)&v33, 0x16u);

      }
    }
    -[NPKPassSyncEngine reconciledState](self, "reconciledState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateReconcileState:expectedVersion:", v21, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKPassSyncEngine setReconciledState:](self, "setReconciledState:", v22);
    pk_Sync_log();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (v24)
    {
      pk_Sync_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412546;
        v34 = (unint64_t)v26;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): updated reconciled state to match expected version:%@", (uint8_t *)&v33, 0x16u);

      }
    }
    v27 = self->_backupState;
    if (v27)
    {
      objc_msgSend(v15, "updateReconcileState:expectedVersion:", v27, a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassSyncEngine setBackupState:](self, "setBackupState:", v28);
      pk_Sync_log();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

      if (v30)
      {
        pk_Sync_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKPassSyncEngine engineName](self, "engineName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = (unint64_t)v32;
          v35 = 2112;
          v36 = v28;
          _os_log_impl(&dword_213518000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): updated backup state to match expected version:%@", (uint8_t *)&v33, 0x16u);

        }
      }

    }
    -[NPKPassSyncEngine setCandidateChange:](self, "setCandidateChange:", 0);

  }
}

- (void)setLibraryState:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    v6 = objc_msgSend(v5, "version");
    if (v6 != +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport](NPKPassSyncState, "minRemoteDevicePassSyncStateVersionSupport"))
    {
      pk_Sync_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        pk_Sync_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKPassSyncEngine engineName](self, "engineName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412802;
          v12 = v10;
          v13 = 2048;
          v14 = objc_msgSend(v5, "version");
          v15 = 2048;
          v16 = +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport](NPKPassSyncState, "minRemoteDevicePassSyncStateVersionSupport");
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Sync state engine (%@): setting new library state with version:%lu, expected:%lu", (uint8_t *)&v11, 0x20u);

        }
      }
    }
    objc_storeStrong((id *)&self->_libraryState, a3);
    -[NPKPassSyncEngine _engineStateChanged](self, "_engineStateChanged");
  }

}

- (NPKPassSyncState)libraryState
{
  NPKPassSyncState *libraryState;
  NPKPassSyncState *v3;

  libraryState = self->_libraryState;
  if (libraryState)
    v3 = libraryState;
  else
    v3 = -[NPKPassSyncState initWithVersion:]([NPKPassSyncState alloc], "initWithVersion:", +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport](NPKPassSyncState, "minRemoteDevicePassSyncStateVersionSupport"));
  return v3;
}

- (void)setBackupState:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backupState, a3);
    -[NPKPassSyncEngine _engineStateChanged](self, "_engineStateChanged");
  }

}

- (void)setReconciledState:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_reconciledState, a3);
    -[NPKPassSyncEngine _engineStateChanged](self, "_engineStateChanged");
  }

}

- (NPKPassSyncState)reconciledState
{
  NPKPassSyncState *reconciledState;
  NPKPassSyncState *v3;

  reconciledState = self->_reconciledState;
  if (reconciledState)
    v3 = reconciledState;
  else
    v3 = -[NPKPassSyncState initWithVersion:]([NPKPassSyncState alloc], "initWithVersion:", +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport](NPKPassSyncState, "minRemoteDevicePassSyncStateVersionSupport"));
  return v3;
}

- (void)setCandidateState:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_candidateState, a3);
    -[NPKPassSyncEngine _engineStateChanged](self, "_engineStateChanged");
  }

}

- (NPKPassSyncState)candidateState
{
  NPKPassSyncState *candidateState;
  NPKPassSyncState *v3;

  candidateState = self->_candidateState;
  if (candidateState)
    v3 = candidateState;
  else
    v3 = -[NPKPassSyncState initWithVersion:]([NPKPassSyncState alloc], "initWithVersion:", +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport](NPKPassSyncState, "minRemoteDevicePassSyncStateVersionSupport"));
  return v3;
}

- (void)setCandidateChange:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_candidateChange, a3);
    -[NPKPassSyncEngine _engineStateChanged](self, "_engineStateChanged");
  }

}

- (void)_sendNextStateChange
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NPKPassSyncChange *v33;
  void *v34;
  NPKPassSyncChange *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NPKPassSyncChange *v45;
  NPKPassSyncChange *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  NSObject *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  -[NPKPassSyncEngine libraryState](self, "libraryState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v63 = 0;
  v61 = 0;
  objc_msgSend(v3, "compareWithBaselinePassSyncState:outAddedSyncItems:outUpdatedSyncItems:outRemovedSyncItems:", v4, &v63, &v62, &v61);
  v5 = v63;
  v6 = v62;
  v59 = v61;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = objc_claimAutoreleasedReturnValue();
  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncStateHash");
  v57 = objc_claimAutoreleasedReturnValue();

  -[NPKPassSyncEngine reconciledState](self, "reconciledState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v9, "version");

  pk_Sync_log();
  v10 = objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  v58 = (void *)v7;
  if ((_DWORD)v4)
  {
    pk_Sync_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassSyncEngine libraryState](self, "libraryState");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "syncStateHash");
      v13 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hexEncoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassSyncEngine reconciledState](self, "reconciledState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "syncStateHash");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hexEncoding");
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v65 = v12;
      v66 = 2112;
      v67 = v15;
      v68 = 2112;
      v69 = v18;
      v70 = 2112;
      v71 = v5;
      v72 = 2112;
      v73 = v13;
      v74 = 2112;
      v75 = v59;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Compared library state with manifestHash:%@ with reconcileState:%@\n addedID:%@\n updatedIDs:%@\n removedIDs:%@\n", buf, 0x3Eu);

      v7 = (uint64_t)v58;
      v6 = v13;

    }
  }
  v56 = v5;
  if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
  {
    v54 = v6;
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassSyncEngine reconciledState](self, "reconciledState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "syncStateItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "manifest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "manifestHash");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[NPKPassSyncEngine dataSource](self, "dataSource");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uniqueID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        objc_msgSend(v26, "passSyncEngine:partialDataForPassWithUniqueID:baseManifest:outRemoteAssets:", self, v27, v24, &v60);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v60;

        v30 = 1;
        if (v28)
        {
LABEL_14:
          v33 = [NPKPassSyncChange alloc];
          objc_msgSend(v19, "uniqueID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v33;
          v36 = (void *)v57;
          v37 = -[NPKPassSyncChange initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:](v35, "initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:", v7, v57, v55, v30, v34, v19, v28, v25, v29);

          v6 = v54;
          v38 = v59;
          goto LABEL_15;
        }
      }
      else
      {
        v29 = 0;
        v30 = 1;
      }
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v30 = 0;
      v24 = 0;
      v25 = 0;
    }

    -[NPKPassSyncEngine dataSource](self, "dataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniqueID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "passSyncEngine:dataForPassWithUniqueID:", self, v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v29 = 0;
    goto LABEL_14;
  }
  v38 = v59;
  if (!objc_msgSend(v59, "count"))
  {
    pk_Sync_log();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

    v36 = (void *)v57;
    if (!v48)
      goto LABEL_25;
    pk_Sync_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassSyncEngine reconciledState](self, "reconciledState");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "syncStateHash");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "hexEncoding");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v65 = v49;
      v66 = 2112;
      v67 = v52;
      _os_log_impl(&dword_213518000, v37, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): No state changes to send; settling on reconciled state hash %@.",
        buf,
        0x16u);

      v36 = (void *)v57;
      v38 = v59;

    }
    goto LABEL_24;
  }
  objc_msgSend(v59, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = [NPKPassSyncChange alloc];
  objc_msgSend(v19, "uniqueID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  v36 = (void *)v57;
  v37 = -[NPKPassSyncChange initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:](v46, "initWithChangeUUID:reconciledStateHash:reconciledStateVersion:changeType:uniqueID:syncStateItem:passData:", v7, v57, v55, 2, v24, 0, 0);
LABEL_15:

  if (v37)
  {
    -[NPKPassSyncEngine candidateChange](self, "candidateChange");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 && -[NSObject isEqualToChangeIgnoringUUID:](v37, "isEqualToChangeIgnoringUUID:", v39))
    {
      pk_Sync_log();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

      if (v41)
      {
        pk_Sync_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKPassSyncEngine engineName](self, "engineName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v65 = v43;
          v66 = 2112;
          v67 = v39;
          v68 = 2112;
          v69 = v37;
          _os_log_impl(&dword_213518000, v42, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Outgoing change is identical to candidate change except for UUID; changing U"
            "UID to match candidate change\n"
            "\tCandidate change: %@\n"
            "\tOutgoing change: %@",
            buf,
            0x20u);

        }
      }
      objc_msgSend(v39, "changeUUID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setChangeUUID:](v37, "setChangeUUID:", v44);

      v36 = (void *)v57;
    }
    -[NPKPassSyncEngine setCandidateChange:](self, "setCandidateChange:", v37);
    -[NPKPassSyncEngine _sendStateChange:](self, "_sendStateChange:", v37);

LABEL_24:
  }
LABEL_25:

}

- (void)_shouldProcessAddOrUpdateChangeOfType:(unint64_t)a3 changeSyncStateItem:(id)a4 librarySyncStateItem:(id)a5 reconciledSyncStateItem:(id)a6 candidateChange:(id)a7 shouldApplyToPassLibrary:(BOOL *)a8 shouldApplyToReconciledState:(BOOL *)a9
{
  BOOL *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  NPKPassSyncEngine *v39;
  NSObject *v40;
  BOOL *v41;
  NSObject *v42;
  NSObject *v43;
  NPKPassSyncEngine *v44;
  unint64_t engineRole;
  NSObject *v46;
  _BOOL4 v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  NSObject *v56;
  char v57;
  NSObject *v58;
  NPKPassSyncEngine *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  BOOL *v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  NSObject *v67;
  __int16 v68;
  NSObject *v69;
  __int16 v70;
  NSObject *v71;
  uint64_t v72;

  v15 = a9;
  v72 = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (a3 != 1 || v17)
  {
    if ((PKEqualObjects() & 1) != 0)
    {
      LOBYTE(v26) = 1;
      goto LABEL_44;
    }
    pk_Sync_log();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      pk_Sync_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v65 = v30;
        v66 = 2112;
        v67 = v18;
        v68 = 2112;
        v69 = v17;
        v70 = 2112;
        v71 = v16;
        _os_log_impl(&dword_213518000, v29, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Pass has been added/updated in local library also.\n\tReconciled sync state item: %@\n\tLocal library sync state item: %@\n\tChange sync state item: %@", buf, 0x2Au);

      }
    }
    -[NSObject sequenceCounter](v17, "sequenceCounter");
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject sequenceCounter](v16, "sequenceCounter");
    v31 = objc_claimAutoreleasedReturnValue();
    v26 = v31;
    if (v22 || !v31)
    {
      if (v22 && v31)
      {
        if (-[NSObject compare:](v22, "compare:", v31) == 1)
        {
          v63 = a9;
          pk_Sync_log();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

          if (v33)
          {
            pk_Sync_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              -[NPKPassSyncEngine engineName](self, "engineName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v65 = v35;
              v66 = 2112;
              v67 = v22;
              v68 = 2112;
              v69 = v26;
              v36 = "Notice: Sync state engine (%@): local pass has higher sequence counter (%@) than change (%@); not ap"
                    "plying change to local library";
              v37 = v34;
              v38 = 32;
LABEL_24:
              _os_log_impl(&dword_213518000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);

              goto LABEL_25;
            }
            goto LABEL_25;
          }
          goto LABEL_26;
        }
      }
      else
      {
        v62 = v22;
        v63 = a9;
        v39 = self;
        v40 = v16;
        v41 = a8;
        v42 = v18;
        v43 = v19;
        v44 = v39;
        engineRole = v39->_engineRole;
        pk_Sync_log();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

        if (engineRole)
        {
          v19 = v43;
          v18 = v42;
          a8 = v41;
          v16 = v40;
          self = v44;
          v22 = v62;
          if (v47)
          {
            pk_Sync_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              -[NPKPassSyncEngine engineName](self, "engineName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v65 = v35;
              v36 = "Notice: Sync state engine (%@): Not applying change in the absence of sync state counters";
              v37 = v34;
              v38 = 12;
              goto LABEL_24;
            }
LABEL_25:

          }
LABEL_26:

          v15 = v63;
          goto LABEL_27;
        }
        v19 = v43;
        v18 = v42;
        a8 = v41;
        v16 = v40;
        v59 = v44;
        v22 = v62;
        v15 = a9;
        if (v47)
        {
          pk_Sync_log();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            -[NPKPassSyncEngine engineName](v59, "engineName");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v65 = v61;
            _os_log_impl(&dword_213518000, v60, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change in the absence of sync state counters", buf, 0xCu);

          }
        }
      }
    }

    LOBYTE(v26) = 1;
    goto LABEL_51;
  }
  pk_Sync_log();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

  if (!v21)
    goto LABEL_28;
  pk_Sync_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[NPKPassSyncEngine engineName](self, "engineName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject uniqueID](v16, "uniqueID");
    v24 = objc_claimAutoreleasedReturnValue();
    -[NPKPassSyncEngine libraryState](self, "libraryState");
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v65 = v23;
    v66 = 2112;
    v67 = v24;
    v68 = 2112;
    v69 = v25;
    _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Ignoring request to apply pass update with unique ID %@ to local library since the pass is not in our library state: %@", buf, 0x20u);

    v15 = a9;
  }
LABEL_27:

LABEL_28:
  if (self->_engineRole != 1)
  {
LABEL_43:
    LOBYTE(v26) = 0;
    goto LABEL_44;
  }
  if (PKEqualObjects())
  {
    pk_Sync_log();
    v48 = objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)v26)
    {
      pk_Sync_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v65 = v49;
        v66 = 2112;
        v67 = v17;
        v68 = 2112;
        v69 = v16;
        v70 = 2112;
        v71 = v19;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to reconciled state because it matches our library state\n\tLocal library sync state item: %@\n\tChange sync state item: %@\n\tCandidate change: %@", buf, 0x2Au);
LABEL_41:

        goto LABEL_42;
      }
      goto LABEL_42;
    }
LABEL_44:
    v57 = 1;
    goto LABEL_53;
  }
  -[NSObject uniqueID](v19, "uniqueID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject uniqueID](v16, "uniqueID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v50, "isEqualToString:", v51);

  pk_Sync_log();
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);

  if (!v52)
  {
    if (v54)
    {
      pk_Sync_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKPassSyncEngine engineName](self, "engineName");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueID](v16, "uniqueID");
        v58 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v65 = v49;
        v66 = 2112;
        v67 = v58;
        v68 = 2112;
        v69 = v19;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Applying change to reconciled state even though we have an outstanding candidate change for pass with unique ID %@: %@", buf, 0x20u);

        goto LABEL_41;
      }
LABEL_42:
      LOBYTE(v26) = 0;
LABEL_51:
      v57 = 1;
      goto LABEL_52;
    }
    goto LABEL_43;
  }
  if (!v54)
  {
    LOBYTE(v26) = 0;
    v57 = 0;
    goto LABEL_53;
  }
  pk_Sync_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[NPKPassSyncEngine engineName](self, "engineName");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject uniqueID](v16, "uniqueID");
    v56 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v65 = v55;
    v66 = 2112;
    v67 = v56;
    v68 = 2112;
    v69 = v19;
    _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Not applying change to reconciled state since we are not applying it to the local library and have an outstanding candidate change for pass with unique ID %@: %@", buf, 0x20u);

  }
  LOBYTE(v26) = 0;
  v57 = 0;
LABEL_52:

LABEL_53:
  if (a8)
    *a8 = (char)v26;
  if (v15)
    *v15 = v57;

}

- (void)_sendStateChange:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending state change\n\tChange: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passSyncEngine:sendStateChange:", self, v4);

}

- (void)_sendStateChangeProcessedWithUUID:(id)a3 changeAccepted:(BOOL)a4 fullPassRequired:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  _BYTE v16[22];
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v5 = a5;
  v6 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  pk_Sync_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Sync_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("no");
      *(_DWORD *)v16 = 138413058;
      *(_QWORD *)&v16[4] = v12;
      if (v6)
        v14 = CFSTR("yes");
      else
        v14 = CFSTR("no");
      if (v5)
        v13 = CFSTR("yes");
      *(_WORD *)&v16[12] = 2112;
      *(_QWORD *)&v16[14] = v8;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending state change processed\n\tChange UUID: %@\n\tChange accepted: %@\n\tFull pass required: %@", v16, 0x2Au);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate", *(_OWORD *)v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "passSyncEngine:sendStateChangeProcessedWithUUID:changeAccepted:fullPassRequired:", self, v8, v6, v5);

}

- (void)_sendReconciledStateUnrecognizedWithHash:(id)a3 version:(unint64_t)a4 currentPassSyncState:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Sync_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Sync_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hexEncoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2048;
      v21 = a4;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending reconciled state unrecognized\n\tReconciled state hash: %@\n\tversion:%lu\n\tPass sync state: %@", (uint8_t *)&v16, 0x2Au);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "passSyncEngine:sendReconciledStateUnrecognizedWithHash:version:currentPassSyncState:", self, v8, a4, v9);

}

- (void)_sendReconciledStateAcceptedWithHash:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hexEncoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending reconciled state accepted\n\tReconciled state hash: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passSyncEngine:sendReconciledStateAcceptedWithHash:", self, v4);

}

- (void)_sendProposedReconciledState:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Sending proposed reconciled state\n\tProposed pass sync state: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passSyncEngine:sendProposedReconciledState:", self, v4);

}

- (void)_requestAddPassData:(id)a3 forSyncStateItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pk_Sync_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Sync_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "npkDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Requesting that delegate add pass to local pass library\n\tData: %@\n\tSync state item: %@", buf, 0x20u);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __69__NPKPassSyncEngine__requestAddPassData_forSyncStateItem_completion___block_invoke;
  v19[3] = &unk_24CFEAA70;
  v19[4] = self;
  v20 = v9;
  v21 = v10;
  v17 = v10;
  v18 = v9;
  objc_msgSend(v16, "passSyncEngine:requestsAddPassData:forSyncStateItem:completion:", self, v8, v18, v19);

}

uint64_t __69__NPKPassSyncEngine__requestAddPassData_forSyncStateItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Sync_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 1024;
      v15 = a2;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Delegate invoked add completion\n\tsync state item: %@\n\tadded: %d", (uint8_t *)&v10, 0x1Cu);

    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_requestUpdatePassData:(id)a3 forSyncStateItem:(id)a4 baseManifestHashForPartialUpdate:(id)a5 remoteAssetsForPartialUpdate:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  pk_Sync_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    pk_Sync_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "npkDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Requesting that delegate update pass in local pass library\n\tData: %@\n\tSync state item: %@\n\tBase manifest hash for partial update: %@\n\tRemote assets for partial update: %@", buf, 0x34u);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __134__NPKPassSyncEngine__requestUpdatePassData_forSyncStateItem_baseManifestHashForPartialUpdate_remoteAssetsForPartialUpdate_completion___block_invoke;
  v25[3] = &unk_24CFEAA98;
  v25[4] = self;
  v26 = v13;
  v27 = v16;
  v23 = v16;
  v24 = v13;
  objc_msgSend(v22, "passSyncEngine:requestsUpdatePassData:forSyncStateItem:baseManifestHashForPartialUpdate:remoteAssetsForPartialUpdate:completion:", self, v12, v24, v14, v15, v25);

}

uint64_t __134__NPKPassSyncEngine__requestUpdatePassData_forSyncStateItem_baseManifestHashForPartialUpdate_remoteAssetsForPartialUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t result;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Sync_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 1024;
      v17 = a2;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Delegate invoked update completion\n\tsync state item: %@\n\tupdated: %d", (uint8_t *)&v12, 0x1Cu);

    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)_requestRemovePassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Sync_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v11;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Requesting that delegate remove pass in local pass library\n\tunique ID: %@", buf, 0x16u);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__NPKPassSyncEngine__requestRemovePassWithUniqueID_completion___block_invoke;
  v15[3] = &unk_24CFEAA70;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "passSyncEngine:requestsRemovePassWithUniqueID:completion:", self, v14, v15);

}

uint64_t __63__NPKPassSyncEngine__requestRemovePassWithUniqueID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Sync_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 1024;
      v15 = a2;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Delegate invoked remove completion\n\tunique ID: %@\n\tremoved: %d", (uint8_t *)&v10, 0x1Cu);

    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_unexpectedEventOccurred
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Sync_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): encountered unexpected event", (uint8_t *)&v8, 0xCu);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "passSyncEngineEncounteredUnexpectedEvent:", self);

}

- (void)_engineStateChanged
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Sync_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[NPKPassSyncEngine engineName](self, "engineName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Sync state engine (%@): Engine state changed", (uint8_t *)&v8, 0xCu);

    }
  }
  -[NPKPassSyncEngine delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "passSyncEngineStateChanged:", self);

}

- (void)_receivedStateChangeProcessed:(id)a3 changeAccepted:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[NPKPassSyncEngine delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "passSyncEngine:receivedStateChangeProcessed:changeAccepted:", self, v7, v4);

}

- (void)_finishedProcessingChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NPKPassSyncEngine delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "passSyncEngine:finishedProcessingChange:", self, v5);

}

- (NPKPassSyncState)backupState
{
  return self->_backupState;
}

- (unint64_t)engineRole
{
  return self->_engineRole;
}

- (NPKPassSyncEngineDelegate)delegate
{
  return (NPKPassSyncEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NPKPassSyncEngineDataSource)dataSource
{
  return (NPKPassSyncEngineDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NPKPassSyncChange)candidateChange
{
  return self->_candidateChange;
}

- (NPKPassSyncChange)processingChange
{
  return self->_processingChange;
}

- (void)setProcessingChange:(id)a3
{
  objc_storeStrong((id *)&self->_processingChange, a3);
}

- (BOOL)requireAppleAccountForPaymentPasses
{
  return self->_requireAppleAccountForPaymentPasses;
}

- (void)setRequireAppleAccountForPaymentPasses:(BOOL)a3
{
  self->_requireAppleAccountForPaymentPasses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingChange, 0);
  objc_storeStrong((id *)&self->_candidateChange, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_candidateState, 0);
  objc_storeStrong((id *)&self->_reconciledState, 0);
  objc_storeStrong((id *)&self->_backupState, 0);
  objc_storeStrong((id *)&self->_libraryState, 0);
}

@end
