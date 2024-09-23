@implementation SecCTKKey

- (SecCTKKey)initWithAttributes:(id)a3 error:(id *)a4
{
  SecCTKKey *v6;
  SecCTKKey *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TKClientTokenObject *tokenObject;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFData *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  TKClientTokenObject *v39;
  _BOOL4 v40;
  NSDictionary *sessionParameters;
  void *v42;
  void *v43;
  const __CFData *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSDictionary *keychainAttributes;
  SecCTKKey *v54;
  void *v56;
  void *v57;
  _QWORD *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[2];
  _BYTE v70[128];
  uint64_t v71;
  const __CFString *v72;
  id v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SecCTKKey;
  v6 = -[SecCTKKey init](&v64, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v6->_tokenObject)
    {
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("u_TokenSession"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        if (!CryptoTokenKitLibraryCore())
        {
          if (a4)
          {
            v30 = (void *)MEMORY[0x1E0CB35C8];
            v71 = *MEMORY[0x1E0CB2938];
            v72 = CFSTR("CryptoTokenKit is not available");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, v31);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v8 = 0;
          goto LABEL_43;
        }
        if (SecCTKIsQueryForSystemKeychain(v59))
        {
          v65 = 0;
          v66 = &v65;
          v67 = 0x2020000000;
          v12 = (id *)getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr;
          v68 = getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr;
          if (!getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr)
          {
            v13 = CryptoTokenKitLibrary();
            v12 = (id *)dlsym(v13, "TKClientTokenParameterForceSystemSession");
            v66[3] = (uint64_t)v12;
            getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr = (uint64_t)v12;
          }
          _Block_object_dispose(&v65, 8);
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getTKClientTokenParameterForceSystemSession(void)");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("SecSoftLink.h"), 41, CFSTR("%s"), dlerror());

            __break(1u);
          }
          v73 = *v12;
          v74[0] = MEMORY[0x1E0C9AAB0];
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = v73;
          objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v16 = (void *)MEMORY[0x1E0C9AA70];
        }
        v32 = objc_alloc((Class)getTKClientTokenClass());
        objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("tkid"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithTokenID:", v33);

        v35 = objc_alloc((Class)getTKClientTokenSessionClass());
        objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("u_AuthCtx"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v35, "initWithToken:LAContext:parameters:error:", v34, v36, v16, a4);

        if (!v8)
          goto LABEL_43;
      }
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("toid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "objectForObjectID:error:", v9, a4);
        v10 = objc_claimAutoreleasedReturnValue();
        tokenObject = v7->_tokenObject;
        v7->_tokenObject = (TKClientTokenObject *)v10;
      }
      else
      {
        tokenObject = (TKClientTokenObject *)objc_msgSend(v59, "mutableCopy");
        objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("u_AuthCtx"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
          -[TKClientTokenObject removeObjectForKey:](tokenObject, "removeObjectForKey:", CFSTR("u_AuthCtx"));
        objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("accc"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = CFGetTypeID(v19);
          if (v21 == SecAccessControlGetTypeID())
          {
            v29 = SecAccessControlCopyData((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);

            -[TKClientTokenObject setObject:forKeyedSubscript:](tokenObject, "setObject:forKeyedSubscript:", v29, CFSTR("accc"));
          }
          else
          {
            v29 = (__CFData *)v20;
          }
        }
        else
        {
          v29 = 0;
        }
        v37 = -[TKClientTokenObject copy](tokenObject, "copy");

        objc_msgSend(v8, "createObjectWithAttributes:error:", v37, a4);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v7->_tokenObject;
        v7->_tokenObject = (TKClientTokenObject *)v38;

        v59 = (id)v37;
      }

      v40 = v7->_tokenObject == 0;
      if (v40)
      {
LABEL_43:

        v54 = 0;
        goto LABEL_44;
      }

    }
    sessionParameters = v7->_sessionParameters;
    v7->_sessionParameters = (NSDictionary *)MEMORY[0x1E0C9AA70];

    -[SecCTKKey tokenObject](v7, "tokenObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "keychainAttributes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v43, "mutableCopy");

    objc_msgSend(v8, "addEntriesFromDictionary:", v59);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("accc"));
    v44 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v58 = v44;
      goto LABEL_32;
    }
    v58 = SecAccessControlCreateFromData((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v44, (__CFString **)a4);

    if (v58)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v58, CFSTR("accc"));
LABEL_32:
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("toid"));
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("u_TokenSession"));
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v69[0] = CFSTR("type");
      v69[1] = CFSTR("kcls");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v45);
            v49 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKeyedSubscript:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v50, "stringValue");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, v49);

            }
          }
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        }
        while (v46);
      }

      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("keys"), CFSTR("class"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("kcls"));
      v52 = objc_msgSend(v8, "copy");
      keychainAttributes = v7->_keychainAttributes;
      v7->_keychainAttributes = (NSDictionary *)v52;

      goto LABEL_42;
    }
    goto LABEL_43;
  }
LABEL_42:
  v54 = v7;
LABEL_44:

  return v54;
}

- (id)initFromKey:(id)a3
{
  id v4;
  SecCTKKey *v5;
  uint64_t v6;
  NSDictionary *sessionParameters;
  uint64_t v8;
  NSDictionary *keychainAttributes;
  uint64_t v10;
  TKClientTokenObject *tokenObject;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SecCTKKey;
  v5 = -[SecCTKKey init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sessionParameters");
    v6 = objc_claimAutoreleasedReturnValue();
    sessionParameters = v5->_sessionParameters;
    v5->_sessionParameters = (NSDictionary *)v6;

    objc_msgSend(v4, "keychainAttributes");
    v8 = objc_claimAutoreleasedReturnValue();
    keychainAttributes = v5->_keychainAttributes;
    v5->_keychainAttributes = (NSDictionary *)v8;

    objc_msgSend(v4, "tokenObject");
    v10 = objc_claimAutoreleasedReturnValue();
    tokenObject = v5->_tokenObject;
    v5->_tokenObject = (TKClientTokenObject *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SecCTKKey initFromKey:]([SecCTKKey alloc], "initFromKey:", self);
}

- (id)performOperation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12 || (unint64_t)objc_msgSend(v12, "length") <= 0x8000)
    goto LABEL_6;
  -[SecCTKKey tokenObject](self, "tokenObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "operation:data:algorithms:parameters:error:", a3, 0, v13, v14, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0)
    {

LABEL_6:
      -[SecCTKKey tokenObject](self, "tokenObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "operation:data:algorithms:parameters:error:", a3, v12, v13, v14, a7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  -[SecCTKKey tokenObject](self, "tokenObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokenID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "token");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tokenID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v12))
  {
    -[SecCTKKey tokenObject](self, "tokenObject");
    v22 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectID");
    v21 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tokenObject");
    v23 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectID");
    v15 = v8;
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "isEqualToData:", v17);

    v7 = v16;
    v8 = v15;

    v4 = v23;
    v6 = v21;

    v5 = v22;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)algorithmID
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[SecCTKKey tokenObject](self, "tokenObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keychainAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("73")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("2147483678")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("2147483679")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("2147483680")) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("105")) & 1) != 0)
  {
    v5 = 4;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("106")))
  {
    v5 = 5;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (TKClientTokenObject)tokenObject
{
  return self->_tokenObject;
}

- (void)setTokenObject:(id)a3
{
  objc_storeStrong((id *)&self->_tokenObject, a3);
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (NSDictionary)sessionParameters
{
  return self->_sessionParameters;
}

- (void)setSessionParameters:(id)a3
{
  objc_storeStrong((id *)&self->_sessionParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionParameters, 0);
  objc_storeStrong((id *)&self->_keychainAttributes, 0);
  objc_storeStrong((id *)&self->_tokenObject, 0);
}

+ (id)fromKeyRef:(__SecKey *)a3
{
  return *((id *)a3 + 3);
}

@end
