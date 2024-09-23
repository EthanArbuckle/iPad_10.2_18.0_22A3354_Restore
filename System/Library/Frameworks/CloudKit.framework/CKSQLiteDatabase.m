@implementation CKSQLiteDatabase

- (id)numberValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1E1F66ED0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)setNumberValue:(id)a3 forKey:(id)a4
{
  _BOOL8 v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3 != 0;
  v7 = a4;
  v8 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNumberValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1E1F66ED0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)stringValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1E1F66ED0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)setStringValue:(id)a3 forKey:(id)a4
{
  _BOOL8 v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3 != 0;
  v7 = a4;
  v8 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStringValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1E1F66ED0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)dataValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1E1F66ED0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)setDataValue:(id)a3 forKey:(id)a4
{
  _BOOL8 v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3 != 0;
  v7 = a4;
  v8 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDataValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1E1F66ED0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)dateValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1E1F66ED0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)setDateValue:(id)a3 forKey:(id)a4
{
  _BOOL8 v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3 != 0;
  v7 = a4;
  v8 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDateValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1E1F66ED0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)UUIDValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1E1F66ED0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)setUUIDValue:(id)a3 forKey:(id)a4
{
  _BOOL8 v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3 != 0;
  v7 = a4;
  v8 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUUIDValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1E1F66ED0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)objectValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;

  v6 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v7, (uint64_t)self, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectValueForKey_scope_scopeIdentifier_error_(v8, v9, (uint64_t)v6, 0, &stru_1E1F66ED0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)setObjectValue:(id)a3 forKey:(id)a4
{
  _BOOL8 v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = a3 != 0;
  v7 = a4;
  v8 = a3;
  objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, v9, (uint64_t)self, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObjectValue_forKey_scope_scopeIdentifier_(v10, v11, (uint64_t)v8, (uint64_t)v7, 0, &stru_1E1F66ED0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)keyValueCleaner
{
  return (id)objc_msgSend_keyValueStoreInDatabase_create_(CKSQLiteKeyValueTableGroup, a2, (uint64_t)self, 0);
}

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  if (!qword_1ECD96EC0)
  {
    objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E0CB3748], a2, v2, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECD96EC0;
    qword_1ECD96EC0 = v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)qword_1ECD96EC8;
    qword_1ECD96EC8 = (uint64_t)v6;

    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)qword_1ECD96ED0;
    qword_1ECD96ED0 = (uint64_t)v8;

  }
}

+ (void)resetValidatedDatabases
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_removeAllObjects((void *)qword_1ECD96ED0, a2, v2, v3);
}

+ (id)databaseArchiveWithObject:(id)a3
{
  id v3;
  CKSQLiteDatabaseKeyedArchiver *v4;
  const char *v5;
  uint64_t v6;
  void *inited;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a3;
  v4 = [CKSQLiteDatabaseKeyedArchiver alloc];
  inited = (void *)objc_msgSend_initRequiringSecureCoding_(v4, v5, 0, v6);
  objc_msgSend_setOutputFormat_(inited, v8, 200, v9);
  objc_msgSend_encodeObject_(inited, v10, (uint64_t)v3, v11);

  objc_msgSend_finishEncoding(inited, v12, v13, v14);
  objc_msgSend_encodedData(inited, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)unarchivedObjectFromDatabaseArchive:(id)a3
{
  id v3;
  CKSQLiteDatabaseKeyedUnarchiver *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = [CKSQLiteDatabaseKeyedUnarchiver alloc];
  v6 = (void *)objc_msgSend_initForReadingFromData_error_(v4, v5, (uint64_t)v3, 0);

  objc_msgSend_setRequiresSecureCoding_(v6, v7, 0, v8);
  objc_msgSend_decodeTopLevelObjectAndReturnError_(v6, v9, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishDecoding(v6, v12, v13, v14);

  return v11;
}

+ (void)removeLegacyDatabaseAtPath:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend_defaultManager(v3, v5, v6, v7);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtPath_error_(v21, v8, (uint64_t)v4, 0);
  objc_msgSend_stringByAppendingString_(v4, v9, (uint64_t)CFSTR("-journal"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtPath_error_(v21, v12, (uint64_t)v11, 0);

  objc_msgSend_stringByAppendingString_(v4, v13, (uint64_t)CFSTR("-wal"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtPath_error_(v21, v16, (uint64_t)v15, 0);

  objc_msgSend_stringByAppendingString_(v4, v17, (uint64_t)CFSTR("-shm"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeItemAtPath_error_(v21, v20, (uint64_t)v19, 0);
}

+ (id)uniquingKeyForDatabaseDirectory:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  _QWORD v14[2];
  stat v15;

  objc_msgSend_databaseFilePathInDirectory_(a1, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  memset(&v15, 0, sizeof(v15));
  if (v4 && (v9 = (const char *)objc_msgSend_fileSystemRepresentation(v4, v5, v6, v7), !stat(v9, &v15)))
  {
    v14[1] = v15.st_ino;
    v14[0] = v15.st_dev;
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    v10 = (void *)objc_msgSend_initWithBytes_length_(v11, v12, (uint64_t)v14, 16);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)databaseManager:(id *)a3
{
  const char *v4;
  void *v5;
  void *v6;

  sub_18A7C1978(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_managerInDatabase_error_(CKSQLiteDatabaseManager, v4, (uint64_t)v5, (uint64_t)a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)databaseInDirectory:(id)a3 registryDatabase:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  unsigned __int8 *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const __CFString *v20;
  char hasSuffix;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 *v28;
  unint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  unsigned __int8 *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  void *v56;
  id v57;
  const char *v58;
  unsigned __int8 *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  _BOOL8 v64;
  const char *v65;
  uint64_t v66;
  BOOL v67;
  id v68;
  int v69;
  unsigned __int8 *v70;
  uint64_t v71;
  unsigned __int8 *v72;
  int v73;
  NSObject *v74;
  const __CFString *v75;
  unsigned __int8 *v76;
  unsigned __int8 *v77;
  unsigned __int8 *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 *v82;
  __CFString *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  int isEqualToString;
  const char *v91;
  NSObject *v92;
  const char *v93;
  BOOL v94;
  const char *v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  id v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  BOOL v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  unsigned __int8 *v111;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  __CFString *v117;
  id *v118;
  uint64_t v119;
  __CFString *v120;
  unsigned __int8 *v121;
  id v122;
  unsigned __int8 *v123;
  uint8_t buf[4];
  const __CFString *v125;
  __int16 v126;
  unsigned __int8 *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (unsigned __int8 *)a4;
  v123 = 0;
  v118 = a6;
  v119 = MEMORY[0x18D76DE4C]();
  v121 = v11;
  if (byte_1EDF75458)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = getpid();
    objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("_TestHost_%d"), v17, v15);
    v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      hasSuffix = objc_msgSend_hasSuffix_(v10, v18, (uint64_t)v20, v19);
      goto LABEL_4;
    }
  }
  else
  {
    if (_sCKUseSystemInstalledBinariesPredicate != -1)
      dispatch_once(&_sCKUseSystemInstalledBinariesPredicate, &unk_1E1F58998);
    if (!_sCKUseSystemInstalledBinaries)
    {
      v20 = CFSTR("_debug");
      hasSuffix = objc_msgSend_hasSuffix_(v10, v12, (uint64_t)CFSTR("_debug"), v13);
LABEL_4:
      v120 = (__CFString *)v20;
      if ((hasSuffix & 1) == 0)
      {
        objc_msgSend_stringByAppendingString_(v10, v22, (uint64_t)v20, v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v24;
      }
      goto LABEL_10;
    }
  }
  v120 = 0;
LABEL_10:
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD96EB8);
  v27 = 0;
  v28 = 0;
  if (v10)
    v29 = a5;
  else
    v29 = a5 | 0x28;
  while (1)
  {
    if (v10)
    {
      objc_msgSend_uniquingKeyForDatabaseDirectory_(a1, v25, (uint64_t)v10, v26);
      v30 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v30;
      if (v30)
      {
        while ((v29 & 0x20) == 0)
        {
          objc_msgSend_objectForKey_((void *)qword_1ECD96EC0, v31, (uint64_t)v27, v33);
          v34 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
          v35 = v123;
          v123 = v34;

          if (v123)
          {
            v69 = 0;
            goto LABEL_46;
          }
          objc_msgSend_objectForKey_((void *)qword_1ECD96EC8, v31, (uint64_t)v27, v33);
          v36 = objc_claimAutoreleasedReturnValue();
          if (!v36)
            goto LABEL_29;
          v37 = v36;
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD96EB8);
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v38 = (void *)ck_log_facility_sql;
          if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
          {
            v39 = v38;
            objc_msgSend_CKSanitizedPath(v10, v40, v41, v42);
            v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v125 = v43;
            _os_log_impl(&dword_18A5C5000, v39, OS_LOG_TYPE_INFO, "Waiting for database to close at path: %{public}@", buf, 0xCu);

          }
          dispatch_group_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
          os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD96EB8);

          objc_msgSend_uniquingKeyForDatabaseDirectory_(a1, v44, (uint64_t)v10, v45);
          v46 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v46;
          if (!v46)
            goto LABEL_25;
        }
        v56 = v123;
        v123 = 0;

        v27 = (void *)v30;
LABEL_29:
        v57 = objc_alloc((Class)a1);
        v59 = (unsigned __int8 *)objc_msgSend_initWithDatabaseDirectory_registryDatabase_options_(v57, v58, (uint64_t)v10, (uint64_t)v11, v29);
        v60 = v123;
        v123 = v59;

        objc_msgSend_objectForKey_((void *)qword_1ECD96ED0, v61, (uint64_t)v27, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v63 == 0;

        objc_msgSend_openExistingDatabase_(v123, v65, v64, v66);
        v54 = objc_claimAutoreleasedReturnValue();

        if (v54)
          v67 = (v29 & 2) == 0;
        else
          v67 = 0;
        if (v67)
        {
          v29 |= 2uLL;
          v55 = 1;
          goto LABEL_35;
        }
        v72 = v123;
        if (v54)
          v94 = 1;
        else
          v94 = v123 == 0;
        if (v94)
        {
          v69 = 1;
          v28 = (unsigned __int8 *)v54;
          goto LABEL_37;
        }
        v70 = v11;
LABEL_49:
        objc_msgSend_setupDatabaseConnection(v72, v31, v32, v33);
        LODWORD(v72) = 1;
        if (v27)
          goto LABEL_82;
        goto LABEL_50;
      }
    }
    else
    {

    }
LABEL_25:
    if ((v29 & 1) != 0)
      break;
    v47 = objc_alloc((Class)a1);
    v49 = (unsigned __int8 *)objc_msgSend_initWithDatabaseDirectory_registryDatabase_options_(v47, v48, (uint64_t)v10, (uint64_t)v11, v29);
    v50 = v123;
    v123 = v49;

    objc_msgSend_createNewDatabase(v123, v51, v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();

    if (!v54)
    {
      if (!v10 || (v29 & 0x20) != 0)
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v31, (uint64_t)&v123, 8);
        v71 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_uniquingKeyForDatabaseDirectory_(a1, v31, (uint64_t)v10, v33);
        v71 = objc_claimAutoreleasedReturnValue();
      }
      v27 = (void *)v71;
      v28 = 0;
      goto LABEL_45;
    }
    v55 = 0;
    v27 = 0;
LABEL_35:
    v28 = (unsigned __int8 *)v54;
    v68 = (id)objc_msgSend_removeDatabaseDirectory(v123, v31, v32, v33);
    if ((v55 & 1) == 0)
    {
      v69 = 1;
LABEL_37:
      v70 = v121;
      goto LABEL_87;
    }
  }
  v27 = 0;
LABEL_45:
  v69 = 1;
LABEL_46:
  v70 = v121;
  v72 = v123;
  if (v123 && !v28)
  {
    if (v69)
      goto LABEL_49;
    if ((v29 & 8) == 0)
    {
      v70 = v121;
      goto LABEL_60;
    }
    v76 = v123;

    v72 = v123;
    v77 = v76;
    v70 = v77;
    if (v72)
    {
LABEL_60:
      sub_18A7C1978(v72);
      v78 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v82 = v78;
      if (v78 == v70)
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend_databaseDirectory(v78, v79, v80, v81);
        v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_databaseDirectory(v70, v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v83, v88, (uint64_t)v87, v89);

        if (isEqualToString)
        {
          if (ck_log_initialization_predicate != -1)
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          v92 = ck_log_facility_ck;
          if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v125 = v83;
            _os_log_error_impl(&dword_18A5C5000, v92, OS_LOG_TYPE_ERROR, "Detected that the database at %{public}@ has been unexpectedly deleted. This process must now exit.", buf, 0xCu);
          }
          if ((v72[176] & 0x40) == 0)
            exit(1);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v93, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Registry database changed"));
LABEL_78:
          v28 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((v72[176] & 0x40) != 0)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v91, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Mismatched registry database"));
            goto LABEL_78;
          }
          objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v91, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Mismatched registry database"));
          v28 = 0;
        }

      }
      LODWORD(v72) = 0;
      v69 = 0;
      if (v28)
        goto LABEL_87;
      if (v27)
      {
LABEL_82:
        objc_storeStrong((id *)v123 + 18, v27);
        objc_msgSend_setObject_forKey_((void *)qword_1ECD96EC0, v95, (uint64_t)v123, (uint64_t)v27);
        objc_msgSend_setObject_forKey_((void *)qword_1ECD96EC8, v96, *((_QWORD *)v123 + 17), (uint64_t)v27);
        objc_msgSend_objectForKey_((void *)qword_1ECD96ED0, v97, (uint64_t)v27, v98);
        v99 = (id)objc_claimAutoreleasedReturnValue();
        if (!v99)
        {
          v99 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend_setObject_forKey_((void *)qword_1ECD96ED0, v100, (uint64_t)v99, (uint64_t)v27);
        }
        v101 = (void *)*((_QWORD *)v123 + 16);
        *((_QWORD *)v123 + 16) = v99;

        if (!(_DWORD)v72)
        {
LABEL_85:
          v69 = 0;
LABEL_86:
          v28 = 0;
          goto LABEL_87;
        }
LABEL_51:
        v73 = v123[168];
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v74 = ck_log_facility_sql;
        v69 = 1;
        if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
        {
          v75 = CFSTR("created new");
          if (!v73)
            v75 = CFSTR("opened existing");
          *(_DWORD *)buf = 138412546;
          v125 = v75;
          v126 = 2114;
          v127 = v123;
          _os_log_impl(&dword_18A5C5000, v74, OS_LOG_TYPE_INFO, "CKSQLiteDatabase %@ database: %{public}@", buf, 0x16u);
        }
        goto LABEL_86;
      }
    }
    else
    {

      if (v27)
        goto LABEL_82;
    }
LABEL_50:
    if (!(_DWORD)v72)
      goto LABEL_85;
    goto LABEL_51;
  }
LABEL_87:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD96EB8);
  if (v69 && v123)
  {
    if (v123[168])
      v104 = v28 == 0;
    else
      v104 = 0;
    v105 = (void *)v119;
    if (v104)
    {
      v122 = 0;
      objc_msgSend_databaseManager_(v123, v102, (uint64_t)&v122, v103);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (unsigned __int8 *)v122;
      if (!v28)
      {
        objc_msgSend_registerDatabase_(v106, v107, (uint64_t)v123, v108);
        v28 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v105 = (void *)v119;
  }

  objc_autoreleasePoolPop(v105);
  if (v28)
  {
    v109 = v123;
    v123 = 0;

    if (v118)
      *v118 = objc_retainAutorelease(v28);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v110 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v113 = v110;
      objc_msgSend_CKSanitizedPath(v10, v114, v115, v116);
      v117 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v125 = v117;
      v126 = 2112;
      v127 = v28;
      _os_log_error_impl(&dword_18A5C5000, v113, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase: failed to open/create database at %{public}@: %@", buf, 0x16u);

    }
  }
  v111 = v123;

  return v111;
}

+ (id)temporaryDatabaseDirectory
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  const char *v6;
  void *v10;
  const char *v11;
  char v12[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!byte_1EDF75458)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)a1, CFSTR("CKSQLiteDatabase.m"), 353, CFSTR("For unit test use only"));

  }
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getCString_maxLength_encoding_(v4, v5, (uint64_t)v12, 1024, 1);

  __strlcat_chk();
  mkdtemp(v12);
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v6, (uint64_t)v12, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newInMemoryDatabase:(id *)a3
{
  objc_msgSend_databaseInDirectory_registryDatabase_options_error_(a1, a2, 0, 0, 0, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CKSQLiteDatabase)initWithDatabaseDirectory:(id)a3 registryDatabase:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  dispatch_group_t v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v13 = objc_msgSend_init(self, v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    pthread_mutex_init((pthread_mutex_t *)(v13 + 8), 0);
    *(_QWORD *)(v14 + 72) = 0;
    v18 = objc_msgSend_copy(v8, v15, v16, v17);
    v19 = *(void **)(v14 + 88);
    *(_QWORD *)(v14 + 88) = v18;

    *(_QWORD *)(v14 + 176) = a5;
    objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x1E0CB3748], v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(v14 + 152);
    *(_QWORD *)(v14 + 152) = v23;

    v25 = dispatch_group_create();
    v26 = *(void **)(v14 + 136);
    *(_QWORD *)(v14 + 136) = v25;

    objc_storeStrong((id *)(v14 + 160), a4);
    dispatch_group_enter(*(dispatch_group_t *)(v14 + 136));
  }

  return (CKSQLiteDatabase *)v14;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  NSObject *databaseGroup;
  objc_super v6;

  objc_msgSend_closeDatabase(self, a2, v2, v3);
  databaseGroup = self->_databaseGroup;
  if (databaseGroup)
    dispatch_group_leave(databaseGroup);
  v6.receiver = self;
  v6.super_class = (Class)CKSQLiteDatabase;
  -[CKSQLiteDatabase dealloc](&v6, sel_dealloc);
}

+ (BOOL)databaseDidDealloc:(id)a3 timeout:(double)a4
{
  int64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = (uint64_t)(a4 * 1000000000.0);
  v5 = a3;
  v6 = dispatch_time(0, v4);
  v7 = dispatch_group_wait(v5, v6);

  if (v7)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_INFO, "Timed out waiting for database dealloc", v10, 2u);
    }
  }
  return v7 == 0;
}

- (id)deallocToken
{
  const char *v3;
  uint64_t v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD96EB8);
  objc_msgSend_objectForKey_((void *)qword_1ECD96EC8, v3, (uint64_t)self->_uniquingKey, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD96EB8);
  return v5;
}

- (void)setupDatabaseConnection
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  sqlite3_extended_result_codes(self->_db, 1);
  objc_msgSend__executeSQL_(self, v3, (uint64_t)"pragma synchronous = normal", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v8 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      v15 = 138543362;
      v16 = v7;
      _os_log_fault_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_FAULT, "Error setting pragma synchronous = normal: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  objc_msgSend__executeSQL_(self, v5, (uint64_t)"pragma foreign_keys = ON", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      v15 = 138543362;
      v16 = v9;
      _os_log_fault_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_FAULT, "Error setting pragma foreign_keys = ON: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (_sqlite3_maintain_load_factor())
  {
    objc_msgSend_sqlErrorWithMessage_(self, v11, (uint64_t)CFSTR("_sqlite3_maintain_load_factor failed"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_FAULT))
    {
      v15 = 138543362;
      v16 = v13;
      _os_log_fault_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_FAULT, "Failed to enable automatic incremental vacuum: %{public}@", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (id)openExistingDatabase:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  ssize_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int *v17;
  char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSString *databaseDirectory;
  sqlite3 *db;
  NSObject *v31;
  NSObject *v33;
  int *v34;
  char *v35;
  NSString *v36;
  uint8_t buf[4];
  CKSQLiteDatabase *v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v4 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend_databaseFilePath(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const char *)objc_msgSend_fileSystemRepresentation(v6, v7, v8, v9);
  v11 = getxattr(v10, "CKSQLiteDatabaseCorrupt", 0, 0, 0, 0);
  if (!v11)
    goto LABEL_4;
  if (v11 == -1)
  {
    if (*__error() == 93)
    {
LABEL_4:
      v15 = 0;
      goto LABEL_8;
    }
    v17 = __error();
    v18 = strerror(*v17);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v19, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("getxattr() failed at path: %@. error = %s"), v6, v18);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_databaseCorruptError(CKPrettyError, v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v16;
LABEL_8:
  if (getxattr(v10, "CKSQLiteDatabaseIsOpening", 0, 0, 0, 0) == -1)
  {
    if (*__error() != 93)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v22 = (void *)ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        v33 = v22;
        v34 = __error();
        v35 = strerror(*v34);
        *(_DWORD *)buf = 134218498;
        v38 = self;
        v39 = 2112;
        v40 = (NSString *)v6;
        v41 = 2080;
        v42 = v35;
        _os_log_error_impl(&dword_18A5C5000, v33, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: getxattr() failed checking for open crash at path: %@. error = %s", buf, 0x20u);

      }
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v20, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Crash during database open detected. Will not use database."));
    v21 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v21;
  }
  v23 = (char *)v15;
  if (!v15)
  {
    setxattr(v10, "CKSQLiteDatabaseIsOpening", "1", 1uLL, 0, 0);
    v24 = sqlite3_open_v2(v10, &self->_db, 3211266, 0);
    if ((_DWORD)v24)
    {
      objc_msgSend_sqlErrorWithMessage_(self, v25, (uint64_t)CFSTR("Error opening db %@, rc=%d"), v27, self, v24);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v28 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        databaseDirectory = self->_databaseDirectory;
        *(_DWORD *)buf = 134218498;
        v38 = self;
        v39 = 2114;
        v40 = databaseDirectory;
        v41 = 2114;
        v42 = v23;
        _os_log_error_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: Could not open existing database at %{public}@ - %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v23 = 0;
    }
    if (!v23 && v4)
    {
      objc_msgSend_validateOpenDatabase(self, v25, v26, v27);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
    }
    if (!v23)
      goto LABEL_38;
  }
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
  if (!v15)
  {
LABEL_38:
    if ((self->_options & 0x10) == 0 && removexattr(v10, "CKSQLiteDatabaseIsOpening", 0))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v31 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        v36 = self->_databaseDirectory;
        *(_DWORD *)buf = 134218498;
        v38 = self;
        v39 = 2114;
        v40 = v36;
        v41 = 2114;
        v42 = v23;
        _os_log_error_impl(&dword_18A5C5000, v31, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: removexattr() failed removing open crash detection attribute %{public}@ - %{public}@", buf, 0x20u);
      }
    }
  }

  return v23;
}

- (id)_validateVersionNumbers
{
  CKSQLiteTOCTableEntry *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  char isEqualToString;
  const char *v54;
  CKSQLiteTOCTableEntry *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  CKSQLiteTOCTableEntry *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  char v92;
  const char *v93;
  CKSQLiteTOCTableEntry *v95;
  __CFString *v96;
  __CFString *v97;
  _QWORD v98[3];

  v98[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(CKSQLiteTOCTableEntry);
  objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDbTableName_(v3, v8, (uint64_t)v7, v9);

  v98[0] = CKSQLiteTOCTableEntryDbVersionPropertyName;
  v98[1] = CKSQLiteTOCTableEntrySchemaPropertyName;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v98, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroup(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTable(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = CKSQLiteTOCTableEntryDbTablePropertyName;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)&v97, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(v19, v22, (uint64_t)v11, (uint64_t)v3, v21, 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v24, (uint64_t)v23, v25))
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Missing TableGroup table in %@"), self);
    v29 = objc_claimAutoreleasedReturnValue();

    v23 = (id)v29;
  }
  if (!v23)
  {
    objc_msgSend_dbVersion(v3, v26, v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33);
    v38 = objc_msgSend_dbVersion(CKSQLiteTOCTableGroupTable, v35, v36, v37);

    if (v34 == v38)
    {
      objc_msgSend_tocTableGroupTable(v15, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_schema(v3, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_createTableSQL(v42, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v46, v51, (uint64_t)v50, v52);

      if ((isEqualToString & 1) == 0)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v54, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("CKSQLiteTOCTableGroupTable schema changed for %@"), self);
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

        goto LABEL_21;
      }
      v55 = objc_alloc_init(CKSQLiteTOCTableEntry);
      objc_msgSend_dbTableName(CKSQLiteTOCTable, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDbTableName_(v55, v60, (uint64_t)v59, v61);

      v96 = CKSQLiteTOCTableEntryDbTablePropertyName;
      v62 = v55;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v63, (uint64_t)&v96, 1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fetchProperties_inObject_matchingDBProperties_label_(v19, v65, (uint64_t)v11, (uint64_t)v62, v64, 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E0CB35C8], v67, (uint64_t)v66, v68))
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v69, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Missing TOC table in %@"), self);
        v72 = objc_claimAutoreleasedReturnValue();

        v66 = (void *)v72;
      }
      if (v66)
      {
        v23 = v66;
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend_dbVersion(v62, v69, v70, v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v62;
      v77 = objc_msgSend_unsignedIntegerValue(v73, v74, v75, v76);
      v81 = objc_msgSend_dbVersion(CKSQLiteTOCTable, v78, v79, v80);

      if (v77 == v81)
      {
        objc_msgSend_schema(v95, v82, v83, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_createTableSQL(v19, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend_isEqualToString_(v85, v90, (uint64_t)v89, v91);

        if ((v92 & 1) != 0)
        {
          v23 = 0;
LABEL_18:
          v62 = v95;
          goto LABEL_19;
        }
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v93, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("CKSQLiteTOCTable schema changed for %@"), self);
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v82, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("CKSQLiteTOCTable version changed for %@"), self);
      }
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("CKSQLiteTOCTableGroupTable version changed for %@"), self);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

  return v23;
}

- (id)_pruneTables
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  CKSQLiteDatabase *v18;
  id v19;

  objc_msgSend_tocTableGroup(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A7C31D0;
  v16[3] = &unk_1E1F63628;
  v17 = v9;
  v18 = self;
  v19 = v5;
  v10 = v5;
  v11 = v9;
  objc_msgSend_performTransaction_(v11, v12, (uint64_t)v16, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)validateOpenDatabase
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  CKSQLiteDatabase *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend__validateVersionNumbers(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend__pruneTables(self, v5, v6, v7), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218242;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      _os_log_error_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: failed validation: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  return v8;
}

- (id)bootstrap
{
  return (id)((uint64_t (*)(__objc2_class *, char *, CKSQLiteDatabase *))MEMORY[0x1E0DE7D20])(CKSQLiteTOCTableGroup, sel_bootstrapNewDatabase_, self);
}

- (id)createNewDatabase
{
  uint64_t v2;
  uint64_t v3;
  NSString *databaseDirectory;
  id v6;
  __CFString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  databaseDirectory = self->_databaseDirectory;
  if (!databaseDirectory)
    goto LABEL_5;
  v24 = 0;
  CKCreateDirectoryAtPathWithAttributes(databaseDirectory, 0, &v24);
  v6 = v24;
  if (v6)
    goto LABEL_14;
  if (self->_databaseDirectory)
  {
    objc_msgSend_databaseFilePath(self, a2, v2, v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v11 = (const char *)objc_msgSend_fileSystemRepresentation(v7, v8, v9, v10);
  }
  else
  {
LABEL_5:
    v7 = CFSTR(":memory:");
    v11 = (const char *)objc_msgSend_fileSystemRepresentation(CFSTR(":memory:"), a2, v2, v3);
  }
  if (sqlite3_open_v2(v11, &self->_db, 3211270, 0))
  {
    objc_msgSend_sqlErrorWithMessage_(self, v12, (uint64_t)CFSTR("Error opening db at %@"), v13, self->_databaseDirectory);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_14;
  }
  else
  {

  }
  objc_msgSend__executeSQL_(self, v14, (uint64_t)"pragma journal_mode = WAL", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16
    || (v19 = (void *)v16,
        objc_msgSend_sqlErrorWithMessage_(self, v17, (uint64_t)CFSTR("Error setting pragma journal_mode = WAL"), v18),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        !v6))
  {
    objc_msgSend__executeSQL_(self, v17, (uint64_t)"pragma encoding = 'UTF-16'", v18);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend_bootstrap(self, v20, v21, v22);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        self->_databaseWasCreated = 1;
        self->_isEmpty = 1;
        return v6;
      }
    }
  }
LABEL_14:
  sqlite3_close(self->_db);
  self->_db = 0;
  return v6;
}

- (void)closeDatabase
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;
  NSData *uniquingKey;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  CKSQLiteDatabase *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_db)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD96EB8);
    objc_msgSend_databaseFilePath(self, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = sqlite3_close(self->_db);
    self->_db = 0;
    if (v7)
    {
      objc_msgSend_sqlErrorWithMessage_(self, v8, (uint64_t)CFSTR("sqlite3_close() failed"), v9);
      v24 = objc_claimAutoreleasedReturnValue();
      if (ck_log_initialization_predicate != -1)
        goto LABEL_21;
      while (1)
      {
        v25 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v33 = self;
          v34 = 2112;
          v35 = v24;
          _os_log_error_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_ERROR, "Failed to close database %@, error = %@", buf, 0x16u);
        }
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("Failed to close database %@, error = %@"), v27, self, v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UTF8String(v28, v29, v30, v31);
        _os_crash();
        __break(1u);
LABEL_21:
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
    }
    uniquingKey = self->_uniquingKey;
    if (uniquingKey)
    {
      objc_msgSend_removeObjectForKey_((void *)qword_1ECD96EC0, v8, (uint64_t)uniquingKey, v9);
      objc_msgSend_removeObjectForKey_((void *)qword_1ECD96EC8, v11, (uint64_t)self->_uniquingKey, v12);
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v13 = (void *)ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
    {
      if (self->_isEmpty)
        v18 = CFSTR(" (empty)");
      else
        v18 = &stru_1E1F66ED0;
      v19 = (void *)qword_1ECD96EC0;
      v20 = v13;
      *(_DWORD *)buf = 138543874;
      v33 = self;
      v34 = 2114;
      v35 = (uint64_t)v18;
      v36 = 2048;
      v37 = objc_msgSend_count(v19, v21, v22, v23);
      _os_log_debug_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_DEBUG, "Closed db %{public}@%{public}@. allDatabases.count is now %lu.", buf, 0x20u);

    }
    if (self->_isEmpty || self->_removeWhenClosed)
      v17 = (id)objc_msgSend_removeDatabaseDirectory(self, v14, v15, v16);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD96EB8);

  }
}

- (id)removeDatabaseDirectory
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CKSQLiteDatabase *v20;
  NSObject *v21;
  const char *v22;
  id v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  CKSQLiteDatabase *v28;
  __int16 v29;
  CKSQLiteDatabase *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseDirectory(self, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (objc_msgSend_databaseFilePath(self, v9, v10, v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend_fileExistsAtPath_(v5, v14, (uint64_t)v13, v15),
        v13,
        v16))
  {
    objc_msgSend_CKSanitizedPath(v12, v17, v18, v19);
    v20 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v21 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_debug_impl(&dword_18A5C5000, v21, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabase: Removing db at %{public}@", buf, 0xCu);
    }
    v26 = 0;
    objc_msgSend_removeItemAtPath_error_(v5, v22, (uint64_t)v12, (uint64_t)&v26);
    v23 = v26;
    if (v23)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v24 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v28 = self;
        v29 = 2114;
        v30 = v20;
        v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: Removal of database at %{public}@ failed: %{public}@", buf, 0x20u);
      }
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)tocTableGroup
{
  const char *v3;
  uint64_t v4;
  void *WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EDF6F020);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tocTableGroup);
  if (!WeakRetained)
  {
    objc_msgSend_TOCTableGroupInDatabase_(CKSQLiteTOCTableGroup, v3, (uint64_t)self, v4);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_tocTableGroup, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EDF6F020);
  return WeakRetained;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@(%p)"), v7, v5, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_databaseDirectory)
  {
    objc_msgSend_databaseFilePath(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v8, v17, (uint64_t)CFSTR(" path=%@"), v18, v16);

  }
  else
  {
    objc_msgSend_appendString_(v8, v9, (uint64_t)CFSTR(" (in memory)"), v11);
  }
  return v8;
}

+ (id)databaseFilePathInDirectory:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_stringByAppendingPathComponent_(a3, a2, (uint64_t)CFSTR("db"), v3);
}

- (id)databaseFilePath
{
  void *v3;
  const char *v4;
  uint64_t v5;

  v3 = (void *)objc_opt_class();
  return (id)objc_msgSend_databaseFilePathInDirectory_(v3, v4, (uint64_t)self->_databaseDirectory, v5);
}

- (id)sqlErrorWithMessage:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSQLiteDatabase *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v31;
  int *v32;
  char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int isAppleInternalInstall;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  CKSQLiteDatabase *v47;
  __int16 v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_errorForSQLite_message_args_(CKPrettyError, v5, (uint64_t)self->_db, (uint64_t)v4, &v51);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_CKSQLiteCode(v6, v7, v8, v9) == 11)
  {
    objc_msgSend_databaseFilePath(self, v10, v11, v12);
    v13 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v47 = self;
      v48 = 2114;
      v49 = (char *)v13;
      _os_log_error_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: Database corrupt: %{public}@", buf, 0x16u);
    }
    v18 = (const char *)objc_msgSend_fileSystemRepresentation(v13, v15, v16, v17);
    if (setxattr(v18, "CKSQLiteDatabaseCorrupt", "1", 1uLL, 0, 0))
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v22 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
      {
        v31 = v22;
        v32 = __error();
        v33 = strerror(*v32);
        *(_DWORD *)buf = 138412546;
        v47 = v13;
        v48 = 2080;
        v49 = v33;
        _os_log_fault_impl(&dword_18A5C5000, v31, OS_LOG_TYPE_FAULT, "setxattr failed at path: %@. Removing database instead. error = %s", buf, 0x16u);

      }
      v26 = (id)objc_msgSend_removeDatabaseDirectory(self, v23, v24, v25);
    }
    if ((objc_msgSend_options(self, v19, v20, v21) & 4) == 0)
    {
      objc_msgSend_sharedOptions(CKBehaviorOptions, v27, v28, v29);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v34, v35, v36, v37);

      if (isAppleInternalInstall)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v39 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18A5C5000, v39, OS_LOG_TYPE_ERROR, "Database corrupt", buf, 2u);
        }
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v40, (uint64_t)CFSTR("Database corrupt"), v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UTF8String(v42, v43, v44, v45);
        _os_crash();
        __break(1u);
      }
      exit(1);
    }

  }
  return v6;
}

- (id)allTableNames:(id *)a3
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A7C47BC;
  v12[3] = &unk_1E1F605B0;
  v12[4] = self;
  v6 = v5;
  v13 = v6;
  objc_msgSend_performDatabaseTransaction_(self, v7, (uint64_t)v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    v6 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = v6;

  return v10;
}

- (id)_executeSQL:(const char *)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v5 = sqlite3_exec(self->_db, a3, 0, 0, 0);
  if ((_DWORD)v5)
  {
    objc_msgSend_sqlErrorWithMessage_(self, v6, (uint64_t)CFSTR("Error executing SQL: \"%s\" (%d)"), v7, a3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)executeSQL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v4 = objc_retainAutorelease(a3);
  v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  return (id)objc_msgSend__executeSQL_(self, v9, v8, v10);
}

- (int64_t)lastInsertRowID
{
  return sqlite3_last_insert_rowid(self->_db);
}

- (unint64_t)changeCount
{
  return sqlite3_changes(self->_db);
}

- (void)compiledStatementWithSQL:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *db;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  sqlite3_stmt *v16;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  ppStmt = 0;
  db = self->_db;
  v8 = objc_retainAutorelease(v6);
  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  if (sqlite3_prepare_v2(db, v12, -1, &ppStmt, 0))
  {
    objc_msgSend_sqlErrorWithMessage_(self, v13, (uint64_t)CFSTR("Error preparing statement: %@"), v14, v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v15 = objc_retainAutorelease(v15);
      *a4 = v15;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = ppStmt;

  return v16;
}

- (void)finalizeHandle:(void *)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (sqlite3_finalize((sqlite3_stmt *)a3))
  {
    objc_msgSend_sqlErrorWithMessage_(self, v4, (uint64_t)CFSTR("Error finalizing compiled statement"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v7 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_fault_impl(&dword_18A5C5000, v7, OS_LOG_TYPE_FAULT, "-[SQLiteDatabase finalizeHandle]: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (id)dropTable:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("DROP TABLE '%@'"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_INFO, "Dropping table %{public}@", buf, 0xCu);
  }
  objc_msgSend_executeSQL_(self, v9, (uint64_t)v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)traceSQL
{
  sqlite3_trace_v2(self->_db, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_18A7C4C5C, self);
}

- (void)usingTableGroupCachePerformBlock:(id)a3
{
  (*((void (**)(id, NSMapTable *))a3 + 2))(a3, self->_tableGroupCache);
}

- (void)assertInTransaction
{
  _opaque_pthread_t *accessThread;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  id v14;

  accessThread = (_opaque_pthread_t *)self->_serializer.accessThread;
  if (accessThread != pthread_self())
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v9, (uint64_t)"void CKSQLDAssertSerialized(CKSQLDBRecursiveSerializer * _Nonnull)", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v8, v12, (uint64_t)v11, (uint64_t)CFSTR("CKSQLiteDatabaseSerializer.h"), 94, CFSTR("Expected to be serialized"));

  }
  if (!self->_transactionNestCount)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteDatabase.m"), 912, CFSTR("Expected to be in a transaction"));

  }
}

- (void)handleDatabaseBusy:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *databaseDirectory;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  CKSQLiteDatabase *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_INFO))
  {
    databaseDirectory = self->_databaseDirectory;
    v10 = v5;
    objc_msgSend_CKSanitizedPath(databaseDirectory, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = self;
    v17 = 2114;
    v18 = v14;
    _os_log_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_INFO, "SQLitDatabase(%p): Database busy at %{public}@", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E0CB3978], v6, v7, v8, 0.1);

}

- (id)performDatabaseTransaction:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKSignpost *transactionSignpost;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  os_signpost_id_t v13;
  const char *v14;
  uint64_t v15;
  CKSQLiteDatabase *v16;
  NSMutableArray *transactionCompletionHandlers;
  NSMutableArray **p_transactionCompletionHandlers;
  NSMutableArray *v19;
  NSMutableArray *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  int v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSMutableArray *v36;
  NSMutableArray *v37;
  NSMutableArray *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  const char *v43;
  void (**v44)(_QWORD);
  CKSignpost *v45;
  const char *v46;
  uint64_t v47;
  CKSignpost *v48;
  CKSignpost *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  CKSignpost *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  os_signpost_id_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  CKSQLiteDatabase *v62;
  const char *v63;
  uint64_t v64;
  id v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  CKSignpost *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  os_signpost_id_t v81;
  void *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  NSMutableArray *v87;
  NSMutableArray *v88;
  NSMutableArray *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  const char *v94;
  CKSignpost *v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  os_signpost_id_t v100;
  CKSignpost *v101;
  void (**v103)(void);
  void *v104;
  pthread_mutex_t *v105;
  uint8_t v106[16];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  CKSQLiteDatabase *v112;
  __int16 v113;
  id v114;
  char __str[4];
  id v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v104 = v4;
  v105 = _CKSQLDBSerializerLock((uint64_t)&self->_serializer);
  if (self->_transactionNestCount)
  {
    v103 = (void (**)(void))v4;
    transactionSignpost = self->_transactionSignpost;
    if (transactionSignpost)
    {
      objc_msgSend_log(transactionSignpost, v5, v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_identifier(self->_transactionSignpost, v10, v11, v12);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v14, self->_transactionNestCount, v15);
        v16 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v112 = v16;
        _os_signpost_emit_with_name_impl(&dword_18A5C5000, v9, OS_SIGNPOST_EVENT, v13, "Transaction", "Starting execution with NestCount=%{signpost.description:attribute,public}@ ", buf, 0xCu);

      }
    }
    ++self->_transactionNestCount;
    p_transactionCompletionHandlers = &self->_transactionCompletionHandlers;
    transactionCompletionHandlers = self->_transactionCompletionHandlers;
    v19 = transactionCompletionHandlers;
    v20 = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = 0;

    snprintf(__str, 0x20uLL, "SAVEPOINT S%lu", self->_transactionNestCount);
    objc_msgSend__executeSQL_(self, v21, (uint64_t)__str, v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23
      || (v24 = (void *)MEMORY[0x18D76DE4C](),
          v103[2](),
          v23 = (id)objc_claimAutoreleasedReturnValue(),
          objc_autoreleasePoolPop(v24),
          v23))
    {
      snprintf(__str, 0x20uLL, "ROLLBACK TO S%lu", self->_transactionNestCount);
      objc_msgSend__executeSQL_(self, v25, (uint64_t)__str, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v28 = ck_log_facility_sql;
        if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v112 = self;
          v113 = 2114;
          v114 = v27;
          _os_log_error_impl(&dword_18A5C5000, v28, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: ROLLBACK failed with %{public}@", buf, 0x16u);
        }
      }

      v29 = 0;
    }
    else
    {
      v29 = 1;
    }
    snprintf(__str, 0x20uLL, "RELEASE S%lu", self->_transactionNestCount);
    objc_msgSend__executeSQL_(self, v30, (uint64_t)__str, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
      goto LABEL_21;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v35 = ck_log_facility_sql;
    if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v112 = self;
      v113 = 2114;
      v114 = v34;
      _os_log_error_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: RELEASE failed with %{public}@", buf, 0x16u);
      if (!v29)
        goto LABEL_21;
    }
    else if (!v29)
    {
LABEL_21:
      v36 = *p_transactionCompletionHandlers;
      if (*p_transactionCompletionHandlers)
      {
        if (v23)
        {
          v37 = v36;
          objc_storeStrong((id *)&self->_transactionCompletionHandlers, transactionCompletionHandlers);
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v38 = v37;
          v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v107, (uint64_t)buf, 16);
          if (v40)
          {
            v41 = *(_QWORD *)v108;
            do
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v108 != v41)
                  objc_enumerationMutation(v38);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i) + 16))();
              }
              v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v43, (uint64_t)&v107, (uint64_t)buf, 16);
            }
            while (v40);
          }

        }
        else if (v19)
        {
          objc_msgSend_addObjectsFromArray_(v19, v32, (uint64_t)v36, v33);
          objc_storeStrong((id *)&self->_transactionCompletionHandlers, transactionCompletionHandlers);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_transactionCompletionHandlers, transactionCompletionHandlers);
      }
      v76 = self->_transactionSignpost;
      if (v76)
      {
        objc_msgSend_log(v76, v32, (uint64_t)v36, v33);
        v77 = objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend_identifier(self->_transactionSignpost, v78, v79, v80);
        if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
        {
          *(_WORD *)v106 = 0;
          _os_signpost_emit_with_name_impl(&dword_18A5C5000, v77, OS_SIGNPOST_EVENT, v81, "Transaction", "Finished execution", v106, 2u);
        }

      }
      --self->_transactionNestCount;
      v65 = v23;

      goto LABEL_79;
    }
    v23 = v34;
    goto LABEL_21;
  }
  v44 = (void (**)(_QWORD))v4;
  v45 = [CKSignpost alloc];
  v48 = (CKSignpost *)objc_msgSend_initWithLog_(v45, v46, ck_log_facility_sql, v47);
  v49 = self->_transactionSignpost;
  self->_transactionSignpost = v48;

  v53 = self->_transactionSignpost;
  if (v53)
  {
    objc_msgSend_log(v53, v50, v51, v52);
    v54 = objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_identifier(self->_transactionSignpost, v55, v56, v57);
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      objc_msgSend_databaseDirectory(self, v59, v60, v61);
      v62 = (CKSQLiteDatabase *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v112 = v62;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v58, "Transaction", "Directory=%{signpost.description:attribute,public}@ ", buf, 0xCu);

    }
  }
  ++self->_transactionNestCount;
  objc_msgSend__executeSQL_(self, v50, (uint64_t)"BEGIN EXCLUSIVE TRANSACTION", v52);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    while (objc_msgSend_CKIsBusyDatabaseError_(MEMORY[0x1E0CB35C8], v63, (uint64_t)v65, v64))
    {
      objc_msgSend_handleDatabaseBusy_(self, v66, (uint64_t)v65, v67);
      objc_msgSend__executeSQL_(self, v68, (uint64_t)"BEGIN EXCLUSIVE TRANSACTION", v69);
      v70 = objc_claimAutoreleasedReturnValue();

      v65 = (id)v70;
      if (!v70)
        goto LABEL_39;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v74 = ck_log_facility_sql;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    *(_DWORD *)buf = 134218242;
    v112 = self;
    v113 = 2114;
    v114 = v65;
    v75 = "CKSQLiteDatabase<%p>: failed to begin transaction: %{public}@";
LABEL_86:
    _os_log_error_impl(&dword_18A5C5000, v74, OS_LOG_TYPE_ERROR, v75, buf, 0x16u);
    goto LABEL_57;
  }
LABEL_39:
  v71 = (void *)MEMORY[0x18D76DE4C]();
  v44[2](v44);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v71);
  if (v65)
  {
LABEL_57:
    objc_msgSend__executeSQL_(self, v72, (uint64_t)"ROLLBACK TRANSACTION", v73);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v83 = ck_log_facility_sql;
      if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v112 = self;
        v113 = 2114;
        v114 = v82;
        _os_log_error_impl(&dword_18A5C5000, v83, OS_LOG_TYPE_ERROR, "CKSQLiteDatabase<%p>: transaction rollback failed with %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_63;
  }
  objc_msgSend__executeSQL_(self, v72, (uint64_t)"COMMIT TRANSACTION", v73);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v74 = ck_log_facility_sql;
    if (!os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    *(_DWORD *)buf = 134218242;
    v112 = self;
    v113 = 2114;
    v114 = v65;
    v75 = "CKSQLiteDatabase<%p>: transaction commit failed with %{public}@";
    goto LABEL_86;
  }
LABEL_63:
  v87 = self->_transactionCompletionHandlers;
  if (v87)
  {
    v88 = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = 0;

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v89 = v87;
    v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v107, (uint64_t)buf, 16);
    if (v91)
    {
      v92 = *(_QWORD *)v108;
      do
      {
        for (j = 0; j != v91; ++j)
        {
          if (*(_QWORD *)v108 != v92)
            objc_enumerationMutation(v89);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j) + 16))();
        }
        v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v94, (uint64_t)&v107, (uint64_t)buf, 16);
      }
      while (v91);
    }

  }
  v95 = self->_transactionSignpost;
  if (v95)
  {
    objc_msgSend_log(v95, v84, v85, v86);
    v96 = objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend_identifier(self->_transactionSignpost, v97, v98, v99);
    if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
    {
      *(_DWORD *)__str = 138412290;
      v116 = v65;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v96, OS_SIGNPOST_INTERVAL_END, v100, "Transaction", "error=%{signpost.description:attribute}@ ", (uint8_t *)__str, 0xCu);
    }

    v101 = self->_transactionSignpost;
  }
  else
  {
    v101 = 0;
  }
  self->_transactionSignpost = 0;

  --self->_transactionNestCount;
LABEL_79:
  if (v105)
  {
    v105[1].__sig = 0;
    pthread_mutex_unlock(v105);
  }

  return v65;
}

- (id)performInDatabaseTransaction:(id)a3
{
  void (**v4)(_QWORD);
  const char *v5;
  uint64_t v6;
  pthread_mutex_t *v7;
  void *v8;

  v4 = (void (**)(_QWORD))a3;
  v7 = _CKSQLDBSerializerLock((uint64_t)&self->_serializer);
  if (self->_transactionNestCount)
    v4[2](v4);
  else
    objc_msgSend_performDatabaseTransaction_(self, v5, (uint64_t)v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v7[1].__sig = 0;
    pthread_mutex_unlock(v7);
  }

  return v8;
}

- (void)addTransactionCompletionHandler:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *transactionCompletionHandlers;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *aBlock;

  v5 = a3;
  aBlock = v5;
  if (!self->_transactionNestCount)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CKSQLiteDatabase.m"), 1095, CFSTR("Must be in a transaction"));

    v5 = aBlock;
  }
  transactionCompletionHandlers = self->_transactionCompletionHandlers;
  if (!transactionCompletionHandlers)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = v10;

    v5 = aBlock;
    transactionCompletionHandlers = self->_transactionCompletionHandlers;
  }
  v12 = _Block_copy(v5);
  objc_msgSend_addObject_(transactionCompletionHandlers, v13, (uint64_t)v12, v14);

}

- (void)tableGroupPassedValidation:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *validatedTableGroups;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v4 = self->_validatedTableGroups;
  objc_sync_enter(v4);
  validatedTableGroups = self->_validatedTableGroups;
  objc_msgSend_groupID(v12, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(validatedTableGroups, v10, (uint64_t)v9, v11);

  objc_sync_exit(v4);
}

- (BOOL)tableGroupWasPreviouslyValidated:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *validatedTableGroups;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  v4 = a3;
  v5 = self->_validatedTableGroups;
  objc_sync_enter(v5);
  validatedTableGroups = self->_validatedTableGroups;
  objc_msgSend_groupID(v4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(validatedTableGroups) = objc_msgSend_containsObject_(validatedTableGroups, v11, (uint64_t)v10, v12);

  objc_sync_exit(v5);
  return (char)validatedTableGroups;
}

- (void)removeValidatedTableGroup:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *validatedTableGroups;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v4 = self->_validatedTableGroups;
  objc_sync_enter(v4);
  validatedTableGroups = self->_validatedTableGroups;
  objc_msgSend_groupID(v12, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(validatedTableGroups, v10, (uint64_t)v9, v11);

  objc_sync_exit(v4);
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (BOOL)databaseWasCreated
{
  return self->_databaseWasCreated;
}

- (BOOL)removeWhenClosed
{
  return self->_removeWhenClosed;
}

- (void)setRemoveWhenClosed:(BOOL)a3
{
  self->_removeWhenClosed = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSData)uniquingKey
{
  return self->_uniquingKey;
}

- (NSMapTable)tableGroupCache
{
  return self->_tableGroupCache;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (void)setIsEmpty:(BOOL)a3
{
  self->_isEmpty = a3;
}

- (CKSQLiteDatabaseManagerTimer)databaseManagerTimer
{
  return self->_databaseManagerTimer;
}

- (void)setDatabaseManagerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManagerTimer, a3);
}

- (NSObject)databaseManagerData
{
  return self->_databaseManagerData;
}

- (void)setDatabaseManagerData:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManagerData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManagerData, 0);
  objc_storeStrong((id *)&self->_databaseManagerTimer, 0);
  objc_storeStrong((id *)&self->_registryDatabase, 0);
  objc_storeStrong((id *)&self->_tableGroupCache, 0);
  objc_storeStrong((id *)&self->_uniquingKey, 0);
  objc_storeStrong((id *)&self->_databaseGroup, 0);
  objc_storeStrong((id *)&self->_validatedTableGroups, 0);
  objc_storeStrong((id *)&self->_transactionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_transactionSignpost, 0);
  objc_destroyWeak((id *)&self->_tocTableGroup);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

@end
