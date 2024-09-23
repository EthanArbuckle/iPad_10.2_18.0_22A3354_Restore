@implementation CKDThrottleManager

- (CKDThrottleManager)initWithDeviceContext:(id)a3
{
  id v4;
  id *v5;
  CKDThrottleManager *v6;
  const char *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKDThrottleManager;
  v5 = -[CKThrottleManager initInternal](&v10, sel_initInternal);
  v6 = (CKDThrottleManager *)v5;
  if (v5)
  {
    objc_storeWeak(v5 + 13, v4);
    objc_msgSend_loadThrottlesFromDatabase(v6, v7, v8);
  }

  return v6;
}

- (id)throttleTable:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  CKDThrottleTableGroup *v14;
  id v15;
  CKDThrottleTableGroup *throttleTableGroup;
  const char *v17;
  NSObject *v18;
  CKThrottleTable *v19;
  CKThrottleTable *throttleTable;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_throttleTableGroup)
  {
    v4 = a3;
    objc_msgSend_deviceContext(self, a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceScopedDatabase(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_groupName(CKDThrottleTableGroup, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v13 = 0;
    else
      v13 = 0x10000;
    v22 = 0;
    objc_msgSend_tableGroupInDatabase_withName_options_error_(CKDThrottleTableGroup, v11, (uint64_t)v8, v12, v13, &v22);
    v14 = (CKDThrottleTableGroup *)objc_claimAutoreleasedReturnValue();
    v15 = v22;
    throttleTableGroup = self->_throttleTableGroup;
    self->_throttleTableGroup = v14;

    if (v15)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v18 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_fault_impl(&dword_1BE990000, v18, OS_LOG_TYPE_FAULT, "Failed to create the throttle table: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_tableWithName_(self->_throttleTableGroup, v17, (uint64_t)CFSTR("Throttle"));
      v19 = (CKThrottleTable *)objc_claimAutoreleasedReturnValue();
      throttleTable = self->_throttleTable;
      self->_throttleTable = v19;

    }
  }
  return self->_throttleTable;
}

- (void)loadThrottlesFromDatabase
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;
  dispatch_once_t *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend_throttleTable_(self, a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend_fetchAllEntries_(v3, v4, (uint64_t)&v39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v39;
  v7 = (dispatch_once_t *)MEMORY[0x1E0C95300];
  if (v6)
  {
    v8 = v6;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v10 = 0;
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138543362;
    v42 = (uint64_t)v8;
    _os_log_fault_impl(&dword_1BE990000, v9, OS_LOG_TYPE_FAULT, "Failed to fetch the throttle list: %{public}@", buf, 0xCu);
    v10 = 0;
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = v5;
    v11 = v5;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v35, v40, 16);
    if (v13)
    {
      v16 = v13;
      v8 = 0;
      v17 = *(_QWORD *)v36;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v11);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
          objc_msgSend_expirationDate(v19, v14, v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isExpired(v19, v21, v22) & 1) != 0
            || (objc_msgSend_timeIntervalSinceNow(v20, v23, v24), v25 > 172800.0))
          {
            objc_msgSend_deleteObject_(v3, v23, (uint64_t)v19);
            v26 = objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              if (*v7 != -1)
                dispatch_once(v7, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v27 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                v42 = v26;
                _os_log_fault_impl(&dword_1BE990000, v27, OS_LOG_TYPE_FAULT, "Failed to delete throttle: %{public}@", buf, 0xCu);
              }
              v8 = (void *)v26;
            }
            else
            {
              v8 = 0;
            }
          }
          else
          {
            objc_msgSend_addThrottle_(self, v23, (uint64_t)v19);
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v35, v40, 16);
      }
      while (v16);
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend_allThrottles(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_count(v30, v31, v32);

    v5 = v34;
  }
  if (*v7 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_28:
  v33 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v42 = v10;
    _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_INFO, "CKThrottle count at startup: %lu", buf, 0xCu);
  }

}

- (void)invalidateAdopterThrottles
{
  uint64_t v2;
  void *v4;
  const char *v5;
  _QWORD v6[5];

  objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BEC1829C;
  v6[3] = &unk_1E7837CC8;
  v6[4] = self;
  objc_msgSend_enumerateConnections_(v4, v5, (uint64_t)v6);

}

- (BOOL)addThrottle:(id)a3
{
  const char *v4;
  uint64_t v5;
  _BOOL4 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDThrottleManager;
  v6 = -[CKThrottleManager addThrottle:](&v8, sel_addThrottle_, a3);
  if (v6)
    objc_msgSend_invalidateAdopterThrottles(self, v4, v5);
  return v6;
}

- (void)throttleWasAdded:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend_isExpired(v4, v5, v6) & 1) == 0)
  {
    objc_msgSend_throttleID(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend_throttleTable_(self, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_insertObject_(v11, v12, (uint64_t)v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v14 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
        {
          v15 = 138543362;
          v16 = v13;
          _os_log_fault_impl(&dword_1BE990000, v14, OS_LOG_TYPE_FAULT, "Failed to save new throttle: %{public}@", (uint8_t *)&v15, 0xCu);
        }
      }

    }
  }

}

- (void)throttleWillBeRemoved:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_throttleTable_(self, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteObject_(v6, v7, (uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v12 = 138543362;
      v13 = v8;
      _os_log_fault_impl(&dword_1BE990000, v11, OS_LOG_TYPE_FAULT, "Failed to delete throttle: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend_invalidateAdopterThrottles(self, v9, v10);

}

- (void)throttleListBecameEmpty
{
  CKThrottleTable *throttleTable;
  CKDThrottleTableGroup *throttleTableGroup;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;

  throttleTable = self->_throttleTable;
  self->_throttleTable = 0;

  throttleTableGroup = self->_throttleTableGroup;
  self->_throttleTableGroup = 0;

  objc_msgSend_deviceContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedDatabase(v7, v8, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_groupName(CKDThrottleTableGroup, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_purgeGroupWithName_inDatabase_(MEMORY[0x1E0C950F0], v13, (uint64_t)v12, v14);

}

- (void)noteDataChangeForThrottle:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_throttleTable_(self, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateRequestCount_(v6, v7, (uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
    {
      v10 = 138543362;
      v11 = v8;
      _os_log_fault_impl(&dword_1BE990000, v9, OS_LOG_TYPE_FAULT, "Failed to save throttle changes: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

}

+ (id)_expirationDateForTTLSeconds:(unsigned int)a3
{
  unsigned int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 86400;
  if (a3 <= 0x15180)
  {
    v4 = a3;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v5 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_error_impl(&dword_1BE990000, v5, OS_LOG_TYPE_ERROR, "Received throttle config with large ttl (%d sec). Limiting to 24 hours.", (uint8_t *)v7, 8u);
    }
  }
  objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], a2, *(uint64_t *)&a3, (double)v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)throttleFromServerJSONDictionary:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  id v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  void *v44;
  id v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  const char *v103;
  void *v104;
  const char *v105;
  const char *v106;
  void *v107;
  const char *v108;
  const char *v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  void *v128;
  const char *v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  void *v137;
  const char *v138;
  const char *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  const char *v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  int v175;
  uint64_t v176;
  const char *v177;
  void *v178;
  const char *v179;
  void *v181;
  void *v182;
  id v183;
  void *v184;
  int v185;
  void *v186;
  void *v187;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v7, (uint64_t)CFSTR("criteria"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v9, (uint64_t)CFSTR("rateLimit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v11, (uint64_t)CFSTR("containerName"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = v6 == 0;
  v15 = v8 != 0;
  if (v8)
    v14 = 1;
  if (!v12)
    v15 = 0;
  if (v10)
    v16 = 1;
  else
    v16 = v14;
  if (v10)
    v17 = v15;
  else
    v17 = 0;
  if (v16 != 1 || v17)
  {
    v185 = v16;
    v20 = objc_alloc_init(MEMORY[0x1E0C951E8]);
    v22 = v20;
    if (v6)
      objc_msgSend_setLabel_(v20, v21, (uint64_t)v6);
    v187 = v6;
    objc_msgSend_objectForKey_(v8, v21, (uint64_t)CFSTR("containerName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainerIdentifier_(v22, v24, (uint64_t)v23);

    objc_msgSend_objectForKey_(v8, v25, (uint64_t)CFSTR("databaseType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    if (v26)
    {
      v29 = v26;
      if ((objc_msgSend_isEqualToString_(v29, v30, (uint64_t)CFSTR("privateDB")) & 1) != 0)
      {
        v32 = 2;
      }
      else if ((objc_msgSend_isEqualToString_(v29, v31, (uint64_t)CFSTR("publicDB")) & 1) != 0)
      {
        v32 = 1;
      }
      else if ((objc_msgSend_isEqualToString_(v29, v33, (uint64_t)CFSTR("sharedDB")) & 1) != 0)
      {
        v32 = 3;
      }
      else if (objc_msgSend_isEqualToString_(v29, v34, (uint64_t)CFSTR("orgDB")))
      {
        v32 = 4;
      }
      else
      {
        v32 = 2;
      }

      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v35, v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDatabaseScope_(v22, v37, (uint64_t)v36);

    }
    v186 = v28;
    objc_msgSend_objectForKey_(v8, v27, (uint64_t)CFSTR("zoneName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setZoneName_(v22, v39, (uint64_t)v38);

    objc_msgSend_objectForKey_(v8, v40, (uint64_t)CFSTR("operationType"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v41;
    if (v41)
    {
      v44 = (void *)MEMORY[0x1E0CB37E8];
      v45 = v41;
      v182 = v44;
      if ((objc_msgSend_isEqualToString_(v45, v46, (uint64_t)CFSTR("noneType")) & 1) != 0)
      {
        v48 = 0;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v47, (uint64_t)CFSTR("zoneSaveType")) & 1) != 0)
      {
        v48 = 200;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v49, (uint64_t)CFSTR("zoneRetrieveType")) & 1) != 0)
      {
        v48 = 201;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v50, (uint64_t)CFSTR("zoneDeleteType")) & 1) != 0)
      {
        v48 = 202;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v51, (uint64_t)CFSTR("zoneRetrieveChangesType")) & 1) != 0)
      {
        v48 = 203;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v52, (uint64_t)CFSTR("recordSaveType")) & 1) != 0)
      {
        v48 = 210;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v53, (uint64_t)CFSTR("recordRetrieveType")) & 1) != 0)
      {
        v48 = 211;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v54, (uint64_t)CFSTR("recordRetrieveVersionsType")) & 1) != 0)
      {
        v48 = 212;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v55, (uint64_t)CFSTR("recordRetrieveChangesType")) & 1) != 0)
      {
        v48 = 213;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v56, (uint64_t)CFSTR("recordDeleteType")) & 1) != 0)
      {
        v48 = 214;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v57, (uint64_t)CFSTR("recordResolveTokenType")) & 1) != 0)
      {
        v48 = 216;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v58, (uint64_t)CFSTR("fetchArchivedRecordsType")) & 1) != 0)
      {
        v48 = 217;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v59, (uint64_t)CFSTR("recordMoveType")) & 1) != 0)
      {
        v48 = 218;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v60, (uint64_t)CFSTR("shareAccessType")) & 1) != 0)
      {
        v48 = 219;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v61, (uint64_t)CFSTR("queryRetrieveType")) & 1) != 0)
      {
        v48 = 220;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v62, (uint64_t)CFSTR("shareDeclineType")) & 1) != 0)
      {
        v48 = 221;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v63, (uint64_t)CFSTR("assetUploadTokenRetrieveType")) & 1) != 0)
      {
        v48 = 230;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v64, (uint64_t)CFSTR("containerDeleteType")) & 1) != 0)
      {
        v48 = 240;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v65, (uint64_t)CFSTR("userAvailableQuotaType")) & 1) != 0)
      {
        v48 = 243;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v66, (uint64_t)CFSTR("containerGetBundlesType")) & 1) != 0)
      {
        v48 = 244;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v67, (uint64_t)CFSTR("webAuthTokenRetrieveType")) & 1) != 0)
      {
        v48 = 250;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v68, (uint64_t)CFSTR("dataRepairUpdateMissingAssetStatusType")) & 1) != 0)
      {
        v48 = 260;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v69, (uint64_t)CFSTR("addAnonymousShareType")) & 1) != 0)
      {
        v48 = 270;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v70, (uint64_t)CFSTR("removeAnonymousShareType")) & 1) != 0)
      {
        v48 = 271;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v71, (uint64_t)CFSTR("subscriptionCreateType")) & 1) != 0)
      {
        v48 = 300;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v72, (uint64_t)CFSTR("subscriptionRetrieveType")) & 1) != 0)
      {
        v48 = 301;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v73, (uint64_t)CFSTR("subscriptionDeleteType")) & 1) != 0)
      {
        v48 = 302;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v74, (uint64_t)CFSTR("mergeableDeltaSaveType")) & 1) != 0)
      {
        v48 = 311;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v75, (uint64_t)CFSTR("mergeableDeltaMetadataRetrieveType")) & 1) != 0)
      {
        v48 = 312;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v76, (uint64_t)CFSTR("mergeableDeltaReplaceType")) & 1) != 0)
      {
        v48 = 313;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v77, (uint64_t)CFSTR("mergeableDeltaRetrieveType")) & 1) != 0)
      {
        v48 = 314;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v78, (uint64_t)CFSTR("privateSearchSetType")) & 1) != 0)
      {
        v48 = 320;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v79, (uint64_t)CFSTR("privateSearchGetType")) & 1) != 0)
      {
        v48 = 321;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v80, (uint64_t)CFSTR("privateSearchDeleteType")) & 1) != 0)
      {
        v48 = 322;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v81, (uint64_t)CFSTR("userRetrieveType")) & 1) != 0)
      {
        v48 = 400;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v82, (uint64_t)CFSTR("userQueryType")) & 1) != 0)
      {
        v48 = 401;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v83, (uint64_t)CFSTR("userPrivacySettingsRetrieveType")) & 1) != 0)
      {
        v48 = 402;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v84, (uint64_t)CFSTR("userPrivacySettingsUpdateType")) & 1) != 0)
      {
        v48 = 403;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v85, (uint64_t)CFSTR("userPrivacySettingsResetType")) & 1) != 0)
      {
        v48 = 404;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v86, (uint64_t)CFSTR("userPrivacySettingsBatchLookup")) & 1) != 0)
      {
        v48 = 405;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v87, (uint64_t)CFSTR("sharePermissionSettingsUpdateType")) & 1) != 0)
      {
        v48 = 406;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v88, (uint64_t)CFSTR("shareAcceptType")) & 1) != 0)
      {
        v48 = 503;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v89, (uint64_t)CFSTR("shareVettingInitiateType")) & 1) != 0)
      {
        v48 = 513;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v90, (uint64_t)CFSTR("pushRegisterType")) & 1) != 0)
      {
        v48 = 800;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v91, (uint64_t)CFSTR("pushUnregisterType")) & 1) != 0)
      {
        v48 = 801;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v92, (uint64_t)CFSTR("pushBadgeType")) & 1) != 0)
      {
        v48 = 802;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v93, (uint64_t)CFSTR("pushSyncType")) & 1) != 0)
      {
        v48 = 803;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v94, (uint64_t)CFSTR("pushReadType")) & 1) != 0)
      {
        v48 = 804;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v95, (uint64_t)CFSTR("archiveRecordsType")) & 1) != 0)
      {
        v48 = 900;
      }
      else if ((objc_msgSend_isEqualToString_(v45, v96, (uint64_t)CFSTR("datarepairMarkAssetBrokenType")) & 1) != 0)
      {
        v48 = 901;
      }
      else if (objc_msgSend_isEqualToString_(v45, v97, (uint64_t)CFSTR("functionInvokeType")))
      {
        v48 = 1101;
      }
      else
      {
        v48 = 0;
      }

      objc_msgSend_numberWithInt_(v182, v98, v48);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOperationType_(v22, v100, (uint64_t)v99);

    }
    v184 = v43;
    objc_msgSend_objectForKey_(v8, v42, (uint64_t)CFSTR("invernessServiceName"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setServiceName_(v22, v102, (uint64_t)v101);

    objc_msgSend_objectForKey_(v8, v103, (uint64_t)CFSTR("invernessFunctionName"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFunctionName_(v22, v105, (uint64_t)v104);

    objc_msgSend_objectForKey_(v8, v106, (uint64_t)CFSTR("bundleID"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBundleID_(v22, v108, (uint64_t)v107);

    objc_msgSend_objectForKey_(v8, v109, (uint64_t)CFSTR("operationGroupName"));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOperationGroupNamePrefix_(v22, v111, (uint64_t)v110);

    v112 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_objectForKey_(v10, v113, (uint64_t)CFSTR("intervalLengthSec"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend_integerValue(v114, v115, v116);
    objc_msgSend_numberWithInteger_(v112, v118, v117);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIntervalLengthSeconds_(v22, v120, (uint64_t)v119);

    v121 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_objectForKey_(v10, v122, (uint64_t)CFSTR("allowedRequestCount"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend_integerValue(v123, v124, v125);
    objc_msgSend_numberWithInteger_(v121, v127, v126);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAllowedRequestCount_(v22, v129, (uint64_t)v128);

    v130 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_objectForKey_(v10, v131, (uint64_t)CFSTR("repeatEverySec"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend_integerValue(v132, v133, v134);
    objc_msgSend_numberWithInteger_(v130, v136, v135);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRepeatEverySeconds_(v22, v138, (uint64_t)v137);

    objc_msgSend_objectForKey_(v10, v139, (uint64_t)CFSTR("startTimeSecondsAfterUnixEpoch"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v140;
    if (v140)
    {
      v144 = objc_msgSend_integerValue(v140, v141, v142);
      objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v145, v146, (double)v144);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setThrottleStartDate_(v22, v148, (uint64_t)v147);

    }
    objc_msgSend_objectForKey_(v10, v141, (uint64_t)CFSTR("startTimeSecondsAfterLocalMidnight"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v149;
    if (v149)
    {
      v153 = objc_msgSend_integerValue(v149, v150, v151);
      objc_msgSend_currentCalendar(MEMORY[0x1E0C99D48], v154, v155);
      v181 = v143;
      v156 = v22;
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_date(MEMORY[0x1E0C99D68], v158, v159);
      v183 = a1;
      v160 = v8;
      v161 = v10;
      v162 = v4;
      v163 = v13;
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startOfDayForDate_(v157, v165, (uint64_t)v164);
      v166 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_dateByAddingTimeInterval_(v166, v167, v168, (double)v153);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setThrottleStartDate_(v156, v170, (uint64_t)v169);

      v13 = v163;
      v4 = v162;
      v10 = v161;
      v8 = v160;
      a1 = v183;

      v22 = v156;
      v143 = v181;
    }
    objc_msgSend_objectForKey_(v4, v150, (uint64_t)CFSTR("ttlSec"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v171;
    if (v171)
      v175 = v185;
    else
      v175 = 0;
    if (v175 == 1)
    {
      v176 = objc_msgSend_integerValue(v171, v172, v173);
      objc_msgSend__expirationDateForTTLSeconds_(a1, v177, v176);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExpirationDate_(v22, v179, (uint64_t)v178);

    }
    objc_msgSend_setFlag_(v22, v172, 1);
    v19 = v22;

    v6 = v187;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v18, OS_LOG_TYPE_ERROR, "Received malformed throttling config. Discarding.", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)throttleFromPThrottlingConfig:(id)a3
{
  id v4;
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
  BOOL v16;
  id v18;
  int hasContainerName;
  int v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  unsigned int v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t started;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  char v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  const char *v110;
  id v111;
  NSObject *v112;
  void *v113;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  uint8_t buf[4];
  int v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_hasLabel(v4, v5, v6))
  {
    objc_msgSend_label(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend_hasCriteria(v4, v7, v8))
  {
    objc_msgSend_criteria(v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend_hasRateLimit(v4, v10, v11))
  {
    objc_msgSend_rateLimit(v4, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if (v9)
    v16 = v12 == 0;
  else
    v16 = 0;
  LODWORD(v18) = v16 && v15 == 0;
  if (v12)
  {
    hasContainerName = objc_msgSend_hasContainerName(v12, v13, v14);
    if (v15)
      v20 = hasContainerName;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  if (((v18 | v20) & 1) != 0)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C951E8]);
    v24 = v21;
    if (v9)
      objc_msgSend_setLabel_(v21, v22, (uint64_t)v9);
    if (objc_msgSend_hasContainerName(v12, v22, v23))
    {
      objc_msgSend_containerName(v12, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setContainerIdentifier_(v24, v28, (uint64_t)v27);

    }
    if (objc_msgSend_hasDatabaseType(v12, v25, v26))
    {
      v32 = objc_msgSend_databaseType(v12, v29, v30) - 1;
      if (v32 >= 4)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v113 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          v115 = v113;
          *(_DWORD *)buf = 67109120;
          v120 = objc_msgSend_databaseType(v12, v116, v117);
          _os_log_error_impl(&dword_1BE990000, v115, OS_LOG_TYPE_ERROR, "Received throttle with unknown database type: %d. Discarding.", buf, 8u);

        }
        v111 = 0;
        goto LABEL_68;
      }
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v31, qword_1BECBC0E8[v32]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDatabaseScope_(v24, v34, (uint64_t)v33);

    }
    if (objc_msgSend_hasZoneName(v12, v29, v30))
    {
      objc_msgSend_zoneName(v12, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneName_(v24, v38, (uint64_t)v37);

    }
    if (objc_msgSend_hasOperationType(v12, v35, v36))
    {
      v41 = (void *)MEMORY[0x1E0CB37E8];
      v42 = objc_msgSend_operationType(v12, v39, v40);
      objc_msgSend_numberWithInt_(v41, v43, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOperationType_(v24, v45, (uint64_t)v44);

    }
    if (objc_msgSend_hasInvernessServiceName(v12, v39, v40))
    {
      objc_msgSend_invernessServiceName(v12, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setServiceName_(v24, v49, (uint64_t)v48);

    }
    if (objc_msgSend_hasInvernessFunctionName(v12, v46, v47))
    {
      objc_msgSend_invernessFunctionName(v12, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFunctionName_(v24, v53, (uint64_t)v52);

    }
    if (objc_msgSend_hasBundleID(v12, v50, v51))
    {
      objc_msgSend_bundleID(v12, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBundleID_(v24, v57, (uint64_t)v56);

    }
    if (objc_msgSend_hasOperationGroupName(v12, v54, v55))
    {
      objc_msgSend_operationGroupName(v12, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOperationGroupNamePrefix_(v24, v61, (uint64_t)v60);

    }
    if (objc_msgSend_hasIntervalLengthSec(v15, v58, v59))
    {
      v64 = (void *)MEMORY[0x1E0CB37E8];
      v65 = objc_msgSend_intervalLengthSec(v15, v62, v63);
      objc_msgSend_numberWithInt_(v64, v66, v65);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setIntervalLengthSeconds_(v24, v68, (uint64_t)v67);

    }
    if (objc_msgSend_hasAllowedRequestCount(v15, v62, v63))
    {
      v71 = (void *)MEMORY[0x1E0CB37E8];
      v72 = objc_msgSend_allowedRequestCount(v15, v69, v70);
      objc_msgSend_numberWithInt_(v71, v73, v72);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAllowedRequestCount_(v24, v75, (uint64_t)v74);

    }
    if (objc_msgSend_hasRepeatEverySec(v15, v69, v70))
    {
      v78 = (void *)MEMORY[0x1E0CB37E8];
      v79 = objc_msgSend_repeatEverySec(v15, v76, v77);
      objc_msgSend_numberWithInt_(v78, v80, v79);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setRepeatEverySeconds_(v24, v82, (uint64_t)v81);

    }
    if (objc_msgSend_hasStartTimeSecondsAfterUnixEpoch(v15, v76, v77))
    {
      started = objc_msgSend_startTimeSecondsAfterUnixEpoch(v15, v83, v84);
      objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v86, v87, (double)started);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setThrottleStartDate_(v24, v89, (uint64_t)v88);

    }
    if (objc_msgSend_hasStartTimeSecondsAfterLocalMidnight(v15, v83, v84))
    {
      v92 = objc_msgSend_startTimeSecondsAfterLocalMidnight(v15, v90, v91);
      objc_msgSend_currentCalendar(MEMORY[0x1E0C99D48], v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_date(MEMORY[0x1E0C99D68], v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startOfDayForDate_(v95, v99, (uint64_t)v98);
      v118 = v9;
      v100 = (char)v18;
      v18 = a1;
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_dateByAddingTimeInterval_(v101, v102, v103, (double)v92);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setThrottleStartDate_(v24, v105, (uint64_t)v104);

      a1 = v18;
      LOBYTE(v18) = v100;
      v9 = v118;

    }
    if ((v18 & 1) == 0 && objc_msgSend_hasTtlSec(v4, v90, v91))
    {
      v107 = objc_msgSend_ttlSec(v4, v90, v106);
      objc_msgSend__expirationDateForTTLSeconds_(a1, v108, v107);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setExpirationDate_(v24, v110, (uint64_t)v109);

    }
    objc_msgSend_setFlag_(v24, v90, 2);
    v111 = v24;
LABEL_68:

    goto LABEL_69;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v112 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE990000, v112, OS_LOG_TYPE_ERROR, "Received malformed throttling config. Discarding.", buf, 2u);
  }
  v111 = 0;
LABEL_69:

  return v111;
}

- (CKDLogicalDeviceContext)deviceContext
{
  return (CKDLogicalDeviceContext *)objc_loadWeakRetained((id *)&self->_deviceContext);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceContext);
  objc_storeStrong((id *)&self->_throttleTable, 0);
  objc_storeStrong((id *)&self->_throttleTableGroup, 0);
}

@end
