@implementation TKSEPKey

- (id)initLocalWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[TKLocalSEPKey _initWithObjectID:authContext:caller:forceSystemSession:error:]([TKLocalSEPKey alloc], "_initWithObjectID:authContext:caller:forceSystemSession:error:", v14, v13, v12, v8, a7);

  return v15;
}

- (id)_initWithAuthContext:(id)a3
{
  id v5;
  TKSEPKey *v6;
  TKSEPKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSEPKey;
  v6 = -[TKSEPKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authContext, a3);

  return v7;
}

- (LAContext)authContext
{
  return self->_authContext;
}

+ (TKClientToken)clientToken
{
  return (TKClientToken *)(id)_clientToken;
}

+ (BOOL)hasSEP
{
  return +[TKLocalSEPKey hasSEP](TKLocalSEPKey, "hasSEP");
}

+ (BOOL)isDaytona
{
  return +[TKLocalSEPKey isDaytona](TKLocalSEPKey, "isDaytona");
}

+ (BOOL)isGibraltar
{
  return +[TKLocalSEPKey isGibraltar](TKLocalSEPKey, "isGibraltar");
}

+ (void)setClientToken:(id)a3
{
  objc_storeStrong((id *)&_clientToken, a3);
}

+ (void)setupKeybagForTesting:(BOOL)a3
{
  +[TKLocalSEPKey setupKeybagForTesting:](TKLocalSEPKey, "setupKeybagForTesting:", a3);
}

+ (NSDictionary)_testing_callerEntitlements
{
  return (NSDictionary *)+[TKLocalSEPKey _testing_callerEntitlements](TKLocalSEPKey, "_testing_callerEntitlements");
}

+ (void)set_testing_callerEntitlements:(id)a3
{
  +[TKLocalSEPKey set_testing_callerEntitlements:](TKLocalSEPKey, "set_testing_callerEntitlements:", a3);
}

+ (NSNumber)_testing_keybagHandle
{
  return (NSNumber *)+[TKLocalSEPKey _testing_keybagHandle](TKLocalSEPKey, "_testing_keybagHandle");
}

+ (void)set_testing_keybagHandle:(id)a3
{
  +[TKLocalSEPKey set_testing_keybagHandle:](TKLocalSEPKey, "set_testing_keybagHandle:", a3);
}

+ (void)setContextErrorHandler:(id)a3
{
  +[TKLocalSEPKey setContextErrorHandler:](TKLocalSEPKey, "setContextErrorHandler:", a3);
}

+ (BOOL)canUseSEPLocally
{
  void *v2;

  objc_msgSend(a1, "clientToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 0;
  if (canUseSEPLocally_onceToken != -1)
    dispatch_once(&canUseSEPLocally_onceToken, &__block_literal_global_3);
  return canUseSEPLocally_hasEntitlement;
}

void __28__TKSEPKey_canUseSEPLocally__block_invoke()
{
  __SecTask *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v1 = (void *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.keystore.access-keychain-keys"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "integerValue"))
  {
    TK_LOG_sepkey();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9768000, v2, OS_LOG_TYPE_INFO, "Detected com.apple.keystore.access-keychain-keys entitlement, using in-process SEP SecKey implementation", v5, 2u);
    }

    canUseSEPLocally_hasEntitlement = 1;
    v3 = (void *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.keystore.sik.access"), 0);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v3, "integerValue"))
    {
      TK_LOG_sepkey();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __28__TKSEPKey_canUseSEPLocally__block_invoke_cold_1(v4);

    }
  }
  else
  {
    v3 = v1;
  }

}

- (TKSEPKey)initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  TKBERTLVRecord *v12;
  uint64_t v13;
  id *v14;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v7 = a5;
  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[TKBERTLVRecord initWithPropertyList:]([TKBERTLVRecord alloc], "initWithPropertyList:", v10);
    -[TKTLVRecord data](v12, "data");
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_16:
    if (objc_msgSend((id)objc_opt_class(), "canUseSEPLocally"))
      v14 = -[TKLocalSEPKey _initWithObjectID:authContext:caller:forceSystemSession:error:]([TKLocalSEPKey alloc], "_initWithObjectID:authContext:caller:forceSystemSession:error:", v10, v11, 0, v7, a6);
    else
      v14 = -[TKRemoteSEPKey _initWithObjectID:authContext:forceSystemSession:error:]([TKRemoteSEPKey alloc], "_initWithObjectID:authContext:forceSystemSession:error:", v10, v11, v7, a6);
    a6 = v14;
  }
  else if (a6)
  {
    TK_LOG_sepkey();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:].cold.1((uint64_t)v10, v16);

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2938];
    v20[0] = CFSTR("objectID of unexpected type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return (TKSEPKey *)a6;
}

- (TKSEPKey)initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  TKSEPKey *v18;
  TKSEPKey *v19;
  uint64_t v21;

  v9 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  if (objc_msgSend((id)objc_opt_class(), "canUseSEPLocally"))
  {
    LOBYTE(v21) = v9;
    v18 = -[TKLocalSEPKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:]([TKLocalSEPKey alloc], "_initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:", v17, a4, a5, v16, v15, 0, v21, a9);
  }
  else
  {
    v18 = -[TKRemoteSEPKey _initWithKeyType:keySize:accessControl:options:authContext:forceSystemSession:error:]([TKRemoteSEPKey alloc], "_initWithKeyType:keySize:accessControl:options:authContext:forceSystemSession:error:", v17, a4, a5, v16, v15, v9, a9);
  }
  v19 = v18;

  return v19;
}

- (id)initLocalWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v22;

  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  LOBYTE(v22) = a9;
  v20 = -[TKLocalSEPKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:]([TKLocalSEPKey alloc], "_initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:", v19, a4, a5, v18, v17, v16, v22, a10);

  return v20;
}

- (id)objectID
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s must be overriden"), "-[TKSEPKey objectID]");
  return 0;
}

- (__SecAccessControl)accessControl
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s must be overriden"), "-[TKSEPKey accessControl]");
  return (__SecAccessControl *)*MEMORY[0x1E0C9B0D0];
}

- (id)keyType
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s must be overriden"), "-[TKSEPKey keyType]");
  return (id)*MEMORY[0x1E0CD6A38];
}

- (id)keySize
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s must be overriden"), "-[TKSEPKey keySize]");
  return 0;
}

- (BOOL)systemKey
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s must be overriden"), "-[TKSEPKey systemKey]");
  return 0;
}

- (BOOL)systemSessionKey
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s must be overriden"), "-[TKSEPKey systemSessionKey]");
  return 0;
}

- (BOOL)deleteWithError:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)publicKeyWithError:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSDictionary)attributes
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  _QWORD v29[17];
  _QWORD v30[18];

  v30[17] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CD6C98];
  v30[0] = *MEMORY[0x1E0CD6CC0];
  v4 = *MEMORY[0x1E0CD6A38];
  v29[0] = v3;
  v29[1] = v4;
  -[TKSEPKey keyType](self, "keyType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v5;
  v29[2] = *MEMORY[0x1E0CD6A20];
  -[TKSEPKey keySize](self, "keySize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v6;
  v29[3] = *MEMORY[0x1E0CD69A8];
  -[TKSEPKey keySize](self, "keySize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CD69F8];
  v9 = *MEMORY[0x1E0CD6A00];
  v30[3] = v7;
  v30[4] = v9;
  v10 = *MEMORY[0x1E0CD69E0];
  v29[4] = v8;
  v29[5] = v10;
  v11 = *MEMORY[0x1E0CD69C8];
  v30[5] = MEMORY[0x1E0C9AAB0];
  v30[6] = MEMORY[0x1E0C9AAA0];
  v12 = *MEMORY[0x1E0CD69B8];
  v29[6] = v11;
  v29[7] = v12;
  v13 = *MEMORY[0x1E0CD6C10];
  v30[7] = MEMORY[0x1E0C9AAA0];
  v30[8] = MEMORY[0x1E0C9AAB0];
  v14 = *MEMORY[0x1E0CD6950];
  v29[8] = v13;
  v29[9] = v14;
  v15 = *MEMORY[0x1E0CD6940];
  v30[9] = MEMORY[0x1E0C9AAA0];
  v30[10] = MEMORY[0x1E0C9AAA0];
  v16 = *MEMORY[0x1E0CD6948];
  v29[10] = v15;
  v29[11] = v16;
  v17 = *MEMORY[0x1E0CD6958];
  v30[11] = MEMORY[0x1E0C9AAB0];
  v30[12] = MEMORY[0x1E0C9AAB0];
  v18 = *MEMORY[0x1E0CD6968];
  v29[12] = v17;
  v29[13] = v18;
  v19 = *MEMORY[0x1E0CD6970];
  v30[13] = MEMORY[0x1E0C9AAA0];
  v30[14] = MEMORY[0x1E0C9AAA0];
  v20 = *MEMORY[0x1E0CD6890];
  v29[14] = v19;
  v29[15] = v20;
  -[TKSEPKey accessControl](self, "accessControl");
  v21 = (void *)SecAccessControlCopyData();
  v30[15] = v21;
  v29[16] = *MEMORY[0x1E0CD6BB8];
  -[TKSEPKey objectID](self, "objectID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[16] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  v25 = (id)*MEMORY[0x1E0CD70C0];
  if (-[TKSEPKey systemSessionKey](self, "systemSessionKey") && v25)
  {
    TK_LOG_sepkey();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[TKSEPKey attributes].cold.1((uint64_t)self, (uint64_t)v25, v26);

    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v25);
  }
  v27 = (void *)objc_msgSend(v24, "copy");

  return (NSDictionary *)v27;
}

- (TKSEPKey)initWithAttributes:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD);
  id v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  TKSEPKey *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  TKSEPKey *v61;
  void *v62;
  uint64_t v64;
  _BOOL4 v65;
  uint64_t v66;
  id v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id obja;
  id obj;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[6];
  _QWORD v96[5];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[3];
  uint64_t v117;
  void *v118;
  _BYTE v119[128];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[3];
  uint64_t v131;
  _QWORD v132[3];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[19];

  v65 = a5;
  v137[17] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v68 = a4;
  v107 = 0;
  v108 = &v107;
  v109 = 0x3032000000;
  v110 = __Block_byref_object_copy__1;
  v111 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v112 = (id)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v102 = (id *)&v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__1;
  v105 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v106 = (id)objc_claimAutoreleasedReturnValue();
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  v8 = *MEMORY[0x1E0CD6CC0];
  v136[0] = *MEMORY[0x1E0CD6C98];
  v136[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v137[0] = obja;
  v9 = *MEMORY[0x1E0CD6A00];
  v135[0] = *MEMORY[0x1E0CD69F8];
  v135[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v84;
  v66 = *MEMORY[0x1E0CD6A38];
  v134[0] = *MEMORY[0x1E0CD6A38];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v82;
  v10 = MEMORY[0x1E0C809B0];
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke;
  v96[3] = &unk_1E7089790;
  v96[4] = &v101;
  v80 = (void *)MEMORY[0x1BCCC4AEC](v96);
  v134[2] = v80;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 3);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v79;
  v133[0] = *MEMORY[0x1E0CD6A20];
  v133[1] = &unk_1E7097660;
  v95[0] = v10;
  v95[1] = 3221225472;
  v95[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_20;
  v95[3] = &unk_1E70897B8;
  v95[4] = &v97;
  v95[5] = &v101;
  v78 = (void *)MEMORY[0x1BCCC4AEC](v95);
  v133[2] = v78;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v137[3] = v77;
  v132[0] = *MEMORY[0x1E0CD69A8];
  v132[1] = &unk_1E7097660;
  v94[0] = v10;
  v94[1] = 3221225472;
  v94[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2_21;
  v94[3] = &unk_1E7089790;
  v94[4] = &v97;
  v76 = (void *)MEMORY[0x1BCCC4AEC](v94);
  v132[2] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 3);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v137[4] = v75;
  v131 = *MEMORY[0x1E0CD70D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v137[5] = v74;
  v11 = v108[5];
  v64 = *MEMORY[0x1E0CD6890];
  v130[0] = *MEMORY[0x1E0CD6890];
  v130[1] = v11;
  v93[0] = v10;
  v93[1] = 3221225472;
  v93[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_3;
  v93[3] = &unk_1E7089790;
  v93[4] = &v107;
  v73 = (void *)MEMORY[0x1BCCC4AEC](v93);
  v130[2] = v73;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v137[6] = v72;
  v12 = MEMORY[0x1E0C9AAB0];
  v129[0] = *MEMORY[0x1E0CD69E0];
  v129[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v137[7] = v71;
  v13 = MEMORY[0x1E0C9AAA0];
  v128[0] = *MEMORY[0x1E0CD69C8];
  v128[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v137[8] = v70;
  v127[0] = *MEMORY[0x1E0CD69B8];
  v127[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v137[9] = v14;
  v126[0] = *MEMORY[0x1E0CD6C10];
  v126[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v137[10] = v15;
  v125[0] = *MEMORY[0x1E0CD6950];
  v125[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v137[11] = v16;
  v124[0] = *MEMORY[0x1E0CD6940];
  v124[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v137[12] = v17;
  v123[0] = *MEMORY[0x1E0CD6948];
  v123[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v137[13] = v18;
  v122[0] = *MEMORY[0x1E0CD6958];
  v122[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v137[14] = v19;
  v121[0] = *MEMORY[0x1E0CD6968];
  v121[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v137[15] = v20;
  v120[0] = *MEMORY[0x1E0CD6970];
  v120[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v137[16] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v22;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v90;
    v85 = *MEMORY[0x1E0CB2938];
LABEL_3:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v90 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v25);
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v26, "count") < 2)
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v26, "count") < 3)
      {
        v31 = 0;
        if (v29)
        {
LABEL_11:
          if (v31)
          {
            ((void (**)(_QWORD, void *))v31)[2](v31, v29);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            if (!v32)
              goto LABEL_35;
          }
          else
          {
            if (objc_msgSend(v28, "isEqual:", v29))
              v36 = v28;
            else
              v36 = 0;
            v32 = v36;
            if (!v32)
            {
LABEL_35:
              if (a6)
              {
                v45 = (void *)MEMORY[0x1E0CB35C8];
                v117 = v85;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sepkey: %@ requires '%@' value when present"), v27, v28);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v118 = v46;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, v47);
                *a6 = (id)objc_claimAutoreleasedReturnValue();

              }
              v48 = 0;
              v43 = obj;
              goto LABEL_46;
            }
          }

          goto LABEL_25;
        }
      }
      else
      {
        objc_msgSend(v26, "objectAtIndex:", 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCC4AEC]();

        if (v29)
          goto LABEL_11;
      }
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v28, "isEqual:", v33);

        if ((v34 & 1) == 0)
        {
          if (v31)
          {
            ((void (**)(_QWORD, void *))v31)[2](v31, v28);
            v35 = objc_claimAutoreleasedReturnValue();

            v28 = (void *)v35;
          }
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, v27);
        }
      }
LABEL_25:

      if (v23 == ++v25)
      {
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v119, 16);
        if (v23)
          goto LABEL_3;
        break;
      }
    }
  }

  v37 = v102[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = objc_msgSend(v37, "isEqual:", v38);

  if ((_DWORD)v37)
    objc_storeStrong(v102 + 5, (id)*MEMORY[0x1E0CD6A50]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v102[5], v66);
  v39 = (void *)v108[5];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = objc_msgSend(v39, "isEqual:", v40);

  if ((_DWORD)v39)
  {
    v41 = (id)*MEMORY[0x1E0CD68C0];
    if ((objc_msgSend(v102[5], "isEqual:", *MEMORY[0x1E0CD6A58]) & 1) != 0
      || (objc_msgSend(v102[5], "isEqual:", *MEMORY[0x1E0CD6A80]) & 1) != 0
      || objc_msgSend(v102[5], "isEqual:", *MEMORY[0x1E0CD6A78]))
    {
      v42 = (id)*MEMORY[0x1E0CD68B0];

      v41 = v42;
    }
    v43 = SecAccessControlCreateWithFlags(0, v41, 0, 0);
    v44 = (void *)SecAccessControlCopyData();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, v64);

  }
  else
  {
    v43 = (void *)SecAccessControlCreateFromData();
  }
  v113 = *MEMORY[0x1E0CD6ED0];
  v49 = (void *)MEMORY[0x1E0CB37E8];
  v86 = v113;
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "numberWithBool:", objc_msgSend(v50, "BOOLValue"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v116[0] = v51;
  v114 = *MEMORY[0x1E0CD6F08];
  v52 = (void *)MEMORY[0x1E0CB37E8];
  v83 = v114;
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "numberWithBool:", objc_msgSend(v53, "BOOLValue"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v54;
  v115 = *MEMORY[0x1E0CD6F18];
  v55 = (void *)MEMORY[0x1E0CB37E8];
  v81 = v115;
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "numberWithBool:", objc_msgSend(v56, "BOOLValue"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v116[2] = v57;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, &v113, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v58, "mutableCopy");

  objc_msgSend(v7, "objectForKey:", CFSTR("ECCompactable"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ECCompactable"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v60, CFSTR("ECCompactable"));

  }
  v61 = -[TKSEPKey initWithKeyType:keySize:accessControl:options:authContext:forceSystemSession:error:](self, "initWithKeyType:keySize:accessControl:options:authContext:forceSystemSession:error:", v102[5], v98[3], v43, v27, v68, v65, a6);
  if (-[TKSEPKey accessControl](v61, "accessControl"))
  {
    -[TKSEPKey accessControl](v61, "accessControl");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", SecAccessControlGetProtection(), *MEMORY[0x1E0CD68A0]);
  }
  -[TKSEPKey objectID](v61, "objectID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v62, *MEMORY[0x1E0CD6BB8]);

  if (-[TKSEPKey systemSessionKey](v61, "systemSessionKey"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD70C8]);
  objc_msgSend(v7, "removeObjectForKey:", v86);
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("ECCompactable"));
  objc_msgSend(v7, "removeObjectForKey:", v83);
  objc_msgSend(v7, "removeObjectForKey:", v81);
  v48 = v61;
  self = v48;
LABEL_46:

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);

  _Block_object_dispose(&v107, 8);
  return v48;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (_block_invoke_once != -1)
    dispatch_once(&_block_invoke_once, &__block_literal_global_17);
  if (objc_msgSend((id)_block_invoke_supportedTypes, "containsObject:", v4))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD6A58];
  v5[0] = *MEMORY[0x1E0CD6A50];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0CD6A78];
  v5[2] = *MEMORY[0x1E0CD6A80];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0CD6A88];
  v5[4] = *MEMORY[0x1E0CD6A60];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0CD6A68];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_block_invoke_supportedTypes;
  _block_invoke_supportedTypes = v3;

}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "integerValue");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqual:", *MEMORY[0x1E0CD6A68]);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v4)
  {
    if ((v5 | 0x80) != 0x180)
      goto LABEL_4;
    goto LABEL_6;
  }
  v6 = v3;
  if (v5 != 1024)
  {
    if (v5 != 768)
    {
LABEL_4:
      v6 = 0;
      goto LABEL_7;
    }
LABEL_6:
    v6 = v3;
  }
LABEL_7:
  v7 = v6;

  return v7;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2_21(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a2, "integerValue");
  if (v3 == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return v4;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
}

void __28__TKSEPKey_canUseSEPLocally__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9768000, log, OS_LOG_TYPE_ERROR, "Process has com.apple.keystore.access-keychain-keys entitlement but is missing com.apple.keystore.sik.access entitlement, any attestation attempt will fail", v1, 2u);
}

- (void)initWithObjectID:(uint64_t)a1 authContext:(NSObject *)a2 forceSystemSession:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B9768000, a2, OS_LOG_TYPE_ERROR, "invalid objectID used for SEPKey: %@", (uint8_t *)&v2, 0xCu);
}

- (void)attributes
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138543874;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  v7 = 2114;
  v8 = MEMORY[0x1E0C9AAB0];
  _os_log_debug_impl(&dword_1B9768000, log, OS_LOG_TYPE_DEBUG, "%{public}@ system-session-key detected, returning %{public}@=%{public}@ in key's attributes", (uint8_t *)&v3, 0x20u);
}

@end
