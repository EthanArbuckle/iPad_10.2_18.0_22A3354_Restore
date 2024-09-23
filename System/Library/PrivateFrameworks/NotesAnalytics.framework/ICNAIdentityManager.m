@implementation ICNAIdentityManager

+ (id)sharedManager
{
  if (sharedManager_s_onceToken != -1)
    dispatch_once(&sharedManager_s_onceToken, &__block_literal_global_1);
  return (id)sharedManager_s_instance;
}

void __36__ICNAIdentityManager_sharedManager__block_invoke()
{
  ICNAIdentityManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICNAIdentityManager);
  v1 = (void *)sharedManager_s_instance;
  sharedManager_s_instance = (uint64_t)v0;

}

- (ICNAIdentityManager)init
{
  ICNAIdentityManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  NSObject *v6;
  _QWORD block[4];
  ICNAIdentityManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICNAIdentityManager;
  v2 = -[ICNAIdentityManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.notes.analytics.saltManager", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__ICNAIdentityManager_init__block_invoke;
    block[3] = &unk_1E771BE80;
    v9 = v2;
    dispatch_sync(v6, block);

  }
  return v2;
}

uint64_t __27__ICNAIdentityManager_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A38]), "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.notes.analytics"), 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__keyValueStoreDidChangeExternally_, *MEMORY[0x1E0CB3368], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  return objc_msgSend(*(id *)(a1 + 32), "loadIdentifiersFromKVSAndForceRegenerateIdentity:", 0);
}

- (void)loadIdentifiersAndRegenerateIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ICNAIdentityManager_loadIdentifiersAndRegenerateIfNecessary__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __62__ICNAIdentityManager_loadIdentifiersAndRegenerateIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "encryptedKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");

  return objc_msgSend(*(id *)(a1 + 32), "loadIdentifiersFromKVSAndForceRegenerateIdentity:", 0);
}

- (NSString)userID
{
  NSObject *v3;
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
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__ICNAIdentityManager_userID__block_invoke;
  v7[3] = &unk_1E771BED0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __29__ICNAIdentityManager_userID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSString)privateUserID
{
  NSObject *v3;
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
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__ICNAIdentityManager_privateUserID__block_invoke;
  v7[3] = &unk_1E771BED0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __36__ICNAIdentityManager_privateUserID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)todayTimestampYYYYMM:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setCalendar:", v4);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyyMM"));
  objc_msgSend(v5, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identityTimestampYYYYMM
{
  NSObject *v3;
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
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ICNAIdentityManager_identityTimestampYYYYMM__block_invoke;
  v7[3] = &unk_1E771BED0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __46__ICNAIdentityManager_identityTimestampYYYYMM__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (unint64_t)startYear
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ICNAIdentityManager_startYear__block_invoke;
  v7[3] = &unk_1E771BED0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __32__ICNAIdentityManager_startYear__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (unint64_t)startMonth
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ICNAIdentityManager_startMonth__block_invoke;
  v7[3] = &unk_1E771BED0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __33__ICNAIdentityManager_startMonth__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (id)saltedID:(id)a3 forClass:(Class)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICNAIdentityManager_saltedID_forClass___block_invoke;
  block[3] = &unk_1E771C4B0;
  block[4] = self;
  block[5] = &v12;
  block[6] = a4;
  dispatch_sync(v8, block);

  objc_msgSend((id)objc_opt_class(), "saltedID:withSalt:", v6, v13[5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __41__ICNAIdentityManager_saltedID_forClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "salts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(*(Class *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)debug_forceRegenerateIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Forced identifier regeneration requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __55__ICNAIdentityManager_debug_forceRegenerateIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadIdentifiersFromKVSAndForceRegenerateIdentity:", 1);
}

- (void)debug_clearIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Forced identifier deletion requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __45__ICNAIdentityManager_debug_clearIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setUserID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPrivateUserID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSalts:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIdentityTimestampYYYYMM:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStartYear:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStartMonth:", 0);
  objc_msgSend(*(id *)(a1 + 32), "encryptedKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("identityManager"));

  objc_msgSend(*(id *)(a1 + 32), "encryptedKVStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  return objc_msgSend(*(id *)(a1 + 32), "setCurrentDateForTesting:", 0);
}

- (void)debug_dumpIdentifiers
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[ICNAIdentityManager userID](self, "userID", CFSTR("userID"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (const __CFString *)v4;
    else
      v6 = CFSTR("nil");
    v20[0] = v6;
    v19[1] = CFSTR("privateUserID");
    -[ICNAIdentityManager privateUserID](self, "privateUserID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = CFSTR("nil");
    v20[1] = v9;
    v19[2] = CFSTR("salts");
    -[ICNAIdentityManager salts](self, "salts");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = CFSTR("nil");
    v20[2] = v12;
    v19[3] = CFSTR("identityTimestampYYYYMM");
    -[ICNAIdentityManager identityTimestampYYYYMM](self, "identityTimestampYYYYMM");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = CFSTR("nil");
    v20[3] = v15;
    v19[4] = CFSTR("startYear");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICNAIdentityManager startYear](self, "startYear"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[4] = v16;
    v19[5] = CFSTR("startMonth");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICNAIdentityManager startMonth](self, "startMonth"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[5] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v18;
    _os_log_debug_impl(&dword_1BDCEC000, v3, OS_LOG_TYPE_DEBUG, "Identifiers: %@", buf, 0xCu);

  }
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *userID;
  NSString *v23;
  NSString *privateUserID;
  NSDictionary *v25;
  NSDictionary *salts;
  _QWORD *p_salts;
  NSString *v28;
  NSString *identityTimestampYYYYMM;
  void *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  NSString *v42;
  NSString *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  NSString *v47;
  NSString *v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  objc_class *v68;
  void *v69;
  void *v70;
  objc_class *v71;
  void *v72;
  void *v73;
  objc_class *v74;
  void *v75;
  void *v76;
  objc_class *v77;
  void *v78;
  void *v79;
  objc_class *v80;
  void *v81;
  void *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  objc_class *v86;
  void *v87;
  void *v88;
  objc_class *v89;
  void *v90;
  void *v91;
  objc_class *v92;
  void *v93;
  NSDictionary *v94;
  NSDictionary *v95;
  NSString *v96;
  NSDictionary *v97;
  const __CFString *v98;
  NSObject *v99;
  NSUbiquitousKeyValueStore *encryptedKVStore;
  void *v101;
  void *v102;
  void *v103;
  objc_class *v104;
  void *v105;
  void *v106;
  objc_class *v107;
  void *v108;
  NSDictionary *v109;
  NSDictionary *v110;
  void *v111;
  objc_class *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  objc_class *v117;
  void *v118;
  NSDictionary *v119;
  NSDictionary *v120;
  void *v121;
  objc_class *v122;
  void *v123;
  void *v124;
  NSObject *v125;
  void *v126;
  objc_class *v127;
  void *v128;
  NSDictionary *v129;
  void *v130;

  -[ICNAIdentityManager accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_encryptedKVStore)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((_encryptedKVStore) != nil)", "-[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "_encryptedKVStore");
  -[ICNAIdentityManager currentDateForTesting](self, "currentDateForTesting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[NSUbiquitousKeyValueStore dictionaryForKey:](self->_encryptedKVStore, "dictionaryForKey:", CFSTR("identityManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "mutableCopy");

  v12 = v11 == 0;
  if (!v11)
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "objectForKey:", CFSTR("startYear"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_startYear = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v11, "objectForKey:", CFSTR("startMonth"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_startMonth = objc_msgSend(v14, "unsignedIntegerValue");

  if (!self->_startMonth || !self->_startYear)
  {
    v15 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.6();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "components:fromDate:", 12, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    self->_startYear = objc_msgSend(v17, "year");
    self->_startMonth = objc_msgSend(v17, "month");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_startYear);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("startYear"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_startMonth);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("startMonth"));

    v12 = 1;
  }
  -[ICNAIdentityManager todayTimestampYYYYMM:](self, "todayTimestampYYYYMM:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("userID"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  userID = self->_userID;
  self->_userID = v21;

  objc_msgSend(v11, "objectForKey:", CFSTR("privateUserID"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  privateUserID = self->_privateUserID;
  self->_privateUserID = v23;

  objc_msgSend(v11, "objectForKey:", CFSTR("salts"));
  v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  p_salts = &self->_salts;
  salts = self->_salts;
  self->_salts = v25;

  objc_msgSend(v11, "objectForKey:", CFSTR("identityTimestampYYYYMM"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  identityTimestampYYYYMM = self->_identityTimestampYYYYMM;
  self->_identityTimestampYYYYMM = v28;

  if (!-[NSString isEqualToString:](self->_identityTimestampYYYYMM, "isEqualToString:", v20)
    || a3
    || !self->_userID
    || !self->_privateUserID
    || (v30 = (void *)*p_salts) == 0)
  {
    self->_identifierResetOccurred = 1;
    v39 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.4(a3, v39, v40);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v42 = (NSString *)objc_claimAutoreleasedReturnValue();
    v43 = self->_userID;
    self->_userID = v42;

    objc_msgSend(v11, "setObject:forKey:", self->_userID, CFSTR("userID"));
    v44 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.3(a3, v44, v45);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "UUIDString");
    v47 = (NSString *)objc_claimAutoreleasedReturnValue();
    v48 = self->_privateUserID;
    self->_privateUserID = v47;

    objc_msgSend(v11, "setObject:forKey:", self->_privateUserID, CFSTR("privateUserID"));
    v49 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.2(a3, v49, v50);

    v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v52 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v52, v54);

    v55 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v55, v57);

    v58 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v59 = (objc_class *)objc_opt_class();
    NSStringFromClass(v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v58, v60);

    v61 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v62 = (objc_class *)objc_opt_class();
    NSStringFromClass(v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v61, v63);

    v64 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v65 = (objc_class *)objc_opt_class();
    NSStringFromClass(v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v64, v66);

    v67 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v68 = (objc_class *)objc_opt_class();
    NSStringFromClass(v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v67, v69);

    v70 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v70, v72);

    v73 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v74 = (objc_class *)objc_opt_class();
    NSStringFromClass(v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v73, v75);

    v76 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v77 = (objc_class *)objc_opt_class();
    NSStringFromClass(v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v76, v78);

    v79 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v80 = (objc_class *)objc_opt_class();
    NSStringFromClass(v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v79, v81);

    v82 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v83 = (objc_class *)objc_opt_class();
    NSStringFromClass(v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v82, v84);

    v85 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v86 = (objc_class *)objc_opt_class();
    NSStringFromClass(v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v85, v87);

    v88 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v89 = (objc_class *)objc_opt_class();
    NSStringFromClass(v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v88, v90);

    v91 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v92 = (objc_class *)objc_opt_class();
    NSStringFromClass(v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v91, v93);

    v94 = (NSDictionary *)objc_msgSend(v51, "copy");
    v95 = self->_salts;
    self->_salts = v94;

    objc_msgSend(v11, "setObject:forKey:", self->_salts, CFSTR("salts"));
    v96 = v20;
    v97 = (NSDictionary *)self->_identityTimestampYYYYMM;
    self->_identityTimestampYYYYMM = v96;
    v98 = CFSTR("identityTimestampYYYYMM");
    p_salts = &self->_identityTimestampYYYYMM;
    goto LABEL_28;
  }
  v130 = v9;
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", v32);
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    v35 = (void *)*p_salts;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      goto LABEL_35;
  }
  else
  {

  }
  v102 = (void *)-[NSDictionary mutableCopy](self->_salts, "mutableCopy");
  v103 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
  v104 = (objc_class *)objc_opt_class();
  NSStringFromClass(v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setObject:forKeyedSubscript:", v103, v105);

  v106 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
  v107 = (objc_class *)objc_opt_class();
  NSStringFromClass(v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setObject:forKeyedSubscript:", v106, v108);

  v109 = (NSDictionary *)objc_msgSend(v102, "copy");
  v110 = self->_salts;
  self->_salts = v109;

  objc_msgSend(v11, "setObject:forKey:", self->_salts, CFSTR("salts"));
  v12 = 1;
LABEL_35:
  v111 = (void *)*p_salts;
  v112 = (objc_class *)objc_opt_class();
  NSStringFromClass(v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "objectForKeyedSubscript:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v114)
  {
    v115 = (void *)-[NSDictionary mutableCopy](self->_salts, "mutableCopy");
    v116 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v117 = (objc_class *)objc_opt_class();
    NSStringFromClass(v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setObject:forKeyedSubscript:", v116, v118);

    v119 = (NSDictionary *)objc_msgSend(v115, "copy");
    v120 = self->_salts;
    self->_salts = v119;

    objc_msgSend(v11, "setObject:forKey:", self->_salts, CFSTR("salts"));
    v12 = 1;
  }
  v121 = (void *)*p_salts;
  v122 = (objc_class *)objc_opt_class();
  NSStringFromClass(v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "objectForKeyedSubscript:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v130;
  if (!v124)
  {
    v51 = (id)-[NSDictionary mutableCopy](self->_salts, "mutableCopy");
    v126 = (void *)objc_msgSend((id)objc_opt_class(), "newSalt");
    v127 = (objc_class *)objc_opt_class();
    NSStringFromClass(v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setObject:forKeyedSubscript:", v126, v128);

    v129 = (NSDictionary *)objc_msgSend(v51, "copy");
    v97 = self->_salts;
    self->_salts = v129;
    v98 = CFSTR("salts");
LABEL_28:

    objc_msgSend(v11, "setObject:forKey:", *p_salts, v98);
    goto LABEL_29;
  }
  if (!v12)
  {
    v125 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
      -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.5(v11);

    goto LABEL_32;
  }
LABEL_29:
  v99 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    -[ICNAIdentityManager loadIdentifiersFromKVSAndForceRegenerateIdentity:].cold.1(v11);

  encryptedKVStore = self->_encryptedKVStore;
  v101 = (void *)objc_msgSend(v11, "copy");
  -[NSUbiquitousKeyValueStore setDictionary:forKey:](encryptedKVStore, "setDictionary:forKey:", v101, CFSTR("identityManager"));

  -[NSUbiquitousKeyValueStore synchronize](self->_encryptedKVStore, "synchronize");
LABEL_32:

}

- (void)_keyValueStoreDidChangeExternally:(id)a3
{
  id v4;
  NSUbiquitousKeyValueStore *v5;
  NSUbiquitousKeyValueStore *encryptedKVStore;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (NSUbiquitousKeyValueStore *)objc_claimAutoreleasedReturnValue();
  encryptedKVStore = self->_encryptedKVStore;

  v7 = os_log_create("com.apple.notes", "Analytics");
  v8 = v7;
  if (v5 != encryptedKVStore)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICNAIdentityManager _keyValueStoreDidChangeExternally:].cold.3();
    goto LABEL_16;
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ICNAIdentityManager _keyValueStoreDidChangeExternally:].cold.2(v4, v9);

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3358]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3360]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 < 2)
  {
    if (!objc_msgSend(v8, "containsObject:", CFSTR("identityManager")))
      goto LABEL_16;
    -[ICNAIdentityManager accessQueue](self, "accessQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke;
    block[3] = &unk_1E771BE80;
    block[4] = self;
    v16 = block;
    goto LABEL_12;
  }
  if (v12 != 2)
  {
    if (v12 != 3)
      goto LABEL_16;
    -[ICNAIdentityManager accessQueue](self, "accessQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_59;
    v18[3] = &unk_1E771BE80;
    v18[4] = self;
    v16 = v18;
LABEL_12:
    dispatch_async(v14, v16);

    goto LABEL_16;
  }
  v17 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[ICNAIdentityManager _keyValueStoreDidChangeExternally:].cold.1();

LABEL_16:
}

uint64_t __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "loadIdentifiersFromKVSAndForceRegenerateIdentity:", 0);
}

uint64_t __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_59(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_59_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "loadIdentifiersFromKVSAndForceRegenerateIdentity:", 1);
}

+ (id)saltedID:(id)a3 withSalt:(id)a4
{
  id v5;
  NSObject *v6;
  os_log_t v7;
  void *v8;
  const char *v9;
  size_t v10;
  void *v11;
  CCHmacContext v13;
  _OWORD macOut[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
  {
    objc_msgSend(a4, "dataUsingEncoding:", 4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
    if (v5 && v6)
    {
      memset(&v13, 0, sizeof(v13));
      v7 = objc_retainAutorelease(v6);
      CCHmacInit(&v13, 2u, (const void *)-[NSObject bytes](v7, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0),
        -[NSObject length](v7, "length"));
      v9 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      v10 = strlen(v9);
      CCHmacUpdate(&v13, v9, v10);
      memset(macOut, 0, sizeof(macOut));
      CCHmacFinal(&v13, macOut);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ICNAIdentityManager saltedID:withSalt:].cold.1(v5, v7);

    v8 = 0;
  }

  return v8;
}

+ (id)newSalt
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE bytes[512];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x200uLL, bytes))
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", bytes, 512);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedDataWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);

  return v2;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setPrivateUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIdentityTimestampYYYYMM:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setStartYear:(unint64_t)a3
{
  self->_startYear = a3;
}

- (void)setStartMonth:(unint64_t)a3
{
  self->_startMonth = a3;
}

- (BOOL)identifierResetOccurred
{
  return self->_identifierResetOccurred;
}

- (void)setIdentifierResetOccurred:(BOOL)a3
{
  self->_identifierResetOccurred = a3;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NSDictionary)salts
{
  return self->_salts;
}

- (void)setSalts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSUbiquitousKeyValueStore)encryptedKVStore
{
  return self->_encryptedKVStore;
}

- (void)setEncryptedKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedKVStore, a3);
}

- (NSDate)currentDateForTesting
{
  return self->_currentDateForTesting;
}

- (void)setCurrentDateForTesting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateForTesting, 0);
  objc_storeStrong((id *)&self->_encryptedKVStore, 0);
  objc_storeStrong((id *)&self->_salts, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_identityTimestampYYYYMM, 0);
  objc_storeStrong((id *)&self->_privateUserID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_md5");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1BDCEC000, v2, v3, "Saving new identifiers (hash=%@, timestamp=%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(uint64_t)a3 .cold.2(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1BDCEC000, a2, a3, "Regenerating salts (forced=%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(uint64_t)a3 .cold.3(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1BDCEC000, a2, a3, "Regenerating privateUserID (forced=%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(uint64_t)a3 .cold.4(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1BDCEC000, a2, a3, "Regenerating userID (forced=%@)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ic_md5");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1BDCEC000, v2, v3, "Loaded identifiers (hash=%@, timestamp=%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)loadIdentifiersFromKVSAndForceRegenerateIdentity:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Generating start year and month", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_keyValueStoreDidChangeExternally:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1BDCEC000, v0, OS_LOG_TYPE_FAULT, "Analytics KVS is reporting that it is over quota", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_keyValueStoreDidChangeExternally:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_0(&dword_1BDCEC000, a2, v4, "Processing KVS change notification: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_8();
}

- (void)_keyValueStoreDidChangeExternally:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Ignoring a change notification for a KVS that doesn't belong to us", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Reloading due to a change notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__ICNAIdentityManager__keyValueStoreDidChangeExternally___block_invoke_59_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1BDCEC000, v0, v1, "Reloading all identifiers due to an iCloud account change", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)saltedID:(void *)a1 withSalt:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "length");
  _os_log_error_impl(&dword_1BDCEC000, a2, OS_LOG_TYPE_ERROR, "Salt is nil when trying to salt identifier length=%lu", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_8();
}

@end
