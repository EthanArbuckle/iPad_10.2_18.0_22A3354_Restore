@implementation CKDMetadataCache

- (id)inlock_applicationMetadataForApplicationID:(id)a3
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
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  id v45;
  const char *v46;
  id v47;
  void *v48;
  const char *v49;
  void *v50;
  void *v51;
  CKDApplicationMetadata *v52;
  const char *v53;
  void *isClientMainBundleAppleExecutable;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[6];
  const __CFString *v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60 = CFSTR("applicationID");
  v61[0] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v61, &v60, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = CFSTR("adopterProcessType");
  v59[1] = CFSTR("applicationContainerPath");
  v59[2] = CFSTR("clientSDKVersion");
  v59[3] = CFSTR("containingBundleID");
  v59[4] = CFSTR("entitlements");
  v59[5] = CFSTR("isMainBundleAppleExecutable");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v59, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v1(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v8, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_where_bindings_(self, v17, (uint64_t)v10, CFSTR("AppBundle"), v13, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v18, v19, v20))
  {
    objc_msgSend_objectAtIndexedSubscript_(v18, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)CFSTR("adopterProcessType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_integerValue(v24, v25, v26);

    objc_msgSend_objectForKeyedSubscript_(v22, v27, (uint64_t)CFSTR("applicationContainerPath"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKNilIfLengthZero(v28, v29, v30);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v22, v31, (uint64_t)CFSTR("clientSDKVersion"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_integerValue(v32, v33, v34);

    objc_msgSend_objectForKeyedSubscript_(v22, v35, (uint64_t)CFSTR("isMainBundleAppleExecutable"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_BOOLValue(v36, v37, v38);

    objc_msgSend_objectForKeyedSubscript_(v22, v40, (uint64_t)CFSTR("containingBundleID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKNilIfLengthZero(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_alloc(MEMORY[0x1E0C94D80]);
    objc_msgSend_objectForKeyedSubscript_(v22, v46, (uint64_t)CFSTR("entitlements"));
    v47 = v4;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v6;
    v51 = (void *)objc_msgSend_initWithSqliteRepresentation_(v45, v49, (uint64_t)v48);

    v4 = v47;
    v52 = [CKDApplicationMetadata alloc];
    isClientMainBundleAppleExecutable = (void *)objc_msgSend_initWithAdopterProcessType_containingBundleID_applicationContainerPath_entitlements_clientSDKVersion_isClientMainBundleAppleExecutable_(v52, v53, v58, v44, v57, v51, v56, v39);

    v6 = v50;
  }
  else
  {
    isClientMainBundleAppleExecutable = (void *)objc_opt_new();
  }

  return isClientMainBundleAppleExecutable;
}

- (void)setCachedDSID:(id)a3 forAccountID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C352C;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_sync(v10, block);

}

- (void)setApplicationMetadata:(id)a3 forApplicationID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9AECE0;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  dispatch_sync(v10, block);

}

- (void)setAppContainerAccountMetadata:(id)a3 forAppContainerAccountTuple:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C1938;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  dispatch_sync(v10, block);

}

- (id)cachedDSIDForAccountID:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v12;
  CKDMetadataCache *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1BE9BB260;
  v19 = sub_1BE9BAED8;
  v20 = 0;
  if (v6)
  {
    objc_msgSend_cacheQueue(self, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE9C3CAC;
    block[3] = &unk_1E7831250;
    v12 = v6;
    v13 = self;
    v14 = &v15;
    dispatch_sync(v7, block);

    v8 = (void *)v16[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (id)appContainerAccountMetadataForAppContainerAccountTuple:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  CKDMetadataCache *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1BE9BB260;
  v19 = sub_1BE9BAED8;
  v20 = 0;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9C210C;
  block[3] = &unk_1E7831250;
  v12 = v4;
  v13 = self;
  v14 = &v15;
  v8 = v4;
  dispatch_sync(v7, block);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (id)sharedCache
{
  uint64_t v2;
  void *v5;
  const char *v6;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, a1, CFSTR("CKDMetadataCache.m"), 221, CFSTR("Use -initWithDeviceContext:"));

  return 0;
}

+ (id)cacheDatabaseSchema
{
  return CFSTR("create table if not exists PushTokens (\n    applicationID             text,\n    containerID               text,\n    personaID                 text,\n    accountID                 text,\n    apsToken                  blob,\n    apsEnvironment            text,\n    expirationDate            real,\n    unique (applicationID, containerID, personaID, accountID) on conflict replace\n);\ncreate table if not exists AppBundle (\n    applicationID               text,\n    adopterProcessType          integer,\n    applicationContainerPath    text,\n    clientSDKVersion            integer,\n    containingBundleID          text,\n    entitlements                text,\n    isMainBundleAppleExecutable integer,\n    unique (applicationID) on conflict replace\n);\ncreate table if not exists ContainerServerInfo (\n    containerID                 text primary key,\n    publicCloudDBURL            text,\n    publicShareServiceURL       text,\n    publicDeviceServiceURL      text,\n    publicCodeServiceURL        text,\n    publicMetricsServiceURL     text,\n    scopedUserID                text,\n    orgAdminUserID              text,\n    accountID                   text,\n    unique (containerID, accountID) on conflict replace\n);\n create table if not exists AppContainerAccount (\n    applicationID               text,\n    containerID                 text,\n    personaID                   text,\n    accountID                   text,\n    containerOptions            text,\n    tokenRegistered             integer,\n    unique (applicationID, containerID, personaID, accountID) on conflict replace\n);\ncreate table if not exists ServerConfiguration (\n     valuesData            blob,\n     expiry                real\n);\ncreate table if not exists VerifiedPublicKey (\n     keyType          text,\n     keyID            text,\n     publicKey        blob,\n     keyVersion       integer,\n     keyExpiration    integer,\n     keyCert          blob,\n     protectionSource text,\n     unique (keyType, keyID) on conflict replace\n);\ncreate table if not exists DSIDMap (\n     accountID        text primary key,\n     DSID             text\n);\n");
}

+ (id)dbFileName
{
  return CFSTR("CloudKitMetadata");
}

- (CKDMetadataCache)initWithCacheDir:(id)a3
{
  CKDMetadataCache *v3;
  const char *v4;
  CKDMetadataCache *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *cacheQueue;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDMetadataCache;
  v3 = -[CKDSQLiteCache initWithCacheDir:](&v11, sel_initWithCacheDir_, a3);
  v5 = v3;
  if (v3)
  {
    objc_msgSend_setUserVersion_(v3, v4, 3873022576);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.cloudkit.metadatacache", v6);
    cacheQueue = v5->_cacheQueue;
    v5->_cacheQueue = (OS_dispatch_queue *)v7;

    objc_msgSend_setObjectClassPrefix_(v5, v9, (uint64_t)CFSTR("CKD"));
  }
  return v5;
}

- (void)expungeAllData
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC8120C;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)expungeOldData
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC814CC;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)inlock_expungeDataForAccountID:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEC81660;
  v8[3] = &unk_1E78364E8;
  v9 = v4;
  v5 = v4;
  v7 = (id)objc_msgSend_performDatabaseOperation_withErrorHandler_(self, v6, (uint64_t)v8, &unk_1E7838BD8);

}

- (void)expungeDataForAccountID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  CKDMetadataCache *v11;

  v4 = a3;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC81890;
  block[3] = &unk_1E782EE20;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (void)expungeStaleAccountIDs
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC819D8;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (id)pushTokenForAppContainerAccountTuple:(id)a3 filterOldTokens:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  CKDMetadataCache *v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1BE9BB260;
  v22 = sub_1BE9BAED8;
  v23 = 0;
  objc_msgSend_cacheQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEC81E70;
  v13[3] = &unk_1E7838C00;
  v17 = a4;
  v14 = v6;
  v15 = self;
  v16 = &v18;
  v10 = v6;
  dispatch_sync(v9, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)setPushToken:(id)a3 forAppContainerAccountTuple:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  CKDMetadataCache *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC82244;
  block[3] = &unk_1E782E418;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v7;
  dispatch_sync(v10, block);

}

- (id)knownAppContainerAccountTuplesForAccountID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1BE9BB260;
  v18 = sub_1BE9BAED8;
  v19 = 0;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC826D0;
  block[3] = &unk_1E7831250;
  block[4] = self;
  v12 = v4;
  v13 = &v14;
  v8 = v4;
  dispatch_sync(v7, block);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)knownAppContainerTuples
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE9BB260;
  v12 = sub_1BE9BAED8;
  v13 = 0;
  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC82A8C;
  v7[3] = &unk_1E7833208;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)knownAppContainerAccountTuples
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE9BB260;
  v12 = sub_1BE9BAED8;
  v13 = 0;
  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC82D8C;
  v7[3] = &unk_1E7833208;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)dateOfLastTokenUpdate
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE9BB260;
  v12 = sub_1BE9BAED8;
  v13 = 0;
  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC830C0;
  v7[3] = &unk_1E78303D8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)inlock_setDateOfLastTokenUpdate:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setDateProperty_forKey_, a3);
}

- (void)setDateOfLastTokenUpdate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC831A4;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (id)applicationMetadataForApplicationID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1BE9BB260;
  v18 = sub_1BE9BAED8;
  v19 = 0;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC832B8;
  block[3] = &unk_1E7831BB8;
  v12 = v4;
  v13 = &v14;
  block[4] = self;
  v8 = v4;
  dispatch_sync(v7, block);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)knownApplicationIDs
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE9BB260;
  v12 = sub_1BE9BAED8;
  v13 = 0;
  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC83560;
  v7[3] = &unk_1E7833208;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)knownContainerizedApplicationIDs
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE9BB260;
  v12 = sub_1BE9BAED8;
  v13 = 0;
  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC83780;
  v7[3] = &unk_1E7833208;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)removeKnownApplicationID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC8398C;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (id)globalConfiguration
{
  uint64_t v2;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1BE9BB260;
  v12 = sub_1BE9BAED8;
  v13 = 0;
  objc_msgSend_cacheQueue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BEC83BD8;
  v7[3] = &unk_1E7833208;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)setGlobalConfiguration:(id)a3
{
  id v4;
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
  id v16;
  _QWORD block[5];
  id v18;

  v4 = a3;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC83D00;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v18 = v4;
  v16 = v4;
  dispatch_sync(v7, block);

  objc_msgSend_deviceContext(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationScheduler(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRefreshChanged(v13, v14, v15);

}

- (id)publicKeyOfType:(id)a3 withIdentifier:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v17;
  const char *v18;
  _QWORD block[4];
  id v20;
  id v21;
  CKDMetadataCache *v22;
  uint64_t *v23;
  SEL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v8 = a4;
  v11 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKDMetadataCache.m"), 693, CFSTR("Must specify both key type and key identifier"));

  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1BE9BB260;
  v29 = sub_1BE9BAED8;
  v30 = 0;
  objc_msgSend_cacheQueue(self, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC83F64;
  block[3] = &unk_1E7838CD0;
  v20 = v7;
  v21 = v11;
  v23 = &v25;
  v24 = a2;
  v22 = self;
  v13 = v11;
  v14 = v7;
  dispatch_sync(v12, block);

  v15 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v15;
}

- (void)setPublicKey:(id)a3 ofType:(id)a4 withIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  const char *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v14 = v11;
  if (!v10 || !v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKDMetadataCache.m"), 719, CFSTR("Must specify both key type and key identifier"));

  }
  objc_msgSend_cacheQueue(self, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC84348;
  block[3] = &unk_1E782F4A8;
  block[4] = self;
  v22 = v9;
  v23 = v10;
  v24 = v14;
  v16 = v14;
  v17 = v10;
  v20 = v9;
  dispatch_sync(v15, block);

}

- (id)inlock_containerServerInfoForContainerID:(id)a3 accountID:(id)a4
{
  id v6;
  const __CFString *v7;
  const char *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  const char *v62;
  void *v63;
  const char *v64;
  _QWORD v66[7];
  _QWORD v67[2];
  _QWORD v68[3];

  v68[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (const __CFString *)a4;
  v9 = (__CFString *)v7;
  v67[0] = CFSTR("containerID");
  v67[1] = CFSTR("accountID");
  v10 = &stru_1E7838F48;
  if (v7)
    v10 = v7;
  v68[0] = v6;
  v68[1] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v68, v67, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_equalityClauseAndBindingsForDict_(MEMORY[0x1E0C950E0], v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = CFSTR("publicCloudDBURL");
  v66[1] = CFSTR("publicShareServiceURL");
  v66[2] = CFSTR("publicDeviceServiceURL");
  v66[3] = CFSTR("publicCodeServiceURL");
  v66[4] = CFSTR("publicMetricsServiceURL");
  v66[5] = CFSTR("scopedUserID");
  v66[6] = CFSTR("orgAdminUserID");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v66, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v1(v13, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_v2(v13, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_select_from_where_bindings_(self, v22, (uint64_t)v15, CFSTR("ContainerServerInfo"), v18, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v23, v24, v25))
  {
    objc_msgSend_objectAtIndexedSubscript_(v23, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_opt_new();
    objc_msgSend_objectForKeyedSubscript_(v27, v29, (uint64_t)CFSTR("publicCloudDBURL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v30, v31, v32))
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v33, (uint64_t)v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPublicCloudDBURL_(v28, v35, (uint64_t)v34);

    }
    objc_msgSend_objectForKeyedSubscript_(v27, v33, (uint64_t)CFSTR("publicShareServiceURL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v36, v37, v38))
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v39, (uint64_t)v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPublicShareServiceURL_(v28, v41, (uint64_t)v40);

    }
    objc_msgSend_objectForKeyedSubscript_(v27, v39, (uint64_t)CFSTR("publicDeviceServiceURL"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v42, v43, v44))
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v45, (uint64_t)v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPublicDeviceServiceURL_(v28, v47, (uint64_t)v46);

    }
    objc_msgSend_objectForKeyedSubscript_(v27, v45, (uint64_t)CFSTR("publicCodeServiceURL"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v48, v49, v50))
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v51, (uint64_t)v48);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPublicCodeServiceURL_(v28, v53, (uint64_t)v52);

    }
    objc_msgSend_objectForKeyedSubscript_(v27, v51, (uint64_t)CFSTR("publicMetricsServiceURL"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v54, v55, v56))
    {
      objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v57, (uint64_t)v54);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPublicMetricsServiceURL_(v28, v59, (uint64_t)v58);

    }
    objc_msgSend_objectForKeyedSubscript_(v27, v57, (uint64_t)CFSTR("scopedUserID"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainerScopedUserID_(v28, v61, (uint64_t)v60);

    objc_msgSend_objectForKeyedSubscript_(v27, v62, (uint64_t)CFSTR("orgAdminUserID"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOrgAdminUserID_(v28, v64, (uint64_t)v63);

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)containerServerInfoForContainerID:(id)a3 accountID:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v16;
  const char *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v10 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1BE9BB260;
  v26 = sub_1BE9BAED8;
  v27 = 0;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("CKDMetadataCache.m"), 793, CFSTR("Unexpectedly-nil containerID"));

  }
  objc_msgSend_cacheQueue(self, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEC84BCC;
  v18[3] = &unk_1E7834710;
  v18[4] = self;
  v19 = v7;
  v20 = v10;
  v21 = &v22;
  v12 = v10;
  v13 = v7;
  dispatch_sync(v11, v18);

  v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

- (void)setContainerServerInfo:(id)a3 forContainerID:(id)a4 accountID:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v13 = a5;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKDMetadataCache.m"), 803, CFSTR("Unexpectedly-nil containerID"));

  }
  objc_msgSend_cacheQueue(self, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC84D30;
  block[3] = &unk_1E782F4A8;
  block[4] = self;
  v21 = v9;
  v22 = v10;
  v23 = v13;
  v15 = v13;
  v16 = v10;
  v19 = v9;
  dispatch_sync(v14, block);

}

- (void)removeContainerID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_cacheQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC8530C;
  block[3] = &unk_1E782EE20;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (void)willCreateDatabase
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  objc_msgSend_currentProcess(CKDDaemonProcess, a2, v2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_processType(v12, v3, v4) && objc_msgSend_isSystemInstalledBinary(v12, v5, v6))
  {
    objc_msgSend_sharedClient(CKDPDSClient, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unregisterAllTokens(v9, v10, v11);

  }
}

- (void)setCacheQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end
