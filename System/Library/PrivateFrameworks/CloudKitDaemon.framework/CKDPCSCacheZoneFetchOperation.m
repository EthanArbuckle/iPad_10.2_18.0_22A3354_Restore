@implementation CKDPCSCacheZoneFetchOperation

- (int)operationType
{
  return 0;
}

- (id)itemTypeName
{
  return CFSTR("zone");
}

- (BOOL)needsZoneishPCS
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  if ((objc_msgSend_fetchOptions(self, a2, v2) & 8) == 0 || objc_msgSend_databaseScope(self, v4, v5) != 2)
    return 0;
  objc_msgSend_zonePCSData(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneishPCSData(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  return v12;
}

- (BOOL)hasAllPCSData
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int v11;

  objc_msgSend_zonePCSData(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_pcs(v4, v5, v6) && (objc_msgSend_needsZoneishPCS(self, v7, v8) & 1) == 0)
    v11 = objc_msgSend_rolledPCSForZone(self, v9, v10) ^ 1;
  else
    LOBYTE(v11) = 0;

  return v11;
}

- (void)_willRetryFetch
{
  objc_super v2;

  self->_shouldCreateZoneishPCS = 0;
  self->_rolledPCSForZone = 0;
  v2.receiver = self;
  v2.super_class = (Class)CKDPCSCacheZoneFetchOperation;
  -[CKDPCSCacheFetchOperation _willRetryFetch](&v2, sel__willRetryFetch);
}

- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4
{
  id v6;
  __CFString *v7;
  CKDPCSCacheZoneFetchOperation *v8;
  _QWORD *v9;
  id *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  _BYTE v41[22];
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v10 = (id *)MEMORY[0x1E0C952B0];
  v11 = (id)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_operationID(v8, v12, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsKeyID(v6, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPublicKeyID(v6, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = CFSTR(" and error ");
    *(_DWORD *)v41 = 138544386;
    v30 = &stru_1E7838F48;
    *(_QWORD *)&v41[4] = v21;
    *(_WORD *)&v41[12] = 2114;
    if (v7)
      v30 = v7;
    else
      v29 = &stru_1E7838F48;
    *(_QWORD *)&v41[14] = v24;
    v42 = 2114;
    v43 = v27;
    v44 = 2114;
    v45 = v29;
    v46 = 2112;
    v47 = v30;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Zone PCS fetch operation %{public}@ received PCS data (%{public}@/%{public}@)%{public}@%@", v41, 0x34u);

  }
  if ((objc_msgSend_didFetchData(v8, v14, v15) & 1) != 0)
  {
    if (*v9 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(v8, v18, v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zonePCSData(v8, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsKeyID(v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsKeyID(v6, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v41 = 138544130;
      *(_QWORD *)&v41[4] = v31;
      *(_WORD *)&v41[12] = 2112;
      *(_QWORD *)&v41[14] = v37;
      v42 = 2112;
      v43 = (uint64_t)v40;
      v44 = 2112;
      v45 = v7;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Zone PCS fetch operation %{public}@ already has PCS data %@. Ignoring the fetch callback with %@/%@", v41, 0x2Au);

    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend_setZonePCSData_(v8, v16, (uint64_t)v6);
      objc_msgSend_setDidFetchData_(v8, v20, 1);
    }
    objc_msgSend_setFetchError_(v8, v16, (uint64_t)v7, *(_OWORD *)v41);
  }
  objc_sync_exit(v8);

}

- (BOOL)_fetchPCSDataFromDatabase
{
  uint64_t v2;
  NSObject *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v11 = v5;
    objc_msgSend_zoneID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_databaseScope(self, v15, v16);
    CKDatabaseScopeString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v14;
    v21 = 2112;
    v22 = v17;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Fetching PCS data for zone %@ from the database with scope %@", buf, 0x16u);

  }
  objc_msgSend_cache(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEA4C920;
  v18[3] = &unk_1E782EE48;
  v18[4] = self;
  objc_msgSend_getSQLCache_(v8, v9, (uint64_t)v18);

  return 1;
}

- (BOOL)_fetchDependentPCS
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  objc_msgSend_zonePCSData(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v15, (uint64_t)a2, self, CFSTR("CKDPCSCacheZoneFetchOperation.m"), 117, CFSTR("We should have PCS data for zone %@ by this point"), v14);

  }
  if (objc_msgSend_databaseScope(self, v6, v7) == 3)
    objc_msgSend__fetchDepedentPCSInSharedDatabase(self, v8, v9);
  return 1;
}

- (void)_fetchDepedentPCSInSharedDatabase
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t Options;
  const char *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend_zonePCSData(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_initWeak(location, self);
    objc_msgSend_zonePCSData(self, v8, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_pcs(v10, v11, v12))
    {
      if ((objc_msgSend_fetchOptions(self, v13, v14) & 0x10) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend_zonePCSData(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharePCSData(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_myParticipantPCS(v20, v21, v22) == 0;

      if (!v23)
      {
LABEL_13:
        objc_destroyWeak(location);
        return;
      }
    }
    else
    {

    }
    objc_msgSend_stateTransitionGroup(self, v24, v25);
    v31 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v31);

    v32 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend_zoneID(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend_initWithRecordName_zoneID_(v32, v36, *MEMORY[0x1E0C949F0], v35);

    objc_msgSend_cache(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    Options = objc_msgSend_fetchOptions(self, v41, v42);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1BEA4D1CC;
    v45[3] = &unk_1E7830AE8;
    objc_copyWeak(&v47, location);
    v10 = v37;
    v46 = v10;
    objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v40, v44, (uint64_t)v10, self, Options, v45);

    objc_destroyWeak(&v47);
    goto LABEL_12;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v26 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v27 = v26;
    objc_msgSend_zoneID(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v30;
    _os_log_debug_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEBUG, "Not fetching zone-wide share PCS for zone %@ in the shared database since it has no shareID", (uint8_t *)location, 0xCu);

  }
}

- (void)_saveZoneToServer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  id v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1BE9BAF78;
  v23[4] = sub_1BE9BAD70;
  v24 = 0;
  v8 = (void *)objc_opt_new();
  v25[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZonesToSave_(v8, v11, (uint64_t)v10);

  objc_msgSend_setAllowDefaultZoneSave_(v8, v12, 1);
  objc_msgSend_setMaxZoneSaveAttempts_(v8, v13, 1);
  objc_msgSend_setDontFetchFromServer_(v8, v14, 1);
  v15 = objc_opt_class();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEA4D554;
  v19[3] = &unk_1E7830B60;
  v22 = v23;
  v16 = v6;
  v20 = v16;
  v17 = v7;
  v21 = v17;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v18, v15, v8, v19);

  _Block_object_dispose(v23, 8);
}

- (void)_saveZoneToServer:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 zoneishPCS:(_OpaquePCSShareProtection *)a5 previousEtag:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, id);
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  const char *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, id))a7;
  objc_msgSend_container(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend_dataFromZonePCS_error_(v20, v21, (uint64_t)a4, &v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v42;

  if (!v23 && v22)
  {
    if (!a5)
      goto LABEL_6;
    objc_msgSend_container(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend_dataFromRecordPCS_error_(v29, v30, (uint64_t)a5, &v41);
    a5 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    v23 = v41;

    if (!v23)
    {
      if (a5)
      {
LABEL_6:
        objc_msgSend_setProtectionData_(v12, v24, (uint64_t)v22);
        objc_msgSend_etagFromPCSData_(CKDPCSManager, v31, (uint64_t)v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setProtectionEtag_(v12, v33, (uint64_t)v32);

        objc_msgSend_setZoneishProtectionData_(v12, v34, (uint64_t)a5);
        objc_msgSend_setPreviousProtectionEtag_(v12, v35, (uint64_t)v13);
        objc_msgSend__saveZoneToServer_completion_(self, v36, (uint64_t)v12, v14);
        v23 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v39 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v23;
      _os_log_error_impl(&dword_1BE990000, v39, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
      if (v23)
        goto LABEL_18;
    }
    else if (v23)
    {
LABEL_18:
      v14[2](v14, v23);
      goto LABEL_19;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v40, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't serialize zoneish PCS"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v37 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v23;
    _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Couldn't serialize zone PCS: %@", buf, 0xCu);
    if (v23)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!v23)
  {
LABEL_11:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v38, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't serialize zone PCS"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v14[2](v14, v23);
LABEL_20:

}

- (void)_saveNewPCSOnZone:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char isSystemRecordZoneID;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  _QWORD *v26;
  os_log_t *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const void *ZonePCSWithError;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const void *v46;
  NSObject *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  id v54;
  const char *v55;
  NSObject *v56;
  const char *v57;
  _QWORD v58[4];
  id v59;
  void (**v60)(id, _QWORD, id);
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend_zoneID(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isDefaultRecordZoneID(v11, v12, v13) & 1) == 0)
  {
    objc_msgSend_zoneID(v7, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isSystemRecordZoneID = objc_msgSend_isSystemRecordZoneID(v16, v17, v18);

    if ((isSystemRecordZoneID & 1) != 0)
      goto LABEL_5;
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v20, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v7, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v25, (uint64_t)a2, self, CFSTR("CKDPCSCacheZoneFetchOperation.m"), 229, CFSTR("We shouldn't be trying to save a new PCS on anything other than the default zone or system zone: %@"), v24);

  }
LABEL_5:
  v26 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v27 = (os_log_t *)MEMORY[0x1E0C952D8];
  v28 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v31 = v28;
    objc_msgSend_zoneID(v7, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v65 = v34;
    _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Saving new PCS on zone %@", buf, 0xCu);

  }
  objc_msgSend_container(self, v29, v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  ZonePCSWithError = (const void *)objc_msgSend_createZonePCSWithError_(v38, v39, (uint64_t)&v63);
  v41 = v63;

  if (v41 || !ZonePCSWithError)
  {
    if (*v26 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v47 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v41;
      _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "Couldn't create new zone PCS: %@", buf, 0xCu);
      if (v41)
      {
LABEL_17:
        if (!ZonePCSWithError)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    else if (v41)
    {
      goto LABEL_17;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v48, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't create a new zone PCS"));
    v41 = (id)objc_claimAutoreleasedReturnValue();
    if (!ZonePCSWithError)
    {
LABEL_35:
      v8[2](v8, 0, v41);

      goto LABEL_36;
    }
LABEL_34:
    CFRelease(ZonePCSWithError);
    goto LABEL_35;
  }
  if ((objc_msgSend_fetchOptions(self, v42, v43) & 8) == 0)
  {
    v46 = 0;
LABEL_21:
    objc_initWeak((id *)buf, self);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_1BEA4E324;
    v58[3] = &unk_1E7830BB0;
    v59 = v7;
    v60 = v8;
    objc_copyWeak(&v61, (id *)buf);
    objc_msgSend__saveZoneToServer_withPCS_zoneishPCS_previousEtag_completion_(self, v55, (uint64_t)v59, ZonePCSWithError, v46, 0, v58);
    CFRelease(ZonePCSWithError);
    if (v46)
      CFRelease(v46);
    objc_destroyWeak(&v61);

    objc_destroyWeak((id *)buf);
    goto LABEL_36;
  }
  objc_msgSend_container(self, v44, v45);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v46 = (const void *)objc_msgSend_createRecordPCSWithZonePCS_sharePCS_createLite_error_(v52, v53, (uint64_t)ZonePCSWithError, 0, 0, &v62);
  v54 = v62;

  if (!v54 && v46)
    goto LABEL_21;
  if (*v26 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v56 = *v27;
  if (os_log_type_enabled(*v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v65 = v54;
    _os_log_error_impl(&dword_1BE990000, v56, OS_LOG_TYPE_ERROR, "Couldn't create new zoneish PCS: %@", buf, 0xCu);
    if (v54)
      goto LABEL_29;
    goto LABEL_28;
  }
  if (!v54)
  {
LABEL_28:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v57, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't create a new zoneish PCS"));
    v54 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_29:
  if (v46)
    CFRelease(v46);
  CFRelease(ZonePCSWithError);
  v8[2](v8, 0, v54);

LABEL_36:
}

- (BOOL)_fetchPCSDataFromServer
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  _QWORD v19[5];

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchAggregator(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentOperation(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEA4EA78;
  v19[3] = &unk_1E78308D0;
  v19[4] = self;
  objc_msgSend_requestFetchOfZoneWithID_forOperation_withCompletionHandler_(v10, v17, (uint64_t)v13, v16, v19);

  return 1;
}

- (BOOL)_createAdditionalPCS
{
  uint64_t v2;
  const char *v4;

  if (objc_msgSend_needsZoneishPCS(self, a2, v2))
    objc_msgSend_setShouldCreateZoneishPCS_(self, v4, 1);
  return 1;
}

- (BOOL)_decryptPCS
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;

  objc_msgSend_zonePCSData(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_zonePCSData(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_pcs(v10, v11, v12);

    if (!v13)
    {
      if (objc_msgSend_databaseScope(self, v14, v15) == 3)
        objc_msgSend__decryptZonePCSInSharedDatabase(self, v16, v17);
      else
        objc_msgSend__decryptZonePCSUsingServiceIdentities(self, v16, v17);
    }
  }
  else
  {
    objc_msgSend_fetchError(self, v8, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v21 = (void *)MEMORY[0x1E0C94FF8];
      v22 = *MEMORY[0x1E0C94B20];
      objc_msgSend_zoneID(self, v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v21, v24, v22, 5004, CFSTR("We don't have zone PCS data for zone %@"), v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFetchError_(self, v26, (uint64_t)v25);

    }
  }
  return v7 != 0;
}

- (void)_decryptZonePCSInSharedDatabase
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const void *v39;
  id v40;
  const char *v41;
  CKDZonePCSData *v42;
  const char *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  CKDZonePCSData *v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend_zonePCSData(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_zonePCSData(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharePCSData(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_pcs(v13, v14, v15);

    if (v16)
    {
      objc_msgSend_container(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zonePCSData(self, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsData(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zonePCSData(self, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sharePCSData(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_pcs(v34, v35, v36);
      v62 = 0;
      v39 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v22, v38, (uint64_t)v28, 3, v37, &v62);
      v40 = v62;

      if (!v39 || v40)
      {
        v42 = 0;
        v60 = 0;
        if (!v39)
        {
LABEL_14:
          objc_msgSend__handleDecryptedZonePCSData_withError_(self, v41, (uint64_t)v60, v40);

          return;
        }
      }
      else
      {
        v42 = objc_alloc_init(CKDZonePCSData);
        objc_msgSend_setPcs_(v42, v43, (uint64_t)v39);
      }
      CFRelease(v39);
      v60 = v42;
      goto LABEL_14;
    }
    objc_msgSend_fetchError(self, v17, v18);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49)
    {
      v52 = (void *)MEMORY[0x1E0C94FF8];
      v53 = *MEMORY[0x1E0C94B20];
      objc_msgSend_dependentPCSFetchError(self, v50, v51);
      v61 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(self, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_error_format_(v52, v57, v53, 5004, v61, CFSTR("We don't have share PCS to decrypt zone PCS data for zone %@"), v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFetchError_(self, v59, (uint64_t)v58);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v44 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v45 = v44;
      objc_msgSend_zoneID(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = v48;
      _os_log_debug_impl(&dword_1BE990000, v45, OS_LOG_TYPE_DEBUG, "Zone %@ in the shared database has no shareID, skipping decryption", buf, 0xCu);

    }
  }
}

- (void)_decryptZonePCSUsingServiceIdentities
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  _QWORD v32[5];

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_msgSend_noteOperationWillWaitOnPCS(self, v5, v6);
  objc_msgSend_container(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSData(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsData(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSData(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSModificationDate(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topmostParentOperation(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1BEA4F54C;
  v32[3] = &unk_1E7830AC0;
  v32[4] = self;
  objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v12, v31, (uint64_t)v18, 0, v24, v30, v32);

}

- (void)_handleDecryptedZonePCSData:(id)a3 withError:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  os_log_t *v13;
  uint64_t *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  id v41;
  void *v42;
  uint64_t v43;
  os_log_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  os_log_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  os_log_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  os_log_t v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  NSObject *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  id v116;
  id v117;
  uint8_t buf[4];
  id v119;
  __int16 v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v9 = objc_msgSend_pcs(a3, v7, v8);
  v12 = v6;
  v13 = (os_log_t *)MEMORY[0x1E0C952D8];
  v14 = (uint64_t *)MEMORY[0x1E0C95300];
  if (v12)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = *v13;
    if (!os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v16 = 0;
      v17 = v12;
LABEL_33:
      v71 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v99 = v71;
        objc_msgSend_zoneID(self, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v119 = v102;
        v120 = 2112;
        v121 = v17;
        _os_log_error_impl(&dword_1BE990000, v99, OS_LOG_TYPE_ERROR, "Error decrypting PCS for zone %@: %@", buf, 0x16u);

      }
      objc_msgSend_setFetchError_(self, v72, (uint64_t)v17);
      goto LABEL_36;
    }
    *(_DWORD *)buf = 138412290;
    v119 = v12;
    _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Warn: Error with PCS data for zone: %@", buf, 0xCu);
    v16 = 0;
    v17 = v12;
LABEL_31:
    if (*v14 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    goto LABEL_33;
  }
  objc_msgSend_zonePCSData(self, v10, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPcs_(v18, v19, v9);

  if (!objc_msgSend_shouldCreateZoneishPCS(self, v20, v21))
  {
    v16 = 0;
    goto LABEL_17;
  }
  objc_msgSend_zonePCSData(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_pcs(v24, v25, v26);

  if (!v27)
  {
    if (*v14 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v58 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v104 = v58;
      objc_msgSend_zoneID(self, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v119 = v107;
      _os_log_error_impl(&dword_1BE990000, v104, OS_LOG_TYPE_ERROR, "We need to create a zoneish PCS but we don't have the zone PCS for zone %@", buf, 0xCu);

    }
    v61 = (void *)MEMORY[0x1E0C94FF8];
    v62 = *MEMORY[0x1E0C94B20];
    objc_msgSend_zoneID(self, v59, v60);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v61, v64, v62, 5004, CFSTR("Couldn't decrypt zone PCS for zone in order to create a zoneish PCS for zone %@"), v63);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
LABEL_30:

    if (!v17)
      goto LABEL_37;
    goto LABEL_31;
  }
  objc_msgSend_container(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSData(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_pcs(v36, v37, v38);
  v117 = 0;
  v16 = (void *)objc_msgSend_createRecordPCSWithZonePCS_sharePCS_createLite_error_(v33, v40, v39, 0, 0, &v117);
  v41 = v117;

  v42 = (void *)*MEMORY[0x1E0C952F8];
  v43 = *v14;
  if (v41 || !v16)
  {
    if (v43 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v42);
    v65 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v112 = v65;
      objc_msgSend_zoneID(self, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v119 = v115;
      _os_log_error_impl(&dword_1BE990000, v112, OS_LOG_TYPE_ERROR, "We need to create a zoneish PCS but we don't have the zone PCS for zone %@", buf, 0xCu);

    }
    v68 = (void *)MEMORY[0x1E0C94FF8];
    v69 = *MEMORY[0x1E0C94B20];
    objc_msgSend_zoneID(self, v66, v67);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v68, v70, v69, 5004, CFSTR("Couldn't create a zoneish PCS for zone %@"), v63);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  if (v43 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v42);
  v44 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
  {
    v108 = v44;
    objc_msgSend_zoneID(self, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v119 = v111;
    v120 = 2112;
    v121 = v16;
    _os_log_debug_impl(&dword_1BE990000, v108, OS_LOG_TYPE_DEBUG, "Created a new zoneish PCS for zone %@: %@", buf, 0x16u);

  }
  objc_msgSend_zonePCSData(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneishPCS_(v47, v48, (uint64_t)v16);

LABEL_17:
  objc_msgSend_zonePCSData(self, v22, v23);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_pcs(v17, v49, v50))
    goto LABEL_36;
  objc_msgSend_zonePCSData(self, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_zoneishPCS(v53, v54, v55))
  {

    goto LABEL_36;
  }
  objc_msgSend_zonePCSData(self, v56, v57);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneishPCSData(v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend_container(self, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(self, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPCSData(v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(self, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_pcs(v91, v92, v93);
    v116 = 0;
    v16 = (void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v82, v95, (uint64_t)v88, 1, v94, &v116);
    v17 = v116;

    if (v17)
    {
      v14 = (uint64_t *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v98 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
        goto LABEL_33;
      *(_DWORD *)buf = 138412290;
      v119 = v17;
      _os_log_impl(&dword_1BE990000, v98, OS_LOG_TYPE_INFO, "Warn: Error with zoneish PCS data for zone: %@", buf, 0xCu);
      goto LABEL_31;
    }
    objc_msgSend_zonePCSData(self, v96, v97);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneishPCS_(v17, v103, (uint64_t)v16);
LABEL_36:

  }
LABEL_37:
  if (v16)
    CFRelease(v16);

}

- (BOOL)_checkAndUpdateZonePCSIfNeeded
{
  uint64_t v2;
  SEL v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  char isEqualToString;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  int isZoneishZone_bypassAllowlistedContainers;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  int v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  const void *v70;
  NSObject *v71;
  int v72;
  int v73;
  int v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  int v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  const char *v100;
  NSObject *v101;
  const char *v102;
  _QWORD *v103;
  os_log_t *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  int v111;
  void *v112;
  void *v113;
  const char *v114;
  int v115;
  void *v116;
  BOOL v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  void *v130;
  const char *v131;
  os_log_t v132;
  _QWORD *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  NSObject *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  void *v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  _QWORD *v148;
  os_log_t *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  NSObject *v157;
  void *v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  const void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  os_log_t v172;
  NSObject *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  NSObject *v177;
  NSObject *v178;
  NSObject *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  NSObject *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  NSObject *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  const char *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  void *v209;
  const char *v210;
  void *v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  NSObject *v217;
  void *v218;
  const char *v219;
  int v220;
  int v221;
  int v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  uint8_t buf[4];
  id v233;
  __int16 v234;
  id v235;
  uint64_t v236;

  v3 = a2;
  v236 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fetchError(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 0;
  objc_msgSend_container(self, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_useAnonymousToServerShareParticipants(v12, v13, v14) & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend_zoneID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v20, v21, *MEMORY[0x1E0C94A38]);

  if ((isEqualToString & 1) == 0)
  {
LABEL_7:
    objc_msgSend_container(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_pcs(v28, v29, v30);

    objc_msgSend_zonePCSData(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_zoneishPCS(v34, v35, v36);

    if (!v31)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v71 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v71, OS_LOG_TYPE_ERROR, "Missing zonePCS when checking for zone key roll requirements, returning", buf, 2u);
      }
      v8 = 0;
      goto LABEL_106;
    }
    objc_msgSend_pcsManager(v25, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    isZoneishZone_bypassAllowlistedContainers = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v40, v41, v31, v37 != 0, 0);

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)CFSTR("ForceKeyRollWhenFetchedFromCache"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend_BOOLValue(v47, v48, v49);

      if (v50)
      {
        isZoneishZone_bypassAllowlistedContainers = 1;
        _PCSFPSetShouldRoll();
      }
    }
    objc_msgSend_container(self, v43, v44);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_specialContainerType(v54, v55, v56);

    if (v57 == 25)
    {
      objc_msgSend_container(self, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v231 = 0;
      objc_msgSend_dataFromZonePCS_error_(v63, v64, v31, &v231);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v231;

      if (v66)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v69 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v66;
          _os_log_impl(&dword_1BE990000, v69, OS_LOG_TYPE_INFO, "Warn: Couldn't export protection data for decrypting with Reminders identity: %@", buf, 0xCu);
        }
        v70 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v224 = v37;
      objc_msgSend_container(self, v67, v68);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v230 = 0;
      v124 = objc_msgSend_createSharePCSFromData_ofType_withService_error_(v122, v123, (uint64_t)v65, 3, 4, &v230);
      v66 = v230;

      v225 = v124;
      if (!v124 || v66)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v70 = (const void *)v124;
        v129 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v188 = v129;
          objc_msgSend_zoneID(self, v189, v190);
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v233 = v191;
          v234 = 2112;
          v235 = v66;
          _os_log_error_impl(&dword_1BE990000, v188, OS_LOG_TYPE_ERROR, "Couldn't decrypt zone %@ with Reminders identity: %@", buf, 0x16u);

        }
        goto LABEL_51;
      }
      v37 = v224;
      v226 = v25;
      objc_msgSend_pcsManager(v25, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(v127, v128, v225, v224 != 0, 0);

    }
    else
    {
      v225 = 0;
      v226 = v25;
      v72 = 0;
    }
    v223 = v37;
    v73 = isZoneishZone_bypassAllowlistedContainers | v72;
    if (v37)
      v74 = isZoneishZone_bypassAllowlistedContainers | v72;
    else
      v74 = 0;
    if (((isZoneishZone_bypassAllowlistedContainers | v74) & 1) != 0 || v72)
    {
      objc_msgSend_container(self, v58, v59);
      v221 = v72;
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_sizeOfPCS_(v78, v79, v31);
      v222 = v74;
      v81 = v31;
      v82 = v3;
      v83 = v73;
      v84 = v80;
      objc_msgSend_container(self, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend_sizeOfPCS_(v90, v91, v223) + v84;

      objc_msgSend_container(self, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v92;
      v73 = v83;
      v3 = v82;
      v31 = v81;
      v74 = v222;
      LODWORD(v78) = objc_msgSend_isPCSSizeTooBigForKeyRoll_(v98, v100, v99);

      v72 = v221;
      if ((_DWORD)v78)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v70 = (const void *)v225;
        v101 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE990000, v101, OS_LOG_TYPE_INFO, "Skipping zone identity key rolling because the combined PCS size is too big.", buf, 2u);
        }
        objc_msgSend_updateCloudKitMetrics_(self, v102, (uint64_t)&unk_1E7830BD0);
        v8 = 0;
        v66 = 0;
LABEL_102:
        v25 = v226;
        if (!v70)
          goto LABEL_104;
        goto LABEL_103;
      }
    }
    if (isZoneishZone_bypassAllowlistedContainers)
    {
      v103 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v104 = (os_log_t *)MEMORY[0x1E0C952D8];
      v105 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        v108 = v105;
        objc_msgSend_zoneID(self, v109, v110);
        v111 = v72;
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v233 = v112;
        _os_log_impl(&dword_1BE990000, v108, OS_LOG_TYPE_INFO, "Updating identity on zone PCS for zone %@", buf, 0xCu);

        v72 = v111;
      }
      if (*MEMORY[0x1E0C95280])
      {
        objc_msgSend_unitTestOverrides(self, v106, v107);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v113, v114, (uint64_t)CFSTR("testUpdatingZonePCSAfterIdentityRoll"));
        v115 = v72;
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        v117 = v116 == 0;
        v72 = v115;
        v118 = v117 ? 0 : 3;
      }
      else
      {
        v118 = 0;
      }
      objc_msgSend_pcsManager(v226, v106, v107);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v130, v131, v31, v118, self);
      v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        if (*v103 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v25 = v226;
        v132 = *v104;
        if (os_log_type_enabled(*v104, OS_LOG_TYPE_ERROR))
        {
          v180 = v132;
          objc_msgSend_zoneID(self, v181, v182);
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v233 = v183;
          v234 = 2112;
          v235 = v66;
          _os_log_error_impl(&dword_1BE990000, v180, OS_LOG_TYPE_ERROR, "Couldn't update identity on zone PCS for zone %@: %@", buf, 0x16u);

        }
        v8 = 0;
        v70 = (const void *)v225;
        if (!v225)
          goto LABEL_104;
        goto LABEL_103;
      }
    }
    v70 = (const void *)v225;
    if (v72)
    {
      v133 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v134 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v137 = v134;
        objc_msgSend_zoneID(self, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v233 = v140;
        _os_log_impl(&dword_1BE990000, v137, OS_LOG_TYPE_INFO, "Reminders zone %@ needs to be rolled for the Reminders identity", buf, 0xCu);

      }
      objc_msgSend_pcsManager(v226, v135, v136);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateIdentityAndRollKeyForZonePCS_usingServiceIdentityWithType_forOperation_(v141, v142, v225, 4, self);
      v66 = (id)objc_claimAutoreleasedReturnValue();

      v31 = v225;
      if (v66)
      {
        if (*v133 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v25 = v226;
        v143 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          v144 = v143;
          objc_msgSend_zoneID(self, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v233 = v147;
          v234 = 2112;
          v235 = v66;
          _os_log_error_impl(&dword_1BE990000, v144, OS_LOG_TYPE_ERROR, "Couldn't roll Reminders identity on zone PCS for zone %@: %@", buf, 0x16u);

        }
        goto LABEL_52;
      }
    }
    if (v74)
    {
      v148 = (_QWORD *)MEMORY[0x1E0C95300];
      v25 = v226;
      v220 = v73;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v149 = (os_log_t *)MEMORY[0x1E0C952D8];
      v150 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v184 = v150;
        objc_msgSend_zoneID(self, v185, v186);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v233 = v187;
        _os_log_debug_impl(&dword_1BE990000, v184, OS_LOG_TYPE_DEBUG, "Updating zoneish PCS on zone %@", buf, 0xCu);

      }
      objc_msgSend_pcsManager(v226, v151, v152);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(v153, v154, v223, 1, 0, self);
      v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        if (*v148 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v157 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v66;
          _os_log_error_impl(&dword_1BE990000, v157, OS_LOG_TYPE_ERROR, "Couldn't roll master key for zoneish PCS: %@", buf, 0xCu);
        }
LABEL_52:
        v8 = 0;
        if (!v70)
        {
LABEL_104:
          if (v66)
          {
            objc_msgSend_setFetchError_(self, v58, (uint64_t)v66);

          }
LABEL_106:

          return v8;
        }
LABEL_103:
        CFRelease(v70);
        goto LABEL_104;
      }
      objc_msgSend_pcsManager(v226, v155, v156);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = 0;
      objc_msgSend_dataFromRecordPCS_error_(v158, v159, v223, &v229);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v229;

      if (v66 || !v160)
      {
        if (*v148 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v177 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v66;
          _os_log_error_impl(&dword_1BE990000, v177, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        goto LABEL_101;
      }
      objc_msgSend_pcsManager(v226, v161, v162);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = 0;
      v165 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v163, v164, (uint64_t)v160, 1, v31, &v228);
      v66 = v228;

      if (v66 || !v165)
      {
        if (*v148 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v178 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v66;
          _os_log_error_impl(&dword_1BE990000, v178, OS_LOG_TYPE_ERROR, "Couldn't decode zoneishPCS data: %@", buf, 0xCu);
          if (!v165)
            goto LABEL_100;
        }
        else if (!v165)
        {
LABEL_100:
          v70 = (const void *)v225;
LABEL_101:

          v8 = 0;
          goto LABEL_102;
        }
LABEL_99:
        CFRelease(v165);
        goto LABEL_100;
      }
      objc_msgSend_pcsManager(v226, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(v168, v169, (uint64_t)v165, v31, 1, 0);
      v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        if (*v148 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v172 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          v173 = v172;
          objc_msgSend_zoneID(self, v174, v175);
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v233 = v176;
          v234 = 2112;
          v235 = v66;
          _os_log_error_impl(&dword_1BE990000, v173, OS_LOG_TYPE_ERROR, "Couldn't update identity on zoneish PCS for zone %@: %@", buf, 0x16u);

        }
        goto LABEL_99;
      }
      objc_msgSend_zonePCSData(self, v170, v171);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishPCS_(v192, v193, (uint64_t)v165);

      CFRelease(v165);
      objc_msgSend_zonePCSData(self, v194, v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = objc_msgSend_zoneishPCS(v196, v197, v198);

      objc_msgSend_pcsManager(v226, v200, v201);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      v227 = 0;
      objc_msgSend_dataFromRecordPCS_error_(v202, v203, v199, &v227);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v227;

      if (v66 || !v204)
      {
        if (*v148 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v217 = *v149;
        if (os_log_type_enabled(*v149, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v233 = v66;
          _os_log_error_impl(&dword_1BE990000, v217, OS_LOG_TYPE_ERROR, "Couldn't serialize zoneish PCS: %@", buf, 0xCu);
        }
        v160 = v204;
        goto LABEL_100;
      }
      objc_msgSend_zonePCSData(self, v205, v206);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishPCSData_(v207, v208, (uint64_t)v204);

      v70 = (const void *)v225;
      v73 = v220;
    }
    v25 = v226;
    if (v73)
    {
      if (*MEMORY[0x1E0C95280])
      {
        objc_msgSend_unitTestOverrides(self, v58, v59);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v209, v210, (uint64_t)CFSTR("ShouldNotKeyRollWhenFetchedFromCache"));
        v211 = (void *)objc_claimAutoreleasedReturnValue();

        if (v211)
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v58, v212);
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v218, v219, (uint64_t)v3, self, CFSTR("CKDPCSCacheZoneFetchOperation.m"), 627, CFSTR("Did not expect a key roll"));

        }
      }
      v8 = 1;
      objc_msgSend_setRolledPCSForZone_(self, v58, 1);
      objc_msgSend_zonePCSData(self, v213, v214);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPcs_(v215, v216, v31);

    }
    else
    {
      v8 = 0;
    }
    v66 = 0;
    if (!v70)
      goto LABEL_104;
    goto LABEL_103;
  }
  return 0;
}

- (BOOL)_saveUpdatedPCSToServer
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const __CFString *v42;
  const __CFString *v43;
  _QWORD v44[5];
  id v45;
  _BYTE location[12];
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_shouldCreateZoneishPCS(self, a2, v2) & 1) != 0
    || objc_msgSend_rolledPCSForZone(self, v4, v5))
  {
    objc_msgSend_stateTransitionGroup(self, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v6);

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v7 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v34 = v7;
      objc_msgSend_zoneID(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_shouldCreateZoneishPCS(self, v38, v39))
        v42 = CFSTR("YES");
      else
        v42 = CFSTR("NO");
      *(_DWORD *)location = 138543874;
      if (objc_msgSend_rolledPCSForZone(self, v40, v41))
        v43 = CFSTR("YES");
      else
        v43 = CFSTR("NO");
      *(_QWORD *)&location[4] = v37;
      v47 = 2114;
      v48 = v42;
      v49 = 2114;
      v50 = v43;
      _os_log_debug_impl(&dword_1BE990000, v34, OS_LOG_TYPE_DEBUG, "Saving the new Zone PCS to the server for zone %{public}@ due to shouldCreateZoneishPCS: %{public}@, rolledPCSForZone: %{public}@", location, 0x20u);

    }
    v8 = objc_alloc(MEMORY[0x1E0C95088]);
    objc_msgSend_zoneID(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend_initWithZoneID_(v8, v12, (uint64_t)v11);

    objc_initWeak((id *)location, self);
    objc_msgSend_zonePCSData(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_pcs(v16, v17, v18);
    objc_msgSend_zonePCSData(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_zoneishPCS(v22, v23, v24);
    objc_msgSend_zonePCSData(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etag(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1BEA50FD0;
    v44[3] = &unk_1E78307E0;
    objc_copyWeak(&v45, (id *)location);
    v44[4] = self;
    objc_msgSend__saveZoneToServer_withPCS_zoneishPCS_previousEtag_completion_(self, v32, (uint64_t)v13, v19, v25, v31, v44);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)location);

  }
  return 1;
}

- (BOOL)_savePCSDataToCache
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;

  objc_initWeak(&location, self);
  if ((objc_msgSend_wasFetchedFromCache(self, v3, v4) & 1) != 0)
  {
    objc_msgSend_stateTransitionGroup(self, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v7);

    objc_msgSend_cache(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_databaseScope(self, v17, v18);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_1BEA513EC;
    v34[3] = &unk_1E78309E8;
    v20 = &v35;
    objc_copyWeak(&v35, &location);
    objc_msgSend_updateMemoryCacheWithZonePCSData_forZoneWithID_databaseScope_withCompletionHandler_(v10, v21, (uint64_t)v13, v16, v19, v34);
  }
  else
  {
    objc_msgSend_stateTransitionGroup(self, v5, v6);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v22);

    objc_msgSend_cache(self, v23, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(self, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(self, v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_databaseScope(self, v29, v30);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1BEA513A8;
    v36[3] = &unk_1E78309E8;
    v20 = &v37;
    objc_copyWeak(&v37, &location);
    objc_msgSend__setPCSData_forFetchedZoneID_withScope_withCompletionHandler_(v10, v32, (uint64_t)v13, v16, v31, v36);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)shouldCreateZoneishPCS
{
  return self->_shouldCreateZoneishPCS;
}

- (void)setShouldCreateZoneishPCS:(BOOL)a3
{
  self->_shouldCreateZoneishPCS = a3;
}

- (BOOL)rolledPCSForZone
{
  return self->_rolledPCSForZone;
}

- (void)setRolledPCSForZone:(BOOL)a3
{
  self->_rolledPCSForZone = a3;
}

@end
