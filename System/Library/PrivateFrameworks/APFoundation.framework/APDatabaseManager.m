@implementation APDatabaseManager

- (BOOL)executeQuery:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  sqlite3_stmt *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;

  v6 = a4;
  v7 = a3;
  objc_msgSend_lock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14);
  v17 = (sqlite3_stmt *)objc_msgSend__prepareStatementForQuery_(self, v15, (uint64_t)v7, v16);

  if (v17)
  {
    if (objc_msgSend__bindParameters_toStatement_(self, v18, (uint64_t)v6, (uint64_t)v17))
    {
      v21 = sqlite3_step(v17);
      v23 = (_DWORD)v21 == 9 || (v21 & 0xFFFFFFFE) == 100;
      if ((v21 - 100) >= 2)
      {
        v24 = v21;
        if ((_DWORD)v21 != 9)
        {
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = sqlite3_errstr(v21);
          objc_msgSend_stringWithFormat_(v25, v27, (uint64_t)CFSTR("Execute query error: %s"), v28, v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend_currentVersion(self, v30, v31, v32);
          objc_msgSend_dbName(self, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          APDatabaseError(433, v24, v33, v37, v29);

        }
      }
    }
    else
    {
      v23 = 0;
    }
    sqlite3_finalize(v17);
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend_unlock(v11, v18, v19, v20);

  return v23;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (sqlite3_stmt)_prepareStatementForQuery:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  sqlite3 *database;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  sqlite3_stmt *v28;
  sqlite3_stmt *ppStmt;

  v4 = a3;
  if (objc_msgSend__isConnectionValidWithErrorDescription_(self, v5, (uint64_t)CFSTR("No connection on prepare statement."), v6))
  {
    ppStmt = 0;
    database = self->_database;
    v8 = objc_retainAutorelease(v4);
    v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
    v13 = sqlite3_prepare_v2(database, v12, -1, &ppStmt, 0);
    if (!(_DWORD)v13)
    {
      v28 = ppStmt;
      goto LABEL_6;
    }
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = sqlite3_errstr(v13);
    objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("Prepare statement error: %s"), v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_currentVersion(self, v20, v21, v22);
    objc_msgSend_dbName(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    APDatabaseError(441, v14, v23, v27, v19);

  }
  v28 = 0;
LABEL_6:

  return v28;
}

- (BOOL)_bindParameters:(id)a3 toStatement:(sqlite3_stmt *)a4
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char isKindOfClass;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  char v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  sqlite3_int64 v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  char v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  char v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  char v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  char v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  char v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  BOOL v125;
  NSObject *v126;
  void *v127;
  id v128;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  const char *v135;
  const char *v136;
  id obj;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint8_t buf[4];
  void *v144;
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  obj = a3;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v139, (uint64_t)v145, 16);
  if (!v6)
  {
LABEL_34:
    v125 = 1;
    goto LABEL_50;
  }
  v10 = v6;
  v11 = 1;
  v12 = *(_QWORD *)v140;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v140 != v12)
      objc_enumerationMutation(obj);
    v14 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v13);
    objc_msgSend_value(v14, v7, v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      break;
    sqlite3_bind_null(a4, v11 + v13);
LABEL_32:
    if (v10 == ++v13)
    {
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v139, (uint64_t)v145, 16);
      v11 += v13;
      if (!v10)
        goto LABEL_34;
      goto LABEL_3;
    }
  }
  switch(objc_msgSend_type(v14, v16, v17, v18))
  {
    case 0:
      objc_msgSend_value(v14, v7, v8, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend_value(v14, v21, v22, v23);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_intValue(v24, v25, v26, v27);
        v29 = sqlite3_bind_int(a4, v11 + v13, v28);
        if ((_DWORD)v29)
        {
          v30 = v29;
          v31 = (void *)MEMORY[0x1E0CB3940];
          v130 = sqlite3_errstr(v29);
          objc_msgSend_stringWithFormat_(v31, v32, (uint64_t)CFSTR("Bind Integer error: %s"), v33, v130);
LABEL_30:
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = objc_msgSend_currentVersion(self, v117, v118, v119);
          objc_msgSend_dbName(self, v121, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          APDatabaseError(442, v30, v120, v124, v116);

          goto LABEL_31;
        }
        goto LABEL_31;
      }
      APLogForCategory(0xBuLL);
      v126 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      break;
    case 1:
      objc_msgSend_value(v14, v7, v8, v9);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) != 0)
      {
        objc_msgSend_value(v14, v36, v37, v38);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend_longValue(v24, v39, v40, v41);
        v43 = sqlite3_bind_int64(a4, v11 + v13, v42);
        if ((_DWORD)v43)
        {
          v30 = v43;
          v44 = (void *)MEMORY[0x1E0CB3940];
          v131 = sqlite3_errstr(v43);
          objc_msgSend_stringWithFormat_(v44, v45, (uint64_t)CFSTR("Bind Integer64 error: %s"), v46, v131);
          goto LABEL_30;
        }
LABEL_31:

        goto LABEL_32;
      }
      APLogForCategory(0xBuLL);
      v126 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      break;
    case 2:
      objc_msgSend_value(v14, v7, v8, v9);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v48 = objc_opt_isKindOfClass();

      if ((v48 & 1) != 0)
      {
        objc_msgSend_value(v14, v49, v50, v51);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v24, v52, v53, v54);
        v56 = sqlite3_bind_double(a4, v11 + v13, v55);
        if ((_DWORD)v56)
        {
          v30 = v56;
          v57 = (void *)MEMORY[0x1E0CB3940];
          v132 = sqlite3_errstr(v56);
          objc_msgSend_stringWithFormat_(v57, v58, (uint64_t)CFSTR("Bind Real error: %s"), v59, v132);
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      APLogForCategory(0xBuLL);
      v126 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      break;
    case 3:
      objc_msgSend_value(v14, v7, v8, v9);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v61 = objc_opt_isKindOfClass();

      if ((v61 & 1) != 0)
      {
        objc_msgSend_value(v14, v62, v63, v64);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v68 = (const char *)objc_msgSend_UTF8String(v24, v65, v66, v67);
        v69 = sqlite3_bind_text(a4, v11 + v13, v68, -1, 0);
        if ((_DWORD)v69)
        {
          v30 = v69;
          v70 = (void *)MEMORY[0x1E0CB3940];
          v133 = sqlite3_errstr(v69);
          objc_msgSend_stringWithFormat_(v70, v71, (uint64_t)CFSTR("Bind Text error: %s"), v72, v133);
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      APLogForCategory(0xBuLL);
      v126 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      break;
    case 4:
      objc_msgSend_value(v14, v7, v8, v9);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v74 = objc_opt_isKindOfClass();

      if ((v74 & 1) != 0)
      {
        objc_msgSend_value(v14, v75, v76, v77);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSince1970(v24, v78, v79, v80);
        v82 = sqlite3_bind_double(a4, v11 + v13, v81);
        if ((_DWORD)v82)
        {
          v30 = v82;
          v83 = (void *)MEMORY[0x1E0CB3940];
          v134 = sqlite3_errstr(v82);
          objc_msgSend_stringWithFormat_(v83, v84, (uint64_t)CFSTR("Bind Date error: %s"), v85, v134);
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      APLogForCategory(0xBuLL);
      v126 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      break;
    case 5:
      objc_msgSend_value(v14, v7, v8, v9);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v87 = objc_opt_isKindOfClass();

      if ((v87 & 1) != 0)
      {
        objc_msgSend_value(v14, v88, v89, v90);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend_intValue(v24, v91, v92, v93);
        v95 = sqlite3_bind_int(a4, v11 + v13, v94);
        if ((_DWORD)v95)
        {
          v30 = v95;
          v96 = (void *)MEMORY[0x1E0CB3940];
          v135 = sqlite3_errstr(v95);
          objc_msgSend_stringWithFormat_(v96, v97, (uint64_t)CFSTR("Bind Bool error: %s"), v98, v135);
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      APLogForCategory(0xBuLL);
      v126 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      break;
    case 6:
      objc_msgSend_value(v14, v7, v8, v9);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v100 = objc_opt_isKindOfClass();

      if ((v100 & 1) != 0)
      {
        objc_msgSend_value(v14, v101, v102, v103);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v107 = (const void *)objc_msgSend_bytes(v24, v104, v105, v106);
        v111 = objc_msgSend_length(v24, v108, v109, v110);
        v112 = sqlite3_bind_blob(a4, v11 + v13, v107, v111, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        if ((_DWORD)v112)
        {
          v30 = v112;
          v113 = (void *)MEMORY[0x1E0CB3940];
          v136 = sqlite3_errstr(v112);
          objc_msgSend_stringWithFormat_(v113, v114, (uint64_t)CFSTR("Bind Blob error: %s"), v115, v136);
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      APLogForCategory(0xBuLL);
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        break;
LABEL_49:

      v125 = 0;
LABEL_50:

      return v125;
    default:
      goto LABEL_32;
  }
  v127 = (void *)objc_opt_class();
  *(_DWORD *)buf = 138477827;
  v144 = v127;
  v128 = v127;
  _os_log_impl(&dword_1CF251000, v126, OS_LOG_TYPE_ERROR, "[%{private}@]: Error - Bind parameter column type class type mismatch.", buf, 0xCu);

  goto LABEL_49;
}

+ (id)mainDatabase
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  APDatabaseManager *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v27;
  id v28;
  APDeviceLockedTask *v29;
  APDatabaseManager *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, const char *);
  void *v39;
  APDatabaseManager *v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_isPromotedContentDaemon(MEMORY[0x1E0CB34D0], a2, v2, v3))
    return 0;
  objc_msgSend_sharedInstance(APUniversalSingleton, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainDatabase(v8, v9, v10, v11);
  v12 = (APDatabaseManager *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = a1;
    objc_sync_enter(v13);
    objc_msgSend_mainDatabase(v8, v14, v15, v16);
    v12 = (APDatabaseManager *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(APDatabaseManager);
      objc_msgSend_pathForName_(APDatabasePath, v17, (uint64_t)CFSTR("APDatabase"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_deviceUnlockedSinceBoot(APDeviceLockedTask, v20, v21, v22))
      {
        objc_msgSend__openDBConnectionCanRepeat_databasePath_(v12, v23, 1, (uint64_t)v19);
      }
      else
      {
        APLogForCategory(0xBuLL);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v43 = (id)objc_opt_class();
          v28 = v43;
          _os_log_impl(&dword_1CF251000, v27, OS_LOG_TYPE_DEFAULT, "[%{private}@]: APDatabase connection delayed until first unlock.", buf, 0xCu);

        }
        v29 = [APDeviceLockedTask alloc];
        v36 = MEMORY[0x1E0C809B0];
        v37 = 3221225472;
        v38 = sub_1CF287144;
        v39 = &unk_1E8C48760;
        v30 = v12;
        v40 = v30;
        v41 = v19;
        v33 = (void *)objc_msgSend_initWithHandler_(v29, v31, (uint64_t)&v36, v32);
        objc_msgSend_setDeviceLockedTask_(v30, v34, (uint64_t)v33, v35, v36, v37, v38, v39);

      }
      objc_msgSend_setMainDatabase_(v8, v24, (uint64_t)v12, v25);

    }
    objc_sync_exit(v13);

  }
  return v12;
}

- (APDatabaseManager)init
{
  APDatabaseManager *v2;
  APUnfairLock *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  APUnfairLock *lock;
  NSString *dbName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APDatabaseManager;
  v2 = -[APDatabaseManager init](&v10, sel_init);
  if (v2)
  {
    v3 = [APUnfairLock alloc];
    v6 = objc_msgSend_initWithOptions_(v3, v4, 1, v5);
    lock = v2->_lock;
    v2->_lock = (APUnfairLock *)v6;

    dbName = v2->_dbName;
    v2->_dbName = (NSString *)CFSTR("N/A");

    v2->_currentVersion = -1;
    v2->_openConnectionResult = -1;
  }
  return v2;
}

- (BOOL)openDatabaseConnectionWithName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isConnectionOpen;
  uint64_t v15;

  v4 = a3;
  objc_msgSend_pathForName_(APDatabasePath, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__openDBConnectionCanRepeat_databasePath_(self, v8, 1, (uint64_t)v7);
  if ((objc_msgSend_setUpDatabaseWithPath_(self, v9, (uint64_t)v7, v10) & 1) != 0)
  {
    isConnectionOpen = objc_msgSend__isConnectionOpen(self, v11, v12, v13);
  }
  else
  {
    v15 = objc_msgSend_currentVersion(self, v11, v12, v13);
    APDatabaseError(430, 0xFFFFFFFFLL, v15, v4, CFSTR("SetUp failed after opening connection with name."));
    isConnectionOpen = 0;
  }

  return isConnectionOpen;
}

- (BOOL)openConnectionIfFileExistsToDatabaseWithName:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char isConnectionOpen;

  objc_msgSend_pathForName_(APDatabasePath, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseFilePath(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_fileExistsAtPath_(v13, v14, (uint64_t)v9, v15))
  {
    objc_msgSend__openDBConnectionCanRepeat_databasePath_(self, v16, 1, (uint64_t)v5);
    isConnectionOpen = objc_msgSend__isConnectionOpen(self, v17, v18, v19);
  }
  else
  {
    isConnectionOpen = 0;
  }

  return isConnectionOpen;
}

- (void)closeDatabaseConnection
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  sqlite3 *database;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0;
  }
  objc_msgSend_setDbName_(self, v9, (uint64_t)CFSTR("N/A"), v10);
  objc_msgSend_setCurrentVersion_(self, v12, -1, v13);
  objc_msgSend_setOpenConnectionResult_(self, v14, 0xFFFFFFFFLL, v15);
  objc_msgSend_unlock(v5, v16, v17, v18);
  objc_msgSend_setTableCache_(self, v19, 0, v20);
  APLogForCategory(0xBuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138477827;
    v24 = (id)objc_opt_class();
    v22 = v24;
    _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database connection closed sucessfully.", (uint8_t *)&v23, 0xCu);

  }
}

- (id)executeSelectQuery:(id)a3 forTable:(id)a4 withParameters:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  sqlite3_stmt *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  int v35;
  int i;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  id v44;
  int v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  id v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const unsigned __int8 *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  sqlite3_int64 v64;
  const char *v65;
  uint64_t v66;
  id v67;
  _BOOL8 v68;
  const char *v69;
  uint64_t v70;
  id v71;
  const void *v72;
  int v73;
  const char *v74;
  void *v75;
  void *v77;
  id v78;
  void *v79;
  id v80;

  v8 = a3;
  v80 = a4;
  v9 = a5;
  objc_msgSend_lock(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v13, v14, v15, v16);
  v19 = objc_msgSend__prepareStatementForQuery_(self, v17, (uint64_t)v8, v18);
  if (v19)
  {
    v23 = (sqlite3_stmt *)v19;
    if (objc_msgSend__bindParameters_toStatement_(self, v20, (uint64_t)v9, v19))
    {
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (sqlite3_step(v23) == 100)
      {
        v77 = v13;
        v78 = v8;
        v79 = v24;
        do
        {
          v28 = objc_alloc((Class)objc_msgSend_rowClass(v80, v25, v26, v27));
          v31 = (void *)objc_msgSend_initWithTable_(v28, v29, (uint64_t)v80, v30);
          v32 = sqlite3_column_count(v23);
          if (v32 >= 1)
          {
            v35 = v32;
            for (i = 0; i != v35; ++i)
            {
              if (sqlite3_column_type(v23, i) != 5)
              {
                v37 = (void *)MEMORY[0x1E0CB3940];
                v38 = sqlite3_column_name(v23, i);
                objc_msgSend_stringWithUTF8String_(v37, v39, (uint64_t)v38, v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                switch(objc_msgSend_typeForColumnName_(v31, v42, (uint64_t)v41, v43))
                {
                  case 0:
                    v44 = objc_alloc(MEMORY[0x1E0CB37E8]);
                    v45 = sqlite3_column_int(v23, i);
                    v48 = objc_msgSend_initWithInteger_(v44, v46, v45, v47);
                    goto LABEL_16;
                  case 1:
                    v63 = objc_alloc(MEMORY[0x1E0CB37E8]);
                    v64 = sqlite3_column_int64(v23, i);
                    v48 = objc_msgSend_initWithLong_(v63, v65, v64, v66);
                    goto LABEL_16;
                  case 2:
                    v50 = objc_alloc(MEMORY[0x1E0CB37E8]);
                    v51 = sqlite3_column_double(v23, i);
                    v48 = objc_msgSend_initWithDouble_(v50, v52, v53, v54, v51);
                    goto LABEL_16;
                  case 3:
                    v55 = (void *)MEMORY[0x1E0CB3940];
                    v56 = sqlite3_column_text(v23, i);
                    objc_msgSend_stringWithUTF8String_(v55, v57, (uint64_t)v56, v58);
                    v48 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_16;
                  case 4:
                    v59 = sqlite3_column_double(v23, i);
                    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v60, v61, v62, v59);
                    v48 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_16;
                  case 5:
                    v67 = objc_alloc(MEMORY[0x1E0CB37E8]);
                    v68 = sqlite3_column_int(v23, i) != 0;
                    v48 = objc_msgSend_initWithBool_(v67, v69, v68, v70);
                    goto LABEL_16;
                  case 6:
                    v71 = objc_alloc(MEMORY[0x1E0C99D50]);
                    v72 = sqlite3_column_blob(v23, i);
                    v73 = sqlite3_column_bytes(v23, i);
                    v48 = objc_msgSend_initWithBytes_length_(v71, v74, (uint64_t)v72, v73);
LABEL_16:
                    v75 = (void *)v48;
                    objc_msgSend_setValue_forColumnName_(v31, v49, v48, (uint64_t)v41);

                    break;
                  default:
                    break;
                }

              }
            }
          }
          v24 = v79;
          objc_msgSend_addObject_(v79, v33, (uint64_t)v31, v34);

        }
        while (sqlite3_step(v23) == 100);
        v8 = v78;
        v13 = v77;
      }
    }
    else
    {
      v24 = 0;
    }
    sqlite3_finalize(v23);
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend_unlock(v13, v20, v21, v22);

  return v24;
}

- (id)getCursorForQuery:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  sqlite3_stmt *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  APDatabaseCursor *v24;
  const char *v25;
  void *v26;

  v6 = a4;
  v7 = a3;
  objc_msgSend_lock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14);
  v17 = (sqlite3_stmt *)objc_msgSend__prepareStatementForQuery_(self, v15, (uint64_t)v7, v16);

  if (!v17)
    goto LABEL_5;
  if ((objc_msgSend__bindParameters_toStatement_(self, v18, (uint64_t)v6, (uint64_t)v17) & 1) == 0)
  {
    sqlite3_finalize(v17);
LABEL_5:
    objc_msgSend_unlock(v11, v18, v19, v20);
    v26 = 0;
    goto LABEL_6;
  }
  objc_msgSend_unlock(v11, v21, v22, v23);
  v24 = [APDatabaseCursor alloc];
  v26 = (void *)objc_msgSend_initWithStatement_lock_(v24, v25, (uint64_t)v17, (uint64_t)v11);
LABEL_6:

  return v26;
}

- (id)getTableForClass:(Class)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char isKindOfClass;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  objc_msgSend_tableCache(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getObjectForIdentifier_(v6, v8, (uint64_t)v7, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v13 = (void *)v10;
    objc_msgSend_recentlyAccessedObject_(v6, v11, v10, v12);
  }
  else
  {
    v14 = objc_alloc_init(a3);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v19 = [a3 alloc];
      v13 = (void *)objc_msgSend_initWithDatabaseManager_(v19, v20, (uint64_t)self, v21);
      if (v13)
      {
        objc_msgSend_setObject_(v6, v22, (uint64_t)v13, v24);
      }
      else
      {
        v30 = objc_msgSend_currentVersion(self, v22, v23, v24);
        objc_msgSend_dbName(self, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        APDatabaseError(432, 0xFFFFFFFFLL, v30, v34, &stru_1E8C4E328);

      }
    }
    else
    {
      v25 = objc_msgSend_currentVersion(self, v16, v17, v18);
      objc_msgSend_dbName(self, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      APDatabaseError(431, 0xFFFFFFFFLL, v25, v29, &stru_1E8C4E328);

      v13 = 0;
    }
  }

  return v13;
}

- (id)executeSelectQuery:(id)a3 forTable:(id)a4 withParameters:(id)a5 groupedByColumn:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  sqlite3_stmt *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  int v35;
  const char *v36;
  uint64_t v37;
  int v38;
  int v39;
  __CFString *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  int v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  id v54;
  double v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const unsigned __int8 *v60;
  const char *v61;
  uint64_t v62;
  __CFString *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  sqlite3_int64 v72;
  const char *v73;
  uint64_t v74;
  id v75;
  _BOOL8 v76;
  const char *v77;
  uint64_t v78;
  id v79;
  const void *v80;
  int v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  _QWORD v107[2];

  v107[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v105 = a4;
  v11 = a5;
  v106 = a6;
  objc_msgSend_lock(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v15, v16, v17, v18);
  v21 = objc_msgSend__prepareStatementForQuery_(self, v19, (uint64_t)v10, v20);
  if (v21)
  {
    v25 = (sqlite3_stmt *)v21;
    if (objc_msgSend__bindParameters_toStatement_(self, v22, (uint64_t)v11, v21))
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (sqlite3_step(v25) == 100)
      {
        v101 = v15;
        v102 = v11;
        v103 = v10;
        v104 = v26;
        v30 = 0x1E0CB3000uLL;
        do
        {
          v31 = objc_alloc((Class)objc_msgSend_rowClass(v105, v27, v28, v29, v101, v102, v103));
          v34 = (void *)objc_msgSend_initWithTable_(v31, v32, (uint64_t)v105, v33);
          v35 = sqlite3_column_count(v25);
          if (v35 < 1)
          {
            v40 = CFSTR("N/A");
          }
          else
          {
            v38 = v35;
            v39 = 0;
            v40 = CFSTR("N/A");
            do
            {
              if (sqlite3_column_type(v25, v39) != 5)
              {
                v41 = (void *)MEMORY[0x1E0CB3940];
                v42 = sqlite3_column_name(v25, v39);
                objc_msgSend_stringWithUTF8String_(v41, v43, (uint64_t)v42, v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                switch(objc_msgSend_typeForColumnName_(v34, v46, (uint64_t)v45, v47))
                {
                  case 0:
                    v48 = objc_alloc(*(Class *)(v30 + 2024));
                    v49 = sqlite3_column_int(v25, v39);
                    v52 = objc_msgSend_initWithInteger_(v48, v50, v49, v51);
                    goto LABEL_17;
                  case 1:
                    v71 = objc_alloc(*(Class *)(v30 + 2024));
                    v72 = sqlite3_column_int64(v25, v39);
                    v52 = objc_msgSend_initWithLong_(v71, v73, v72, v74);
                    goto LABEL_17;
                  case 2:
                    v54 = objc_alloc(*(Class *)(v30 + 2024));
                    v55 = sqlite3_column_double(v25, v39);
                    v52 = objc_msgSend_initWithDouble_(v54, v56, v57, v58, v55);
                    goto LABEL_17;
                  case 3:
                    v59 = (void *)MEMORY[0x1E0CB3940];
                    v60 = sqlite3_column_text(v25, v39);
                    objc_msgSend_stringWithUTF8String_(v59, v61, (uint64_t)v60, v62);
                    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setValue_forColumnName_(v34, v64, (uint64_t)v63, (uint64_t)v45);
                    if (objc_msgSend_isEqualToString_(v45, v65, (uint64_t)v106, v66))
                    {
                      v63 = v63;

                      v40 = v63;
                    }
                    goto LABEL_18;
                  case 4:
                    v67 = sqlite3_column_double(v25, v39);
                    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], v68, v69, v70, v67);
                    v52 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_17;
                  case 5:
                    v75 = objc_alloc(*(Class *)(v30 + 2024));
                    v76 = sqlite3_column_int(v25, v39) != 0;
                    v52 = objc_msgSend_initWithBool_(v75, v77, v76, v78);
                    goto LABEL_17;
                  case 6:
                    v79 = objc_alloc(MEMORY[0x1E0C99D50]);
                    v80 = sqlite3_column_blob(v25, v39);
                    v81 = sqlite3_column_bytes(v25, v39);
                    v82 = (uint64_t)v80;
                    v30 = 0x1E0CB3000;
                    v52 = objc_msgSend_initWithBytes_length_(v79, v83, v82, v81);
LABEL_17:
                    v63 = (__CFString *)v52;
                    objc_msgSend_setValue_forColumnName_(v34, v53, v52, (uint64_t)v45);
LABEL_18:

                    break;
                  default:
                    break;
                }

              }
              ++v39;
            }
            while (v38 != v39);
          }
          v26 = v104;
          objc_msgSend_objectForKey_(v104, v36, (uint64_t)v40, v37);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          if (v84)
          {
            v88 = v84;
            v89 = (void *)objc_msgSend_mutableCopy(v84, v85, v86, v87);
            objc_msgSend_addObject_(v89, v90, (uint64_t)v34, v91);
            objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v92, (uint64_t)v89, v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_setObject_forKey_(v104, v95, (uint64_t)v94, (uint64_t)v40);
            v30 = 0x1E0CB3000;
          }
          else
          {
            v107[0] = v34;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v85, (uint64_t)v107, 1);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKey_(v104, v96, (uint64_t)v94, (uint64_t)v40);
          }

        }
        while (sqlite3_step(v25) == 100);
        v11 = v102;
        v10 = v103;
        v15 = v101;
      }
    }
    else
    {
      v26 = 0;
    }
    sqlite3_finalize(v25);
    objc_msgSend_unlock(v15, v97, v98, v99);
  }
  else
  {
    objc_msgSend_unlock(v15, v22, v23, v24);
    v26 = 0;
  }

  return v26;
}

- (id)executeSelectStringsQuery:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  sqlite3_stmt *v21;
  id v22;
  void *v23;
  const unsigned __int8 *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend_lock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14);
  v17 = objc_msgSend__prepareStatementForQuery_(self, v15, (uint64_t)v6, v16);
  if (v17)
  {
    v21 = (sqlite3_stmt *)v17;
    if (objc_msgSend__bindParameters_toStatement_(self, v18, (uint64_t)v7, v17))
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      while (sqlite3_step(v21) == 100)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = sqlite3_column_text(v21, 0);
        objc_msgSend_stringWithUTF8String_(v23, v25, (uint64_t)v24, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v22, v28, (uint64_t)v27, v29);

      }
    }
    else
    {
      v22 = 0;
    }
    sqlite3_finalize(v21);
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend_unlock(v11, v18, v19, v20);

  return v22;
}

- (int64_t)executeInsertQuery:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  sqlite3_stmt *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  sqlite3_int64 insert_rowid;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v6 = a4;
  v7 = a3;
  objc_msgSend_lock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14);
  v17 = (sqlite3_stmt *)objc_msgSend__prepareStatementForQuery_(self, v15, (uint64_t)v7, v16);

  if (v17)
  {
    if (objc_msgSend__bindParameters_toStatement_(self, v18, (uint64_t)v6, (uint64_t)v17))
    {
      v21 = sqlite3_step(v17);
      if ((v21 - 100) < 2 || (v22 = v21, (_DWORD)v21 == 9))
      {
        insert_rowid = sqlite3_last_insert_rowid(self->_database);
LABEL_9:
        sqlite3_finalize(v17);
        goto LABEL_10;
      }
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = sqlite3_errstr(v21);
      objc_msgSend_stringWithFormat_(v24, v26, (uint64_t)CFSTR("Execute insert query error: %s"), v27, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_currentVersion(self, v29, v30, v31);
      objc_msgSend_dbName(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      APDatabaseError(434, v22, v32, v36, v28);

    }
    insert_rowid = -1;
    goto LABEL_9;
  }
  insert_rowid = -1;
LABEL_10:
  objc_msgSend_unlock(v11, v18, v19, v20);

  return insert_rowid;
}

- (BOOL)setUpMainDatabase
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_pathForName_(APDatabasePath, a2, (uint64_t)CFSTR("APDatabase"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend_setUpDatabaseWithPath_(self, v5, (uint64_t)v4, v6);

  return (char)self;
}

- (BOOL)setUpDatabaseWithPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int isConnectionValidWithErrorDescription;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  BOOL v33;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11);
  isConnectionValidWithErrorDescription = objc_msgSend__isConnectionValidWithErrorDescription_(self, v12, (uint64_t)CFSTR("No connection on Set Up DB with path."), v13);
  objc_msgSend_unlock(v8, v15, v16, v17);
  if (isConnectionValidWithErrorDescription)
  {
    v21 = 3;
    while (1)
    {
      if (v21 == 1)
      {
        v22 = objc_msgSend_currentVersion(self, v18, v19, v20);
        objc_msgSend_dbName(self, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        APDatabaseError(443, 0xFFFFFFFFLL, v22, v26, CFSTR("Reacreating Database File."));

        objc_msgSend_closeDatabaseConnection(self, v27, v28, v29);
        objc_msgSend_removeDatabaseAtPath_(APDatabaseFileUtilities, v30, (uint64_t)v4, v31);
        objc_msgSend__openDBConnectionCanRepeat_databasePath_(self, v32, 1, (uint64_t)v4);
      }
      if ((objc_msgSend__updateVersionForPath_(self, v18, (uint64_t)v4, v20) & 1) != 0)
        break;
      if (!--v21)
      {
        objc_msgSend_closeDatabaseConnection(self, v18, v19, v20);
        v33 = 0;
        goto LABEL_9;
      }
    }
  }
  v33 = 1;
LABEL_9:

  return v33;
}

- (void)beginTransaction
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  objc_msgSend_lock(self, a2, v2, v3);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v28, v5, v6, v7);
  if (objc_msgSend__isConnectionValidWithErrorDescription_(self, v8, (uint64_t)CFSTR("No connection on begin transaction."), v9))
  {
    v13 = sqlite3_exec(self->_database, "BEGIN EXCLUSIVE TRANSACTION", 0, 0, 0);
    if ((_DWORD)v13)
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = sqlite3_errstr(v13);
      objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("Execute begin transaction error: %s"), v18, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_currentVersion(self, v20, v21, v22);
      objc_msgSend_dbName(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      APDatabaseError(436, v14, v23, v27, v19);

    }
  }
  objc_msgSend_unlock(v28, v10, v11, v12);

}

- (void)commitTransaction
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  objc_msgSend_lock(self, a2, v2, v3);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v28, v5, v6, v7);
  if (objc_msgSend__isConnectionValidWithErrorDescription_(self, v8, (uint64_t)CFSTR("No connection on commit transaction."), v9))
  {
    v13 = sqlite3_exec(self->_database, "COMMIT TRANSACTION", 0, 0, 0);
    if ((_DWORD)v13)
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = sqlite3_errstr(v13);
      objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("Execute commit transaction error: %s"), v18, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_currentVersion(self, v20, v21, v22);
      objc_msgSend_dbName(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      APDatabaseError(437, v14, v23, v27, v19);

    }
  }
  objc_msgSend_unlock(v28, v10, v11, v12);

}

- (void)incrementalVacuumIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const __CFString *v43;
  NSObject *v44;
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  id v51;
  _BYTE v52[22];
  __int16 v53;
  const __CFString *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  if ((objc_msgSend__isConnectionValidWithErrorDescription_(self, v9, (uint64_t)CFSTR("No connection on incremental vacuum."), v10) & 1) != 0)
  {
    objc_msgSend__executePragmaSelectQuery_(self, v11, (uint64_t)CFSTR("PRAGMA freelist_count"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__executePragmaSelectQuery_(self, v15, (uint64_t)CFSTR("PRAGMA page_count"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17;
    if (v14 && v17)
    {
      objc_msgSend_doubleValue(v17, v18, v19, v20);
      v23 = v22 * 0.05;
      objc_msgSend_doubleValue(v14, v24, v25, v26);
      v28 = v27;
      v29 = fmax(v23, 256.0);
      APLogForCategory(0xBuLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_opt_class();
        v32 = v31;
        objc_msgSend_doubleValue(v14, v33, v34, v35);
        v37 = v36;
        objc_msgSend_doubleValue(v21, v38, v39, v40);
        v42 = v37 / v41;
        v43 = CFSTR("WILL NOT");
        *(_DWORD *)v52 = 138478339;
        *(_QWORD *)&v52[4] = v31;
        if (v28 >= v29)
          v43 = CFSTR("WILL");
        *(_WORD *)&v52[12] = 2048;
        *(double *)&v52[14] = v42;
        v53 = 2112;
        v54 = v43;
        _os_log_impl(&dword_1CF251000, v30, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database has %f free pages, %@. vacuum.", v52, 0x20u);

      }
      if (v28 >= v29)
      {
        APLogForCategory(0xBuLL);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = (void *)objc_opt_class();
          *(_DWORD *)v52 = 138477827;
          *(_QWORD *)&v52[4] = v45;
          v46 = v45;
          _os_log_impl(&dword_1CF251000, v44, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database vacuuming started.", v52, 0xCu);

        }
        objc_msgSend__executeQueryFromString_(self, v47, (uint64_t)CFSTR("PRAGMA incremental_vacuum"), v48);
        APLogForCategory(0xBuLL);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (void *)objc_opt_class();
          *(_DWORD *)v52 = 138477827;
          *(_QWORD *)&v52[4] = v50;
          v51 = v50;
          _os_log_impl(&dword_1CF251000, v49, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database vacuuming complete.", v52, 0xCu);

        }
      }
    }
    objc_msgSend_unlock(v5, v18, v19, v20, *(_OWORD *)v52);

  }
  else
  {
    objc_msgSend_unlock(v5, v11, v12, v13);
  }

}

- (BOOL)executeQueryFromString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11);
  if (objc_msgSend__isConnectionValidWithErrorDescription_(self, v12, (uint64_t)CFSTR("No connection on execute query from string."), v13))v17 = objc_msgSend__executeQueryFromString_(self, v14, (uint64_t)v4, v16);
  else
    v17 = 0;
  objc_msgSend_unlock(v8, v14, v15, v16);

  return v17;
}

- (id)executeSelectNumberQuery:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  sqlite3_stmt *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = a4;
  v7 = a3;
  objc_msgSend_lock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14);
  v17 = (sqlite3_stmt *)objc_msgSend__prepareStatementForQuery_(self, v15, (uint64_t)v7, v16);

  if (v17)
  {
    if (objc_msgSend__bindParameters_toStatement_(self, v18, (uint64_t)v6, (uint64_t)v17)
      && sqlite3_step(v17) == 100)
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = sqlite3_column_double(v17, 0);
      objc_msgSend_numberWithDouble_(v21, v23, v24, v25, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    sqlite3_finalize(v17);
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend_unlock(v11, v18, v19, v20);

  return v26;
}

- (BOOL)_updateVersionForPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  APDatabaseMigration *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t Version;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v127;
  void *v128;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint8_t v134[128];
  uint8_t buf[4];
  void *v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  uint64_t v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11);
  objc_msgSend__userVersion(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  if (v15)
  {
    v20 = objc_msgSend_intValue(v15, v16, v17, v18);
    objc_msgSend_setCurrentVersion_(self, v21, v20, v22);
    v23 = [APDatabaseMigration alloc];
    v26 = (void *)objc_msgSend_initWithDatabasePath_(v23, v24, (uint64_t)v4, v25);
    Version = objc_msgSend_lastVersion(v26, v27, v28, v29);
    v34 = objc_msgSend_integerValue(v19, v31, v32, v33);
    APLogForCategory(0x10uLL);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34 == Version)
    {
      if (v36)
      {
        v37 = (void *)objc_opt_class();
        v38 = v37;
        *(_DWORD *)buf = 138478083;
        v136 = v37;
        v137 = 2050;
        v138 = objc_msgSend_integerValue(v19, v39, v40, v41);
        _os_log_impl(&dword_1CF251000, v35, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database up to date version %{public}ld.", buf, 0x16u);

      }
      objc_msgSend_unlock(v8, v42, v43, v44);
      v45 = 1;
    }
    else
    {
      if (v36)
      {
        v54 = (void *)objc_opt_class();
        v55 = v54;
        *(_DWORD *)buf = 138478339;
        v136 = v54;
        v137 = 2050;
        v138 = objc_msgSend_integerValue(v19, v56, v57, v58);
        v139 = 2048;
        v140 = Version;
        _os_log_impl(&dword_1CF251000, v35, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Start Database migration from v%{public}ld to v%ld.", buf, 0x20u);

      }
      v62 = objc_msgSend_intValue(v19, v59, v60, v61);
      objc_msgSend_getMigrationQueriesFromVersion_(v26, v63, v62, v64);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        v128 = v26;
        v129 = v4;
        objc_msgSend__executeQueryFromString_(self, v65, (uint64_t)CFSTR("PRAGMA locking_mode = EXCLUSIVE"), v67);
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        v127 = v68;
        v69 = v68;
        v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v130, (uint64_t)v134, 16);
        if (v71)
        {
          v74 = v71;
          v75 = 0;
          v76 = *(_QWORD *)v131;
          while (2)
          {
            v77 = 0;
            v78 = v75 + v74;
            do
            {
              if (*(_QWORD *)v131 != v76)
                objc_enumerationMutation(v69);
              if (!objc_msgSend__executeQueryFromString_(self, v72, *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * v77), v73))
              {
                v92 = (void *)MEMORY[0x1E0CB3940];
                v93 = objc_msgSend_intValue(v19, v72, v79, v73);
                objc_msgSend_stringWithFormat_(v92, v94, (uint64_t)CFSTR("Migration failed from version %d, Query number: %d"), v95, v93, v77 + v75);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = objc_msgSend_currentVersion(self, v97, v98, v99);
                objc_msgSend_dbName(self, v101, v102, v103);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                APDatabaseError(438, 0xFFFFFFFFLL, v100, v104, v96);

                objc_msgSend__executeQueryFromString_(self, v105, (uint64_t)CFSTR("PRAGMA locking_mode = NORMAL"), v106);
                objc_msgSend_unlock(v8, v107, v108, v109);

                v45 = 0;
                goto LABEL_22;
              }
              ++v77;
            }
            while (v74 != v77);
            v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v130, (uint64_t)v134, 16);
            v75 = v78;
            if (v74)
              continue;
            break;
          }
        }

        objc_msgSend_setCurrentVersion_(self, v80, Version, v81);
        objc_msgSend__setUserVersion_(self, v82, Version, v83);
        objc_msgSend__executeQueryFromString_(self, v84, (uint64_t)CFSTR("PRAGMA locking_mode = NORMAL"), v85);
        APLogForCategory(0x10uLL);
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          v87 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138478083;
          v136 = v87;
          v137 = 2048;
          v138 = Version;
          v88 = v87;
          _os_log_impl(&dword_1CF251000, v86, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database migration complete v%ld.", buf, 0x16u);

        }
        objc_msgSend_unlock(v8, v89, v90, v91);
        v45 = 1;
LABEL_22:
        v26 = v128;
        v4 = v129;
        v68 = v127;
      }
      else
      {
        v110 = (void *)MEMORY[0x1E0CB3940];
        v111 = objc_msgSend_intValue(v19, v65, v66, v67);
        objc_msgSend_stringWithFormat_(v110, v112, (uint64_t)CFSTR("Migration queries is nil, from version %d"), v113, v111);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend_currentVersion(self, v115, v116, v117);
        objc_msgSend_dbName(self, v119, v120, v121);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        APDatabaseError(438, 0xFFFFFFFFLL, v118, v122, v114);

        objc_msgSend_unlock(v8, v123, v124, v125);
        v45 = 0;
      }

    }
  }
  else
  {
    v46 = objc_msgSend_currentVersion(self, v16, v17, v18);
    objc_msgSend_dbName(self, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    APDatabaseError(438, 0xFFFFFFFFLL, v46, v50, CFSTR("Error getting current version."));

    objc_msgSend_unlock(v8, v51, v52, v53);
    v45 = 0;
  }

  return v45;
}

- (id)_userVersion
{
  uint64_t v2;

  return (id)objc_msgSend__executePragmaSelectQuery_(self, a2, (uint64_t)CFSTR("PRAGMA user_version"), v2);
}

- (BOOL)_setUserVersion:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("PRAGMA user_version = %ld"), v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (sqlite3_stmt *)objc_msgSend__prepareStatementForQuery_(self, v6, (uint64_t)v5, v7);
  if (!v8)
    goto LABEL_5;
  v9 = v8;
  v10 = sqlite3_step(v8);
  if ((_DWORD)v10 != 101)
  {
    v12 = v10;
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = sqlite3_errstr(v10);
    objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("Set user version error: %s"), v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_currentVersion(self, v18, v19, v20);
    objc_msgSend_dbName(self, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    APDatabaseError(439, v12, v21, v25, v17);

LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  sqlite3_finalize(v9);
  v11 = 1;
LABEL_6:

  return v11;
}

- (id)_executePragmaSelectQuery:(id)a3
{
  uint64_t v3;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v5 = (sqlite3_stmt *)objc_msgSend__prepareStatementForQuery_(self, a2, (uint64_t)a3, v3);
  if (v5)
  {
    v6 = v5;
    v7 = sqlite3_step(v5);
    if ((_DWORD)v7 == 100)
    {
      v8 = sqlite3_column_int(v6, 0);
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v9, v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v7;
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = sqlite3_errstr(v7);
      objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("Execute Pragma Select Query error: %s"), v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_currentVersion(self, v18, v19, v20);
      objc_msgSend_dbName(self, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      APDatabaseError(433, v12, v21, v25, v17);

      v11 = 0;
    }
    sqlite3_finalize(v6);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_openDBConnectionCanRepeat:(BOOL)a3 databasePath:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  NSObject *v93;
  void *v94;
  id v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  dispatch_queue_t v101;
  APInMemoryTTLCache *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint8_t buf[4];
  void *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v4 = a3;
  v112 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  APLogForCategory(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend_databaseName(v6, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v109 = v8;
    v110 = 2113;
    v111 = v13;
    _os_log_impl(&dword_1CF251000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@]: %{private}@ request to open connection.", buf, 0x16u);

  }
  objc_msgSend_databaseName(v6, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDbName_(self, v18, (uint64_t)v17, v19);

  objc_msgSend_databaseFilePath(v6, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v23;
  if (v23)
  {
    v28 = objc_retainAutorelease(v23);
    v32 = (const char *)objc_msgSend_UTF8String(v28, v29, v30, v31);
    objc_msgSend_lock(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v36, v37, v38, v39);
    if (self->_database)
    {
      APLogForCategory(0xBuLL);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v109 = v41;
        v42 = v41;
        _os_log_impl(&dword_1CF251000, v40, OS_LOG_TYPE_ERROR, "[%{private}@]: Open database called when connection is already open.", buf, 0xCu);

      }
      objc_msgSend_unlock(v36, v43, v44, v45);
    }
    else
    {
      v50 = sqlite3_open(v32, &self->_database);
      objc_msgSend_setOpenConnectionResult_(self, v51, v50, v52);
      objc_msgSend__executeQueryFromString_(self, v53, (uint64_t)CFSTR("PRAGMA foreign_keys = ON"), v54);
      if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v55, v56, v57))
        sqlite3_extended_result_codes(self->_database, 1);
      objc_msgSend__executeQueryFromString_(self, v58, (uint64_t)CFSTR("PRAGMA journal_mode = WAL"), v59);
      objc_msgSend__executeQueryFromString_(self, v60, (uint64_t)CFSTR("PRAGMA synchronous = NORMAL"), v61);
      objc_msgSend__executeQueryFromString_(self, v62, (uint64_t)CFSTR("PRAGMA auto_vacuum = INCREMENTAL"), v63);
      sqlite3_busy_timeout(self->_database, 500);
      objc_msgSend_unlock(v36, v64, v65, v66);
      if ((_DWORD)v50)
      {
        v67 = (void *)MEMORY[0x1E0CB3940];
        v68 = sqlite3_errstr(v50);
        objc_msgSend_stringWithFormat_(v67, v69, (uint64_t)CFSTR("Open connection query error: %s"), v70, v68);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend_currentVersion(self, v72, v73, v74);
        objc_msgSend_dbName(self, v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        APDatabaseError(440, v50, v75, v79, v71);

        objc_msgSend_closeDatabaseConnection(self, v80, v81, v82);
        if ((_DWORD)v50 == 14 || (_DWORD)v50 == 11)
        {
          objc_msgSend_removeDatabaseAtPath_(APDatabaseFileUtilities, v83, (uint64_t)v6, v84);
          v88 = objc_msgSend_currentVersion(self, v85, v86, v87);
          objc_msgSend_dbName(self, v89, v90, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          APDatabaseError(443, 0xFFFFFFFFLL, v88, v92, CFSTR("Reacreating Database File on open connection."));

        }
        if (v4)
          objc_msgSend__openDBConnectionCanRepeat_databasePath_(self, v83, 0, (uint64_t)v6);

      }
      else
      {
        APLogForCategory(0xBuLL);
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v94 = (void *)objc_opt_class();
          v95 = v94;
          objc_msgSend_dbName(self, v96, v97, v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v109 = v94;
          v110 = 2113;
          v111 = v99;
          _os_log_impl(&dword_1CF251000, v93, OS_LOG_TYPE_DEFAULT, "[%{private}@]: %{private}@ connection opened sucessfully.", buf, 0x16u);

        }
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v100 = objc_claimAutoreleasedReturnValue();
        v101 = dispatch_queue_create("com.apple.ap.db-table-cache.queue", v100);

        v102 = [APInMemoryTTLCache alloc];
        v105 = (void *)objc_msgSend_initWithExpirationInterval_flushQueue_(v102, v103, (uint64_t)v101, v104, 1800.0);
        objc_msgSend_setTableCache_(self, v106, (uint64_t)v105, v107);

      }
    }
  }
  else
  {
    v46 = objc_msgSend_currentVersion(self, v24, v25, v26);
    objc_msgSend_dbName(self, v47, v48, v49);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    APDatabaseError(444, 0xFFFFFFFFLL, v46, v36, CFSTR("No Database path when trying to open connection."));
  }

}

- (BOOL)_executeQueryFromString:(id)a3
{
  sqlite3 *database;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char *errmsg;

  errmsg = 0;
  database = self->_database;
  v5 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
  v10 = sqlite3_exec(database, v9, 0, 0, &errmsg);
  v11 = v10;
  if ((_DWORD)v10)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = sqlite3_errstr(v10);
    objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("Execute Query From String error: %s"), v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_currentVersion(self, v17, v18, v19);
    objc_msgSend_dbName(self, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    APDatabaseError(433, v11, v20, v24, v16);

    sqlite3_free(errmsg);
  }
  return (_DWORD)v11 == 0;
}

- (BOOL)_isConnectionOpen
{
  uint64_t v2;
  uint64_t v3;
  APDatabaseManager *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = self;
  objc_msgSend_lock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  LOBYTE(v4) = v4->_database != 0;
  objc_msgSend_unlock(v5, v9, v10, v11);

  return (char)v4;
}

- (BOOL)_isConnectionValidWithErrorDescription:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  v7 = a3;
  if (self->_database)
  {
    v8 = objc_msgSend_openConnectionResult(self, v4, v5, v6);
    if (!(_DWORD)v8)
    {
      v25 = 1;
      goto LABEL_7;
    }
    v12 = v8;
    v13 = objc_msgSend_currentVersion(self, v9, v10, v11);
    objc_msgSend_dbName(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 445;
    v19 = v12;
    v20 = v13;
  }
  else
  {
    v21 = objc_msgSend_currentVersion(self, v4, v5, v6);
    objc_msgSend_dbName(self, v22, v23, v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 435;
    v19 = 0xFFFFFFFFLL;
    v20 = v21;
  }
  APDatabaseError(v18, v19, v20, v17, v7);

  v25 = 0;
LABEL_7:

  return v25;
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (APDeviceLockedTask)deviceLockedTask
{
  return self->_deviceLockedTask;
}

- (void)setDeviceLockedTask:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLockedTask, a3);
}

- (APInMemoryTTLCache)tableCache
{
  return self->_tableCache;
}

- (void)setTableCache:(id)a3
{
  objc_storeStrong((id *)&self->_tableCache, a3);
}

- (NSString)dbName
{
  return self->_dbName;
}

- (void)setDbName:(id)a3
{
  objc_storeStrong((id *)&self->_dbName, a3);
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(int64_t)a3
{
  self->_currentVersion = a3;
}

- (int)openConnectionResult
{
  return self->_openConnectionResult;
}

- (void)setOpenConnectionResult:(int)a3
{
  self->_openConnectionResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbName, 0);
  objc_storeStrong((id *)&self->_tableCache, 0);
  objc_storeStrong((id *)&self->_deviceLockedTask, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
