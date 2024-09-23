@implementation CKDPCSCacheRecordFetchOperation

- (id)itemTypeName
{
  return CFSTR("record");
}

- (BOOL)needsChainPCSCreation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  if ((objc_msgSend_fetchOptions(self, a2, v2) & 4) == 0)
    return 0;
  objc_msgSend_recordPCSData(self, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_chainPCSData(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10 == 0;

  return v6;
}

- (BOOL)hasAllPCSData
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  if ((objc_msgSend_serverRecordHasNoProtectionData(self, a2, v2) & 1) != 0)
    return 1;
  objc_msgSend_recordPCSData(self, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_pcs(v7, v8, v9) != 0;

  return v6;
}

- (void)_handlePCSDataFetched:(id)a3 withError:(id)a4
{
  id v6;
  __CFString *v7;
  CKDPCSCacheRecordFetchOperation *v8;
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
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Record PCS fetch operation %{public}@ received PCS data (%{public}@/%{public}@)%{public}@%@", v41, 0x34u);

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
      objc_msgSend_recordPCSData(v8, v32, v33);
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
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Record PCS fetch operation %{public}@ already has PCS data %@. Ignoring the fetch callback with %@/%@", v41, 0x2Au);

    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend_setRecordPCSData_(v8, v16, (uint64_t)v6);
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
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v11 = v5;
    objc_msgSend_recordID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v14;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Fetching PCS data for record %@ from the database", buf, 0xCu);

  }
  objc_msgSend_cache(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEBC1DDC;
  v15[3] = &unk_1E782EE48;
  v15[4] = self;
  objc_msgSend_getSQLCache_(v8, v9, (uint64_t)v15);

  return 1;
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
  objc_msgSend_recordID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentOperation(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1BEBC23B0;
  v19[3] = &unk_1E78325F0;
  v19[4] = self;
  objc_msgSend_requestFetchOfRecordWithID_forOperation_withCompletionHandler_(v10, v17, (uint64_t)v13, v16, v19);

  return 1;
}

- (BOOL)_createAdditionalPCS
{
  uint64_t v2;
  void *v4;
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
  id v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_needsChainPCSCreation(self, a2, v2))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v4 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v35 = v4;
      objc_msgSend_recordID(self, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v38;
      _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "PCS data from server for %@ has no PCS chaining blob. Creating it and saving the record to the server", buf, 0xCu);

    }
    objc_msgSend_stateTransitionGroup(self, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v7);

    objc_msgSend_recordPCSData(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordType(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    if (v13)
    {
      v17 = v13;
    }
    else
    {
      objc_msgSend_serverRecordType(self, v14, v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    v19 = objc_alloc(MEMORY[0x1E0C95048]);
    objc_msgSend_recordID(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend_initWithRecordType_recordID_(v19, v23, (uint64_t)v18, v22);

    objc_msgSend_setWantsChainPCS_(v24, v25, 1);
    v26 = (void *)objc_opt_new();
    objc_msgSend_setSavePolicy_(v26, v27, 1);
    v41 = v24;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v28, (uint64_t)&v41, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRecordsToSave_(v26, v30, (uint64_t)v29);

    v31 = objc_opt_class();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = sub_1BEBC27E4;
    v39[3] = &unk_1E782E558;
    v39[4] = self;
    v40 = v24;
    v32 = v24;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v33, v31, v26, v39);

  }
  return 1;
}

- (BOOL)_fetchPCSForPrivateZone
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  os_log_t *v15;
  os_log_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  os_log_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t Options;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordPCSData(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_pcs(v4, v5, v6);

  if (!v7)
  {
    objc_msgSend_recordPCSData(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (_QWORD *)MEMORY[0x1E0C95300];
    v15 = (os_log_t *)MEMORY[0x1E0C952D8];
    if (!v13)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v16 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
      {
        v19 = v16;
        objc_msgSend_recordID(self, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v52 = v22;
        _os_log_impl(&dword_1BE990000, v19, OS_LOG_TYPE_INFO, "Warn: We don't have a zone ID in our PCS data for record %@. Using the record's zone ID instead", buf, 0xCu);

      }
      objc_msgSend_recordID(self, v17, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v23, v24, v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (*v14 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
    {
      v45 = v26;
      objc_msgSend_recordID(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v13;
      v53 = 2112;
      v54 = v48;
      _os_log_debug_impl(&dword_1BE990000, v45, OS_LOG_TYPE_DEBUG, "Fetching PCS for zone %@ in order to decrypt record %@", buf, 0x16u);

    }
    objc_msgSend_stateTransitionGroup(self, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v29);

    objc_initWeak((id *)buf, self);
    Options = objc_msgSend_fetchOptions(self, v30, v31);
    objc_msgSend_recordPCSData(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPublicKeyID(v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_cache(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      v42 = Options | 8;
    else
      v42 = Options;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_1BEBC2E70;
    v49[3] = &unk_1E7836680;
    objc_copyWeak(&v50, (id *)buf);
    objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v41, v43, (uint64_t)v13, self, v42, v49);

    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)buf);

  }
  return 1;
}

- (BOOL)_fetchDependentPCSInSharedDatabase
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  _BOOL4 v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
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
  uint64_t v32;
  _QWORD *v33;
  id *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  BOOL v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  id v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t Options;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  const char *v106;
  NSObject *v107;
  id v108;
  id v109;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD *v130;
  id v131;
  _QWORD v132[5];
  id v133;
  NSObject *v134;
  _QWORD *v135;
  id v136;
  _QWORD v137[4];
  NSObject *v138;
  _QWORD *v139;
  id v140;
  _QWORD v141[4];
  NSObject *v142;
  _QWORD *v143;
  id v144;
  _QWORD v145[3];
  char v146;
  id location;
  uint8_t buf[4];
  id v149;
  __int16 v150;
  void *v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  objc_msgSend_recordPCSData(self, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_pcs(v5, v6, v7))
  {

    goto LABEL_6;
  }
  if ((objc_msgSend_fetchOptions(self, v8, v9) & 0x10) == 0)
  {
LABEL_37:

    goto LABEL_38;
  }
  objc_msgSend_recordPCSData(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_signingPCS(v12, v13, v14) == 0;

  if (v15)
  {
LABEL_6:
    v5 = dispatch_group_create();
    objc_msgSend_stateTransitionGroup(self, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v18);

    v145[0] = 0;
    v145[1] = v145;
    v145[2] = 0x2020000000;
    v146 = 0;
    objc_msgSend_recordPCSData(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareID(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_recordPCSData(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parentID(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (_QWORD *)MEMORY[0x1E0C95300];
    v34 = (id *)MEMORY[0x1E0C952D8];
    if (v24)
    {
      objc_msgSend_container(self, v31, v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend_specialContainerType(v38, v39, v40) == 21;

      if (v41 || v30 == 0)
        goto LABEL_15;
    }
    else if (!v30)
    {
LABEL_20:
      objc_msgSend_recordPCSData(self, v31, v32);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parentID(v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73 == 0;

      if (!v74)
      {
        v24 = 0;
LABEL_22:
        objc_msgSend_recordPCSData(self, v68, v69);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v75, v76, v77);
        v78 = (id)objc_claimAutoreleasedReturnValue();

        if (v78)
          goto LABEL_28;
        if (*v33 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v79 = *v34;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_recordID(self, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v149 = v82;
          _os_log_impl(&dword_1BE990000, v79, OS_LOG_TYPE_INFO, "Warn: We don't have a zone ID in our PCS data for record %@. Using the record's zone ID instead", buf, 0xCu);

        }
        objc_msgSend_recordID(self, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v85, v86, v87);
        v78 = (id)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
LABEL_28:
          if (*v33 != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v90 = *v34;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_recordID(self, v91, v92);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v149 = v78;
            v150 = 2112;
            v151 = v117;
            _os_log_debug_impl(&dword_1BE990000, v90, OS_LOG_TYPE_DEBUG, "Fetching PCS for zone %@ in order to decrypt record %@", buf, 0x16u);

          }
          dispatch_group_enter(v5);
          Options = objc_msgSend_fetchOptions(self, v93, v94);
          objc_msgSend_recordPCSData(self, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_zoneishPublicKeyID(v98, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_cache(self, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (v101)
            v105 = Options | 8;
          else
            v105 = Options;
          v132[0] = MEMORY[0x1E0C809B0];
          v132[1] = 3221225472;
          v132[2] = sub_1BEBC3B98;
          v132[3] = &unk_1E78366F8;
          objc_copyWeak(&v136, &location);
          v132[4] = self;
          v78 = v78;
          v133 = v78;
          v135 = v145;
          v134 = v5;
          objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v104, v106, (uint64_t)v78, self, v105, v132);

          objc_destroyWeak(&v136);
        }
        objc_msgSend_callbackQueue(self, v88, v89);
        v107 = objc_claimAutoreleasedReturnValue();
        v127[0] = MEMORY[0x1E0C809B0];
        v127[1] = 3221225472;
        v127[2] = sub_1BEBC3E48;
        v127[3] = &unk_1E7836720;
        objc_copyWeak(&v131, &location);
        v129 = v78;
        v130 = v145;
        v128 = v24;
        v108 = v78;
        v109 = v24;
        dispatch_group_notify(v5, v107, v127);

        objc_destroyWeak(&v131);
        _Block_object_dispose(v145, 8);
        goto LABEL_37;
      }
      if (*v33 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v111 = *v34;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_recordID(self, v112, v113);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v149 = v126;
        _os_log_debug_impl(&dword_1BE990000, v111, OS_LOG_TYPE_DEBUG, "Assuming %@ is a share since we have no share or parent ID set", buf, 0xCu);

      }
      objc_msgSend_recordID(self, v114, v115);
      v116 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v116;
      if (!v116)
        goto LABEL_22;
LABEL_15:
      if (*v33 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v58 = *v34;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_recordID(self, v59, v60);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v149 = v24;
        v150 = 2112;
        v151 = v118;
        _os_log_debug_impl(&dword_1BE990000, v58, OS_LOG_TYPE_DEBUG, "Fetching PCS for share %@ in order to decrypt record %@", buf, 0x16u);

      }
      dispatch_group_enter(v5);
      objc_msgSend_cache(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend_fetchOptions(self, v64, v65);
      v137[0] = MEMORY[0x1E0C809B0];
      v137[1] = 3221225472;
      v137[2] = sub_1BEBC3AA0;
      v137[3] = &unk_1E78366D0;
      objc_copyWeak(&v140, &location);
      v139 = v145;
      v138 = v5;
      objc_msgSend_fetchPCSForShareWithID_forOperation_options_withCompletionHandler_(v63, v67, (uint64_t)v24, self, v66, v137);

      objc_destroyWeak(&v140);
      goto LABEL_22;
    }
    if (*v33 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v42 = *v34;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_recordPCSData(self, v43, v44);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parentID(v119, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(self, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v149 = v122;
      v150 = 2112;
      v151 = v125;
      _os_log_debug_impl(&dword_1BE990000, v42, OS_LOG_TYPE_DEBUG, "Fetching parent PCS from record %@ for child record %@", buf, 0x16u);

    }
    v47 = objc_msgSend_fetchOptions(self, v45, v46);
    dispatch_group_enter(v5);
    objc_msgSend_cache(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parentID(v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v141[0] = MEMORY[0x1E0C809B0];
    v141[1] = 3221225472;
    v141[2] = sub_1BEBC39A8;
    v141[3] = &unk_1E78366A8;
    objc_copyWeak(&v144, &location);
    v143 = v145;
    v142 = v5;
    objc_msgSend_fetchPCSForRecordWithID_forOperation_options_withCompletionHandler_(v50, v57, (uint64_t)v56, self, v47 | 4, v141);

    objc_destroyWeak(&v144);
    if (v24)
      goto LABEL_15;
    goto LABEL_20;
  }
LABEL_38:
  objc_destroyWeak(&location);
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
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  objc_msgSend_recordPCSData(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v15, (uint64_t)a2, self, CFSTR("CKDPCSCacheRecordFetchOperation.m"), 343, CFSTR("We should have PCS data for record %@ by this point"), v14);

  }
  if (objc_msgSend_databaseScope(self, v6, v7) == 2)
    return MEMORY[0x1E0DE7D20](self, sel__fetchPCSForPrivateZone, v9);
  if (objc_msgSend_databaseScope(self, v8, v9) == 3)
    return MEMORY[0x1E0DE7D20](self, sel__fetchDependentPCSInSharedDatabase, v10);
  return 1;
}

- (BOOL)_decryptRecordPCSInPrivateDatabase
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
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
  uint64_t v33;
  const void *v34;
  id v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  BOOL v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  id v77;
  uint8_t buf[16];

  objc_msgSend_recordPCSData(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_pcs(v7, v8, v9);

  if (v10)
  {
    objc_msgSend_recordPCSData(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPublicKeyID(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_recordPCSData(self, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zonePCSData(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_zoneishPCS(v22, v23, v24);

      if (v25)
      {
        objc_msgSend_recordPCSData(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zonePCSData(v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (const void *)objc_msgSend_zoneishPCS(v31, v32, v33);

        CFRetain(v34);
        if (v34)
        {
          v35 = 0;
          goto LABEL_14;
        }
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v46 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE990000, v46, OS_LOG_TYPE_ERROR, "Record has a zoneish public key set, but we didn't fetch a zoneish PCS on this zone. We'll try decrypting the record PCS anyway, but this might fail.", buf, 2u);
        }
      }
    }
    objc_msgSend_container(self, v17, v18);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsData(v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_pcs(v62, v63, v64);
    v77 = 0;
    v34 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v50, v66, (uint64_t)v56, 1, v65, &v77);
    v35 = v77;

    if (!v34)
    {
      v69 = (void *)MEMORY[0x1E0C94FF8];
      v70 = *MEMORY[0x1E0C94B20];
      objc_msgSend_recordID(self, v17, v18);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_error_format_(v69, v72, v70, 5004, v35, CFSTR("Failed to decrypt PCS data for record %@"), v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFetchError_(self, v74, (uint64_t)v73);

      objc_msgSend_setShouldRetry_(self, v75, 1);
      v45 = 0;
      goto LABEL_16;
    }
LABEL_14:
    objc_msgSend_recordPCSData(self, v17, v18);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPcs_(v67, v68, (uint64_t)v34);

    CFRelease(v34);
    v45 = 1;
LABEL_16:

    return v45;
  }
  objc_msgSend_fetchError(self, v11, v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    v39 = (void *)MEMORY[0x1E0C94FF8];
    v40 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(self, v37, v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v39, v42, v40, 5004, CFSTR("We couldn't get zone PCS data for record %@"), v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFetchError_(self, v44, (uint64_t)v43);

  }
  return 0;
}

- (BOOL)_decryptRecordPCSInSharedDatabase
{
  uint64_t v2;
  void *v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const void *v32;
  id v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  BOOL v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  const char *v109;
  void *v110;
  const char *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  NSObject *v120;
  NSObject *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  NSObject *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  id v156;
  uint8_t buf[4];
  void *v158;
  __int16 v159;
  void *v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordPCSData(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentPCSData(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_chainPCSData(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_pcs(v11, v12, v13);

  if (v14)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v121 = v17;
      objc_msgSend_recordID(self, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordPCSData(self, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parentID(v127, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v158 = v124;
      v159 = 2112;
      v160 = v130;
      _os_log_debug_impl(&dword_1BE990000, v121, OS_LOG_TYPE_DEBUG, "Attempting a decrypt of record %@ via its parent PCS (record %@)", buf, 0x16u);

    }
    objc_msgSend_recordPCSData(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parentPCSData(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chainPCSData(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_pcs(v26, v27, v28);

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend_recordPCSData(self, v15, v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSData(v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_pcs(v37, v38, v39);

  if (!v40)
  {
    objc_msgSend_recordPCSData(self, v41, v42);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharePCSData(v88, v89, v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_pcs(v91, v92, v93);

    if (!v94)
      goto LABEL_27;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v95 = (id)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_recordID(self, v96, v97);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordPCSData(self, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareID(v147, v148, v149);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = v152;
      if (!v152)
      {
        objc_msgSend_recordPCSData(self, v150, v151);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharePCSData(v3, v154, v155);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412546;
      v158 = v144;
      v159 = 2112;
      v160 = v153;
      _os_log_debug_impl(&dword_1BE990000, v95, OS_LOG_TYPE_DEBUG, "Attempting a decrypt of record %@ via its share PCS (record %@)", buf, 0x16u);
      if (!v152)
      {

      }
    }

    objc_msgSend_recordPCSData(self, v98, v99);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharePCSData(v20, v100, v101);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_pcs(v23, v102, v103);
    goto LABEL_7;
  }
  v43 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v44 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v131 = v44;
    objc_msgSend_recordID(self, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v135, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(v137, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v140, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v158 = v134;
    v159 = 2112;
    v160 = v143;
    _os_log_debug_impl(&dword_1BE990000, v131, OS_LOG_TYPE_DEBUG, "Attempting a decrypt of record %@ via its shared zone PCS (zone %@)", buf, 0x16u);

  }
  objc_msgSend_recordPCSData(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSData(v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_pcs(v50, v51, v52);

  objc_msgSend_recordPCSData(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneishPublicKeyID(v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend_recordPCSData(self, v30, v31);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSData(v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend_zoneishPCS(v62, v63, v64);

    if (v65)
    {
      objc_msgSend_recordPCSData(self, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zonePCSData(v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (const void *)objc_msgSend_zoneishPCS(v71, v72, v73);

      CFRetain(v32);
      if (v29)
        goto LABEL_9;
      goto LABEL_27;
    }
    if (*v43 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v120 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v120, OS_LOG_TYPE_ERROR, "Record has a zoneish public key set, but we didn't fetch a zoneish PCS on this zone. We'll try decrypting the record PCS anyway, but this might fail.", buf, 2u);
    }
  }
LABEL_8:
  v32 = 0;
  if (v29)
  {
LABEL_9:
    if (v32)
    {
      v33 = 0;
LABEL_21:
      objc_msgSend_recordPCSData(self, v30, v31);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPcs_(v85, v86, (uint64_t)v32);

      CFRelease(v32);
      v87 = 1;
LABEL_32:

      return v87;
    }
    objc_msgSend_container(self, v30, v31);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsData(v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = 0;
    v32 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(v77, v84, (uint64_t)v83, 1, v29, &v156);
    v33 = v156;

    if (v32)
      goto LABEL_21;
    v112 = (void *)MEMORY[0x1E0C94FF8];
    v113 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(self, v30, v31);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_error_format_(v112, v115, v113, 5004, v33, CFSTR("Failed to decrypt PCS data for record %@"), v114);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFetchError_(self, v117, (uint64_t)v116);

    objc_msgSend_setShouldRetry_(self, v118, 1);
LABEL_31:
    v87 = 0;
    goto LABEL_32;
  }
LABEL_27:
  objc_msgSend_fetchError(self, v30, v31);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v104)
  {
    v107 = (void *)MEMORY[0x1E0C94FF8];
    v108 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(self, v105, v106);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v107, v109, v108, 5004, CFSTR("We couldn't get any dependent PCS data to decrypt shared record %@"), v33);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFetchError_(self, v111, (uint64_t)v110);

    goto LABEL_31;
  }
  return 0;
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
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char v18;
  const char *v19;
  uint64_t v20;
  char v21;
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
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  int shouldRetry;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  BOOL v97;
  const char *v98;
  uint64_t v99;
  CKDWrappingContext *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  _BOOL4 v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  NSObject *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  const char *v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  NSObject *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  NSObject *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  NSObject *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  NSObject *v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  NSObject *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  NSObject *v216;
  const char *v217;
  uint64_t v218;
  void *v219;
  NSObject *v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  _QWORD v225[4];
  id v226;
  _QWORD v227[4];
  id v228;
  _QWORD v229[4];
  id v230;
  _QWORD v231[4];
  id v232;
  uint8_t buf[4];
  void *v234;
  __int16 v235;
  void *v236;
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordPCSData(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend_recordPCSData(self, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPublicKeyID(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend_fetchError(self, v10, v11);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
      {
        v57 = (void *)MEMORY[0x1E0C94FF8];
        objc_msgSend_recordID(self, v55, v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(v57, v59, *MEMORY[0x1E0C94B20], 5004, CFSTR("We don't have record PCS data for record %@"), v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFetchError_(self, v61, (uint64_t)v60);

      }
      LOBYTE(shouldRetry) = 0;
      return shouldRetry;
    }
  }
  if (objc_msgSend_databaseScope(self, v10, v11) == 2)
  {
    v18 = objc_msgSend__decryptRecordPCSInPrivateDatabase(self, v16, v17);
LABEL_8:
    v21 = v18;
    goto LABEL_10;
  }
  if (objc_msgSend_databaseScope(self, v16, v17) == 3)
  {
    v18 = objc_msgSend__decryptRecordPCSInSharedDatabase(self, v19, v20);
    goto LABEL_8;
  }
  v21 = 1;
LABEL_10:
  if ((objc_msgSend_fetchOptions(self, v19, v20) & 4) != 0)
  {
    objc_msgSend_recordPCSData(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chainPCSData(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend_container(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordPCSData(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decryptChainPCSForRecordPCS_(v33, v37, (uint64_t)v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38
        || (objc_msgSend_recordPCSData(self, v39, v40),
            v63 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_chainPCSData(v63, v64, v65),
            v66 = (void *)objc_claimAutoreleasedReturnValue(),
            v69 = objc_msgSend_pcs(v66, v67, v68),
            v66,
            v63,
            !v69))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v41 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          v208 = v41;
          objc_msgSend_recordID(self, v209, v210);
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v234 = v211;
          v235 = 2112;
          v236 = v38;
          _os_log_debug_impl(&dword_1BE990000, v208, OS_LOG_TYPE_DEBUG, "Error decrypting chain PCS on record %@: %@", buf, 0x16u);

        }
        v44 = (void *)MEMORY[0x1E0C94FF8];
        objc_msgSend_recordID(self, v42, v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_error_format_(v44, v46, *MEMORY[0x1E0C94B20], 5004, v38, CFSTR("Couldn't decrypt chain PCS on record %@"), v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFetchError_(self, v48, (uint64_t)v47);

      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v70 = (void *)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          v216 = v70;
          objc_msgSend_recordID(self, v217, v218);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v234 = v219;
          _os_log_debug_impl(&dword_1BE990000, v216, OS_LOG_TYPE_DEBUG, "Successfully decrypted chain PCS data on record %@", buf, 0xCu);

        }
      }

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v49 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v50 = v49;
        objc_msgSend_recordID(self, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v234 = v53;
        _os_log_debug_impl(&dword_1BE990000, v50, OS_LOG_TYPE_DEBUG, "Didn't get any chain PCS data on record %@, but the client requested it. This might be ok since the client might want to create it", buf, 0xCu);

      }
    }
  }
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_unitTestOverrides(self, v22, v23);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v71, v72, (uint64_t)CFSTR("ReturnWrappedEPSKForRecordPCS"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_recordPCSData(self, v22, v23);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encryptedPublicSharingKey(v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setData_(v77, v78, 0);

    }
  }
  objc_msgSend_recordPCSData(self, v22, v23);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedPublicSharingKey(v79, v80, v81);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v84)
    goto LABEL_50;
  objc_msgSend_recordPCSData(self, v82, v83);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedPublicSharingKey(v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {

LABEL_49:
LABEL_50:

    goto LABEL_51;
  }
  objc_msgSend_recordPCSData(self, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend_pcs(v94, v95, v96) == 0;

  if (!v97)
  {
    v100 = [CKDWrappingContext alloc];
    objc_msgSend_recordID(self, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v100, v104, (uint64_t)v103, *MEMORY[0x1E0C95380], 0, 0, 0);

    objc_msgSend_container(self, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedPublicSharingKey(v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend_pcs(v119, v120, v121);
    objc_msgSend_unwrapEncryptedData_withPCS_inContext_(v110, v123, (uint64_t)v116, v122, v79);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
      goto LABEL_39;
    objc_msgSend_recordPCSData(self, v124, v125);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedPublicSharingKey(v134, v135, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v137, v138, v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v140 == 0;

    if (v141)
    {
LABEL_39:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v126 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v212 = v126;
        objc_msgSend_recordID(self, v213, v214);
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v234 = v215;
        v235 = 2112;
        v236 = v84;
        _os_log_debug_impl(&dword_1BE990000, v212, OS_LOG_TYPE_DEBUG, "Error decrypting public sharing key on record %@: %@", buf, 0x16u);

      }
      v129 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_recordID(self, v127, v128);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_error_format_(v129, v131, *MEMORY[0x1E0C94B20], 5004, v84, CFSTR("Couldn't decrypt public sharing key on record %@"), v130);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFetchError_(self, v133, (uint64_t)v132);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v142 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v220 = v142;
        objc_msgSend_recordID(self, v221, v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v234 = v223;
        _os_log_debug_impl(&dword_1BE990000, v220, OS_LOG_TYPE_DEBUG, "Successfully decrypted public sharing key on record %@", buf, 0xCu);

      }
    }
    goto LABEL_49;
  }
LABEL_51:
  if ((v21 & 1) != 0)
  {
LABEL_61:
    LOBYTE(shouldRetry) = 1;
    return shouldRetry;
  }
  if ((objc_msgSend_wasFetchedFromCache(self, v98, v99) & 1) != 0
    || (shouldRetry = objc_msgSend_shouldRetry(self, v143, v144)) != 0)
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend_stateTransitionGroup(self, v145, v146);
    v147 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v147);

    objc_msgSend_cache(self, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v151, v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend_databaseScope(self, v154, v155);
    v157 = MEMORY[0x1E0C809B0];
    v231[0] = MEMORY[0x1E0C809B0];
    v231[1] = 3221225472;
    v231[2] = sub_1BEBC58C8;
    v231[3] = &unk_1E78309E8;
    objc_copyWeak(&v232, (id *)buf);
    objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v150, v158, 0, v153, v156, v231);

    objc_msgSend_recordPCSData(self, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v161, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v164)
    {
      objc_msgSend_recordID(self, v165, v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v167, v168, v169);
      v164 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_stateTransitionGroup(self, v165, v166);
    v170 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v170);

    objc_msgSend_cache(self, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = objc_msgSend_databaseScope(self, v174, v175);
    v229[0] = v157;
    v229[1] = 3221225472;
    v229[2] = sub_1BEBC590C;
    v229[3] = &unk_1E78309E8;
    objc_copyWeak(&v230, (id *)buf);
    objc_msgSend__setPCSData_forFetchedZoneID_withScope_withCompletionHandler_(v173, v177, 0, v164, v176, v229);

    objc_msgSend_recordPCSData(self, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_shareID(v180, v181, v182);
    v183 = (void *)objc_claimAutoreleasedReturnValue();

    if (v183)
    {
      objc_msgSend_stateTransitionGroup(self, v184, v185);
      v186 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v186);

      objc_msgSend_cache(self, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = objc_msgSend_databaseScope(self, v190, v191);
      v227[0] = v157;
      v227[1] = 3221225472;
      v227[2] = sub_1BEBC5950;
      v227[3] = &unk_1E78309E8;
      objc_copyWeak(&v228, (id *)buf);
      objc_msgSend__setPCSData_forFetchedShareID_withScope_withCompletionHandler_(v189, v193, 0, v183, v192, v227);

      objc_destroyWeak(&v228);
    }
    objc_msgSend_recordPCSData(self, v184, v185);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parentID(v194, v195, v196);
    v197 = (void *)objc_claimAutoreleasedReturnValue();

    if (v197)
    {
      objc_msgSend_stateTransitionGroup(self, v198, v199);
      v200 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v200);

      objc_msgSend_cache(self, v201, v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = objc_msgSend_databaseScope(self, v204, v205);
      v225[0] = v157;
      v225[1] = 3221225472;
      v225[2] = sub_1BEBC5994;
      v225[3] = &unk_1E78309E8;
      objc_copyWeak(&v226, (id *)buf);
      objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v203, v207, 0, v197, v206, v225);

      objc_destroyWeak(&v226);
    }

    objc_destroyWeak(&v230);
    objc_destroyWeak(&v232);
    objc_destroyWeak((id *)buf);
    goto LABEL_61;
  }
  return shouldRetry;
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
    objc_msgSend_recordPCSData(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_databaseScope(self, v17, v18);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_1BEBC5C0C;
    v34[3] = &unk_1E78309E8;
    v20 = &v35;
    objc_copyWeak(&v35, &location);
    objc_msgSend_updateMemoryCacheWithRecordPCSData_forRecordWithID_databaseScope_withCompletionHandler_(v10, v21, (uint64_t)v13, v16, v19, v34);
  }
  else
  {
    objc_msgSend_stateTransitionGroup(self, v5, v6);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v22);

    objc_msgSend_cache(self, v23, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordPCSData(self, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(self, v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_databaseScope(self, v29, v30);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1BEBC5BC8;
    v36[3] = &unk_1E78309E8;
    v20 = &v37;
    objc_copyWeak(&v37, &location);
    objc_msgSend__setPCSData_forFetchedRecordID_withScope_withCompletionHandler_(v10, v32, (uint64_t)v13, v16, v31, v36);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)serverRecordHasNoProtectionData
{
  return self->_serverRecordHasNoProtectionData;
}

- (void)setServerRecordHasNoProtectionData:(BOOL)a3
{
  self->_serverRecordHasNoProtectionData = a3;
}

- (NSString)serverRecordType
{
  return self->_serverRecordType;
}

- (void)setServerRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_serverRecordType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverRecordType, 0);
}

@end
