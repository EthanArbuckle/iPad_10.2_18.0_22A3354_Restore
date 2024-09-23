@implementation TKRemoteSEPKey

- (id)signDigest:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__TKRemoteSEPKey_signDigest_error___block_invoke;
  v10[3] = &unk_1E708A1B0;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)withError:(id *)a3 invoke:(id)a4
{
  void (**v5)(id, void *, id *);
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, id *))a4;
  if (withError_invoke__onceToken != -1)
    dispatch_once(&withError_invoke__onceToken, &__block_literal_global_11);
  v6 = 0;
  v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__4;
  v24[3] = __Block_byref_object_dispose__4;
  v25 = 0;
  while (1)
  {
    objc_msgSend((id)withError_invoke__connectionSlot, "resourceWithError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      goto LABEL_16;
    objc_msgSend(v7, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __35__TKRemoteSEPKey_withError_invoke___block_invoke_88;
    v20[3] = &unk_1E708A098;
    v22 = &v23;
    v10 = v8;
    v21 = v10;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(v24[0] + 40);
    *(_QWORD *)(v24[0] + 40) = 0;

    v5[2](v5, v11, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_QWORD *)(v24[0] + 40))
    {

LABEL_15:
      goto LABEL_17;
    }
    TK_LOG_rsepkey();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v6 == 4)
      break;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(v24[0] + 40);
      *(_DWORD *)buf = 67109378;
      v29 = v6;
      v30 = 2114;
      v31 = v16;
      _os_log_debug_impl(&dword_1B9768000, v15, OS_LOG_TYPE_DEBUG, "failed to call remotesepkey, try %d, error %{public}@", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", (double)v6 * 0.1);
    ++v6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[TKRemoteSEPKey withError:invoke:].cold.1((uint64_t)v24, v15);

  if (a3)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *(_QWORD *)(v24[0] + 40);
    v26 = *MEMORY[0x1E0CB3388];
    v27 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -2, v10);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:
  v13 = 0;
LABEL_17:
  _Block_object_dispose(&v23, 8);

  return v13;
}

id __35__TKRemoteSEPKey_signDigest_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteKeyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__TKRemoteSEPKey_signDigest_error___block_invoke_2;
  v13[3] = &unk_1E7089F48;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v5, "signWithKey:digest:authContext:forceSystemSession:reply:", v6, v7, v8, v9, v13);

  v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v10 = (void *)v21[5];
  }
  v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (id)keyID
{
  return self->_keyID;
}

- (BOOL)processServerAtributes:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id keyType;
  void *v9;
  id keySize;
  void *v11;
  NSData *v12;
  NSData *publicKey;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id accessControl;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  id *v25;

  v6 = a3;
  v25 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keyType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  keyType = self->_keyType;
  self->_keyType = v7;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("keySize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  keySize = self->_keySize;
  self->_keySize = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_systemKey = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("publicKey"));
  v12 = (NSData *)objc_claimAutoreleasedReturnValue();
  publicKey = self->_publicKey;
  self->_publicKey = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemSessionKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_forceSystemSession = objc_msgSend(v14, "BOOLValue");

  if (!self->_keyType
    || !self->_keySize
    || (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemKey")),
        (v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v16 = (void *)v15,
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemSessionKey")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    TK_LOG_rsepkey();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[TKRemoteSEPKey processServerAtributes:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -2, 0);
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v21 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessControl"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)SecAccessControlCreateFromData();
  accessControl = self->_accessControl;
  self->_accessControl = v19;

  if (!self->_accessControl)
  {
    TK_LOG_rsepkey();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[TKRemoteSEPKey processServerAtributes:error:].cold.2(&v25, v23);

    goto LABEL_14;
  }
  v21 = 1;
LABEL_15:

  return v21;
}

uint64_t __35__TKRemoteSEPKey_withError_invoke___block_invoke()
{
  uint64_t v0;
  void *v1;
  TKSharedResourceSlot *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF237CF8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)withError_invoke__SEPKeyInterface;
  withError_invoke__SEPKeyInterface = v0;

  v2 = -[TKSharedResourceSlot initWithName:]([TKSharedResourceSlot alloc], "initWithName:", CFSTR("TKRemoteSEPKey-serverConnection"));
  v3 = (void *)withError_invoke__connectionSlot;
  withError_invoke__connectionSlot = (uint64_t)v2;

  objc_msgSend((id)withError_invoke__connectionSlot, "setIdleTimeout:", 60.0);
  objc_msgSend((id)withError_invoke__connectionSlot, "setCreateObjectBlock:", &__block_literal_global_79);
  return objc_msgSend((id)withError_invoke__connectionSlot, "setObjectDestroyedBlock:", &__block_literal_global_87);
}

id __35__TKRemoteSEPKey_withError_invoke___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v3;
  TKClientToken *v4;
  TKClientToken *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  +[TKSEPKey clientToken](TKSEPKey, "clientToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[TKSEPKey clientToken](TKSEPKey, "clientToken");
    v4 = (TKClientToken *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = -[TKClientToken initWithTokenID:]([TKClientToken alloc], "initWithTokenID:", &stru_1E708AD68);
  }
  v5 = v4;
  -[TKClientToken SEPKeyEndpoint](v4, "SEPKeyEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
    objc_msgSend(v7, "setRemoteObjectInterface:", withError_invoke__SEPKeyInterface);
    objc_msgSend(v7, "resume");
    TK_LOG_rsepkey();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_2();
  }
  else
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -2, 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    TK_LOG_rsepkey();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_1();
    v7 = 0;
  }

  return v7;
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_85(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TK_LOG_rsepkey();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __35__TKRemoteSEPKey_withError_invoke___block_invoke_85_cold_1();

  objc_msgSend(v2, "invalidate");
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_88(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (objc_msgSend(v6, "code") == 4099)
  {
    objc_msgSend(v6, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  id v11;
  id v12;
  id *v13;
  id *v14;
  TKBERTLVRecord *v15;
  void *v16;
  TKBERTLVRecord *v17;
  uint64_t v18;
  id v19;
  id *v20;
  void *v21;
  id *v22;
  _QWORD v24[4];
  id *v25;
  id v26;
  BOOL v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TKRemoteSEPKey;
  v13 = -[TKSEPKey _initWithAuthContext:](&v28, sel__initWithAuthContext_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 8, a3);
    v15 = [TKBERTLVRecord alloc];
    objc_msgSend(v14, "keyID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TKBERTLVRecord initWithPropertyList:](v15, "initWithPropertyList:", v16);
    -[TKTLVRecord data](v17, "data");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v14[9];
    v14[9] = (id)v18;

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke;
    v24[3] = &unk_1E708A0E8;
    v20 = v14;
    v25 = v20;
    v26 = v12;
    v27 = a5;
    objc_msgSend(v20, "withError:invoke:", a6, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21 || !objc_msgSend(v20, "processServerAtributes:error:", v21, a6))
    {

      v22 = 0;
      goto LABEL_7;
    }

  }
  v22 = v14;
LABEL_7:

  return v22;
}

id __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v8 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke_2;
  v12[3] = &unk_1E708A0C0;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v5, "getAttributesOfKey:authContext:forceSystemSession:reply:", v7, v6, v8, v12);
  v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = (void *)v20[5];
  }
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t, void *, _QWORD *);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  int64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  objc_super v44;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)TKRemoteSEPKey;
  v17 = -[TKSEPKey _initWithAuthContext:](&v44, sel__initWithAuthContext_, v16);
  if (!v17)
    goto LABEL_6;
  v18 = (void *)SecAccessControlCopyData();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4;
  v42 = __Block_byref_object_dispose__4;
  v43 = 0;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke;
  v29 = &unk_1E708A138;
  v30 = v14;
  v36 = a4;
  v19 = v18;
  v31 = v19;
  v32 = v15;
  v33 = v16;
  v37 = a8;
  v20 = v17;
  v34 = v20;
  v35 = &v38;
  objc_msgSend(v20, "withError:invoke:", a9, &v26);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v20[8];
  v20[8] = v21;

  v23 = v20[8]
      ? objc_msgSend(v20, "processServerAtributes:error:", v39[5], a9, v26, v27, v28, v29, v30, v31, v32, v33)
      : 0;

  _Block_object_dispose(&v38, 8);
  if (!v23)
    v24 = 0;
  else
LABEL_6:
    v24 = v17;

  return v24;
}

id __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(unsigned __int8 *)(a1 + 88);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke_2;
  v17[3] = &unk_1E708A110;
  v19 = &v28;
  v20 = &v22;
  v12 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v18 = v12;
  v21 = v13;
  objc_msgSend(v5, "generateKeyType:keySize:accessControl:options:authContext:forceSystemSession:reply:", v7, v6, v8, v9, v10, v11, v17);
  v14 = (void *)v29[5];
  if (a3 && !v14)
  {
    *a3 = objc_retainAutorelease((id)v23[5]);
    v14 = (void *)v29[5];
  }
  v15 = v14;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  if (v14)
  {
    +[TKTLVRecord recordFromData:](TKBERTLVRecord, "recordFromData:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyList");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_storeStrong((id *)(a1[4] + 72), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }

}

- (id)keyType
{
  return self->_keyType;
}

- (id)keySize
{
  return self->_keySize;
}

- (BOOL)systemKey
{
  return self->_systemKey;
}

- (BOOL)systemSessionKey
{
  return self->_forceSystemSession;
}

- (id)publicKeyWithError:(id *)a3
{
  return self->_publicKey;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)self->_accessControl;
}

- (BOOL)deleteWithError:(id *)a3
{
  void *v3;
  char v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__TKRemoteSEPKey_deleteWithError___block_invoke;
  v6[3] = &unk_1E708A188;
  v6[4] = self;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a3, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

id __34__TKRemoteSEPKey_deleteWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteKeyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__TKRemoteSEPKey_deleteWithError___block_invoke_2;
  v12[3] = &unk_1E708A160;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v5, "deleteKey:authContext:forceSystemSession:reply:", v6, v7, v8, v12);

  v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = (void *)v20[5];
  }
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __34__TKRemoteSEPKey_deleteWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
    v6 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v6 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __35__TKRemoteSEPKey_signDigest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke;
  v10[3] = &unk_1E708A1B0;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteKeyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke_2;
  v13[3] = &unk_1E7089F48;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v5, "computeSharedSecretWithKey:publicKey:authContext:forceSystemSession:reply:", v6, v7, v8, v9, v13);

  v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v10 = (void *)v21[5];
  }
  v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke;
  v14[3] = &unk_1E708A1D8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a5, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteKeyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke_2;
  v14[3] = &unk_1E7089F48;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v5, "recryptWithKey:data:attributes:authContext:forceSystemSession:reply:", v6, v8, v7, v9, v10, v14);

  v11 = (void *)v22[5];
  if (a3 && !v11)
  {
    *a3 = objc_retainAutorelease((id)v16[5]);
    v11 = (void *)v22[5];
  }
  v12 = v11;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke;
  v10[3] = &unk_1E708A1B0;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteKeyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke_2;
  v13[3] = &unk_1E7089F48;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v5, "decapsulateWithKey:encapsulatedKey:authContext:forceSystemSession:reply:", v6, v7, v8, v9, v13);

  v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v10 = (void *)v21[5];
  }
  v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKRemoteSEPKey.m"), 274, CFSTR("attempt to perform attestation with mixed local/remote keys"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke;
  v17[3] = &unk_1E708A1D8;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v12 = v10;
  v13 = v11;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a5, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteKeyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "remoteKeyID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 56);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke_2;
  v15[3] = &unk_1E7089F48;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v5, "attestWithKey:keyToAttest:nonce:authContext:forceSystemSessionAttestingKey:forceSystemSessionKeyToAttest:reply:", v6, v7, v8, v9, v10, v11, v15);

  v12 = (void *)v23[5];
  if (a3 && !v12)
  {
    *a3 = objc_retainAutorelease((id)v17[5]);
    v12 = (void *)v23[5];
  }
  v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  void *v4;
  char v5;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke;
  v7[3] = &unk_1E708A200;
  v7[4] = self;
  v7[5] = a3;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

id __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remoteKeyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke_2;
  v13[3] = &unk_1E708A160;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v5, "lifetimeControlKey:type:authContext:forceSystemSession:reply:", v6, v7, v8, v9, v13);

  v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v10 = (void *)v21[5];
  }
  v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (a2)
    v6 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v6 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (NSData)remoteKeyID
{
  return self->_remoteKeyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteKeyID, 0);
  objc_storeStrong(&self->_keyID, 0);
  objc_storeStrong(&self->_accessControl, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong(&self->_keySize, 0);
  objc_storeStrong(&self->_keyType, 0);
}

- (void)processServerAtributes:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_1B9768000, v0, OS_LOG_TYPE_FAULT, "got invalid serverAttributes for key", v1, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)processServerAtributes:(_QWORD *)a1 error:(NSObject *)a2 .cold.2(_QWORD **a1, NSObject *a2)
{
  _QWORD *v2;
  int v3;
  _QWORD *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  if (*a1)
    v2 = (_QWORD *)*v2;
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_1B9768000, a2, OS_LOG_TYPE_FAULT, "unable to deserialize accessControl, error %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)withError:(uint64_t)a1 invoke:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B9768000, a2, OS_LOG_TYPE_ERROR, "failed to call remotesepkey repeatedly, giving up, error: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_1B9768000, v0, OS_LOG_TYPE_ERROR, "unable to get endpoint", v1, 2u);
  OUTLINED_FUNCTION_8();
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "creating rsepkey xpc connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_85_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "invalidating rsepkey xpc connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
