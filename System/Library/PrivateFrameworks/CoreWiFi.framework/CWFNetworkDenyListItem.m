@implementation CWFNetworkDenyListItem

- (CWFNetworkDenyListItem)initWithDenyListNetwork:(id)a3
{
  id v4;
  CWFNetworkDenyListItem *v5;
  NSMutableArray *v6;
  NSMutableArray *denyListTriggers;
  NSMutableArray *v8;
  NSMutableArray *statesCurrent;
  NSMutableArray *v10;
  NSMutableArray *statesHistory;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isEAP;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isProfileBased;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  CWFNetworkDenyListItem *v34;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;
  int v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CWFNetworkDenyListItem;
  v5 = -[CWFNetworkDenyListItem init](&v47, sel_init);
  if (!v5)
  {
    CWFGetOSLog();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      CWFGetOSLog();
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v42 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }
  if (!v4)
  {
    CWFGetOSLog();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      CWFGetOSLog();
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v43 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  denyListTriggers = v5->_denyListTriggers;
  v5->_denyListTriggers = v6;

  if (!v5->_denyListTriggers)
  {
    CWFGetOSLog();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      CWFGetOSLog();
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v44 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  statesCurrent = v5->_statesCurrent;
  v5->_statesCurrent = v8;

  if (!v5->_statesCurrent)
  {
    CWFGetOSLog();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      CWFGetOSLog();
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v45 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
    goto LABEL_33;
  }
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  statesHistory = v5->_statesHistory;
  v5->_statesHistory = v10;

  if (!v5->_statesHistory)
  {
    CWFGetOSLog();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      CWFGetOSLog();
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = MEMORY[0x1E0C81028];
      v46 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    v48 = 136446210;
    v49 = "-[CWFNetworkDenyListItem initWithDenyListNetwork:]";
LABEL_33:
    _os_log_send_and_compose_impl();
LABEL_34:

    v34 = 0;
    goto LABEL_7;
  }
  isEAP = objc_msgSend_isEAP(v4, v12, v13, v14, v15);
  objc_msgSend_matchingKnownNetworkProfile(v4, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isProfileBased = objc_msgSend_isProfileBased(v21, v22, v23, v24, v25);

  v5->_enterprisePolicy = isEAP & isProfileBased;
  v30 = (void *)objc_msgSend_copyWithZone_(v4, v27, 0, v28, v29);
  objc_msgSend_setScanResultForNetworkDenyListItem_(v5, v31, (uint64_t)v30, v32, v33);

  v34 = v5;
LABEL_7:

  return v34;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  objc_msgSend_removeAllObjects(self->_denyListTriggers, a2, v2, v3, v4);
  objc_msgSend_removeAllObjects(self->_statesCurrent, v6, v7, v8, v9);
  objc_msgSend_removeAllObjects(self->_statesHistory, v10, v11, v12, v13);
  v14.receiver = self;
  v14.super_class = (Class)CWFNetworkDenyListItem;
  -[CWFNetworkDenyListItem dealloc](&v14, sel_dealloc);
}

- (void)addDenyListTrigger:(unint64_t)a3 reasonData:(int64_t)a4 BSSID:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CWFNetworkDenyListInfo *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;

  v8 = a5;
  objc_msgSend_denyListTriggers(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v13, v14, v15, v16, v17);

  if (v18 >= 0x10)
  {
    objc_msgSend_denyListTriggers(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectAtIndex_(v23, v24, 0, v25, v26);

  }
  v27 = objc_alloc_init(CWFNetworkDenyListInfo);
  if (v27)
  {
    CWFStringFromDenyListAddReason(a3);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setReason_(v27, v29, a3, v30, v31);
    objc_msgSend_setReasonData_(v27, v32, a4, v33, v34);
    if (v28)
      objc_msgSend_setReasonString_(v27, v35, (uint64_t)v28, v37, v38);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v39, v40, v41, v42, v43);
    objc_msgSend_setReasonTimestamp_(v27, v44, v45, v46, v47);

    if (v8)
      objc_msgSend_setBSSID_(v27, v48, (uint64_t)v8, v50, v51);
    objc_msgSend_denyListTriggers(self, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v52, v53, (uint64_t)v27, v54, v55);

  }
  else
  {
    CWFGetOSLog();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      CWFGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = MEMORY[0x1E0C81028];
      v57 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      _os_log_send_and_compose_impl();
  }

}

- (BOOL)containsNetwork:(id)a3
{
  if (a3)
    return ((uint64_t (*)(CWFNetworkDenyListItem *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_isEqualToDenyListScanResult_, a3);
  else
    return 0;
}

- (BOOL)hasDenyListState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_statesCurrent(self, a2, a3, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v6);
        if (objc_msgSend_state(*(void **)(*((_QWORD *)&v18 + 1) + 8 * i), v9, v10, v11, v12) == a3)
        {
          v16 = 1;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)updateNetwork:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CWFScanResult *v6;
  CWFScanResult *scanResultForNetworkDenyListItem;

  v6 = (CWFScanResult *)objc_msgSend_copyWithZone_(a3, a2, 0, v3, v4);
  scanResultForNetworkDenyListItem = self->_scanResultForNetworkDenyListItem;
  self->_scanResultForNetworkDenyListItem = v6;

  return 1;
}

- (id)_copyCreateDenyListState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  CWFNetworkDenyListInfo *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v40;
  id v41;

  v8 = objc_alloc_init(CWFNetworkDenyListInfo);
  if (v8)
  {
    CWFStringFromDenyListState(a3);
    v9 = objc_claimAutoreleasedReturnValue();
    CWFStringFromDenyListAddReason(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setState_(v8, v11, a3, v12, v13);
    objc_msgSend_setStateString_(v8, v14, (uint64_t)v9, v15, v16);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSince1970(v21, v22, v23, v24, v25);
    objc_msgSend_setStateTimestamp_(v8, v26, v27, v28, v29);

    objc_msgSend_setReason_(v8, v30, a4, v31, v32);
    objc_msgSend_setReasonData_(v8, v33, a5, v34, v35);
    objc_msgSend_setReasonString_(v8, v36, (uint64_t)v10, v37, v38);

  }
  else
  {
    CWFGetOSLog();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      CWFGetOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v41 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      _os_log_send_and_compose_impl();
  }

  return v8;
}

- (void)addDenyListState:(unint64_t)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *DenyListState_reason_reasonData;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  id v83;
  void *v84;
  NSObject *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  int v91;
  const char *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  unint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  DenyListState_reason_reasonData = (void *)objc_msgSend__copyCreateDenyListState_reason_reasonData_(self, a2, a3, a4, a5);
  if (!DenyListState_reason_reasonData)
  {
    CWFGetOSLog();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      CWFGetOSLog();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      v83 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v91 = 136446210;
      v92 = "-[CWFNetworkDenyListItem addDenyListState:reason:reasonData:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_31;
  }
  objc_msgSend_scanResultForNetworkDenyListItem(self, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v13, v14, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_scanResultForNetworkDenyListItem(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_statesCurrent(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_count(v33, v34, v35, v36, v37);

  if (v38)
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend_statesCurrent(self, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v86, (uint64_t)v90, 16);
    if (v45)
    {
      v46 = v45;
      v84 = v28;
      v85 = v18;
      v47 = 0;
      v48 = *(_QWORD *)v87;
      while (2)
      {
        v49 = 0;
        v50 = v47;
        do
        {
          if (*(_QWORD *)v87 != v48)
            objc_enumerationMutation(v43);
          v47 = *(id *)(*((_QWORD *)&v86 + 1) + 8 * v49);

          v55 = objc_msgSend_state(v47, v51, v52, v53, v54);
          if (v55 == objc_msgSend_state(DenyListState_reason_reasonData, v56, v57, v58, v59))
          {

            CWFGetOSLog();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            if (v63)
            {
              CWFGetOSLog();
              v64 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v64 = MEMORY[0x1E0C81028];
              v66 = MEMORY[0x1E0C81028];
            }
            v28 = v84;
            v18 = v85;

            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              CWFStringFromDenyListState(a3);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              CWFStringFromDenyListAddReason(a4);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = 138544386;
              v92 = (const char *)v85;
              v93 = 2114;
              v94 = v84;
              v95 = 2114;
              v96 = v67;
              v97 = 2114;
              v98 = v68;
              v99 = 2048;
              v100 = a4;
              _os_log_send_and_compose_impl();

            }
            goto LABEL_30;
          }
          ++v49;
          v50 = v47;
        }
        while (v46 != v49);
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v60, (uint64_t)&v86, (uint64_t)v90, 16);
        if (v46)
          continue;
        break;
      }

      v28 = v84;
      v18 = v85;
    }

    CWFGetOSLog();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      CWFGetOSLog();
      v62 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = MEMORY[0x1E0C81028];
      v72 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    CWFStringFromDenyListState(a3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    CWFStringFromDenyListAddReason(a4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 138544386;
    v92 = (const char *)v18;
    v93 = 2114;
    v94 = v28;
    v95 = 2114;
    v96 = v70;
    v97 = 2114;
    v98 = v71;
    v99 = 2048;
    v100 = a4;
    goto LABEL_28;
  }
  CWFGetOSLog();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    CWFGetOSLog();
    v62 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = MEMORY[0x1E0C81028];
    v69 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    CWFStringFromDenyListState(a3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    CWFStringFromDenyListAddReason(a4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 138544386;
    v92 = (const char *)v18;
    v93 = 2114;
    v94 = v28;
    v95 = 2114;
    v96 = v70;
    v97 = 2114;
    v98 = v71;
    v99 = 2048;
    v100 = a4;
LABEL_28:
    _os_log_send_and_compose_impl();

  }
LABEL_29:

  objc_msgSend_statesCurrent(self, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v77, v78, (uint64_t)DenyListState_reason_reasonData, v79, v80);

  objc_msgSend_processDenyListStateMetric_denyListRemove_denyListRemoveReason_(self, v81, (uint64_t)DenyListState_reason_reasonData, 0, 0);
LABEL_30:

LABEL_31:
}

- (void)addDenyListStateHistory:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
  id v10;
  const char *v11;
  void *v12;
  NSObject *DenyListState_reason_reasonData;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;

  v10 = a3;
  v12 = v10;
  if (v10)
  {
    DenyListState_reason_reasonData = v10;
LABEL_4:
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_scanResultForNetworkDenyListItem(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend_initWithData_encoding_(v14, v25, (uint64_t)v24, 4, v26);

    objc_msgSend_statesHistory(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_count(v32, v33, v34, v35, v36);

    if (v37 >= 5)
    {
      objc_msgSend_statesHistory(self, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectAtIndex_(v42, v43, 0, v44, v45);

    }
    CWFGetOSLog();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      CWFGetOSLog();
      v47 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = MEMORY[0x1E0C81028];
      v48 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      CWFStringFromDenyListState(a4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      CWFStringFromDenyListAddReason(a5);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
    objc_msgSend_statesHistory(self, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v54, v55, (uint64_t)DenyListState_reason_reasonData, v56, v57);

    goto LABEL_12;
  }
  DenyListState_reason_reasonData = objc_msgSend__copyCreateDenyListState_reason_reasonData_(self, v11, a4, a5, a6);
  if (DenyListState_reason_reasonData)
    goto LABEL_4;
  CWFGetOSLog();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    CWFGetOSLog();
    DenyListState_reason_reasonData = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DenyListState_reason_reasonData = MEMORY[0x1E0C81028];
    v59 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(DenyListState_reason_reasonData, OS_LOG_TYPE_ERROR))
    _os_log_send_and_compose_impl();
LABEL_12:

}

- (void)processDenyListedBSSForMetrics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  const char *v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t i;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  NSMutableArray *v44;
  const __CFString *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int isEqualToString;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  NSObject *v71;
  id v72;
  void *v73;
  id v74;
  char v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  int v82;
  const char *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (self->_denyListMetrics)
  {
    objc_msgSend_scanResultForNetworkDenyListItem(self, a2, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_BSSID(v6, v7, v8, v9, v10);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_scanResultForNetworkDenyListItem(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend_initWithData_encoding_(v11, v22, (uint64_t)v21, 4, v23);

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v25 = self->_denyListMetrics;
    v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v78, (uint64_t)v88, 16);
    if (!v77)
    {

      goto LABEL_19;
    }
    v75 = 0;
    v27 = CFSTR("ssid");
    v28 = *(_QWORD *)v79;
    v29 = CFSTR("prunedCount");
    while (1)
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v79 != v28)
          objc_enumerationMutation(v25);
        v31 = *(id *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v27, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v35, v36, (uint64_t)v24, v37, v38))
        {
          objc_msgSend_objectForKeyedSubscript_(v31, v39, (uint64_t)CFSTR("bssid"), v40, v41);
          v42 = v24;
          v43 = v27;
          v44 = v25;
          v45 = v29;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v46, v47, (uint64_t)v76, v48, v49);

          v29 = v45;
          v25 = v44;
          v27 = v43;
          v24 = v42;

          if (!isEqualToString)
            goto LABEL_14;
          objc_msgSend_objectForKey_(v31, v51, (uint64_t)v29, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v54)
          {
            objc_msgSend_objectForKeyedSubscript_(v31, v55, (uint64_t)v29, v56, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend_unsignedIntegerValue(v58, v59, v60, v61, v62);

            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v64, v63 + 1, v65, v66);
          }
          else
          {
            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v55, 1, v56, v57);
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v31, v67, (uint64_t)v35, (uint64_t)v29, v68);
          v75 = 1;
        }

LABEL_14:
      }
      v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v69, (uint64_t)&v78, (uint64_t)v88, 16);
      if (!v77)
      {

        if ((v75 & 1) == 0)
        {
LABEL_19:
          CWFGetOSLog();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (v70)
          {
            CWFGetOSLog();
            v71 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v71 = MEMORY[0x1E0C81028];
            v72 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            v82 = 136446722;
            v83 = "-[CWFNetworkDenyListItem processDenyListedBSSForMetrics]";
            v84 = 2114;
            v85 = v24;
            v86 = 2114;
            v87 = v76;
            _os_log_send_and_compose_impl();
          }
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
  }
  CWFGetOSLog();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    CWFGetOSLog();
    v71 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = MEMORY[0x1E0C81028];
    v74 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
  {
    v82 = 136446210;
    v83 = "-[CWFNetworkDenyListItem processDenyListedBSSForMetrics]";
    _os_log_send_and_compose_impl();
  }
  v24 = 0;
  v76 = 0;
LABEL_24:

LABEL_25:
}

- (void)processDenyListStateMetric:(id)a3 denyListRemove:(BOOL)a4 denyListRemoveReason:(unint64_t)a5
{
  _BOOL4 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSMutableArray *v12;
  NSMutableArray *denyListMetrics;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t i;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  int isEqualToString;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  NSObject *v124;
  void *v125;
  NSObject *v126;
  id v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  id v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  NSObject *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  NSObject *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  ether_addr *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  NSObject *v256;
  id v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  NSObject *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  NSObject *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  void *v273;
  NSObject *v274;
  void *v275;
  NSObject *v276;
  void *v277;
  void *v278;
  NSObject *v279;
  id v280;
  id v281;
  id v282;
  id v283;
  id v284;
  int *v285;
  uint64_t v286;
  void *v287;
  id v289;
  NSObject *v290;
  int v291;
  const char *v292;
  __int16 v293;
  NSObject *v294;
  __int16 v295;
  NSObject *v296;
  __int16 v297;
  NSObject *v298;
  __int16 v299;
  NSObject *v300;
  __int16 v301;
  id v302;
  uint64_t v303;

  v5 = a4;
  v303 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (!v11)
  {
    CWFGetOSLog();
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (v272)
    {
      CWFGetOSLog();
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = MEMORY[0x1E0C81028];
      v280 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v291 = 136446210;
    v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
LABEL_63:
    _os_log_send_and_compose_impl();
    goto LABEL_38;
  }
  if (!self->_denyListMetrics)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    denyListMetrics = self->_denyListMetrics;
    self->_denyListMetrics = v12;

    if (!self->_denyListMetrics)
    {
      CWFGetOSLog();
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      if (v277)
      {
        CWFGetOSLog();
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = MEMORY[0x1E0C81028];
        v283 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      v291 = 136446210;
      v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
      goto LABEL_63;
    }
  }
  objc_msgSend_scanResultForNetworkDenyListItem(self, v7, v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_BSSID(v14, v15, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_scanResultForNetworkDenyListItem(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_initWithData_encoding_(v20, v31, (uint64_t)v30, 4, v32);

  if (v19)
  {
    if (!v33)
    {
      CWFGetOSLog();
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      if (v275)
      {
        CWFGetOSLog();
        v276 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v276 = MEMORY[0x1E0C81028];
        v282 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR))
      {
        v291 = 136446210;
        v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
        _os_log_send_and_compose_impl();
      }

LABEL_29:
      v33 = v19;
      goto LABEL_38;
    }
    v289 = v11;
    if (v5)
    {
      objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v34, v35, v36, v37);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(self->_denyListMetrics, v38, v39, v40, v41))
      {
        for (i = 0; i < objc_msgSend_count(self->_denyListMetrics, v152, v153, v154, v155); ++i)
        {
          objc_msgSend_objectAtIndex_(self->_denyListMetrics, v42, i, v44, v45, v285, v286);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)CFSTR("state"), v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend_unsignedIntegerValue(v51, v52, v53, v54, v55);
          v61 = objc_msgSend_state(v11, v57, v58, v59, v60);

          if (v56 == v61)
          {
            objc_msgSend_objectForKeyedSubscript_(v47, v62, (uint64_t)CFSTR("ssid"), v63, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_isEqualToString_(v65, v66, (uint64_t)v33, v67, v68) & 1) == 0)
            {

LABEL_15:
              CWFGetOSLog();
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              if (v125)
              {
                CWFGetOSLog();
                v126 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v126 = MEMORY[0x1E0C81028];
                v127 = MEMORY[0x1E0C81028];
              }

              if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend_objectForKeyedSubscript_(v47, v128, (uint64_t)CFSTR("ssid"), v129, v130);
                v131 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v47, v132, (uint64_t)CFSTR("bssid"), v133, v134);
                v135 = objc_claimAutoreleasedReturnValue();
                v291 = 136447234;
                v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
                v293 = 2114;
                v294 = v131;
                v295 = 2114;
                v296 = v135;
                v297 = 2114;
                v298 = v33;
                v299 = 2114;
                v300 = v19;
                LODWORD(v286) = 52;
                v285 = &v291;
                _os_log_send_and_compose_impl();

                v11 = v289;
              }

              goto LABEL_25;
            }
            objc_msgSend_objectForKeyedSubscript_(v47, v69, (uint64_t)CFSTR("bssid"), v70, v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v72, v73, (uint64_t)v19, v74, v75);

            if (!isEqualToString)
              goto LABEL_15;
            objc_msgSend_date(MEMORY[0x1E0C99D68], v77, v78, v79, v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_timeIntervalSince1970(v81, v82, v83, v84, v85);
            v87 = v86;

            v88 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend_objectForKeyedSubscript_(v47, v89, (uint64_t)CFSTR("denyListTimestamp"), v90, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v92, v93, v94, v95, v96);
            objc_msgSend_numberWithDouble_(v88, v98, v99, v100, v101, v87 - v97);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v47, v103, (uint64_t)v102, (uint64_t)CFSTR("denyListedDuration"), v104);

            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v105, a5, v106, v107);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v47, v109, (uint64_t)v108, (uint64_t)CFSTR("denyListRemoveReason"), v110);

            objc_msgSend_removeObjectForKey_(v47, v111, (uint64_t)CFSTR("ssid"), v112, v113);
            objc_msgSend_removeObjectForKey_(v47, v114, (uint64_t)CFSTR("bssid"), v115, v116);
            objc_msgSend_removeObjectForKey_(v47, v117, (uint64_t)CFSTR("state"), v118, v119);
            objc_msgSend_removeObjectForKey_(v47, v120, (uint64_t)CFSTR("denyListTimestamp"), v121, v122);
            CWFGetOSLog();
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            if (v123)
            {
              CWFGetOSLog();
              v124 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v124 = MEMORY[0x1E0C81028];
              v136 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_objectForKeyedSubscript_(v47, v137, (uint64_t)CFSTR("denyListedDuration"), v138, v139);
              v140 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v47, v141, (uint64_t)CFSTR("denyListRemoveReason"), v142, v143);
              v144 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v47, v145, (uint64_t)CFSTR("prunedCount"), v146, v147);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              v291 = 136447490;
              v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
              v293 = 2114;
              v294 = v33;
              v295 = 2114;
              v296 = v19;
              v297 = 2114;
              v298 = v140;
              v299 = 2114;
              v300 = v144;
              v301 = 2114;
              v302 = v148;
              LODWORD(v286) = 62;
              v285 = &v291;
              _os_log_send_and_compose_impl();

              v11 = v289;
            }

            objc_msgSend_addIndex_(v287, v149, i, v150, v151);
          }
LABEL_25:

        }
      }
      if (objc_msgSend_count(v287, v42, v43, v44, v45, v285, v286))
      {
        objc_msgSend_objectsAtIndexes_(self->_denyListMetrics, v156, (uint64_t)v287, v157, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_enumerateObjectsUsingBlock_(v159, v160, (uint64_t)&unk_1E6132880, v161, v162);
        objc_msgSend_removeObjectsAtIndexes_(self->_denyListMetrics, v163, (uint64_t)v287, v164, v165);

        v11 = v289;
      }

      goto LABEL_29;
    }
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v34, v35, v36, v37);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_retainAutorelease(v19);
    v172 = (const char *)objc_msgSend_UTF8String(v167, v168, v169, v170, v171);
    if (ether_aton(v172))
    {
      v290 = v167;
      v173 = objc_retainAutorelease(v167);
      v178 = (const char *)objc_msgSend_UTF8String(v173, v174, v175, v176, v177);
      v179 = ether_aton(v178);
      v180 = v179->octet[0];
      v181 = v179->octet[1];
      v182 = v179->octet[2];
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v183, (uint64_t)v33, v184, v185);
      v186 = v11;
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v166, v188, (uint64_t)v187, (uint64_t)CFSTR("ssid"), v189);

      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v190, (uint64_t)v173, v191, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v166, v194, (uint64_t)v193, (uint64_t)CFSTR("bssid"), v195);

      v196 = (void *)MEMORY[0x1E0CB37E8];
      v201 = objc_msgSend_state(v186, v197, v198, v199, v200);
      objc_msgSend_numberWithUnsignedInteger_(v196, v202, v201, v203, v204);
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v166, v206, (uint64_t)v205, (uint64_t)CFSTR("state"), v207);

      v208 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_stateTimestamp(v186, v209, v210, v211, v212);
      objc_msgSend_numberWithDouble_(v208, v213, v214, v215, v216);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v166, v218, (uint64_t)v217, (uint64_t)CFSTR("denyListTimestamp"), v219);

      v220 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v221, (uint64_t)CFSTR("%02x:%02x:%02x"), v222, v223, v180, v181, v182);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithString_(v220, v225, (uint64_t)v224, v226, v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v166, v229, (uint64_t)v228, (uint64_t)CFSTR("oui"), v230);

      v231 = (void *)MEMORY[0x1E0CB37E8];
      v236 = objc_msgSend_reason(v186, v232, v233, v234, v235);
      objc_msgSend_numberWithUnsignedInteger_(v231, v237, v236, v238, v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v166, v241, (uint64_t)v240, (uint64_t)CFSTR("reason"), v242);

      v243 = (void *)MEMORY[0x1E0CB37E8];
      v248 = objc_msgSend_reasonData(v186, v244, v245, v246, v247);
      objc_msgSend_numberWithInteger_(v243, v249, v248, v250, v251);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v166, v253, (uint64_t)v252, (uint64_t)CFSTR("denyListedSubreason"), v254);

      CWFGetOSLog();
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      if (v255)
      {
        CWFGetOSLog();
        v256 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v256 = MEMORY[0x1E0C81028];
        v257 = MEMORY[0x1E0C81028];
      }

      v167 = v290;
      if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_objectForKeyedSubscript_(v166, v258, (uint64_t)CFSTR("oui"), v259, v260);
        v261 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v166, v262, (uint64_t)CFSTR("reason"), v263, v264);
        v265 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v166, v266, (uint64_t)CFSTR("denyListedSubreason"), v267, v268);
        v291 = 136447490;
        v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
        v293 = 2114;
        v294 = v33;
        v295 = 2114;
        v296 = v173;
        v297 = 2114;
        v298 = v261;
        v299 = 2114;
        v300 = v265;
        v301 = 2114;
        v302 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
      objc_msgSend_addObject_(self->_denyListMetrics, v269, (uint64_t)v166, v270, v271);
      v11 = v289;
    }
    else
    {
      CWFGetOSLog();
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      if (v278)
      {
        CWFGetOSLog();
        v279 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v279 = MEMORY[0x1E0C81028];
        v284 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
      {
        v291 = 136446210;
        v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
        _os_log_send_and_compose_impl();
      }

    }
    v33 = v167;
  }
  else
  {
    CWFGetOSLog();
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    if (v273)
    {
      CWFGetOSLog();
      v274 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v274 = MEMORY[0x1E0C81028];
      v281 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v274, OS_LOG_TYPE_ERROR))
    {
      v291 = 136446210;
      v292 = "-[CWFNetworkDenyListItem processDenyListStateMetric:denyListRemove:denyListRemoveReason:]";
      _os_log_send_and_compose_impl();
    }

  }
LABEL_38:

}

- (BOOL)isEqualToDenyListScanResult:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  char isEqual;

  v4 = a3;
  objc_msgSend_SSID(self->_scanResultForNetworkDenyListItem, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = (void *)v9;
    objc_msgSend_SSID(v4, v10, v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      isEqual = 0;
LABEL_12:

      goto LABEL_13;
    }
    v20 = (void *)v15;
    objc_msgSend_SSID(self->_scanResultForNetworkDenyListItem, v16, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SSID(v4, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v27, (uint64_t)v26, v28, v29))
    {
      isEqual = 0;
LABEL_11:

      goto LABEL_12;
    }
    v34 = objc_msgSend_supportedSecurityTypes(self->_scanResultForNetworkDenyListItem, v30, v31, v32, v33);
    v39 = objc_msgSend_supportedSecurityTypes(v4, v35, v36, v37, v38) & v34;

    if (v39)
    {
      objc_msgSend_BSSID(v4, v40, v41, v42, v43);
      v44 = objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        isEqual = 1;
        goto LABEL_13;
      }
      v14 = (void *)v44;
      objc_msgSend_BSSID(self->_scanResultForNetworkDenyListItem, v45, v46, v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      if (!v49)
      {
        isEqual = 1;
        goto LABEL_12;
      }
      v20 = (void *)v49;
      objc_msgSend_BSSID(v4, v50, v51, v52, v53);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_BSSID(self->_scanResultForNetworkDenyListItem, v54, v55, v56, v57);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v21, v58, (uint64_t)v26, v59, v60);
      goto LABEL_11;
    }
  }
  isEqual = 0;
LABEL_13:

  return isEqual;
}

- (CWFScanResult)scanResultForNetworkDenyListItem
{
  return (CWFScanResult *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScanResultForNetworkDenyListItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)denyListTriggers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDenyListTriggers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)statesCurrent
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStatesCurrent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)statesHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStatesHistory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)enterprisePolicy
{
  return self->_enterprisePolicy;
}

- (void)setEnterprisePolicy:(BOOL)a3
{
  self->_enterprisePolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statesHistory, 0);
  objc_storeStrong((id *)&self->_statesCurrent, 0);
  objc_storeStrong((id *)&self->_denyListTriggers, 0);
  objc_storeStrong((id *)&self->_scanResultForNetworkDenyListItem, 0);
  objc_storeStrong((id *)&self->_denyListMetrics, 0);
}

@end
