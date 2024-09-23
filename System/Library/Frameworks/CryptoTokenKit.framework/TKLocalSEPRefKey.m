@implementation TKLocalSEPRefKey

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int type;
  NSObject *v27;
  id v28;
  NSObject *v29;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  _BYTE buf[12];
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v8 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = -[TKLocalSEPKey _initWithAuthContext:caller:](self, "_initWithAuthContext:caller:", a4, a5);
  if (v13)
  {
    v14 = v12;
    objc_msgSend((id)objc_opt_class(), "keybagHandleForceSystemSession:", v8);
    v15 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "bytes");
    objc_msgSend(v15, "length");
    v16 = aks_ref_key_create_with_blob();
    if ((_DWORD)v16)
    {
      v17 = v16;
      TK_LOG_sepkey_0();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "callerName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v34;
        v38 = 1024;
        v39 = v17;
        v40 = 2114;
        v41 = v15;
        _os_log_error_impl(&dword_1B9768000, v18, OS_LOG_TYPE_ERROR, "objectID from %{public}@ contains invalid refkey (err: %d) data:%{public}@", buf, 0x1Cu);

      }
      objc_msgSend(v13, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a7, v17, 0, 0, 0, CFSTR("objectID contains invalid refkey data"));
      goto LABEL_18;
    }
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", aks_ref_key_get_external_data(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[TKTLVRecord recordFromData:](TKBERTLVRecord, "recordFromData:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "propertyList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("acl"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)SecAccessControlCreate();
    objc_msgSend(v13, "setSac:", v23);

    v24 = (void *)objc_opt_class();
    objc_msgSend(v24, "protectionForKeyClass:", aks_ref_key_get_key_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessControl");
    if ((SecAccessControlSetProtection() & 1) == 0)
    {
      TK_LOG_sepkey_0();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:].cold.3();
      goto LABEL_16;
    }
    if (v22)
    {
      objc_msgSend(v13, "accessControl");
      SecAccessControlSetConstraints();
    }
    type = aks_ref_key_get_type();
    if ((type - 3) >= 8)
    {
      v31 = type;
      if (type != 1)
      {
        TK_LOG_sepkey_0();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:].cold.2(v13, v31, v32);

        if (!a7)
          goto LABEL_17;
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2938];
        v36 = CFSTR("objectID contains invalid key type");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, v29);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:
LABEL_18:

        v28 = 0;
        goto LABEL_19;
      }
    }

  }
  TK_LOG_sepkey_0();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:].cold.1(v13);

  v28 = v13;
LABEL_19:

  return v28;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;

  v6 = a3;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "ACMHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v11 = objc_retainAutorelease(v6);
    objc_msgSend(v11, "bytes");
    objc_msgSend(v11, "length");
    v12 = aks_ref_key_sign();
    if ((_DWORD)v12)
    {
      v13 = v12;
      objc_msgSend(v8, "ACMHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a4, v13, v14, CFSTR("osgn"), v10, CFSTR("unable to sign digest"));
      v15 = 0;
    }
    else
    {
      TK_LOG_sepkey_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[TKLocalSEPRefKey signDigest:error:].cold.1();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[TKTLVRecord recordFromData:](TKBERTLVRecord, "recordFromData:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_AKSRefKey)
    aks_ref_key_free();
  v3.receiver = self;
  v3.super_class = (Class)TKLocalSEPRefKey;
  -[TKLocalSEPRefKey dealloc](&v3, sel_dealloc);
}

- (id)objectID
{
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", aks_ref_key_get_blob(), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  unsigned int handle;
  const char *v4;
  unint64_t debugID;
  const char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_AKSRefKey)
  {
    handle = aks_ref_key_get_handle();
    if (handle != 0 && handle < 0xFFFFFFFA)
      v4 = "";
    else
      v4 = (&off_1E7089E68)[handle + 6];
    v7 = aks_ref_key_get_type() - 1;
    if (v7 > 9)
      v6 = "*";
    else
      v6 = off_1E7089EA0[v7];
    debugID = self->_debugID;
    if (!debugID)
    {
      v10 = 0;
      aks_ref_key_get_public_key();
      v11 = 0;
      v12 = 0;
      LODWORD(v13) = 0;
      ccsha1_di();
      ccdigest();
      v8 = 0;
      debugID = 0;
      do
        debugID = *((unsigned __int8 *)&v11 + v8++) | (debugID << 8);
      while (v8 != 8);
      self->_debugID = debugID;
    }
  }
  else
  {
    debugID = self->_debugID;
    v6 = "*";
    v4 = "";
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<sepk:%s%s kid=%016llx>"), v6, v4, debugID, v10, v11, v12, v13, v14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keySize
{
  unsigned int v2;

  v2 = aks_ref_key_get_type() - 1;
  if (v2 > 9)
    return &unk_1E7097768;
  else
    return (id)qword_1E7089EF0[v2];
}

- (id)keyType
{
  uint64_t type;
  id *v5;
  void *v6;
  __CFString *v7;
  char options;

  type = aks_ref_key_get_type();
  switch((int)type)
  {
    case 1:
      v5 = (id *)MEMORY[0x1E0CD6A88];
      goto LABEL_10;
    case 3:
      v5 = (id *)MEMORY[0x1E0CD6A60];
      goto LABEL_10;
    case 4:
    case 7:
      v5 = (id *)MEMORY[0x1E0CD6A50];
      goto LABEL_10;
    case 5:
    case 8:
      v5 = (id *)MEMORY[0x1E0CD6A58];
      goto LABEL_10;
    case 6:
      options = aks_ref_key_get_options();
      v5 = (id *)MEMORY[0x1E0CD6A80];
      if ((options & 0x40) != 0)
        v5 = (id *)MEMORY[0x1E0CD6A78];
      goto LABEL_10;
    case 9:
    case 10:
      v5 = (id *)MEMORY[0x1E0CD6A68];
LABEL_10:
      v7 = (__CFString *)*v5;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKLocalSEPKey.m"), 865, CFSTR("Unexpected aks_key_type %d"), type);

      v7 = &stru_1E708AD68;
      break;
  }
  return v7;
}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TKBERTLVRecord *v25;
  void *v26;
  TKBERTLVRecord *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  NSObject *v43;
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  v17 = -[TKLocalSEPKey _initWithAuthContext:caller:](self, "_initWithAuthContext:caller:", a7, a8);
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "authContextWithError:", a10);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
LABEL_24:
      v42 = 0;
      goto LABEL_29;
    }
    v20 = (void *)v19;
    if ((objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD6A80]) & 1) == 0
      && (objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD6A78]) & 1) == 0
      && !objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD6A58])
      && (objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD6A60]) & 1) == 0
      && (objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD6A88]) & 1) == 0)
    {
      objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD6A68]);
    }
    objc_msgSend(v18, "setSac:", a5);
    v21 = (void *)objc_opt_class();
    objc_msgSend(v18, "accessControl");
    objc_msgSend(v21, "keyClassForProtection:", SecAccessControlGetProtection());
    objc_msgSend(v20, "ACMHandle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parametersWithACMHandle:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "accessControl"))
    {
      objc_msgSend(v18, "accessControl");
      SecAccessControlGetConstraints();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = [TKBERTLVRecord alloc];
        v45 = CFSTR("acl");
        v46[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[TKBERTLVRecord initWithPropertyList:](v25, "initWithPropertyList:", v26);
        -[TKTLVRecord data](v27, "data");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setData:forKey:", v28, 2);
      }

    }
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6ED0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if (v30)
      v31 = 4;
    else
      v31 = 0;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ECCompactable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "BOOLValue");

    if (v33)
      v31 |= 0x10uLL;
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6F08]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    v36 = v31 | v35;
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6F18]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");

    if (v38)
      v39 = v36 | 0x100;
    else
      v39 = v36;
    if (objc_msgSend(v15, "isEqual:", *MEMORY[0x1E0CD6A78]))
      v40 = v39 | 0x40;
    else
      v40 = v39;
    if (v40)
      objc_msgSend(v23, "setNumber:forKey:", v40, 9);
    objc_msgSend((id)objc_opt_class(), "keybagHandleForceSystemSession:", a9);
    objc_msgSend(v23, "bytes");
    objc_msgSend(v23, "length");
    v41 = aks_ref_key_create();
    if ((_DWORD)v41)
    {
      v18[6] = 0;
      objc_msgSend(v18, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a10, v41, 0, 0, v23, CFSTR("unable to generate key"));

      goto LABEL_24;
    }

  }
  TK_LOG_sepkey_0();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    -[TKLocalSEPRefKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:].cold.1(v18);

  v42 = v18;
LABEL_29:

  return v42;
}

- (BOOL)systemSessionKey
{
  return aks_ref_key_get_handle() == -6;
}

- (BOOL)deleteWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "ACMHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bytes");
    objc_msgSend(v8, "length");
    v9 = aks_ref_key_delete();
    v10 = v9;
    if ((_DWORD)v9 != -536363001)
    {
      if (!(_DWORD)v9)
      {
LABEL_8:
        TK_LOG_sepkey_0();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[TKLocalSEPRefKey deleteWithError:].cold.1();

        v13 = 1;
        goto LABEL_13;
      }
      if ((_DWORD)v9 != -536362989)
      {
        objc_msgSend(v6, "ACMHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a3, v10, v14, CFSTR("odel"), v8, CFSTR("unable to delete key"));

        v13 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    TK_LOG_sepkey_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109120;
      v16[1] = v10;
      _os_log_impl(&dword_1B9768000, v11, OS_LOG_TYPE_DEFAULT, "detected error %08x while deleting refkey, ignoring this error", (uint8_t *)v16, 8u);
    }

    goto LABEL_8;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)publicKeyWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", aks_ref_key_get_public_key(), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;

  v6 = a3;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "ACMHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v11 = objc_retainAutorelease(v6);
    objc_msgSend(v11, "bytes");
    objc_msgSend(v11, "length");
    v12 = aks_ref_key_compute_key();
    if ((_DWORD)v12)
    {
      v13 = v12;
      objc_msgSend(v8, "ACMHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a4, v13, v14, CFSTR("ock"), v10, CFSTR("unable to compute shared secret"));
      v15 = 0;
    }
    else
    {
      TK_LOG_sepkey_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[TKLocalSEPRefKey computeSharedSecret:error:].cold.1();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[TKTLVRecord recordFromData:](TKBERTLVRecord, "recordFromData:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6ED8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v8;
      objc_msgSend(v10, "ACMHandle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *MEMORY[0x1E0CD6F00];
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6F00]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v13, "setData:forKey:", v15, 10);
      v47 = v11;
      v16 = *MEMORY[0x1E0CD6EE8];
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6EE8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v13, "setData:forKey:", v17, 11);
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6EE0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v14);
      v19 = objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend(v13, "setData:forKey:", v19, 12);
      v45 = (void *)v19;
      objc_msgSend(v18, "objectForKeyedSubscript:", v16);
      v20 = objc_claimAutoreleasedReturnValue();

      if (v20)
        objc_msgSend(v13, "setData:forKey:", v20, 13);
      v43 = (void *)v20;
      v21 = *MEMORY[0x1E0CD6EF0];
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6EF0]);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (void *)v22;
      else
        v24 = &unk_1E7097780;
      v25 = v24;

      objc_msgSend(v18, "objectForKeyedSubscript:", v21);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v26)
        v28 = (void *)v26;
      else
        v28 = &unk_1E7097780;
      v29 = v28;

      v44 = v25;
      if (objc_msgSend(v25, "integerValue") == 128 && objc_msgSend(v29, "integerValue") == 128)
      {
        v30 = v29;
        v48 = 0;
        v49 = 0;
        objc_msgSend(v13, "bytes");
        objc_msgSend(v13, "length");
        v31 = objc_retainAutorelease(v47);
        objc_msgSend(v31, "bytes");
        objc_msgSend(v31, "length");
        v8 = v46;
        v32 = objc_retainAutorelease(v46);
        objc_msgSend(v32, "bytes");
        objc_msgSend(v32, "length");
        v33 = aks_ref_key_ecies_transcode();
        if ((_DWORD)v33)
        {
          v34 = v33;
          objc_msgSend(v10, "ACMHandle", &v48);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a5, v34, v35, CFSTR("oect"), v13, CFSTR("unable to recrypt"));

          v36 = 0;
        }
        else
        {
          TK_LOG_sepkey_0();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            -[TKLocalSEPRefKey recryptData:attributes:error:].cold.1();

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v49, v48, &v48);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v40 = v45;
        v29 = v30;
      }
      else
      {
        v8 = v46;
        if (a5)
        {
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v50 = *MEMORY[0x1E0CB2938];
          v51 = CFSTR("Bad kSecKeyEncryptionParameterSymmetricKeySizeInBits - if present, must be set to 128 for both input and output crypto operation");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, v39);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v36 = 0;
        v40 = v45;
      }

      v11 = v47;
    }
    else
    {
      if (!a5)
      {
        v36 = 0;
LABEL_34:

        goto LABEL_35;
      }
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2938];
      v53[0] = CFSTR("Bad or missing kSecKeyEncryptionParameterRecryptCertificate");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, v13);
      v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_34;
  }
  v36 = 0;
LABEL_35:

  return v36;
}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "ACMHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v11 = objc_retainAutorelease(v6);
    objc_msgSend(v11, "bytes");
    objc_msgSend(v11, "length");
    v12 = aks_ref_key_decapsulate();
    if ((_DWORD)v12)
    {
      v13 = v12;
      objc_msgSend(v8, "ACMHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a4, v13, v14, CFSTR("okd"), v10, CFSTR("unable to decapsulate shared key"));

      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v23;
  uint8_t buf[4];
  TKLocalSEPRefKey *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[TKLocalSEPKey callerHasEntitlement:error:](self, "callerHasEntitlement:error:", CFSTR("com.apple.security.attestation.access"), a5))
  {
    -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      v18 = 0;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v10, "ACMHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v13, "setData:forKey:", v9, 4);
    v14 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "bytes");
      objc_msgSend(v13, "length");
      v15 = aks_ref_key_attest();
      TK_LOG_sepkey_0();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138544130;
        v25 = self;
        v26 = 2112;
        v27 = v13;
        v28 = 2114;
        v29 = v14;
        v30 = 1024;
        v31 = v15;
        _os_log_debug_impl(&dword_1B9768000, v16, OS_LOG_TYPE_DEBUG, "aks_ref_key_attest(%{public}@, %@, attested: %{public}@) -> %08x", buf, 0x26u);
      }

      if (!(_DWORD)v15)
      {
        TK_LOG_sepkey_0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[TKLocalSEPRefKey attestKey:nonce:error:].cold.1();

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      objc_msgSend(v11, "ACMHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a5, v15, v17, CFSTR("oa"), v13, CFSTR("unable to attest refkey->refkey"));

    }
    else
    {
      if (a5)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0CB2938];
        v33[0] = CFSTR("unsuitable key for attesting");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, v20);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      TK_LOG_sepkey_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[TKLocalSEPRefKey attestKey:nonce:error:].cold.2();

    }
    v18 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v18 = 0;
LABEL_20:

  return v18;
}

- (aks_ref_key_s)AKSRefKey
{
  return self->_AKSRefKey;
}

- (void)_initWithObjectID:(void *)a1 authContext:caller:forceSystemSession:error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "callerName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7_0(&dword_1B9768000, v2, v3, "%{public}@ parsed for %{public}@ from objectID: ACL=%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)_initWithObjectID:(NSObject *)a3 authContext:caller:forceSystemSession:error:.cold.2(void *a1, int a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "callerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_1B9768000, a3, OS_LOG_TYPE_ERROR, "Request from %{public}@ for key with objectID containing invalid key type (%d)", v6, 0x12u);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithObjectID:authContext:caller:forceSystemSession:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1B9768000, v1, OS_LOG_TYPE_ERROR, "Failed to set protection %{public}@ for ACL (error: %{public}@)", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_initWithKeyType:(void *)a1 keySize:accessControl:options:authContext:caller:forceSystemSession:error:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "callerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0(&dword_1B9768000, v1, v2, "%{public}@ generated for %{public}@: ACL=%{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_4_1();
}

- (void)deleteWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: deleted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)signDigest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: signed digest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)computeSharedSecret:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: computed shared secret", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)recryptData:attributes:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: recrypted data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)attestKey:nonce:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_6_2(&dword_1B9768000, v0, v1, "%{public}@: attested key %{public}@");
  OUTLINED_FUNCTION_4();
}

- (void)attestKey:nonce:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1B9768000, v0, v1, "Only refkeys can be attested by refkey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
