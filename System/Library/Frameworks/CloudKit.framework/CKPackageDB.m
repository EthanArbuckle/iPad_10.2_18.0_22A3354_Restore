@implementation CKPackageDB

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  char DirectoryAtPath_withIntermediateDirectories_attributes_error;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  int v62;
  int v63;
  NSObject *v64;
  NSObject *v65;
  int v66;
  int v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  const char *v79;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  sqlite3 *db;
  sqlite3 *ppDb;
  uint8_t v95[128];
  uint8_t buf[4];
  id v97;
  __int16 v98;
  int v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v9);
  v19 = (const char *)objc_msgSend_fileSystemRepresentation(v15, v16, v17, v18);
  v20 = objc_retainAutorelease(v10);
  v24 = (const char *)objc_msgSend_fileSystemRepresentation(v20, v21, v22, v23);
  db = 0;
  ppDb = 0;
  v25 = sqlite3_open_v2(v19, &ppDb, 1, 0);
  if ((_DWORD)v25)
  {
    if (a6)
    {
      v27 = v25;
      v28 = ppDb;
      if (ppDb)
        v28 = (void *)sqlite3_errmsg(ppDb);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 7000, CFSTR("Error opening SQLite file: %s (%d)"), v28, v27);
      v29 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    goto LABEL_51;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v30 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v97 = v15;
    _os_log_debug_impl(&dword_18A5C5000, v30, OS_LOG_TYPE_DEBUG, "Opened SQLite file at %{public}@", buf, 0xCu);
  }
  objc_msgSend_stringByDeletingLastPathComponent(v20, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  DirectoryAtPath_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v35, (uint64_t)v34, 1, 0, a6);

  if ((DirectoryAtPath_withIntermediateDirectories_attributes_error & 1) == 0)
  {
LABEL_36:
    v29 = 0;
    goto LABEL_51;
  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v26, v37, v38);
  v40 = v39;
  while (1)
  {
    v41 = _sqlite3_db_clone();
    if ((_DWORD)v41 != 5)
    {
      v49 = v41;
      if (!(_DWORD)v41)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v50 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v97 = v20;
          _os_log_debug_impl(&dword_18A5C5000, v50, OS_LOG_TYPE_DEBUG, "Cloning SQLite file to %{public}@", buf, 0xCu);
        }
        v51 = sqlite3_open_v2(v24, &db, 2, 0);
        if ((_DWORD)v51)
        {
          if (a6)
          {
            v52 = v51;
            if (db)
            {
              v53 = sqlite3_errmsg(db);
              if (db)
              {
                v54 = sqlite3_extended_errcode(db);
LABEL_49:
                objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 7000, CFSTR("Error opening SQLite file: %s,%d (%d)"), v53, v54, v52);
                goto LABEL_50;
              }
            }
            else
            {
              v53 = 0;
            }
            v54 = 0xFFFFFFFFLL;
            goto LABEL_49;
          }
LABEL_90:
          v29 = 0;
          goto LABEL_51;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v57 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          v97 = v20;
          v98 = 1024;
          v99 = 2;
          _os_log_debug_impl(&dword_18A5C5000, v57, OS_LOG_TYPE_DEBUG, "Opened SQLite file for copying at %{public}@ with flags 0x%x", buf, 0x12u);
        }
        v58 = sqlite3_wal_checkpoint_v2(db, 0, 2, 0, 0);
        if (!(_DWORD)v58)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v81 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v97 = v15;
            _os_log_debug_impl(&dword_18A5C5000, v81, OS_LOG_TYPE_DEBUG, "Checkpointed copied SQLite file at %{public}@", buf, 0xCu);
          }
          v82 = sqlite3_close(db);
          db = 0;
          if (!(_DWORD)v82)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v86 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v97 = v20;
              _os_log_debug_impl(&dword_18A5C5000, v86, OS_LOG_TYPE_DEBUG, "Closed SQLite file at %{public}@", buf, 0xCu);
            }
            v29 = 1;
            goto LABEL_51;
          }
          if (a6)
          {
            v83 = v82;
            v84 = sqlite3_errmsg(0);
            v88 = sqlite3_extended_errcode(db);
            objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v85, (uint64_t)CFSTR("CKInternalErrorDomain"), 7004, v15, CFSTR("Error closing copied SQLite file: %s,%d (%d)"), v84, v88, v83);
            goto LABEL_50;
          }
          goto LABEL_90;
        }
        if (!a6)
          goto LABEL_90;
        v59 = v58;
        v60 = sqlite3_errmsg(db);
        v87 = sqlite3_extended_errcode(db);
        objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v61, (uint64_t)CFSTR("CKInternalErrorDomain"), 7003, v15, CFSTR("Error checkpointing copied SQLite file: %s,%d (%d)"), v60, v87, v59);
LABEL_50:
        v29 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_51;
      }
      if (!a6)
        goto LABEL_90;
      if (ppDb)
      {
        v55 = sqlite3_errmsg(ppDb);
        if (ppDb)
        {
          v56 = sqlite3_extended_errcode(ppDb);
LABEL_46:
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 7002, CFSTR("Error cloning SQLite file: %s,%d (%d)"), v55, v56, v49);
          goto LABEL_50;
        }
      }
      else
      {
        v55 = 0;
      }
      v56 = 0xFFFFFFFFLL;
      goto LABEL_46;
    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v26, v42, v43);
    if (v44 - v40 >= a5)
      break;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v45 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v97 = v15;
      _os_log_debug_impl(&dword_18A5C5000, v45, OS_LOG_TYPE_DEBUG, "Waiting for busy SQLite database at %{public}@", buf, 0xCu);
    }
    objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E0CB3978], v46, v47, v48, 0.1);
  }
  if (!a6)
    goto LABEL_36;
  objc_msgSend_errorWithDomain_code_path_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKInternalErrorDomain"), 7001, v15, CFSTR("SQLite file is busy"));
  v29 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:
  if (ppDb)
  {
    v62 = sqlite3_close(ppDb);
    if (v62)
    {
      v63 = v62;
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v64 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v97 = v15;
        v98 = 1024;
        v99 = v63;
        _os_log_impl(&dword_18A5C5000, v64, OS_LOG_TYPE_INFO, "Warn: Error closing SQLite file at %@: %d", buf, 0x12u);
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v65 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v97 = v15;
        _os_log_debug_impl(&dword_18A5C5000, v65, OS_LOG_TYPE_DEBUG, "Closed SQLite file at %{public}@", buf, 0xCu);
      }
    }
  }
  if (!db)
    goto LABEL_71;
  v66 = sqlite3_close(db);
  if (!v66)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v69 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v97 = v20;
      _os_log_debug_impl(&dword_18A5C5000, v69, OS_LOG_TYPE_DEBUG, "Closed SQLite file at %{public}@", buf, 0xCu);
      if (v29)
        goto LABEL_80;
      goto LABEL_72;
    }
    goto LABEL_71;
  }
  v67 = v66;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v68 = ck_log_facility_ck;
  if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
LABEL_71:
    if (!v29)
      goto LABEL_72;
    goto LABEL_80;
  }
  *(_DWORD *)buf = 138543618;
  v97 = v20;
  v98 = 1024;
  v99 = v67;
  _os_log_impl(&dword_18A5C5000, v68, OS_LOG_TYPE_INFO, "Warn: Error closing SQLite file at %{public}@: %d", buf, 0x12u);
  if (v29)
    goto LABEL_80;
LABEL_72:
  objc_msgSend_removeItemAtPath_error_(v14, v26, (uint64_t)v20, 0);
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  CKSQLiteJournalSuffixes();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v89, (uint64_t)v95, 16);
  if (v72)
  {
    v75 = v72;
    v76 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v90 != v76)
          objc_enumerationMutation(v70);
        objc_msgSend_stringByAppendingString_(v20, v73, *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i), v74);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeItemAtPath_error_(v14, v79, (uint64_t)v78, 0);

      }
      v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v89, (uint64_t)v95, 16);
    }
    while (v75);
  }

LABEL_80:
  return v29;
}

+ (BOOL)moveSQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  const char *v31;
  const char *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  char v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  BOOL v62;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id *v73;
  char v74;
  uint64_t v75;
  id obj;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint8_t buf[4];
  id v90;
  __int16 v91;
  id v92;
  __int16 v93;
  id v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v8 = a4;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v9 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    v64 = v9;
    objc_msgSend_CKSanitizedPath(v77, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v8, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v90 = v68;
    v91 = 2114;
    v92 = v72;
    _os_log_debug_impl(&dword_18A5C5000, v64, OS_LOG_TYPE_DEBUG, "Moving db at %{public}@ to %{public}@", buf, 0x16u);

  }
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingLastPathComponent(v8, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0;
  v19 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v13, v18, (uint64_t)v17, 1, 0, &v88);
  v20 = v88;

  if (v19)
  {
    v73 = a6;
    objc_msgSend_removeItemAtPath_error_(v13, v21, (uint64_t)v8, 0);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    CKSQLiteJournalSuffixes();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v84, (uint64_t)v96, 16);
    if (v24)
    {
      v27 = v24;
      v28 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v85 != v28)
            objc_enumerationMutation(v22);
          objc_msgSend_stringByAppendingString_(v8, v25, *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i), v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeItemAtPath_error_(v13, v31, (uint64_t)v30, 0);

        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v84, (uint64_t)v96, 16);
      }
      while (v27);
    }

    v83 = v20;
    v74 = objc_msgSend_moveItemAtPath_toPath_error_(v13, v32, (uint64_t)v77, (uint64_t)v8, &v83);
    v33 = v83;

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    CKSQLiteJournalSuffixes();
    obj = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v79, (uint64_t)v95, 16);
    if (v35)
    {
      v38 = v35;
      v39 = *(_QWORD *)v80;
      v75 = *MEMORY[0x1E0CB28A8];
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v80 != v39)
            objc_enumerationMutation(obj);
          v41 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
          objc_msgSend_stringByAppendingString_(v77, v36, v41, v37);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v8, v43, v41, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0;
          v47 = objc_msgSend_moveItemAtPath_toPath_error_(v13, v46, (uint64_t)v42, (uint64_t)v45, &v78);
          v48 = v78;

          if ((v47 & 1) == 0)
          {
            objc_msgSend_domain(v48, v49, v50, v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToString_(v52, v53, v75, v54))
            {
              v58 = objc_msgSend_code(v48, v55, v56, v57);

              if (v58 == 4)
                goto LABEL_27;
            }
            else
            {

            }
            if (v33)
              v59 = v33;
            else
              v59 = v48;
            v60 = v59;

            v74 = 0;
            v33 = v60;
          }
LABEL_27:

        }
        v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v79, (uint64_t)v95, 16);
      }
      while (v38);
    }

    if ((v74 & 1) != 0)
    {
      v62 = 1;
      goto LABEL_40;
    }
    a6 = v73;
  }
  else
  {
    v33 = v20;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v61 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v90 = v77;
    v91 = 2114;
    v92 = v8;
    v93 = 2112;
    v94 = v33;
    _os_log_impl(&dword_18A5C5000, v61, OS_LOG_TYPE_INFO, "Failed to move sqlite DB from: %{public}@, to %{public}@, due to: %@", buf, 0x20u);
  }
  if (a6)
  {
    v33 = objc_retainAutorelease(v33);
    v62 = 0;
    *a6 = v33;
  }
  else
  {
    v62 = 0;
  }
LABEL_40:

  return v62;
}

@end
