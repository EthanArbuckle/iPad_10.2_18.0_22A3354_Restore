@implementation CSUSearchableKnowledgeObjectStore

- (id)initDB:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CSUSearchableKnowledgeObjectStore *v13;
  void *v14;
  const char *v15;
  CSUSearchableKnowledgeObjectStore *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSUSearchableKnowledgeObjectStore;
  v13 = -[CSUSearchableKnowledgeObjectStore init](&v18, sel_init);
  if (v13)
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v10, (uint64_t)v9, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_initDB_atURL_error_(v13, v15, (uint64_t)v8, (uint64_t)v14, (uint64_t)a5))
      v16 = v13;
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)initExistingDB:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CSUSearchableKnowledgeObjectStore *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  CSUSearchableKnowledgeObjectStore *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  objc_super v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v10 = a4;
  if (v10)
  {
    v34.receiver = self;
    v34.super_class = (Class)CSUSearchableKnowledgeObjectStore;
    v15 = -[CSUSearchableKnowledgeObjectStore init](&v34, sel_init);
    if (v15)
    {
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v11, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_fileExistsAtPath_(v16, v17, (uint64_t)v10, v18, v19) & 1) != 0)
      {
        objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v20, (uint64_t)v10, v21, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          if (objc_msgSend_initDB_atURL_error_(v15, v23, (uint64_t)v8, (uint64_t)v24, (uint64_t)a5))
          {
            v25 = v15;
            goto LABEL_17;
          }
        }
        else if (a5)
        {
          v30 = (void *)MEMORY[0x24BDD1540];
          v35 = *MEMORY[0x24BDD0FC8];
          v36 = CFSTR("Invalid path. Failed to create fileUrl from path.");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)&v36, (uint64_t)&v35, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 15, (uint64_t)v31);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v25 = 0;
        goto LABEL_17;
      }
      if (!a5)
      {
        v25 = 0;
LABEL_18:
        self = v15;
        goto LABEL_19;
      }
      v28 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v38 = CFSTR("File does not exist.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v20, (uint64_t)&v38, (uint64_t)&v37, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v29, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 15, (uint64_t)v24);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    self = 0;
  }
  else if (a5)
  {
    v26 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    v40[0] = CFSTR("File path is empty.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v40, (uint64_t)&v39, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v26, v27, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 15, (uint64_t)v16);
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    goto LABEL_20;
  }
  v25 = 0;
LABEL_20:

  return v25;
}

- (id)initExistingDB:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  void *inited;

  objc_msgSend_stringByAppendingPathComponent_(a3, a2, (uint64_t)CFSTR("CSUTaxonomy.sqlite"), (uint64_t)a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (void *)objc_msgSend_initExistingDB_atPath_error_(self, v8, (uint64_t)CFSTR("CSUTaxonomy"), (uint64_t)v7, (uint64_t)a4);

  return inited;
}

- (id)initDB:(id)a3 error:(id *)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  void *inited;

  objc_msgSend_stringByAppendingPathComponent_(a3, a2, (uint64_t)CFSTR("CSUTaxonomy.sqlite"), (uint64_t)a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (void *)objc_msgSend_initDB_atPath_error_(self, v8, (uint64_t)CFSTR("CSUTaxonomy"), (uint64_t)v7, (uint64_t)a4);

  return inited;
}

- (id)getStore:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  uint64_t v24;
  id v25;

  objc_msgSend_persistentContainer(self, a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_persistentStoreCoordinator(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_persistentStores(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v25 = v21;
  }
  else if (a3)
  {
    objc_msgSend_errorForDatabase_(CSUError, v22, (uint64_t)CFSTR("Failed to load persistent store"), v23, v24);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (BOOL)fetchMetadataToMemory:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_getStore_(self, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
  {
    objc_msgSend_metadata(v5, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_mutableCopy(v11, v12, v13, v14, v15);
    v17 = (void *)qword_2542CF808;
    qword_2542CF808 = v16;

    if (!qword_2542CF808)
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v18, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)qword_2542CF808;
      qword_2542CF808 = v22;

    }
  }

  return v10 != 0;
}

- (BOOL)saveMetadataToStore:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend_getStore_(self, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
    objc_msgSend_setMetadata_(v5, v6, qword_2542CF808, v7, v8);

  return v9 != 0;
}

- (BOOL)initDB:(id)a3 atURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  dispatch_semaphore_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int v60;
  BOOL v61;
  void *v63;
  _QWORD v64[4];
  NSObject *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = objc_opt_class();
  objc_msgSend_bundleForClass_(v10, v12, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLForResource_withExtension_(v15, v16, (uint64_t)CFSTR("CSUSearchableObjectKnowledgeStorage"), (uint64_t)CFSTR("momd"), v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x24BDBB6B0]);
    v29 = (void *)objc_msgSend_initWithContentsOfURL_(v22, v23, (uint64_t)v21, v24, v25);
    if (v29)
    {
      objc_msgSend_persistentContainerWithName_managedObjectModel_(MEMORY[0x24BDBB700], v26, (uint64_t)v8, (uint64_t)v29, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPersistentContainer_(self, v31, (uint64_t)v30, v32, v33);

      v34 = objc_alloc(MEMORY[0x24BDBB740]);
      v63 = (void *)objc_msgSend_initWithURL_(v34, v35, (uint64_t)v9, v36, v37);
      v73[0] = v63;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v38, (uint64_t)v73, 1, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_persistentContainer(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPersistentStoreDescriptions_(v45, v46, (uint64_t)v40, v47, v48);

      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = sub_23A00BED4;
      v71 = sub_23A00BEE4;
      v72 = 0;
      v49 = dispatch_semaphore_create(0);
      objc_msgSend_persistentContainer(self, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = sub_23A00BEEC;
      v64[3] = &unk_250B0E308;
      v66 = &v67;
      v55 = v49;
      v65 = v55;
      objc_msgSend_loadPersistentStoresWithCompletionHandler_(v54, v56, (uint64_t)v64, v57, v58);

      dispatch_semaphore_wait(v55, 0xFFFFFFFFFFFFFFFFLL);
      v59 = (void *)v68[5];
      if (v59)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v59);
        v60 = 1;
      }
      else
      {
        v60 = 0;
      }

      _Block_object_dispose(&v67, 8);
    }
    else
    {
      if (a5)
      {
        objc_msgSend_errorForDatabase_(CSUError, v26, (uint64_t)CFSTR("Failed to load model from url"), v27, v28);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v60 = 1;
    }

    v61 = v60 == 0;
  }
  else if (a5)
  {
    objc_msgSend_errorForDatabase_(CSUError, v18, (uint64_t)CFSTR("Error getting modelURL"), v19, v20);
    v61 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = 0;
  }

  return v61;
}

- (id)getDbObjectByIdentifier:(unint64_t)a3 idType:(signed __int16)a4 context:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t UniqueDbId_idType;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v7 = a4;
  v9 = a5;
  UniqueDbId_idType = objc_msgSend_getUniqueDbId_idType_(CSUSearchableKnowledgeDBObject, v10, a3, v7, v11);
  objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v13, (uint64_t)CFSTR("CSUSearchableKnowledgeDBObject"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v17, (uint64_t)CFSTR("dbUniqueId == %lld"), v18, v19, UniqueDbId_idType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPredicate_(v16, v21, (uint64_t)v20, v22, v23);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_23A00BED4;
  v55 = sub_23A00BEE4;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_23A00BED4;
  v49 = sub_23A00BEE4;
  v50 = 0;
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = sub_23A00C1BC;
  v40[3] = &unk_250B0E330;
  v43 = &v45;
  v24 = v9;
  v41 = v24;
  v25 = v16;
  v42 = v25;
  v44 = &v51;
  objc_msgSend_performBlockAndWait_(v24, v26, (uint64_t)v40, v27, v28);
  v33 = (void *)v46[5];
  if (!v33)
  {
    if (a6)
    {
      v38 = 0;
      *a6 = objc_retainAutorelease((id)v52[5]);
      goto LABEL_7;
    }
LABEL_6:
    v38 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend_count(v33, v29, v30, v31, v32))
    goto LABEL_6;
  objc_msgSend_firstObject((void *)v46[5], v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v38;
}

- (BOOL)saveDatabase:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_23A00BED4;
  v28 = sub_23A00BEE4;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (byte_256942578)
    objc_msgSend_saveMetadataToStore_(self, v6, (uint64_t)a4, v7, v8);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_23A00C3B0;
  v16[3] = &unk_250B0E358;
  v10 = v9;
  v17 = v10;
  v18 = &v20;
  v19 = &v24;
  objc_msgSend_performBlockAndWait_(v10, v11, (uint64_t)v16, v12, v13);
  v14 = *((unsigned __int8 *)v21 + 24);
  if (*((_BYTE *)v21 + 24))
  {
    byte_256942578 = 0;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v25[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v14 != 0;
}

- (id)fetchEntitiesWithPredicate:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v48;
  id v49;
  void *v50;
  id obj;
  _QWORD v53[7];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v5, (uint64_t)CFSTR("CSUSearchableKnowledgeDBObject"), v6, v7);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPredicate_(v50, v8, (uint64_t)v49, v9, v10);
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = sub_23A00BED4;
  v85 = sub_23A00BEE4;
  v86 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = sub_23A00BED4;
  v79 = sub_23A00BEE4;
  v80 = 0;
  objc_msgSend_persistentContainer(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_newBackgroundContext(v15, v16, v17, v18, v19);

  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = sub_23A00C8A0;
  v70[3] = &unk_250B0E330;
  v73 = &v75;
  v21 = v20;
  v71 = v21;
  v22 = v50;
  v72 = v22;
  v74 = &v81;
  objc_msgSend_performBlockAndWait_(v21, v23, (uint64_t)v70, v24, v25);
  v48 = v22;
  if (v76[5])
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v26, v27, v28, v29, v22);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = (id)v76[5];
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v66, (uint64_t)v87, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v67;
LABEL_4:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v67 != v36)
          objc_enumerationMutation(obj);
        v38 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v37);
        v60 = 0;
        v61 = &v60;
        v62 = 0x3032000000;
        v63 = sub_23A00BED4;
        v64 = sub_23A00BEE4;
        v65 = 0;
        v54 = 0;
        v55 = &v54;
        v56 = 0x3032000000;
        v57 = sub_23A00BED4;
        v58 = sub_23A00BEE4;
        v59 = 0;
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = sub_23A00C914;
        v53[3] = &unk_250B0E358;
        v53[4] = v38;
        v53[5] = &v60;
        v53[6] = &v54;
        objc_msgSend_performBlockAndWait_(v21, v32, (uint64_t)v53, v33, v34);
        v42 = v61[5];
        if (v42)
        {
          objc_msgSend_addObject_(v30, v39, v61[5], v40, v41);
        }
        else
        {
          if (a4)
            *a4 = objc_retainAutorelease((id)v55[5]);

          v30 = 0;
        }
        _Block_object_dispose(&v54, 8);

        _Block_object_dispose(&v60, 8);
        if (!v42)
          break;
        if (v35 == ++v37)
        {
          v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v66, (uint64_t)v87, 16);
          if (v35)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v43, (uint64_t)v30, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v46 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v82[5]);
  }

  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v81, 8);

  return v46;
}

- (BOOL)storeEntity:(id)a3 uniqueIdWriteback:(unint64_t *)a4 error:(id *)a5
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;

  v8 = a3;
  objc_msgSend_persistentContainer(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_newBackgroundContext(v13, v14, v15, v16, v17);

  v23 = objc_msgSend_qid(v8, v19, v20, v21, v22);
  v28 = objc_msgSend_idType(v8, v24, v25, v26, v27);
  objc_msgSend_getDbObjectByIdentifier_idType_context_error_(self, v29, v23, v28, (uint64_t)v18, a5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v30;
  if (v30)
  {
    objc_msgSend_copyFromEntity_(v30, v31, (uint64_t)v8, v32, v33);
  }
  else
  {
    objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x24BDBB658], v31, (uint64_t)CFSTR("CSUSearchableKnowledgeDBObject"), (uint64_t)v18, v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_copyFromEntity_(v37, v38, (uint64_t)v8, v39, v40);

  }
  v45 = objc_msgSend_saveDatabase_error_(self, v35, (uint64_t)v18, (uint64_t)a5, v36);
  v46 = v45 ^ 1;
  if (!a4)
    v46 = 1;
  if ((v46 & 1) == 0)
  {
    v47 = objc_msgSend_qid(v8, v41, v42, v43, v44);
    v52 = objc_msgSend_idType(v8, v48, v49, v50, v51);
    *a4 = objc_msgSend_getUniqueDbId_idType_(CSUSearchableKnowledgeDBObject, v53, v47, v52, v54);
  }

  return v45;
}

- (id)entityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 locale:(id)a5 error:(id *)a6
{
  objc_msgSend_entityForIdentifier_idType_error_(self, a2, a3, a4, (uint64_t)a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)entityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a4;
  objc_msgSend_persistentContainer(self, a2, a3, a4, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_newBackgroundContext(v9, v10, v11, v12, v13);

  objc_msgSend_getDbObjectByIdentifier_idType_context_error_(self, v15, a3, v6, (uint64_t)v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_23A00BED4;
    v38 = sub_23A00BEE4;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_23A00BED4;
    v32 = sub_23A00BEE4;
    v33 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_23A00CD24;
    v24[3] = &unk_250B0E358;
    v25 = v16;
    v26 = &v34;
    v27 = &v28;
    objc_msgSend_performBlockAndWait_(v14, v18, (uint64_t)v24, v19, v20);
    v21 = (void *)v35[5];
    if (v21)
    {
      v22 = v21;
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease((id)v29[5]);
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)deleteEntityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 locale:(id)a5 error:(id *)a6
{
  return MEMORY[0x24BEDD108](self, sel_deleteEntityForIdentifier_idType_error_, a3, a4, a6);
}

- (BOOL)deleteEntityForIdentifier:(unint64_t)a3 idType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  char v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v28;
  id v29;
  id v30;

  v6 = a4;
  objc_msgSend_persistentContainer(self, a2, a3, a4, (uint64_t)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_newBackgroundContext(v9, v10, v11, v12, v13);

  objc_msgSend_getDbObjectByIdentifier_idType_context_error_(self, v15, a3, v6, (uint64_t)v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = sub_23A00CEE0;
    v28 = &unk_250B0E380;
    v17 = v14;
    v29 = v17;
    v30 = v16;
    objc_msgSend_performBlockAndWait_(v17, v18, (uint64_t)&v25, v19, v20);
    v23 = objc_msgSend_saveDatabase_error_(self, v21, (uint64_t)v17, (uint64_t)a5, v22, v25, v26, v27, v28);

  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (BOOL)deleteAllEntities:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *Request;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v32;

  objc_msgSend_fetchRequest(CSUSearchableKnowledgeDBObject, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDBB5E8]);
  Request = (void *)objc_msgSend_initWithFetchRequest_(v8, v9, (uint64_t)v7, v10, v11);
  objc_msgSend_persistentContainer(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_newBackgroundContext(v17, v18, v19, v20, v21);

  v32 = 0;
  v25 = (id)objc_msgSend_executeRequest_error_(v22, v23, (uint64_t)Request, (uint64_t)&v32, v24);
  v26 = v32;
  v29 = v26;
  if (v26)
  {
    v30 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v26);
  }
  else
  {
    v30 = objc_msgSend_saveDatabase_error_(self, v27, (uint64_t)v22, (uint64_t)a3, v28);
  }

  return v30;
}

- (BOOL)countEntries:(unint64_t *)a3 error:(id *)a4
{
  uint64_t v4;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  objc_msgSend_fetchRequest(CSUSearchableKnowledgeDBObject, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_23A00BED4;
  v39 = sub_23A00BEE4;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend_persistentContainer(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_newBackgroundContext(v13, v14, v15, v16, v17);

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_23A00D1F0;
  v26[3] = &unk_250B0E330;
  v29 = &v31;
  v19 = v18;
  v27 = v19;
  v20 = v8;
  v28 = v20;
  v30 = &v35;
  objc_msgSend_performBlockAndWait_(v19, v21, (uint64_t)v26, v22, v23);
  *a3 = v32[3];
  v24 = (void *)v36[5];
  if (a4 && v24)
    *a4 = objc_retainAutorelease(v24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v24 == 0;
}

- (int)getTaxonomyVersion:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v6 = (void *)qword_2542CF808;
  if (!qword_2542CF808)
  {
    if (!objc_msgSend_fetchMetadataToMemory_(self, a2, (uint64_t)a3, v3, v4))
      return 0;
    v6 = (void *)qword_2542CF808;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, a2, (uint64_t)CFSTR("TaxonomyVersion"), v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend_integerValue(v7, v8, v9, v10, v11);

    return v12;
  }
  else
  {

    return 0;
  }
}

- (BOOL)setTaxonomyVersion:(int)a3 error:(id *)a4
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v50;
  _QWORD v51[2];

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v51[1] = *MEMORY[0x24BDAC8D0];
  if (qword_2542CF808 || (objc_msgSend_fetchMetadataToMemory_(self, a2, (uint64_t)a4, (uint64_t)a4, v4) & 1) == 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, v6, (uint64_t)a4, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_((void *)qword_2542CF808, v9, (uint64_t)CFSTR("TaxonomyVersion"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_intValue(v12, v13, v14, v15, v16);

    if (v17 <= (int)v6)
    {
      objc_msgSend_objectForKeyedSubscript_((void *)qword_2542CF808, v18, (uint64_t)CFSTR("TaxonomyVersion"), v19, v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31 == v8)
      {
        LOBYTE(v5) = 1;
        goto LABEL_12;
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_2542CF808, v32, (uint64_t)v8, (uint64_t)CFSTR("TaxonomyVersion"), v33);
      if (!objc_msgSend_saveMetadataToStore_(self, v34, (uint64_t)v5, v35, v36))
        goto LABEL_10;
      byte_256942578 = 1;
      objc_msgSend_persistentContainer(self, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend_newBackgroundContext(v41, v42, v43, v44, v45);

      LOBYTE(v5) = objc_msgSend_saveDatabase_error_(self, v47, (uint64_t)v46, (uint64_t)v5, v48);
    }
    else if (v5)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_objectForKeyedSubscript_((void *)qword_2542CF808, v18, (uint64_t)CFSTR("TaxonomyVersion"), v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v21, v23, (uint64_t)CFSTR("Setting version is too old. Already on %@, but setting to %d"), v24, v25, v22, v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x24BDD1540];
      v50 = *MEMORY[0x24BDD0FC8];
      v51[0] = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)v51, (uint64_t)&v50, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 17, (uint64_t)v29);
      *v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
      LOBYTE(v5) = 0;
    }
LABEL_12:

    return (char)v5;
  }
  LOBYTE(v5) = 0;
  return (char)v5;
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersistentContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end
