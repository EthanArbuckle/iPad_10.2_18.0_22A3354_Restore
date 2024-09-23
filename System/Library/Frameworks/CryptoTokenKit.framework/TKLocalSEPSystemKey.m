@implementation TKLocalSEPSystemKey

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 isIDUnknown:(BOOL *)a6 error:(id *)a7
{
  id v12;
  int *v13;
  int *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v31;
  int v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = -[TKLocalSEPKey _initWithAuthContext:caller:](self, "_initWithAuthContext:caller:", a4, a5);
  if (!v13)
    goto LABEL_19;
  objc_msgSend((id)objc_opt_class(), "initSystemKeyIDs");
  v14 = v13 + 10;
  v13[10] = 15;
  if (objc_msgSend(v12, "isEqualToData:", sikData))
  {
    v15 = 1;
LABEL_4:
    *v14 = v15;
    v13[11] = v15;
    goto LABEL_12;
  }
  if (objc_msgSend(v12, "isEqualToData:", gidData))
  {
    v16 = 3;
LABEL_7:
    *v14 = v16;
    v17 = 1;
LABEL_11:
    v13[11] = v17;
    goto LABEL_12;
  }
  if (objc_msgSend(v12, "isEqualToData:", proposedUikData))
  {
    v18 = 2;
LABEL_10:
    *v14 = v18;
    v17 = 3;
    goto LABEL_11;
  }
  if (objc_msgSend(v12, "isEqualToData:", committedUikData))
  {
    v15 = 2;
    goto LABEL_4;
  }
  if (objc_msgSend(v12, "isEqualToData:", proposedOikData))
  {
    v18 = 6;
    goto LABEL_10;
  }
  if (objc_msgSend(v12, "isEqualToData:", committedOikData))
  {
    v31 = 6;
    goto LABEL_36;
  }
  if (objc_msgSend(v12, "isEqualToData:", proposedDakData))
  {
    v18 = 9;
    goto LABEL_10;
  }
  if (objc_msgSend(v12, "isEqualToData:", committedDakData))
  {
    v31 = 9;
    goto LABEL_36;
  }
  if (objc_msgSend(v12, "isEqualToData:", proposedHavenData))
  {
    *v14 = 7;
    v32 = 3;
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToData:", committedHavenData))
    {
      if (objc_msgSend(v12, "isEqualToData:", proposedSDakData))
      {
        v18 = 10;
        goto LABEL_10;
      }
      if (!objc_msgSend(v12, "isEqualToData:", committedSDakData))
      {
        if (!objc_msgSend(v12, "isEqualToData:", dcikData))
        {
          v26 = 0;
          *a6 = 1;
          goto LABEL_29;
        }
        v16 = 14;
        goto LABEL_7;
      }
      v31 = 10;
LABEL_36:
      *v14 = v31;
      v17 = 2;
      goto LABEL_11;
    }
    *v14 = 7;
    v32 = 2;
  }
  v13[11] = v32;
LABEL_12:
  if (*v14 == 7)
    v19 = CFSTR("com.apple.private.playgrounds-local-signing-allowed");
  else
    v19 = CFSTR("com.apple.security.attestation.access");
  if (!objc_msgSend(v13, "callerHasEntitlement:error:", v19, a7))
    goto LABEL_28;
  objc_msgSend(v13, "authContextWithError:", a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_27:

LABEL_28:
    v26 = 0;
    goto LABEL_29;
  }
  v21 = objc_opt_class();
  v22 = *v14;
  objc_msgSend(v20, "ACMHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend((id)v21, "hasSystemKey:ACMHandle:", v22, v23);

  if ((v21 & 1) == 0)
  {
    if (a7)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2938];
      v34[0] = CFSTR("Requested system key not supported by the platform");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, v28);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    TK_LOG_sepkey_0();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[TKLocalSEPSystemKey _initWithObjectID:authContext:caller:isIDUnknown:error:].cold.2(v13, (uint64_t)(v13 + 10), v29);

    goto LABEL_27;
  }
  v24 = (void *)SecAccessControlCreate();
  objc_msgSend(v13, "setSac:", v24);

  objc_msgSend(v13, "accessControl");
  SecAccessControlSetProtection();
  objc_msgSend(v13, "accessControl");
  SecAccessControlAddConstraintForOperation();

LABEL_19:
  TK_LOG_sepkey_0();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:].cold.1(v13);

  v26 = v13;
LABEL_29:

  return v26;
}

+ (void)initSystemKeyIDs
{
  if (initSystemKeyIDs_onceToken != -1)
    dispatch_once(&initSystemKeyIDs_onceToken, &__block_literal_global_275);
}

void __39__TKLocalSEPSystemKey_initSystemKeyIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.sik", 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sikData;
  sikData = v0;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.gid", 21);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gidData;
  gidData = v2;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.uikp", 22);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)proposedUikData;
  proposedUikData = v4;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.uikc", 22);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)committedUikData;
  committedUikData = v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.oikp", 22);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)proposedOikData;
  proposedOikData = v8;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.oikc", 22);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)committedOikData;
  committedOikData = v10;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.dakp", 22);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)proposedDakData;
  proposedDakData = v12;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.dakc", 22);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)committedDakData;
  committedDakData = v14;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.havenp", 24);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)proposedHavenData;
  proposedHavenData = v16;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.havenc", 24);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)committedHavenData;
  committedHavenData = v18;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.sdakp", 23);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)proposedSDakData;
  proposedSDakData = v20;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.sdakc", 23);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)committedSDakData;
  committedSDakData = v22;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "com.apple.setoken.dcik", 22);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)dcikData;
  dcikData = v24;

}

+ (BOOL)hasSystemKey:(unsigned int)a3 ACMHandle:(id)a4
{
  id v5;
  BOOL v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  TKAKSParameters *v11;
  NSObject *v12;
  int v13;

  v5 = a4;
  v6 = 0;
  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x4684) != 0)
    {
      v7 = hasSystemKey_ACMHandle__supported[a3];
      if (!v7)
      {
        v8 = aks_system_key_collection();
        v9 = v8;
        if (a3 != 14 && v8)
          v9 = aks_system_key_collection();
        if (v9)
        {
          TK_LOG_sepkey_0();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            +[TKLocalSEPSystemKey hasSystemKey:ACMHandle:].cold.1();

          v7 = -1;
        }
        else
        {
          free(0);
          v7 = 1;
        }
        hasSystemKey_ACMHandle__supported[a3] = v7;
      }
LABEL_21:
      v6 = v7 > 0;
      goto LABEL_22;
    }
    if (((1 << a3) & 0xA) != 0)
    {
      v6 = 1;
    }
    else if (a3 == 6)
    {
      v7 = hasSystemKey_ACMHandle__supported_276;
      if (!hasSystemKey_ACMHandle__supported_276)
      {
        v11 = objc_alloc_init(TKAKSParameters);
        -[TKAKSParameters setData:forKey:](v11, "setData:forKey:", v5, 3);
        -[TKAKSParameters bytes](v11, "bytes", 0);
        -[TKAKSParameters length](v11, "length");
        if (aks_system_key_collection())
        {
          TK_LOG_sepkey_0();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            +[TKLocalSEPSystemKey hasSystemKey:ACMHandle:].cold.2();

          v13 = -1;
        }
        else
        {
          free(0);
          v13 = 1;
        }
        hasSystemKey_ACMHandle__supported_276 = v13;

        v7 = hasSystemKey_ACMHandle__supported_276;
      }
      goto LABEL_21;
    }
  }
LABEL_22:

  return v6;
}

- (id)objectID
{
  void *v3;
  void *v4;
  unsigned int AKSSystemKeyGeneration;
  uint64_t *v6;
  uint64_t *v7;
  void **v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_AKSSystemKeyType)
  {
    case 1u:
      v4 = (void *)sikData;
      goto LABEL_13;
    case 2u:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v6 = &proposedUikData;
      v7 = &committedUikData;
      goto LABEL_9;
    case 3u:
      v4 = (void *)gidData;
      goto LABEL_13;
    case 6u:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v6 = &proposedOikData;
      v7 = &committedOikData;
      goto LABEL_9;
    case 7u:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v6 = &proposedHavenData;
      v7 = &committedHavenData;
      goto LABEL_9;
    case 9u:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v6 = &proposedDakData;
      v7 = &committedDakData;
      goto LABEL_9;
    case 0xAu:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v6 = &proposedSDakData;
      v7 = &committedSDakData;
LABEL_9:
      if (AKSSystemKeyGeneration == 3)
        v8 = (void **)v6;
      else
        v8 = (void **)v7;
      v4 = *v8;
      goto LABEL_13;
    case 0xEu:
      v4 = (void *)dcikData;
LABEL_13:
      v9 = v4;

      v3 = v9;
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)keyType
{
  return (id)*MEMORY[0x1E0CD6A80];
}

- (id)keySize
{
  if (self->_AKSSystemKeyType == 7)
    return &unk_1E7097750;
  else
    return &unk_1E7097738;
}

- (BOOL)systemKey
{
  return 1;
}

- (BOOL)systemSessionKey
{
  return 1;
}

- (id)description
{
  uint64_t v3;
  unint64_t v4;
  uint64_t AKSSystemKeyType;
  __CFString *v6;
  unsigned int AKSSystemKeyGeneration;
  const __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  _QWORD v14[2];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_debugID && !aks_system_key_get_public())
  {
    v14[0] = 0;
    v14[1] = 0;
    v15 = 0;
    ccsha1_di();
    ccdigest();
    free(0);
    v3 = 0;
    v4 = 0;
    do
      v4 = *((unsigned __int8 *)v14 + v3++) | (v4 << 8);
    while (v3 != 8);
    self->_debugID = v4;
  }
  AKSSystemKeyType = self->_AKSSystemKeyType;
  v6 = CFSTR("sik");
  switch((int)AKSSystemKeyType)
  {
    case 1:
      goto LABEL_19;
    case 2:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v8 = CFSTR("uik-c");
      v9 = CFSTR("uik-p");
      goto LABEL_14;
    case 3:
      v6 = CFSTR("gid");
      goto LABEL_19;
    case 6:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v8 = CFSTR("oik-c");
      v9 = CFSTR("oik-p");
      goto LABEL_14;
    case 7:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v8 = CFSTR("haven-c");
      v9 = CFSTR("haven-p");
      goto LABEL_14;
    case 9:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v8 = CFSTR("dak-c");
      v9 = CFSTR("dak-p");
      goto LABEL_14;
    case 10:
      AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
      v8 = CFSTR("sdak-c");
      v9 = CFSTR("sdak-p");
LABEL_14:
      if (AKSSystemKeyGeneration == 3)
        v11 = (__CFString *)v9;
      else
        v11 = (__CFString *)v8;
      v10 = v11;
      goto LABEL_18;
    case 14:
      v6 = CFSTR("dcik");
      goto LABEL_19;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UNKNOWN!%d(%d)"), AKSSystemKeyType, self->_AKSSystemKeyGeneration);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v6 = v10;
LABEL_19:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<sepk:%@ kid=%016llx>"), v6, self->_debugID);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
  }
}

- (id)publicKeyWithError:(id *)a3
{
  uint64_t v5;
  void *v7;
  NSObject *v8;

  v5 = aks_system_key_get_public();
  if ((_DWORD)v5)
  {
    -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a3, v5, 0, 0, 0, CFSTR("unable to get public key"));
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TK_LOG_sepkey_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[TKLocalSEPSystemKey publicKeyWithError:].cold.1();

    return v7;
  }
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
  id v18;

  v6 = a3;
  if (self->_AKSSystemKeyType == 7
    && !-[TKLocalSEPKey callerHasEntitlement:error:](self, "callerHasEntitlement:error:", CFSTR("com.apple.private.playgrounds-local-signing-allowed"), a4))
  {
    v15 = 0;
  }
  else
  {
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
      v18 = v6;
      v11 = objc_retainAutorelease(v6);
      objc_msgSend(v11, "bytes");
      objc_msgSend(v11, "length");
      v12 = aks_system_key_sign();
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
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v6 = v18;

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int AKSSystemKeyType;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  unsigned int AKSSystemKeyGeneration;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  NSObject *v27;
  int isa;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  int v35;
  int isa_high;
  int v37;
  int v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  uint8_t buf[4];
  _BYTE v44[10];
  _BYTE v45[10];
  _BYTE v46[10];
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (-[TKLocalSEPKey callerHasEntitlement:error:](self, "callerHasEntitlement:error:", CFSTR("com.apple.security.attestation.access"), a5))
  {
    -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      v20 = 0;
LABEL_50:

      goto LABEL_51;
    }
    objc_msgSend(v11, "ACMHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v14, "setData:forKey:", v10, 4);
    v15 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TKLocalSEPKey.m"), 1487, CFSTR("Only TKLocalSEPKey instances can be attested"));

    }
    AKSSystemKeyType = self->_AKSSystemKeyType;
    if (AKSSystemKeyType == 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = v15;
        objc_msgSend(v15, "AKSRefKey");
        objc_msgSend(v14, "bytes");
        objc_msgSend(v14, "length");
        v17 = aks_gid_attest();
        TK_LOG_sepkey_0();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          goto LABEL_35;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v44 = self;
        *(_WORD *)&v44[8] = 2112;
        *(_QWORD *)v45 = v14;
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)v46 = v17;
        v19 = "aks_gid_attest(%{public}@, %@) -> %08x";
        goto LABEL_17;
      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      TK_LOG_sepkey_0();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[TKLocalSEPSystemKey attestKey:nonce:error:].cold.4();
LABEL_48:

      v20 = 0;
LABEL_49:

      goto LABEL_50;
    }
    if (AKSSystemKeyType == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = v15;
        objc_msgSend(v15, "AKSRefKey");
        objc_msgSend(v14, "bytes");
        objc_msgSend(v14, "length");
        v17 = aks_sik_attest();
        TK_LOG_sepkey_0();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          goto LABEL_35;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v44 = self;
        *(_WORD *)&v44[8] = 2112;
        *(_QWORD *)v45 = v14;
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)v46 = v17;
        v19 = "aks_sik_attest(%{public}@, %@) -> %08x";
LABEL_17:
        _os_log_debug_impl(&dword_1B9768000, v18, OS_LOG_TYPE_DEBUG, v19, buf, 0x1Cu);
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = v15;
        v27 = v15;
        isa = (int)v27[5].isa;
        if (isa != 2 && isa != 14)
          objc_msgSend(v14, "setNumber:forKey:", 1, 18);
        v41 = v27;
        objc_msgSend(v14, "bytes");
        v29 = v14;
        objc_msgSend(v14, "length");
        v17 = aks_system_key_collection();
        TK_LOG_sepkey_0();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v35 = (int)v41[5].isa;
          isa_high = HIDWORD(v41[5].isa);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v44 = v35;
          *(_WORD *)&v44[4] = 1024;
          *(_DWORD *)&v44[6] = isa_high;
          *(_WORD *)v45 = 2112;
          *(_QWORD *)&v45[2] = v29;
          *(_WORD *)v46 = 1024;
          *(_DWORD *)&v46[2] = v17;
          _os_log_debug_impl(&dword_1B9768000, v30, OS_LOG_TYPE_DEBUG, "aks_system_key_collection(%d, %d, %@) -> %08x", buf, 0x1Eu);
        }

        v14 = v29;
        v18 = v41;
        goto LABEL_35;
      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      TK_LOG_sepkey_0();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[TKLocalSEPSystemKey attestKey:nonce:error:].cold.3();
      goto LABEL_48;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = v15;
      v18 = v15;
      -[NSObject AKSRefKey](v18, "AKSRefKey");
      objc_msgSend(v14, "bytes");
      v40 = v14;
      objc_msgSend(v14, "length");
      v17 = aks_system_key_attest();
      TK_LOG_sepkey_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = self->_AKSSystemKeyType;
        AKSSystemKeyGeneration = self->_AKSSystemKeyGeneration;
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v44 = v22;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = AKSSystemKeyGeneration;
        *(_WORD *)v45 = 2114;
        *(_QWORD *)&v45[2] = v18;
        *(_WORD *)v46 = 2112;
        *(_QWORD *)&v46[2] = v40;
        v47 = 1024;
        v48 = v17;
        v24 = "aks_system_key_attest(%d, generation=%d, attesting=%{public}@, %@) -> %08x";
        v25 = v21;
        v26 = 40;
LABEL_53:
        _os_log_debug_impl(&dword_1B9768000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        TK_LOG_sepkey_0();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[TKLocalSEPSystemKey attestKey:nonce:error:].cold.2();
        goto LABEL_48;
      }
      v42 = v15;
      v18 = v15;
      objc_msgSend(v14, "bytes");
      v40 = v14;
      objc_msgSend(v14, "length");
      v17 = aks_system_key_collection();
      TK_LOG_sepkey_0();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v37 = (int)v18[5].isa;
        v38 = HIDWORD(v18[5].isa);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v44 = v37;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v38;
        *(_WORD *)v45 = 2112;
        *(_QWORD *)&v45[2] = v40;
        *(_WORD *)v46 = 1024;
        *(_DWORD *)&v46[2] = v17;
        v24 = "aks_system_key_collection(%d, %d, %@) -> %08x";
        v25 = v21;
        v26 = 30;
        goto LABEL_53;
      }
    }

    v14 = v40;
LABEL_35:

    if ((_DWORD)v17)
    {
      objc_msgSend(v12, "ACMHandle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a5, v17, v32, CFSTR("oa"), v14, CFSTR("unable to attest key"));

      v20 = 0;
      v15 = v42;
    }
    else
    {
      TK_LOG_sepkey_0();
      v33 = objc_claimAutoreleasedReturnValue();
      v15 = v42;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[TKLocalSEPRefKey attestKey:nonce:error:].cold.1();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_49;
  }
  v20 = 0;
LABEL_51:

  return v20;
}

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v16;

  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      if (a3 == 1 && self->_AKSSystemKeyGeneration == 3)
        goto LABEL_8;
    }
    else if (self->_AKSSystemKeyGeneration == 2)
    {
LABEL_8:
      objc_msgSend(v7, "ACMHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      -[NSObject bytes](v11, "bytes");
      -[NSObject length](v11, "length");
      v12 = aks_system_key_operate();
      if (!(_DWORD)v12)
      {
        TK_LOG_sepkey_0();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[TKLocalSEPSystemKey lifetimeControlWithType:error:].cold.2();

        v9 = 1;
        goto LABEL_15;
      }
      v13 = v12;
      objc_msgSend(v8, "ACMHandle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:](self, "error:withAKSReturn:ACMHandle:AKSOperation:params:message:", a4, v13, v14, CFSTR("oko"), v11, CFSTR("unable to bump/commit key"));

LABEL_14:
      v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -8, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    TK_LOG_sepkey_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TKLocalSEPSystemKey lifetimeControlWithType:error:].cold.1(self, a3, v11);
    goto LABEL_14;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

+ (void)hasSystemKey:ACMHandle:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_1();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1B9768000, v1, OS_LOG_TYPE_DEBUG, "syskey %d not supported, attempt to collect it failed, error %08x", v2, 0xEu);
  OUTLINED_FUNCTION_4();
}

+ (void)hasSystemKey:ACMHandle:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_10_0(&dword_1B9768000, v0, v1, "OIK not supported, attempt to collect proposed generation failed, error %08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_initWithObjectID:(NSObject *)a3 authContext:caller:isIDUnknown:error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "callerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = 1024;
  v8 = v5;
  _os_log_debug_impl(&dword_1B9768000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ requested systemkey aks_system_key_type_t(%d) not supported by the platform", v6, 0x12u);

  OUTLINED_FUNCTION_2();
}

- (void)publicKeyWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_2(&dword_1B9768000, v0, v1, "%{public}@: got publicKey %@");
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
  OUTLINED_FUNCTION_5_0(&dword_1B9768000, v0, v1, "attestKey of unknown key type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)attestKey:nonce:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1B9768000, v0, v1, "SIK-attestKey of unknown key type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)attestKey:nonce:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1B9768000, v0, v1, "GID-attestKey of unknown key type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)lifetimeControlWithType:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "callerName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = "bump";
  v9 = 138543874;
  v10 = a1;
  if (a2 == 1)
    v8 = "commit";
  v11 = 2114;
  v12 = v6;
  v13 = 2082;
  v14 = v8;
  _os_log_error_impl(&dword_1B9768000, a3, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@: an attempt to %{public}s incompatible key", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_4_1();
}

- (void)lifetimeControlWithType:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "%{public}@: bump/commit finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
