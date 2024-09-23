@implementation CKPackage

+ (id)stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  objc_msgSend_CKSafeStringForPathComponent(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(&stru_1E1F66ED0, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKSafeHashStringForPathComponent(v3, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v10, v15, (uint64_t)v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)clonedPackageInDaemonWithBasePath:(id)a3 filesDuplicatedIntoDirectory:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  id v45;
  void *v46;
  CKPackageItem *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  id *v70;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  id v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v10 = a4;
  if (a5)
    *a5 = 0;
  v79 = 0;
  objc_msgSend_packageInDaemonWithBasePath_error_(CKPackage, v9, (uint64_t)v8, (uint64_t)&v79);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v79;
  v15 = v12;
  if (v12)
  {
    v16 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    v70 = a5;
    v71 = v8;
    v78 = 0;
    v17 = objc_msgSend_itemCountWithError_(self, v13, (uint64_t)&v78, v14);
    v21 = v78;
    v72 = v11;
    if (v17)
    {
      for (i = 0; v17 != i; ++i)
      {
        objc_msgSend_itemAtIndex_(self, v18, i, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v23;
        if (v10)
        {
          objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v24, v25, v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_UUIDString(v28, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = v10;
          objc_msgSend_URLByAppendingPathComponent_isDirectory_(v10, v34, (uint64_t)v32, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_fileURL(v27, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v21;
          objc_msgSend_copyItemAtURL_toURL_error_(v39, v44, (uint64_t)v43, (uint64_t)v35, &v77);
          v45 = v77;
          v46 = v21;
          v21 = v45;

          if (v21)
          {

            v11 = v72;
LABEL_19:
            v75 = 0u;
            v76 = 0u;
            v73 = 0u;
            v74 = 0u;
            objc_msgSend_itemEnumerator(v11, v18, v19, v20);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v73, (uint64_t)v80, 16);
            if (v55)
            {
              v59 = v55;
              v60 = *(_QWORD *)v74;
              do
              {
                for (j = 0; j != v59; ++j)
                {
                  if (*(_QWORD *)v74 != v60)
                    objc_enumerationMutation(v53);
                  v62 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
                  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v56, v57, v58);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_fileURL(v62, v64, v65, v66);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_removeItemAtURL_error_(v63, v68, (uint64_t)v67, 0);

                }
                v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v73, (uint64_t)v80, 16);
              }
              while (v59);
            }

            v11 = v72;
LABEL_27:
            objc_msgSend_removeDB(v11, v18, v19, v20);
            if (v70)
            {
              v21 = objc_retainAutorelease(v21);
              v16 = 0;
              *v70 = v21;
            }
            else
            {
              v16 = 0;
            }
            v8 = v71;
            v10 = v33;
            goto LABEL_31;
          }
          v10 = v33;
          v11 = v72;
        }
        else
        {
          objc_msgSend_fileURL(v23, v24, v25, v26);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v47 = [CKPackageItem alloc];
        v50 = (void *)objc_msgSend_initWithFileURL_(v47, v48, (uint64_t)v35, v49);
        objc_msgSend_addItem_(v11, v51, (uint64_t)v50, v52);

      }
    }
    if (v21)
    {
      v33 = v10;
      if (v10)
        goto LABEL_19;
      goto LABEL_27;
    }
    v16 = v11;
    v8 = v71;
LABEL_31:
    v15 = 0;

  }
  return v16;
}

- (BOOL)removeDBAndDeleteFilesWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_itemEnumerator(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v7)
  {
    v11 = v7;
    v12 = 0;
    v13 = *(_QWORD *)v32;
    do
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v5);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
        objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v8, v9, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURL(v16, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        objc_msgSend_removeItemAtURL_error_(v17, v22, (uint64_t)v21, (uint64_t)&v30);
        v23 = v30;

        if (v15)
          v24 = v15;
        else
          v24 = v23;
        v12 = v24;

        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend_removeDB(self, v25, v26, v27);
  if (a3)
    *a3 = objc_retainAutorelease(v12);

  return v12 == 0;
}

- (CKPackage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPackage;
  return -[CKPackage init](&v3, sel_init);
}

- (id)_initWithBasePath:(id)a3 UUID:(id)a4
{
  id v6;
  id v7;
  CKPackage *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKPackage *v12;
  uint64_t v13;
  NSString *rootDatabasePath;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *UUID;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKPackage;
  v8 = -[CKPackage init](&v21, sel_init);
  v12 = v8;
  if (v8)
  {
    v8->_state = 0;
    v13 = objc_msgSend_copy(v6, v9, v10, v11);
    rootDatabasePath = v12->_rootDatabasePath;
    v12->_rootDatabasePath = (NSString *)v13;

    v18 = objc_msgSend_copy(v7, v15, v16, v17);
    UUID = v12->_UUID;
    v12->_UUID = (NSString *)v18;

    v12->_packageID = 0;
    v12->_nextItemIndex = 0;
    v12->_storageGroupingPolicy = 2;
  }

  return v12;
}

- (id)initUnreachablePackageWithUUID:(id)a3
{
  id v4;
  CKPackage *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  v4 = a3;
  v5 = [CKPackage alloc];
  v7 = (void *)objc_msgSend__initWithBasePath_UUID_(v5, v6, (uint64_t)CFSTR("/unreachable/package/"), (uint64_t)v4);

  objc_msgSend_setState_(v7, v8, 6, v9);
  return v7;
}

+ (id)packageWithError:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_packageProcessBasePath(a1, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packageInClientWithBasePath_error_(a1, v7, (uint64_t)v6, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)packageWithPackage:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  CKPackage *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  char v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  CKException *v97;
  const char *v98;
  id v99;
  id v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (__sTestOverridesAvailable)
    v10 = byte_1EDF6A0E0 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v97 = [CKException alloc];
    v99 = (id)objc_msgSend_initWithName_format_(v97, v98, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("This initializer should only be called from the client, not cloudd"));
    objc_exception_throw(v99);
  }
  v11 = v6;
  objc_msgSend__packageDatabasePath(v6, v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CKCreateGUID();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packageProcessBasePath(a1, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = [CKPackage alloc];
  v20 = (void *)objc_msgSend__initWithBasePath_UUID_(v18, v19, (uint64_t)v17, (uint64_t)v13);
  objc_msgSend_setState_(v20, v21, 1, v22);
  objc_msgSend__packageDatabasePath(v20, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v27 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v88 = v27;
    objc_msgSend_UUID(v11, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(v20, v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v102 = v92;
    v103 = 2114;
    v104 = v96;
    v105 = 2114;
    v106 = v12;
    v107 = 2114;
    v108 = v26;
    _os_log_debug_impl(&dword_18A5C5000, v88, OS_LOG_TYPE_DEBUG, "Duplicating package: %{public}@ to %{public}@, with DB: %{public}@ to %{public}@", buf, 0x2Au);

  }
  v100 = 0;
  v29 = objc_msgSend_copySQLiteFileAtPath_toPath_timeout_error_(CKPackageDB, v28, (uint64_t)v12, (uint64_t)v26, &v100, 1.0);
  v30 = v100;
  v34 = v30;
  if ((v29 & 1) == 0)
  {
    if (a4)
    {
      objc_msgSend_CKClientSuitableError(v30, v31, v32, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_releaseDB(v20, v31, v32, v33);
    goto LABEL_16;
  }
  objc_msgSend_setState_(v20, v31, 1, v33);
  v38 = objc_msgSend_packageID(v11, v35, v36, v37);
  objc_msgSend_setPackageID_(v20, v39, v38, v40);
  v44 = objc_msgSend_wasCached(v11, v41, v42, v43);
  objc_msgSend_setWasCached_(v20, v45, v44, v46);
  v50 = objc_msgSend_storageGroupingPolicy(v11, v47, v48, v49);
  objc_msgSend_setStorageGroupingPolicy_(v20, v51, v50, v52);
  objc_msgSend_packageReference(v11, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackageReference_(v20, v57, (uint64_t)v56, v58);

  objc_msgSend_boundaryKey(v11, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend_copy(v62, v63, v64, v65);
  objc_msgSend_setBoundaryKey_(v20, v67, (uint64_t)v66, v68);

  objc_msgSend_assetTransferOptions(v11, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetTransferOptions_(v20, v73, (uint64_t)v72, v74);

  v78 = objc_msgSend_paddedSize(v11, v75, v76, v77);
  objc_msgSend_setPaddedSize_(v20, v79, v78, v80);
  if ((objc_msgSend_openWithError_(v20, v81, (uint64_t)a4, v82) & 1) == 0)
  {
    objc_msgSend_removeDB(v20, v83, v84, v85);
LABEL_16:
    v86 = 0;
    goto LABEL_17;
  }
  v86 = v20;
LABEL_17:

  return v86;
}

+ (id)clonedPackageWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 signature:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  CKPackageReference *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;

  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend_packageWithError_(CKPackage, v14, (uint64_t)a7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [CKPackageReference alloc];
  v19 = (void *)objc_msgSend_initWithRecordID_databaseScope_fieldName_signature_(v17, v18, (uint64_t)v13, a4, v12, v11);

  objc_msgSend_setPackageReference_(v16, v20, (uint64_t)v19, v21);
  return v16;
}

+ (id)clonedPackageWithRecordID:(id)a3 databaseScope:(int64_t)a4 fieldName:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_clonedPackageWithRecordID_databaseScope_fieldName_signature_error_, a3, a4);
}

+ (id)packageInClientWithBasePath:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  CKPackage *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CKException *v31;
  const char *v32;
  id v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__sTestOverridesAvailable)
    v6 = byte_1EDF6A0E0 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v31 = [CKException alloc];
    v33 = (id)objc_msgSend_initWithName_format_(v31, v32, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("This initializer should only be called from the client, not cloudd"));
    objc_exception_throw(v33);
  }
  v7 = v5;
  CKCreateGUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CKPackage alloc];
  v11 = (void *)objc_msgSend__initWithBasePath_UUID_(v9, v10, (uint64_t)v7, (uint64_t)v8);
  objc_msgSend_setState_(v11, v12, 1, v13);
  if ((objc_msgSend_prepareDBWithError_(v11, v14, (uint64_t)a4, v15) & 1) != 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v22 = v19;
      objc_msgSend_rootDatabasePath(v11, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v8;
      v36 = 2114;
      v37 = v30;
      _os_log_debug_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_DEBUG, "Client created package with UUID=%{public}@, path=%{public}@", (uint8_t *)&v34, 0x16u);

    }
    v20 = v11;
  }
  else
  {
    objc_msgSend_releaseDB(v11, v16, v17, v18);
    v20 = 0;
  }

  return v20;
}

+ (id)packageInDaemonWithBasePath:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  CKPackage *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CKException *v24;
  const char *v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__sTestOverridesAvailable)
    v6 = byte_1EDF6A0E0 == 0;
  else
    v6 = 1;
  v7 = !v6 && byte_1EDF75458 == 0;
  if (v7 && (byte_1EDF75459 & 1) == 0)
  {
    v24 = [CKException alloc];
    v26 = (id)objc_msgSend_initWithName_format_(v24, v25, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("This initializer should only be called from cloudd, not the client"));
    objc_exception_throw(v26);
  }
  CKCreateGUID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [CKPackage alloc];
  v11 = (void *)objc_msgSend__initWithBasePath_UUID_(v9, v10, (uint64_t)v5, (uint64_t)v8);
  objc_msgSend_setState_(v11, v12, 7, v13);
  if (objc_msgSend_prepareDBWithError_(v11, v14, (uint64_t)a4, v15))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v16 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v19 = v16;
      objc_msgSend_CKSanitizedPath(v5, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v8;
      v29 = 2114;
      v30 = v23;
      _os_log_debug_impl(&dword_18A5C5000, v19, OS_LOG_TYPE_DEBUG, "Daemon created package with UUID=%{public}@, path=%{public}@", (uint8_t *)&v27, 0x16u);

    }
    v17 = v11;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isReference
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend_packageReference(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  int v62;
  CKPackage *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v62 = 138412290;
    v63 = self;
    _os_log_debug_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_DEBUG, "encoding package: %@", (uint8_t *)&v62, 0xCu);
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass() & 1;
  if (v9)
    objc_msgSend_handleChangeStateAction_(self, v7, 0, v8);
  else
    objc_msgSend_handleChangeStateAction_(self, v7, 4, v8);
  v13 = objc_msgSend_state(self, v10, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v4, v14, v13, (uint64_t)CFSTR("state"));
  objc_msgSend_UUID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, (uint64_t)CFSTR("UUID"));

  objc_msgSend_rootDatabasePath(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("DBBase"));

  v28 = objc_msgSend_packageID(self, v25, v26, v27);
  objc_msgSend_encodeInt64_forKey_(v4, v29, v28, (uint64_t)CFSTR("packageID"));
  v33 = objc_msgSend_wasCached(self, v30, v31, v32);
  objc_msgSend_encodeBool_forKey_(v4, v34, v33, (uint64_t)CFSTR("wasCached"));
  v38 = objc_msgSend_storageGroupingPolicy(self, v35, v36, v37);
  objc_msgSend_encodeInteger_forKey_(v4, v39, v38, (uint64_t)CFSTR("storageGroupingPolicy"));
  objc_msgSend_packageReference(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v43, (uint64_t)CFSTR("packageReference"));

  if (!v9)
  {
    objc_msgSend_archiverInfo(self, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, (uint64_t)CFSTR("archiverInfo"));

  }
  objc_msgSend_assetTransferOptions(self, v45, v46, v47);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v50, (uint64_t)CFSTR("assetTransferOptions"));

  objc_msgSend_boundaryKey(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("boundaryKey"));

  v60 = objc_msgSend_paddedSize(self, v57, v58, v59);
  objc_msgSend_encodeInt64_forKey_(v4, v61, v60, (uint64_t)CFSTR("paddedSize"));
  objc_autoreleasePoolPop(v5);

}

- (CKPackage)initWithCoder:(id)a3
{
  id v4;
  CKPackage *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *rootDatabasePath;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  CKPackageReference *packageReference;
  const char *v27;
  char v28;
  NSString *v29;
  NSString *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSData *archiverInfo;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  NSData *boundaryKey;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  CKAssetTransferOptions *assetTransferOptions;
  const char *v45;
  uint64_t v46;
  void *v47;
  CKPackage *v48;
  NSObject *v50;
  NSString *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  objc_super v62;
  uint8_t buf[4];
  NSString *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)CKPackage;
  v5 = -[CKPackage init](&v62, sel_init);
  if (!v5)
  {
LABEL_11:
    v48 = v5;
    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x18D76DE4C]();
  v7 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("UUID"));
  v9 = objc_claimAutoreleasedReturnValue();
  UUID = v5->_UUID;
  v5->_UUID = (NSString *)v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("DBBase"));
  v13 = objc_claimAutoreleasedReturnValue();
  rootDatabasePath = v5->_rootDatabasePath;
  v5->_rootDatabasePath = (NSString *)v13;

  v5->_packageID = objc_msgSend_decodeInt64ForKey_(v4, v15, (uint64_t)CFSTR("packageID"), v16);
  v5->_wasCached = objc_msgSend_decodeBoolForKey_(v4, v17, (uint64_t)CFSTR("wasCached"), v18);
  v5->_storageGroupingPolicy = objc_msgSend_decodeIntegerForKey_(v4, v19, (uint64_t)CFSTR("storageGroupingPolicy"), v20);
  v5->_state = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)CFSTR("state"), v22);
  v23 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("packageReference"));
  v25 = objc_claimAutoreleasedReturnValue();
  packageReference = v5->_packageReference;
  v5->_packageReference = (CKPackageReference *)v25;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("archiverInfo"));
    v33 = objc_claimAutoreleasedReturnValue();
    archiverInfo = v5->_archiverInfo;
    v5->_archiverInfo = (NSData *)v33;

    objc_msgSend_handleChangeStateAction_(v5, v35, 5, v36);
    goto LABEL_6;
  }
  v61 = 0;
  v28 = objc_msgSend_handleChangeStateAction_error_(v5, v27, 1, (uint64_t)&v61);
  v29 = (NSString *)v61;
  v30 = v29;
  if ((v28 & 1) != 0)
  {

LABEL_6:
    v37 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, (uint64_t)CFSTR("boundaryKey"));
    v39 = objc_claimAutoreleasedReturnValue();
    boundaryKey = v5->_boundaryKey;
    v5->_boundaryKey = (NSData *)v39;

    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("assetTransferOptions"));
    v43 = objc_claimAutoreleasedReturnValue();
    assetTransferOptions = v5->_assetTransferOptions;
    v5->_assetTransferOptions = (CKAssetTransferOptions *)v43;

    v5->_paddedSize = objc_msgSend_decodeInt64ForKey_(v4, v45, (uint64_t)CFSTR("paddedSize"), v46);
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v47 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v51 = v5->_UUID;
      v52 = v47;
      objc_msgSend_rootDatabasePath(v5, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v51;
      v65 = 2114;
      v66 = v60;
      _os_log_debug_impl(&dword_18A5C5000, v52, OS_LOG_TYPE_DEBUG, "Decoded package with UUID=%{public}@, path=%{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    goto LABEL_11;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v50 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v30;
    _os_log_impl(&dword_18A5C5000, v50, OS_LOG_TYPE_INFO, "Warn: CKPackage decoding failed due to: %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v6);
  v48 = 0;
LABEL_12:

  return v48;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _OpaquePCSShareProtection *recordPCS;
  objc_super v13;
  uint8_t buf[4];
  CKPackage *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, v2, v3) == 1 || objc_msgSend_state(self, v5, v6, v7) == 7)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_fault_impl(&dword_18A5C5000, v11, OS_LOG_TYPE_FAULT, "Package dealloced in wrong state: %@.", buf, 0xCu);
    }
  }
  objc_msgSend_close(self, v8, v9, v10);
  recordPCS = self->_recordPCS;
  if (recordPCS)
  {
    CFRelease(recordPCS);
    self->_recordPCS = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)CKPackage;
  -[CKPackage dealloc](&v13, sel_dealloc);
}

+ (id)packageProcessBasePath
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int128 buf;
  void (*v35)(uint64_t);
  void *v36;
  char *v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedManager(CKProcessScopedStateManager, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_untrustedEntitlements(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleID(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v12;
    v16 = (void *)objc_opt_self();
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v35 = sub_18A7E86BC;
    v36 = &unk_1E1F65A48;
    v37 = sel__packagesBasePathForBundleID_;
    v38 = v16;
    if (qword_1ECD96EF0 != -1)
      dispatch_once(&qword_1ECD96EF0, &buf);
    v17 = (void *)qword_1ECD96EE8;
    objc_msgSend_stagingPathSuffixForCloudKitCachesDirectoryWithBundleIdentifier_(v16, v14, (uint64_t)v13, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v17, v19, (uint64_t)v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v22 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v25 = v22;
      objc_msgSend_CKSanitizedPath(v21, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v29;
      v32 = 2114;
      v33 = v13;
      _os_log_debug_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_DEBUG, "Package base path=%{public}@, bundleIdentifier=%{public}@", (uint8_t *)&v30, 0x16u);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v23 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("application-identifier");
      _os_log_fault_impl(&dword_18A5C5000, v23, OS_LOG_TYPE_FAULT, "Could not retrieve application bundle ID because the %@ entitlement is missing", (uint8_t *)&buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

+ (id)clientPackageDatabaseDirectory
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  CKException *v8;
  const char *v9;
  id v10;

  if (__sTestOverridesAvailable)
    v4 = byte_1EDF6A0E0 == 0;
  else
    v4 = 0;
  if (v4)
  {
    v8 = [CKException alloc];
    v10 = (id)objc_msgSend_initWithName_format_(v8, v9, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("This method should only be called from the client, not cloudd"));
    objc_exception_throw(v10);
  }
  objc_msgSend_packageProcessBasePath(a1, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A7E8794((uint64_t)CKPackage, v5, 1uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_packageDatabasePathWithState:(int64_t)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend_rootDatabasePath(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A7E894C((uint64_t)CKPackage, v6, v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_packageDatabasePath
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_state(self, a2, v2, v3);
  return (id)objc_msgSend__packageDatabasePathWithState_(self, v6, v5, v7);
}

- (BOOL)movePackagesDatabaseInDirection:(BOOL)a3 error:(id *)a4
{
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  char v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v24;

  v6 = !a3;
  if (a3)
    v7 = 7;
  else
    v7 = 1;
  if (v6)
    v8 = 7;
  else
    v8 = 1;
  objc_msgSend__packageDatabasePathWithState_(self, a2, v7, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__packageDatabasePathWithState_(self, v10, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_close(self, v13, v14, v15);
  v24 = 0;
  v17 = objc_msgSend_moveSQLiteFileAtPath_toPath_timeout_error_(CKPackageDB, v16, (uint64_t)v9, (uint64_t)v12, &v24, 1.0);
  v18 = v24;
  v22 = v18;
  if (a4 && (v17 & 1) == 0)
  {
    objc_msgSend_CKClientSuitableError(v18, v19, v20, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)handleChangeStateAction:(int64_t)a3 error:(id *)a4
{
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint8_t buf[4];
  CKPackage *v52;
  __int16 v53;
  char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v30 = off_1E1F65BE0[a3];
    *(_DWORD *)buf = 138412546;
    v52 = self;
    v53 = 2080;
    v54 = v30;
    _os_log_debug_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_DEBUG, "%@ state change action: %s", buf, 0x16u);
  }
  v12 = objc_msgSend_state(self, v9, v10, v11);
  v16 = v12;
  switch(a3)
  {
    case 0:
      objc_msgSend_close(self, v13, v14, v15);
      if (v16 == 7)
      {
        objc_msgSend_setState_(self, v17, 8, v19);
        return 1;
      }
      if (v16 == 1)
      {
        objc_msgSend_setState_(self, v17, 2, v19);
        return 1;
      }
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v31;
      if (v16 > 0xC)
        v33 = "Unknown";
      else
        v33 = off_1E1F65C18[v16];
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 592, CFSTR("%@, Unexpected state %s for state change action %s"), self, v33, "kCKPackageStateChangeActionEncodeForXPC");
      goto LABEL_66;
    case 1:
      if (v12 == 8)
      {
        objc_msgSend_setState_(self, v13, 9, v15);
        return 1;
      }
      if (v12 == 2)
      {
        objc_msgSend_setState_(self, v13, 3, v15);
        return 1;
      }
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v34;
      if (v16 > 0xC)
        v36 = "Unknown";
      else
        v36 = off_1E1F65C18[v16];
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 603, CFSTR("%@, Unexpected state %s for state change action %s"), self, v36, "kCKPackageStateChangeActionDecodeFromXPC");
      goto LABEL_66;
    case 2:
      switch(v12)
      {
        case 9:
          if (objc_msgSend_movePackagesDatabaseInDirection_error_(self, v13, 1, (uint64_t)a4))
            goto LABEL_13;
          return 0;
        case 3:
          v22 = 0;
          if (!objc_msgSend_movePackagesDatabaseInDirection_error_(self, v13, 0, (uint64_t)a4))
            return v22;
          objc_msgSend_setState_(self, v40, 7, v41);
          break;
        case 2:
          if (objc_msgSend_movePackagesDatabaseInDirection_error_(self, v13, 1, (uint64_t)a4))
          {
LABEL_13:
            v22 = 1;
            objc_msgSend_setState_(self, v20, 1, v21);
            return v22;
          }
          return 0;
        default:
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v42;
          if (v16 > 0xC)
            v44 = "Unknown";
          else
            v44 = off_1E1F65C18[v16];
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 629, CFSTR("%@, Unexpected state %s for state change action %s"), self, v44, "kCKPackageStateChangeActionClaim");
LABEL_66:

          break;
      }
      return 1;
    case 3:
      if (v12 == 7)
        goto LABEL_30;
      if (v12 == 1)
        goto LABEL_29;
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      if (v16 > 0xC)
        v26 = "Unknown";
      else
        v26 = off_1E1F65C18[v16];
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 640, CFSTR("%@, Unexpected state %s for state change action %s"), self, v26, "kCKPackageStateChangeActionRemoveDB");
      goto LABEL_66;
    case 4:
      objc_msgSend_close(self, v13, v14, v15);
      switch(v16)
      {
        case 1uLL:
        case 5uLL:
        case 6uLL:
          objc_msgSend_setState_(self, v27, 5, v29);
          break;
        case 7uLL:
        case 0xCuLL:
          objc_msgSend_setState_(self, v27, 11, v29);
          break;
        default:
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v27, v28, v29);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v48;
          if (v16 > 0xC)
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 675, CFSTR("%@, Unexpected state %s for state change action %s"), self, "Unknown", "kCKPackageStateChangeActionArchive");
          else
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 675, CFSTR("%@, Unexpected state %s for state change action %s"), self, off_1E1F65C18[v16], "kCKPackageStateChangeActionArchive");
          goto LABEL_66;
      }
      return 1;
    case 5:
      if (v12 == 11)
      {
        objc_msgSend_setState_(self, v13, 12, v15);
        return 1;
      }
      if (v12 == 5)
      {
        objc_msgSend_setState_(self, v13, 6, v15);
        return 1;
      }
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v37;
      if (v16 > 0xC)
        v39 = "Unknown";
      else
        v39 = off_1E1F65C18[v16];
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 686, CFSTR("%@, Unexpected state %s for state change action %s"), self, v39, "kCKPackageStateChangeActionUnarchive");
      goto LABEL_66;
    case 6:
      if (v12 == 8 || v12 == 7)
      {
LABEL_30:
        objc_msgSend_setState_(self, v13, 10, v15);
        return 1;
      }
      if (v12 == 1)
      {
LABEL_29:
        objc_msgSend_setState_(self, v13, 4, v15);
        return 1;
      }
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v45;
      if (v16 > 0xC)
        v47 = "Unknown";
      else
        v47 = off_1E1F65C18[v16];
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 654, CFSTR("%@, Unexpected state %s for state change action %s"), self, v47, "kCKPackageStateChangeActionReleaseDB");
      goto LABEL_66;
    default:
      return 1;
  }
}

- (void)handleChangeStateAction:(int64_t)a3
{
  char v5;
  id v6;
  id v7;
  CKException *v8;
  const char *v9;
  id v10;
  id v11;

  v11 = 0;
  v5 = objc_msgSend_handleChangeStateAction_error_(self, a2, a3, (uint64_t)&v11);
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    v7 = v6;
    v8 = [CKException alloc];
    v10 = (id)objc_msgSend_initWithCode_format_(v8, v9, 12, (uint64_t)CFSTR("%@ state change action %s failed where success was expected. Error: %@"), self, off_1E1F65BE0[a3], v7);
    objc_exception_throw(v10);
  }

}

- (BOOL)setArchiverInfo:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  _QWORD v24[4];
  id v25;
  CKPackage *v26;

  v6 = a3;
  if (objc_msgSend_openWithError_(self, v7, (uint64_t)a4, v8))
  {
    objc_msgSend_sqlite(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_copy(v6, v13, v14, v15);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_18A7E96E0;
    v24[3] = &unk_1E1F62B70;
    v17 = v16;
    v25 = v17;
    v26 = self;
    objc_msgSend_performDatabaseOperation_(v12, v18, (uint64_t)v24, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v20 == 0;
    if (v20)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v20);
    }
    else
    {
      objc_storeStrong((id *)&self->_archiverInfo, v16);
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)prepareDBWithError:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  _QWORD v20[5];
  id v21;

  if (!objc_msgSend_openWithError_(self, a2, (uint64_t)a3, v3))
    return 0;
  objc_msgSend_archiverInfo(self, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_data(MEMORY[0x1E0C99D50], v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_sqlite(self, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18A7E98B8;
  v20[3] = &unk_1E1F62B70;
  v20[4] = self;
  v21 = v12;
  v14 = v12;
  objc_msgSend_performDatabaseOperation_(v13, v15, (uint64_t)v20, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v17)
    *a3 = objc_retainAutorelease(v17);
  v18 = v17 == 0;

  return v18;
}

+ (void)destroyClientPackageWithDatabaseBasePath:(id)a3 UUID:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKException *v14;
  const char *v15;
  id v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (__sTestOverridesAvailable)
    v7 = byte_1EDF6A0E0 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v14 = [CKException alloc];
    v16 = (id)objc_msgSend_initWithName_format_(v14, v15, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("This method should only be called from the client, not cloudd"));
    objc_exception_throw(v16);
  }
  v8 = v6;
  sub_18A7E894C((uint64_t)CKPackage, v17, v6, 1uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A7E99A0((uint64_t)a1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remove(v10, v11, v12, v13);

}

- (void)releaseDBWithRemove:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const __CFString *v23;
  int v24;
  CKPackage *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v23 = CFSTR("false");
    if (v3)
      v23 = CFSTR("true");
    v24 = 138412546;
    v25 = self;
    v26 = 2114;
    v27 = v23;
    _os_log_debug_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_DEBUG, "%@: Releasing DB with remove: %{public}@.", (uint8_t *)&v24, 0x16u);
  }
  objc_msgSend__packageDatabasePath(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_close(self, v10, v11, v12);
  objc_msgSend_setRootDatabasePath_(self, v13, 0, v14);
  if (v3)
  {
    sub_18A7E99A0((uint64_t)CKPackage, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remove(v17, v18, v19, v20);
    objc_msgSend_handleChangeStateAction_(self, v21, 3, v22);

  }
  else
  {
    objc_msgSend_handleChangeStateAction_(self, v15, 6, v16);
  }

}

- (void)removeDB
{
  ((void (*)(CKPackage *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_releaseDBWithRemove_, 1);
}

- (void)releaseDB
{
  ((void (*)(CKPackage *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_releaseDBWithRemove_, 0);
}

- (void)setSize:(unint64_t)a3
{
  self->_hasSize = 1;
  self->_size = a3;
}

- (void)setPaddedSize:(unint64_t)a3
{
  self->_paddedSize = a3;
}

- (void)setRecordPCS:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *recordPCS;

  recordPCS = self->_recordPCS;
  if (recordPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      recordPCS = self->_recordPCS;
    }
    self->_recordPCS = a3;
    if (recordPCS)
      CFRelease(recordPCS);
  }
}

- (CKAssetTransferOptions)assetTransferOptions
{
  return self->_assetTransferOptions;
}

- (void)setAssetTransferOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKAssetTransferOptions *v7;
  CKAssetTransferOptions *assetTransferOptions;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int isReference;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  id v26;

  v26 = a3;
  v7 = (CKAssetTransferOptions *)objc_msgSend_copy(v26, v4, v5, v6);
  assetTransferOptions = self->_assetTransferOptions;
  self->_assetTransferOptions = v7;

  isReference = objc_msgSend_isReference(self, v9, v10, v11);
  v15 = v26;
  if (isReference)
  {
    objc_msgSend_useMMCSEncryptionV2(v26, (const char *)v26, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    if (v16)
    {
      v21 = objc_msgSend_BOOLValue(v16, v17, v18, v19);
      if (v21 != objc_msgSend_useMMCSEncryptionV2(self, v22, v23, v24))
        objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v25, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Value specified forCKAssetTransferOptions.useMMCSEncryptionV2 is inconsistent with referenced package encryption."));
    }

    v15 = v26;
  }

}

- (BOOL)useMMCSEncryptionV2
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char isValidV2Signature;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  if (objc_msgSend_isReference(self, a2, v2, v3))
  {
    objc_msgSend_packageReference(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signature(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      isValidV2Signature = objc_msgSend_isValidV2Signature_(CKSignatureGenerator, v13, (uint64_t)v12, v15);
    }
    else
    {
      objc_msgSend_assetTransferOptions(self, v13, v14, v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_useMMCSEncryptionV2(v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      isValidV2Signature = objc_msgSend_BOOLValue(v28, v29, v30, v31);

      v12 = 0;
    }
  }
  else
  {
    objc_msgSend_assetTransferOptions(self, v5, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_useMMCSEncryptionV2(v12, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    isValidV2Signature = objc_msgSend_BOOLValue(v20, v21, v22, v23);

  }
  return isValidV2Signature;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  CKPackage *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;

  v5 = a5;
  v6 = a4;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_msgSend_state(self, v10, v11, v12);
  if (v13 > 0xC)
    objc_msgSend_stringWithUTF8String_(v9, v14, (uint64_t)"Unknown", v15);
  else
    objc_msgSend_stringWithUTF8String_(v9, v14, (uint64_t)off_1E1F65C18[v13], v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v17, (uint64_t)CFSTR("state"), (uint64_t)v16);

  objc_msgSend_UUID(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v22, (uint64_t)CFSTR("UUID"), (uint64_t)v21);

  if (v6)
  {
    if (objc_msgSend_hasSize(self, v23, v24, v25))
    {
      v29 = (void *)MEMORY[0x1E0CB37E8];
      v30 = objc_msgSend_size(self, v26, v27, v28);
      objc_msgSend_numberWithUnsignedLongLong_(v29, v31, v30, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v34, (uint64_t)CFSTR("size"), (uint64_t)v33);

    }
    if (objc_msgSend_paddedSize(self, v26, v27, v28))
    {
      v38 = (void *)MEMORY[0x1E0CB37E8];
      v39 = objc_msgSend_paddedSize(self, v35, v36, v37);
      objc_msgSend_numberWithUnsignedLongLong_(v38, v40, v39, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v43, (uint64_t)CFSTR("paddedSize"), (uint64_t)v42);

    }
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v35, self->_nextItemIndex, v37);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v45, (uint64_t)CFSTR("itemCount"), (uint64_t)v44);

    objc_msgSend_recordKey(self, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend_recordKey(self, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v54, (uint64_t)CFSTR("recordKey"), (uint64_t)v53);

    }
    if ((objc_msgSend_uploadRank(self, v50, v51, v52) & 0x8000000000000000) == 0)
    {
      v58 = (void *)MEMORY[0x1E0CB37E8];
      v59 = objc_msgSend_uploadRank(self, v55, v56, v57);
      objc_msgSend_numberWithInteger_(v58, v60, v59, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v63, (uint64_t)CFSTR("uploadRank"), (uint64_t)v62);

    }
    objc_msgSend_rootDatabasePath(self, v55, v56, v57);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend_rootDatabasePath(self, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKSanitizedPath(v68, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v73, (uint64_t)CFSTR("rootDatabasePath"), (uint64_t)v72);

    }
    objc_msgSend_assets(self, v65, v66, v67);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      if (v5)
      {
        objc_msgSend_assets(self, v23, v75, v25);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v77, (uint64_t)CFSTR("assets"), (uint64_t)v76);
      }
      else
      {
        v78 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_assets(self, v23, v75, v25);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend_count(v76, v79, v80, v81);
        objc_msgSend_numberWithUnsignedInteger_(v78, v83, v82, v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v86, (uint64_t)CFSTR("assetsCount"), (uint64_t)v85);

      }
    }
  }
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v23, 5, v25);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = self;
  objc_sync_enter(v88);
  if (objc_msgSend_isOpen(v88, v89, v90, v91))
    objc_msgSend_addObject_(v87, v92, (uint64_t)CFSTR("is-open"), v93);
  objc_sync_exit(v88);

  if (objc_msgSend_uploaded(v88, v94, v95, v96))
    objc_msgSend_addObject_(v87, v97, (uint64_t)CFSTR("uploaded"), v99);
  if (objc_msgSend_downloaded(v88, v97, v98, v99))
    objc_msgSend_addObject_(v87, v100, (uint64_t)CFSTR("downloaded"), v102);
  if (objc_msgSend_storageGroupingPolicy(v88, v100, v101, v102) == 1)
    objc_msgSend_addObject_(v87, v103, (uint64_t)CFSTR("group-by-key"), v105);
  if (objc_msgSend_count(v87, v103, v104, v105))
  {
    if (v5)
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v106, (uint64_t)CFSTR("flags"), (uint64_t)v87);
    }
    else
    {
      objc_msgSend_componentsJoinedByString_(v87, v106, (uint64_t)CFSTR("|"), v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v109, (uint64_t)CFSTR("flags"), (uint64_t)v108);

    }
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKPackage *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (BOOL)openWithError:(id *)a3
{
  CKPackage *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  id v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if ((objc_msgSend_isOpen(v4, v5, v6, v7) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend__packageDatabasePath(v4, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      sub_18A7E99A0((uint64_t)CKPackage, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setSynchronousMode_(v14, v15, 0, v16);
      objc_msgSend_setShouldVacuum_(v14, v17, 0, v18);
      v48 = 0;
      objc_msgSend_openWithError_(v14, v19, (uint64_t)&v48, v20);
      v24 = v48;
      if (!v24)
      {
        v25 = (void *)MEMORY[0x1E0CB37E8];
        v26 = objc_msgSend_packageID(v4, v21, v22, v23);
        objc_msgSend_numberWithInteger_(v25, v27, v26, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v29;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v49, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_selectCountFrom_where_bindings_(v14, v32, (uint64_t)CFSTR("Items"), (uint64_t)CFSTR("packageID = ?"), v31);

        if (v33 == -1)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v21, (uint64_t)CFSTR("CKInternalErrorDomain"), 7000, CFSTR("database error initializing package index in %@"), v4);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKClientSuitableError(v38, v39, v40, v41);
          v24 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend_close(v14, v42, v43, v44);
        }
        else
        {
          v24 = 0;
          v4->_nextItemIndex = v33;
        }
      }
      v11 = v24 == 0;
      objc_msgSend_setOpen_(v4, v21, v24 == 0, v23);
      if (v24)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v24);
      }
      else
      {
        objc_msgSend_setSqlite_(v4, v45, (uint64_t)v14, v46);
      }

    }
    else
    {
      if (a3)
      {
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v12, (uint64_t)CFSTR("CKInternalErrorDomain"), 7000, CFSTR("database path is nil for %@"), v4);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKClientSuitableError(v34, v35, v36, v37);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }

  }
  objc_sync_exit(v4);

  return v11;
}

- (void)close
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
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
  CKPackage *obj;

  obj = self;
  objc_sync_enter(obj);
  if (objc_msgSend_isOpen(obj, v2, v3, v4))
  {
    objc_msgSend_sqlite(obj, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_close(v8, v9, v10, v11);

    objc_msgSend_setSqlite_(obj, v12, 0, v13);
    objc_msgSend_setOpen_(obj, v14, 0, v15);
  }
  objc_sync_exit(obj);

}

- (void)setDownloadItemIndices:(id)a3
{
  uint64_t v3;
  NSIndexSet *v5;
  NSIndexSet *downloadItemIndices;

  v5 = (NSIndexSet *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  downloadItemIndices = self->_downloadItemIndices;
  self->_downloadItemIndices = v5;

}

- (NSIndexSet)downloadItemIndices
{
  NSIndexSet *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  v3 = self->_downloadItemIndices;
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB36B8]);
    v8 = objc_msgSend_itemCount(self, v5, v6, v7);
    v3 = (NSIndexSet *)objc_msgSend_initWithIndexesInRange_(v4, v9, 0, v8);
  }
  return v3;
}

- (unint64_t)itemCount
{
  uint64_t v2;

  return objc_msgSend_itemCountWithError_(self, a2, 0, v2);
}

- (unint64_t)itemCountWithError:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  int v11;
  CKPackage *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, (uint64_t)a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    if (objc_msgSend_openWithError_(self, v6, (uint64_t)a3, v8))
      return self->_nextItemIndex;
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_fault_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", (uint8_t *)&v11, 0xCu);
    }
  }
  return 0;
}

- (id)_itemWithColumnsByName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKPackageItem *v7;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;

  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)CFSTR("fileURL"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [CKPackageItem alloc];
  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v8, (uint64_t)v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithFileURL_(v7, v11, (uint64_t)v10, v12);

  objc_msgSend_objectForKeyedSubscript_(v3, v14, (uint64_t)CFSTR("itemID"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_integerValue(v16, v17, v18, v19);
  objc_msgSend_setItemID_(v13, v21, v20, v22);

  objc_msgSend_objectForKeyedSubscript_(v3, v23, (uint64_t)CFSTR("packageIndex"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_integerValue(v25, v26, v27, v28);
  objc_msgSend_setPackageIndex_(v13, v30, v29, v31);

  objc_msgSend_objectForKeyedSubscript_(v3, v32, (uint64_t)CFSTR("signature"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSignature_(v13, v35, (uint64_t)v34, v36);

  objc_msgSend_objectForKeyedSubscript_(v3, v37, (uint64_t)CFSTR("deviceID"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceID_(v13, v40, (uint64_t)v39, v41);

  objc_msgSend_objectForKeyedSubscript_(v3, v42, (uint64_t)CFSTR("fileID"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFileID_(v13, v45, (uint64_t)v44, v46);

  objc_msgSend_objectForKeyedSubscript_(v3, v47, (uint64_t)CFSTR("generationID"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setGenerationID_(v13, v50, (uint64_t)v49, v51);

  objc_msgSend_objectForKeyedSubscript_(v3, v52, (uint64_t)CFSTR("size"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_unsignedLongLongValue(v54, v55, v56, v57);
  objc_msgSend_setSize_(v13, v59, v58, v60);

  objc_msgSend_objectForKeyedSubscript_(v3, v61, (uint64_t)CFSTR("paddedSize"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_unsignedLongLongValue(v63, v64, v65, v66);
  objc_msgSend_setPaddedSize_(v13, v68, v67, v69);

  objc_msgSend_objectForKeyedSubscript_(v3, v70, (uint64_t)CFSTR("offset"), v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend_unsignedLongLongValue(v72, v73, v74, v75);
  objc_msgSend_setOffset_(v13, v77, v76, v78);

  objc_msgSend_objectForKeyedSubscript_(v3, v79, (uint64_t)CFSTR("sectionIndex"), v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend_intValue(v81, v82, v83, v84);
  objc_msgSend_setSectionIndex_(v13, v86, v85, v87);

  objc_msgSend_objectForKeyedSubscript_(v3, v88, (uint64_t)CFSTR("itemTypeHint"), v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setItemTypeHint_(v13, v91, (uint64_t)v90, v92);
  return v13;
}

- (id)_itemOrNilAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  _DWORD v37[2];
  __int16 v38;
  CKPackage *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (objc_msgSend_openWithError_(self, a2, 0, v3))
  {
    objc_msgSend_sqlite(self, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v15 = objc_msgSend_packageID(self, v12, v13, v14);
    objc_msgSend_numberWithInteger_(v11, v16, v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v18;
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v19, a3, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v40, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_selectAllFrom_where_bindings_(v10, v24, (uint64_t)CFSTR("Items"), (uint64_t)CFSTR("packageID = ? and packageIndex = ?"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend_count(v25, v26, v27, v28);
    if (v29)
    {
      if (v29 == 1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v25, v30, 0, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__itemWithColumnsByName_(self, v33, (uint64_t)v32, v34);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
        return v9;
      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v35 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v37[0] = 67109378;
        v37[1] = a3;
        v38 = 2112;
        v39 = self;
        _os_log_error_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_ERROR, "Duplicate items at index %d in package %@", (uint8_t *)v37, 0x12u);
      }
    }
    v9 = 0;
    goto LABEL_10;
  }
  return v9;
}

- (id)itemAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v12;
  CKPackage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    objc_msgSend__itemOrNilAtIndex_(self, v6, a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v12 = 138412290;
      v13 = self;
      _os_log_fault_impl(&dword_18A5C5000, v10, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }
  return v9;
}

- (id)itemEnumerator
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  CKSQLiteEnumerator *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v27[5];
  uint8_t buf[4];
  CKPackage *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, v2, v3) == 7 || objc_msgSend_state(self, v5, v6, v7) == 1)
  {
    v11 = 0;
    if (objc_msgSend_openWithError_(self, v5, 0, v7))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_msgSend_packageID(self, v8, v9, v10);
      objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("packageID = %ld"), v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = [CKSQLiteEnumerator alloc];
      objc_msgSend_sqlite(self, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend_initWithDatabase_columns_from_where_bindings_orderBy_(v17, v22, (uint64_t)v21, 0, CFSTR("Items"), v16, 0, &unk_1E1FC4310);

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_18A7EAE20;
      v27[3] = &unk_1E1F65A70;
      v27[4] = self;
      objc_msgSend_setObjectTranslator_(v11, v23, (uint64_t)v27, v24);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v25 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = self;
      _os_log_fault_impl(&dword_18A5C5000, v25, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    v11 = 0;
  }
  return v11;
}

- (id)itemEnumeratorForSectionAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  CKSQLiteEnumerator *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v28[5];
  uint8_t buf[4];
  CKPackage *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    v12 = 0;
    if (objc_msgSend_openWithError_(self, v6, 0, v8))
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_msgSend_packageID(self, v9, v10, v11);
      objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("packageID = %ld and sectionIndex = %ld"), v16, v14, a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [CKSQLiteEnumerator alloc];
      objc_msgSend_sqlite(self, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend_initWithDatabase_columns_from_where_bindings_orderBy_(v18, v23, (uint64_t)v22, 0, CFSTR("Items"), v17, 0, &unk_1E1FC4328);

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_18A7EB004;
      v28[3] = &unk_1E1F65A70;
      v28[4] = self;
      objc_msgSend_setObjectTranslator_(v12, v24, (uint64_t)v28, v25);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v26 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = self;
      _os_log_fault_impl(&dword_18A5C5000, v26, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    v12 = 0;
  }
  return v12;
}

- (BOOL)addItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t nextItemIndex;
  NSObject *v18;
  BOOL v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  CKPackage *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7) != 7 && objc_msgSend_state(self, v8, v9, v10) != 1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v18 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = self;
      _os_log_fault_impl(&dword_18A5C5000, v18, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (!objc_msgSend_openWithError_(self, v8, 0, v10))
  {
LABEL_10:
    v19 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend_packageIndex(v4, v11, v12, v13) == -1)
    nextItemIndex = self->_nextItemIndex;
  else
    nextItemIndex = objc_msgSend_packageIndex(v4, v14, v15, v16);
  objc_msgSend_sqlite(self, v14, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_18A7EB1E8;
  v25[3] = &unk_1E1F65AC0;
  v25[4] = self;
  v27 = nextItemIndex;
  v26 = v4;
  objc_msgSend_performDatabaseOperation_(v20, v21, (uint64_t)v25, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23 == 0;

  if (!v23)
    ++self->_nextItemIndex;

LABEL_15:
  return v19;
}

- (BOOL)updateItemAtIndex:(int64_t)a3 withSignature:(id)a4 size:(unint64_t)a5 paddedSize:(unint64_t)a6 itemID:(unint64_t)a7 sectionIndex:(unint64_t)a8
{
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  CKPackage *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  uint8_t buf[4];
  CKPackage *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  if (objc_msgSend_state(self, v15, v16, v17) != 7 && objc_msgSend_state(self, v18, v19, v20) != 1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v40 = self;
      _os_log_fault_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!objc_msgSend_openWithError_(self, v18, 0, v20))
  {
LABEL_9:
    v28 = 0;
    goto LABEL_10;
  }
  objc_msgSend_sqlite(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_18A7EB69C;
  v31[3] = &unk_1E1F65B10;
  v34 = a5;
  v35 = a6;
  v36 = a7;
  v37 = a8;
  v32 = v14;
  v33 = self;
  v38 = a3;
  objc_msgSend_performDatabaseOperation_(v24, v25, (uint64_t)v31, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

LABEL_10:
  return v28;
}

- (BOOL)updateItemAtIndex:(int64_t)a3 withFileURL:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  CKPackage *v25;
  int64_t v26;
  uint8_t buf[4];
  CKPackage *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend_state(self, v7, v8, v9) != 7 && objc_msgSend_state(self, v10, v11, v12) != 1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v21 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_fault_impl(&dword_18A5C5000, v21, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!objc_msgSend_openWithError_(self, v10, 0, v12))
  {
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend_sqlite(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_18A7EB978;
  v23[3] = &unk_1E1F65AC0;
  v24 = v6;
  v25 = self;
  v26 = a3;
  objc_msgSend_performDatabaseOperation_(v16, v17, (uint64_t)v23, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

LABEL_10:
  return v20;
}

- (BOOL)updateItemsAtIndexes:(id)a3 fileURLs:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v32;
  const char *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  CKPackage *v37;
  uint8_t buf[4];
  CKPackage *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend_state(self, v9, v10, v11) != 7 && objc_msgSend_state(self, v12, v13, v14) != 1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v30 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_fault_impl(&dword_18A5C5000, v30, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v15 = objc_msgSend_count(v7, v12, v13, v14);
  if (v15 != objc_msgSend_count(v8, v16, v17, v18))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20, v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 1122, CFSTR("Expected same count for %@ and %@"), v7, v8);

  }
  if (!objc_msgSend_openWithError_(self, v19, 0, v21))
  {
LABEL_11:
    v29 = 0;
    goto LABEL_12;
  }
  objc_msgSend_sqlite(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_18A7EBCA4;
  v34[3] = &unk_1E1F62BC0;
  v35 = v7;
  v36 = v8;
  v37 = self;
  objc_msgSend_performDatabaseOperation_(v25, v26, (uint64_t)v34, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

LABEL_12:
  return v29;
}

- (unint64_t)sectionCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  unint64_t v23;
  NSObject *v24;
  void *v26;
  uint8_t buf[4];
  CKPackage *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, v2, v3) == 7 || objc_msgSend_state(self, v5, v6, v7) == 1)
  {
    if (objc_msgSend_openWithError_(self, v5, 0, v7))
    {
      objc_msgSend_sqlite(self, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v16 = objc_msgSend_packageID(self, v13, v14, v15);
      objc_msgSend_numberWithInteger_(v12, v17, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v19;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)&v26, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_selectCountFrom_where_bindings_(v11, v22, (uint64_t)CFSTR("Sections"), (uint64_t)CFSTR("packageID = ?"), v21);

    }
    else
    {
      return -1;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v24 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_fault_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    return 0;
  }
  return v23;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  CKPackageSection *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  NSObject *v57;
  void *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  __int16 v66;
  unint64_t v67;
  _QWORD v68[3];

  v68[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, a3, v3) == 7 || objc_msgSend_state(self, v6, v7, v8) == 1)
  {
    v12 = 0;
    if (objc_msgSend_openWithError_(self, v6, 0, v8))
    {
      objc_msgSend_sqlite(self, v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v18 = objc_msgSend_packageID(self, v15, v16, v17);
      objc_msgSend_numberWithInteger_(v14, v19, v18, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v21;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v22, a3, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v24;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v68, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_select_from_where_bindings_(v13, v27, (uint64_t)&unk_1E1FC4340, (uint64_t)CFSTR("Sections"), CFSTR("packageID = ? and packageIndex = ?"), v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_count(v28, v29, v30, v31) == 1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v28, v32, 0, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = [CKPackageSection alloc];
        objc_msgSend_objectForKeyedSubscript_(v34, v36, (uint64_t)CFSTR("signature"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v34, v39, (uint64_t)CFSTR("size"), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend_longLongValue(v41, v42, v43, v44);
        objc_msgSend_objectForKeyedSubscript_(v34, v46, (uint64_t)CFSTR("paddedSize"), v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_longLongValue(v48, v49, v50, v51);
        objc_msgSend_objectForKeyedSubscript_(v34, v53, (uint64_t)CFSTR("verificationKey"), v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend_initWithIndex_signature_size_paddedSize_verificationKey_(v35, v56, a3, (uint64_t)v38, v45, v52, v55);

      }
      else
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v59 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
        {
          v60 = v59;
          v64 = 134218240;
          v65 = objc_msgSend_count(v28, v61, v62, v63);
          v66 = 2048;
          v67 = a3;
          _os_log_fault_impl(&dword_18A5C5000, v60, OS_LOG_TYPE_FAULT, "Unexpected number of sections (%lu) with index %lu", (uint8_t *)&v64, 0x16u);

        }
        v12 = 0;
      }

    }
    return v12;
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v57 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v64 = 138412290;
      v65 = (uint64_t)self;
      _os_log_fault_impl(&dword_18A5C5000, v57, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", (uint8_t *)&v64, 0xCu);
    }
    return 0;
  }
}

- (BOOL)addSection:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKPackage *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  BOOL v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  CKPackage *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  _QWORD v78[4];
  CKPackage *v79;
  uint8_t buf[4];
  CKPackage *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7) != 7 && objc_msgSend_state(self, v8, v9, v10) != 1)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v37 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = self;
      _os_log_fault_impl(&dword_18A5C5000, v37, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (!objc_msgSend_openWithError_(self, v8, 0, v10))
  {
LABEL_10:
    v38 = 0;
    goto LABEL_20;
  }
  v11 = (CKPackage *)objc_opt_new();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_packageID(self, v13, v14, v15);
  objc_msgSend_numberWithInteger_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v20, (uint64_t)v19, (uint64_t)CFSTR("packageID"));

  v21 = (void *)MEMORY[0x1E0CB37E8];
  v25 = objc_msgSend_index(v4, v22, v23, v24);
  objc_msgSend_numberWithInteger_(v21, v26, v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v29, (uint64_t)v28, (uint64_t)CFSTR("packageIndex"));

  objc_msgSend_signature(v4, v30, v31, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v11, v33, (uint64_t)v36, (uint64_t)CFSTR("signature"));
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v33, v34, v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v11, v40, (uint64_t)v39, (uint64_t)CFSTR("signature"));

  }
  objc_msgSend_verificationKey(v4, v41, v42, v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v11, v44, (uint64_t)v47, (uint64_t)CFSTR("verificationKey"));
  }
  else
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v44, v45, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v11, v49, (uint64_t)v48, (uint64_t)CFSTR("verificationKey"));

  }
  v50 = (void *)MEMORY[0x1E0CB37E8];
  v54 = objc_msgSend_size(v4, v51, v52, v53);
  objc_msgSend_numberWithUnsignedLongLong_(v50, v55, v54, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v58, (uint64_t)v57, (uint64_t)CFSTR("size"));

  v59 = (void *)MEMORY[0x1E0CB37E8];
  v63 = objc_msgSend_paddedSize(v4, v60, v61, v62);
  objc_msgSend_numberWithUnsignedLongLong_(v59, v64, v63, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v67, (uint64_t)v66, (uint64_t)CFSTR("paddedSize"));

  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v68 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v11;
    _os_log_debug_impl(&dword_18A5C5000, v68, OS_LOG_TYPE_DEBUG, "Adding package section %@", buf, 0xCu);
  }
  objc_msgSend_sqlite(self, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = sub_18A7EC790;
  v78[3] = &unk_1E1F629E8;
  v79 = v11;
  v73 = v11;
  objc_msgSend_performDatabaseOperation_(v72, v74, (uint64_t)v78, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v76 == 0;

LABEL_20:
  return v38;
}

- (id)testAddSectionConstraintViolation:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  CKPackage *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  CKPackage *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v73;
  const char *v74;
  _QWORD v75[4];
  CKPackage *v76;
  id v77;
  uint8_t buf[4];
  CKPackage *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!__sTestOverridesAvailable)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v73, v74, (uint64_t)a2, (uint64_t)self, CFSTR("CKPackage.m"), 1187, CFSTR("Only suitable for testing"));

  }
  if (objc_msgSend_state(self, v5, v6, v7) == 7 || objc_msgSend_state(self, v9, v10, v11) == 1)
  {
    v77 = 0;
    v12 = objc_msgSend_openWithError_(self, v9, (uint64_t)&v77, v11);
    v13 = v77;
    if (v12)
    {
      v14 = (CKPackage *)objc_opt_new();
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)&unk_1E1FC4C40, (uint64_t)CFSTR("packageID"));
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v20 = objc_msgSend_index(v8, v17, v18, v19);
      objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v14, v24, (uint64_t)v23, (uint64_t)CFSTR("packageIndex"));

      objc_msgSend_signature(v8, v25, v26, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v14, v28, (uint64_t)v31, (uint64_t)CFSTR("signature"));
      }
      else
      {
        objc_msgSend_null(MEMORY[0x1E0C99E38], v28, v29, v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v14, v35, (uint64_t)v34, (uint64_t)CFSTR("signature"));

      }
      objc_msgSend_verificationKey(v8, v36, v37, v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v14, v39, (uint64_t)v42, (uint64_t)CFSTR("verificationKey"));
      }
      else
      {
        objc_msgSend_null(MEMORY[0x1E0C99E38], v39, v40, v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v14, v44, (uint64_t)v43, (uint64_t)CFSTR("verificationKey"));

      }
      v45 = (void *)MEMORY[0x1E0CB37E8];
      v49 = objc_msgSend_size(v8, v46, v47, v48);
      objc_msgSend_numberWithUnsignedLongLong_(v45, v50, v49, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v14, v53, (uint64_t)v52, (uint64_t)CFSTR("size"));

      v54 = (void *)MEMORY[0x1E0CB37E8];
      v58 = objc_msgSend_paddedSize(v8, v55, v56, v57);
      objc_msgSend_numberWithUnsignedLongLong_(v54, v59, v58, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v14, v62, (uint64_t)v61, (uint64_t)CFSTR("paddedSize"));

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v63 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v79 = v14;
        _os_log_debug_impl(&dword_18A5C5000, v63, OS_LOG_TYPE_DEBUG, "Adding package section %@", buf, 0xCu);
      }
      objc_msgSend_sqlite(self, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = sub_18A7ECBE0;
      v75[3] = &unk_1E1F629E8;
      v76 = v14;
      v68 = v14;
      objc_msgSend_performDatabaseOperation_(v67, v69, (uint64_t)v75, v70);
      v71 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v71;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v32 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v79 = self;
      _os_log_fault_impl(&dword_18A5C5000, v32, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v33, (uint64_t)CFSTR("CKErrorDomain"), 1000, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)performTransactionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  v19 = 0;
  v7 = objc_msgSend_openWithError_(self, v5, (uint64_t)&v19, v6);
  v11 = v19;
  if (v7)
  {
    objc_msgSend_sqlite(self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18A7ECCC0;
    v17[3] = &unk_1E1F65B60;
    v17[4] = self;
    v18 = v4;
    objc_msgSend_performDatabaseOperation_(v12, v13, (uint64_t)v17, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v15;
  }

  return v11;
}

- (void)_setPackagesDBForKey:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  CKPackage *v25;
  uint8_t buf[4];
  CKPackage *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend_state(self, v8, v9, v10) == 7 || objc_msgSend_state(self, v11, v12, v13) == 1)
    && objc_msgSend_openWithError_(self, v11, 0, v13))
  {
    objc_msgSend_sqlite(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_18A7ECEDC;
    v22[3] = &unk_1E1F62BC0;
    v23 = v6;
    v24 = v7;
    v25 = self;
    objc_msgSend_performDatabaseOperation_(v17, v18, (uint64_t)v22, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v21 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v27 = self;
        v28 = 2112;
        v29 = v20;
        _os_log_error_impl(&dword_18A5C5000, v21, OS_LOG_TYPE_ERROR, "Failed to set package signature for %@, error = %@", buf, 0x16u);
      }
    }

  }
}

- (id)_getFromPackagesDBValueForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  void *v40;
  id v41;
  uint8_t buf[4];
  CKPackage *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_state(self, v5, v6, v7) == 7 || objc_msgSend_state(self, v8, v9, v10) == 1)
  {
    v14 = 0;
    if (objc_msgSend_openWithError_(self, v8, 0, v10))
    {
      objc_msgSend_sqlite(self, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v4;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)&v41, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB37E8];
      v22 = objc_msgSend_packageID(self, v19, v20, v21);
      objc_msgSend_numberWithInteger_(v18, v23, v22, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v25;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)&v40, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_select_from_where_bindings_(v15, v28, (uint64_t)v17, (uint64_t)CFSTR("Packages"), CFSTR("packageID = ?"), v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_count(v29, v30, v31, v32) == 1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v29, v33, 0, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)v4, v37);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v38 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = self;
      _os_log_fault_impl(&dword_18A5C5000, v38, OS_LOG_TYPE_FAULT, "%@ in bad state. Package needs to be claimed", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (NSData)signature
{
  return (NSData *)((uint64_t (*)(CKPackage *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel__getFromPackagesDBValueForKey_, CFSTR("signature"));
}

- (void)setSignature:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__setPackagesDBForKey_data_, CFSTR("signature"), a3);
}

- (NSData)verificationKey
{
  return (NSData *)((uint64_t (*)(CKPackage *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel__getFromPackagesDBValueForKey_, CFSTR("verificationKey"));
}

- (void)setVerificationKey:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel__setPackagesDBForKey_data_, CFSTR("verificationKey"), a3);
}

- (BOOL)claimOwnershipWithError:(id *)a3
{
  return objc_msgSend_handleChangeStateAction_error_(self, a2, 2, (uint64_t)a3);
}

- (NSString)databaseBasePath
{
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  NSString *v6;

  objc_msgSend_rootDatabasePath(self, a2, v2, v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("/unreachable/package/");
  v6 = v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)gcPackagesInDirectory:(id)a3 dbInUseBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(_QWORD, void *, uint64_t);
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int isDirectory;
  const char *v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t i;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  char ResourceValue_forKey_error;
  const char *v62;
  char v63;
  __CFString *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  const char *v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  os_log_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  os_log_t log;
  NSObject *loga;
  void *v107;
  void *v108;
  id v109;
  uint64_t (**v110)(_QWORD, void *, uint64_t);
  __CFString *v111;
  uint64_t v112;
  __CFString *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  char v122;
  _BYTE v123[128];
  _QWORD v124[2];
  uint8_t buf[4];
  id v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  double v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(_QWORD, void *, uint64_t))a4;
  v7 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = 0;
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v11, v12, (uint64_t)v5, (uint64_t)&v122);
  if (isDirectory)
    v15 = v122 == 0;
  else
    v15 = 1;
  if (v15)
  {
    v16 = isDirectory;
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v18 = CFSTR("false");
      if (v16)
        v19 = CFSTR("true");
      else
        v19 = CFSTR("false");
      *(_DWORD *)buf = 138412802;
      v126 = v5;
      v127 = 2114;
      if (v122)
        v18 = CFSTR("true");
      v128 = v19;
      v129 = 2114;
      v130 = *(double *)&v18;
      _os_log_error_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_ERROR, "Package GC called on non-existant path or non-directory. Path: %@, exists: %{public}@, isDirectory: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E0C99E98], v14, (uint64_t)v5, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0C998D8];
    v22 = *MEMORY[0x1E0C998D0];
    v124[0] = *MEMORY[0x1E0C998D8];
    v124[1] = v22;
    v112 = v22;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v124, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v11;
    objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v11, v25, (uint64_t)v20, (uint64_t)v24, 4, &unk_1E1F65B80);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedOptions(CKBehaviorOptions, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = sub_18A766384((uint64_t)v30);

    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v32, v33, v34, -v31);
    v111 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v108 = v7;
    v110 = v6;
    v35 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v126 = v5;
      v127 = 2114;
      v128 = v111;
      v129 = 2048;
      v130 = v31;
      _os_log_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_INFO, "GCing packages in directory: %{public}@, with grace date of: %{public}@ (gracePeriod=%fs)", buf, 0x20u);
    }
    v109 = v5;
    objc_msgSend_nextObject(v26, v36, v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v40 = (void *)v39;
      while (1)
      {
        v41 = (void *)MEMORY[0x18D76DE4C]();
        objc_msgSend_lastPathComponent(v40, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        CKSQLiteJournalSuffixes();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v118, (uint64_t)v123, 16);
        if (!v48)
          break;
        v51 = v48;
        v52 = 0;
        v53 = *(_QWORD *)v119;
        do
        {
          for (i = 0; i != v51; ++i)
          {
            if (*(_QWORD *)v119 != v53)
              objc_enumerationMutation(v46);
            v52 |= objc_msgSend_hasSuffix_(v45, v49, *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i), v50);
          }
          v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v118, (uint64_t)v123, 16);
        }
        while (v51);

        if ((v52 & 1) == 0)
          goto LABEL_31;
        v58 = 0;
        v59 = 0;
        v60 = 0;
LABEL_48:
        objc_msgSend_nextObject(v26, v55, v56, v57);
        v74 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v41);
        v40 = (void *)v74;
        if (!v74)
          goto LABEL_76;
      }

LABEL_31:
      v116 = 0;
      v117 = 0;
      ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v40, v55, (uint64_t)&v117, v21, &v116);
      v60 = (__CFString *)v117;
      v58 = (__CFString *)v116;
      if ((ResourceValue_forKey_error & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v72 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v126 = v40;
          v127 = 2112;
          v128 = v58;
          _os_log_error_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_ERROR, "Failed to get modification date for package URL: %{public}@, error: %@. Ignoring.", buf, 0x16u);
        }
        v59 = 0;
        goto LABEL_48;
      }
      v114 = 0;
      v115 = 0;
      v63 = objc_msgSend_getResourceValue_forKey_error_(v40, v62, (uint64_t)&v115, v112, &v114);
      v59 = (__CFString *)v115;
      v64 = (__CFString *)v114;

      if ((v63 & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v73 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v126 = v40;
          v127 = 2112;
          v128 = v64;
          _os_log_error_impl(&dword_18A5C5000, v73, OS_LOG_TYPE_ERROR, "Failed to get access date for package URL: %{public}@, error: %@. Ignoring.", buf, 0x16u);
        }
        goto LABEL_47;
      }
      if (objc_msgSend_compare_(v60, v65, (uint64_t)v111, v66) == 1)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v69 = ck_log_facility_ck;
        if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          goto LABEL_47;
        *(_DWORD *)buf = 138412546;
        v126 = v40;
        v127 = 2114;
        v128 = v60;
        v70 = v69;
        v71 = "Not GCing package: %@ as modification date: %{public}@ newer than grace date";
      }
      else
      {
        if (objc_msgSend_compare_(v59, v67, (uint64_t)v111, v68) != 1)
        {
          objc_msgSend_path(v40, v75, v76, v77);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18A7E99A0((uint64_t)CKPackage, v79);
          v80 = objc_claimAutoreleasedReturnValue();

          v113 = v64;
          log = (os_log_t)v80;
          LOBYTE(v80) = objc_msgSend_openWithError_((void *)v80, v81, (uint64_t)&v113, v82);
          v58 = v113;

          if ((v80 & 1) != 0)
          {
            if (v110)
            {
              objc_msgSend_select_from_(log, v83, (uint64_t)&unk_1E1FC4358, (uint64_t)CFSTR("Packages"));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_CKMap_(v103, v84, (uint64_t)&unk_1E1F65BC0, v85);
              v86 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_path(v40, v87, v88, v89);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = (void *)v86;
              LODWORD(v86) = v110[2](v110, v90, v86);

              if ((_DWORD)v86)
              {
                if (ck_log_initialization_predicate != -1)
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                v91 = log;
                loga = ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v126 = v40;
                  _os_log_debug_impl(&dword_18A5C5000, loga, OS_LOG_TYPE_DEBUG, "Not removing package: %{public}@, as it was deemed in-use", buf, 0xCu);
                }
                objc_msgSend_close(v91, v92, v93, v94);

                goto LABEL_75;
              }

            }
            v91 = log;
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v99 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v126 = v40;
              _os_log_debug_impl(&dword_18A5C5000, v99, OS_LOG_TYPE_DEBUG, "GCing package: %{public}@", buf, 0xCu);
            }
            objc_msgSend_close(log, v100, v101, v102);
          }
          else
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            v91 = log;
            v95 = ck_log_facility_ck;
            if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v126 = v40;
              v127 = 2114;
              v128 = v58;
              _os_log_debug_impl(&dword_18A5C5000, v95, OS_LOG_TYPE_DEBUG, "Failed to open package: %@, due to: %{public}@, removing it", buf, 0x16u);
            }
          }
          objc_msgSend_remove(v91, v96, v97, v98);
LABEL_75:

          goto LABEL_48;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v78 = ck_log_facility_ck;
        if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
          goto LABEL_47;
        *(_DWORD *)buf = 138412546;
        v126 = v40;
        v127 = 2114;
        v128 = v59;
        v70 = v78;
        v71 = "Not GCing package: %@ as access date: %{public}@ newer than grace date";
      }
      _os_log_debug_impl(&dword_18A5C5000, v70, OS_LOG_TYPE_DEBUG, v71, buf, 0x16u);
LABEL_47:
      v58 = v64;
      goto LABEL_48;
    }
LABEL_76:

    v5 = v109;
    v6 = v110;
    v11 = v107;
    v7 = v108;
  }

  objc_autoreleasePoolPop(v7);
}

- (double)earliestUploadReceiptExpiration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend_assets(self, a2, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v17;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend_uploadReceiptExpiration(*(void **)(*((_QWORD *)&v16 + 1) + 8 * i), v7, v8, v9);
        if (v14 != 0.0 && (v12 == 0.0 || v12 > v14))
          v12 = v14;
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (_OpaquePCSShareProtection)recordPCS
{
  return self->_recordPCS;
}

- (NSData)boundaryKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBoundaryKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)rootDatabasePath
{
  return self->_rootDatabasePath;
}

- (void)setRootDatabasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSData)archiverInfo
{
  return self->_archiverInfo;
}

- (void)setArchiverInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CKSQLite)sqlite
{
  return self->_sqlite;
}

- (void)setSqlite:(id)a3
{
  objc_storeStrong((id *)&self->_sqlite, a3);
}

- (unint64_t)nextItemIndex
{
  return self->_nextItemIndex;
}

- (void)setNextItemIndex:(unint64_t)a3
{
  self->_nextItemIndex = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)paddedSize
{
  return self->_paddedSize;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (void)setWasCached:(BOOL)a3
{
  self->_wasCached = a3;
}

- (BOOL)uploaded
{
  return self->_uploaded;
}

- (void)setUploaded:(BOOL)a3
{
  self->_uploaded = a3;
}

- (BOOL)downloaded
{
  return self->_downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (BOOL)hasSize
{
  return self->_hasSize;
}

- (void)setHasSize:(BOOL)a3
{
  self->_hasSize = a3;
}

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (void)setShouldReadRawEncryptedData:(BOOL)a3
{
  self->_shouldReadRawEncryptedData = a3;
}

- (int64_t)storageGroupingPolicy
{
  return self->_storageGroupingPolicy;
}

- (void)setStorageGroupingPolicy:(int64_t)a3
{
  self->_storageGroupingPolicy = a3;
}

- (int64_t)uploadRank
{
  return self->_uploadRank;
}

- (void)setUploadRank:(int64_t)a3
{
  self->_uploadRank = a3;
}

- (int64_t)packageID
{
  return self->_packageID;
}

- (void)setPackageID:(int64_t)a3
{
  self->_packageID = a3;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (CKRecord)record
{
  return (CKRecord *)objc_loadWeakRetained((id *)&self->_record);
}

- (void)setRecord:(id)a3
{
  objc_storeWeak((id *)&self->_record, a3);
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (void)setRecordKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (CKDMMCSItem)manifestItem
{
  return self->_manifestItem;
}

- (void)setManifestItem:(id)a3
{
  objc_storeStrong((id *)&self->_manifestItem, a3);
}

- (CKPackageReference)packageReference
{
  return self->_packageReference;
}

- (void)setPackageReference:(id)a3
{
  objc_storeStrong((id *)&self->_packageReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageReference, 0);
  objc_storeStrong((id *)&self->_manifestItem, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_destroyWeak((id *)&self->_record);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_sqlite, 0);
  objc_storeStrong((id *)&self->_archiverInfo, 0);
  objc_storeStrong((id *)&self->_rootDatabasePath, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_assetTransferOptions, 0);
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_downloadItemIndices, 0);
}

@end
