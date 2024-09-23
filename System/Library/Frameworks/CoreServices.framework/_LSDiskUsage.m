@implementation _LSDiskUsage

- (id)_initWithBundleIdentifier:(id)a3 alreadyKnownUsage:(id)a4 validationToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  _LSDiskUsage *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSMutableDictionary *usage;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_LSDiskUsage;
  v11 = -[_LSDiskUsage init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    if (v9 && objc_msgSend(v9, "count"))
      v14 = objc_msgSend(v9, "mutableCopy");
    else
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    usage = v11->_usage;
    v11->_usage = (NSMutableDictionary *)v14;

    objc_storeStrong(&v11->_validationToken, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  _LSDiskUsage *v9;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend((id)objc_opt_class(), "propertyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___LSDiskUsage_encodeWithCoder___block_invoke;
  block[3] = &unk_1E10422C8;
  v6 = v4;
  v8 = v6;
  v9 = self;
  dispatch_sync(v5, block);

  objc_msgSend(v6, "encodeObject:forKey:", self->_validationToken, CFSTR("validationToken"));
}

+ (id)propertyQueue
{
  if (+[_LSDiskUsage(Private) propertyQueue]::once != -1)
    dispatch_once(&+[_LSDiskUsage(Private) propertyQueue]::once, &__block_literal_global_63);
  return (id)+[_LSDiskUsage(Private) propertyQueue]::result;
}

- (_LSDiskUsage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _LSDiskUsage *v9;

  v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClass:forKey:", v6, objc_opt_class(), CFSTR("knownUsage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validationToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_LSDiskUsage _initWithBundleIdentifier:alreadyKnownUsage:validationToken:](self, "_initWithBundleIdentifier:alreadyKnownUsage:validationToken:", v5, v7, v8);

  return v9;
}

- (_LSDiskUsage)init
{
  abort();
}

- (NSNumber)staticUsage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "propertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27___LSDiskUsage_staticUsage__block_invoke;
  v6[3] = &unk_1E1041FF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)dynamicUsage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  if (-[_LSDiskUsage _fetchWithXPCConnection:error:](self, "_fetchWithXPCConnection:error:", 0, 0))
  {
    objc_msgSend((id)objc_opt_class(), "propertyQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28___LSDiskUsage_dynamicUsage__block_invoke;
    v6[3] = &unk_1E1041FF8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)onDemandResourcesUsage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  if (-[_LSDiskUsage _fetchWithXPCConnection:error:](self, "_fetchWithXPCConnection:error:", 0, 0))
  {
    objc_msgSend((id)objc_opt_class(), "propertyQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38___LSDiskUsage_onDemandResourcesUsage__block_invoke;
    v6[3] = &unk_1E1041FF8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (NSNumber)sharedUsage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  if (-[_LSDiskUsage _fetchWithXPCConnection:error:](self, "_fetchWithXPCConnection:error:", 0, 0))
  {
    objc_msgSend((id)objc_opt_class(), "propertyQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __27___LSDiskUsage_sharedUsage__block_invoke;
    v6[3] = &unk_1E1041FF8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (void)removeAllCachedUsageValues
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "propertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___LSDiskUsage_removeAllCachedUsageValues__block_invoke;
  block[3] = &unk_1E10418C8;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

- (id)debugDescription
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  objc_msgSend((id)objc_opt_class(), "propertyQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32___LSDiskUsage_debugDescription__block_invoke;
  v6[3] = &unk_1E1041FF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)_serverQueue
{
  _LSAssertRunningInServer((uint64_t)"+[_LSDiskUsage(Internal) _serverQueue]");
  if (+[_LSDiskUsage(Internal) _serverQueue]::once != -1)
    dispatch_once(&+[_LSDiskUsage(Internal) _serverQueue]::once, &__block_literal_global_28);
  return (id)+[_LSDiskUsage(Internal) _serverQueue]::result;
}

- (BOOL)_fetchWithXPCConnection:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  NSObject *v8;
  id *v9;
  BOOL v10;
  void *v11;
  id v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_bundleIdentifier;
  if (!v7)
  {
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDiskUsage(Internal) _fetchWithXPCConnection:error:]", 249, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend((id)objc_opt_class(), "propertyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___LSDiskUsage_Internal___fetchWithXPCConnection_error___block_invoke;
  block[3] = &unk_1E1041FF8;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(v8, block);

  if (*((_BYTE *)v19 + 24))
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    {
      v16 = 0;
      v9 = (id *)&v16;
      v10 = -[_LSDiskUsage fetchServerSideWithConnection:error:](self, "fetchServerSideWithConnection:error:", v6, &v16);
    }
    else
    {
      v15 = 0;
      v9 = (id *)&v15;
      v10 = -[_LSDiskUsage fetchClientSideWithError:](self, "fetchClientSideWithError:", &v15);
    }
    v13 = v10;
    v12 = *v9;
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }
  _Block_object_dispose(&v18, 8);
  if (a4)
  {
LABEL_11:
    if (!v13)
      *a4 = objc_retainAutorelease(v12);
  }
LABEL_13:

  return v13;
}

+ (id)mobileInstallationQueue
{
  _LSAssertRunningInServer((uint64_t)"+[_LSDiskUsage(Private) mobileInstallationQueue]");
  if (+[_LSDiskUsage(Private) mobileInstallationQueue]::once != -1)
    dispatch_once(&+[_LSDiskUsage(Private) mobileInstallationQueue]::once, &__block_literal_global_65);
  return (id)+[_LSDiskUsage(Private) mobileInstallationQueue]::result;
}

+ (id)usageFromMobileInstallationForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "mobileInstallationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __78___LSDiskUsage_Private__usageFromMobileInstallationForBundleIdentifier_error___block_invoke;
    v17 = &unk_1E10430F8;
    v18 = v6;
    _LSDispatchWithTimeout(v7, &v14, 5.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "result", v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      objc_msgSend(v8, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }
    else
    {
      objc_msgSend(v8, "result");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
    }

  }
  else
  {
    v19 = *MEMORY[0x1E0CB2938];
    v20[0] = CFSTR("invalid bundleIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[_LSDiskUsage(Private) usageFromMobileInstallationForBundleIdentifier:error:]", 331, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }

  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v12);

  return v11;
}

+ (id)ODRConnection
{
  if (+[_LSDiskUsage(Private) ODRConnection]::once != -1)
    dispatch_once(&+[_LSDiskUsage(Private) ODRConnection]::once, &__block_literal_global_74_0);
  return (id)+[_LSDiskUsage(Private) ODRConnection]::result;
}

+ (id)ODRUsageForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v21 = *MEMORY[0x1E0CB2938];
    v22[0] = CFSTR("invalid bundleIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"+[_LSDiskUsage(Private) ODRUsageForBundleIdentifier:error:]", 400, v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59___LSDiskUsage_Private__ODRUsageForBundleIdentifier_error___block_invoke;
  v18[3] = &unk_1E1043168;
  v20 = a1;
  v19 = v6;
  _LSDispatchWithTimeout(0, v18, 5.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    objc_msgSend(v8, "error");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = v19;
    goto LABEL_7;
  }
  objc_msgSend(v8, "result");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v11)
    goto LABEL_16;
LABEL_8:
  objc_msgSend(v12, "domain");
  v14 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqual:](v14, "isEqual:", *MEMORY[0x1E0CB2FE0]))
  {
    v15 = objc_msgSend(v12, "code") == 60;

    if (!v15)
      goto LABEL_13;
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "timeout waiting for ODR daemon bytesUsedForApplicationWithBundleID to return", v17, 2u);
    }
  }

LABEL_13:
  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    v11 = 0;
    *a4 = v12;
  }
  else
  {
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (BOOL)fetchServerSideWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSString *bundleIdentifier;
  void *v14;
  id v15;
  void *v16;
  NSString *v17;
  void *v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[16];

  v6 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDiskUsage(Private) fetchServerSideWithConnection:error:]");
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInSyncBubble"))
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "cannot calculate disk usage per bundle in the sync bubble", buf, 2u);
    }

    v8 = 424;
    v9 = (void **)&LSApplicationWorkspaceErrorDomain;
    v10 = 110;
    goto LABEL_11;
  }
  if (!+[_LSBundleIDValidationToken isToken:correctForBundleIdentifier:connection:]((uint64_t)_LSBundleIDValidationToken, self->_validationToken, self->_bundleIdentifier, v6))
  {
    v8 = 428;
    v10 = -54;
    v9 = (void **)MEMORY[0x1E0CB2F90];
LABEL_11:
    _LSMakeNSErrorImpl(*v9, v10, (uint64_t)"-[_LSDiskUsage(Private) fetchServerSideWithConnection:error:]", v8, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v11 = (id)-[NSMutableDictionary mutableCopy](self->_usage, "mutableCopy");
  if (!v11)
  {
    v15 = 0;
LABEL_12:
    v21 = 0;
    if (!a4)
      goto LABEL_15;
    goto LABEL_13;
  }
  v12 = (void *)objc_opt_class();
  bundleIdentifier = self->_bundleIdentifier;
  v26 = 0;
  objc_msgSend(v12, "usageFromMobileInstallationForBundleIdentifier:error:", bundleIdentifier, &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v26;
  if (v14)
  {
    objc_msgSend(v11, "addEntriesFromDictionary:", v14);

    v16 = (void *)objc_opt_class();
    v17 = self->_bundleIdentifier;
    v25 = v15;
    objc_msgSend(v16, "ODRUsageForBundleIdentifier:error:", v17, &v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v25;

    if (v18)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("ODR"));

      objc_msgSend((id)objc_opt_class(), "propertyQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61___LSDiskUsage_Private__fetchServerSideWithConnection_error___block_invoke;
      v23[3] = &unk_1E10422C8;
      v23[4] = self;
      v24 = v11;
      v11 = v11;
      dispatch_barrier_async(v20, v23);

      v21 = 1;
    }
    else
    {
      v21 = 0;
    }
    v15 = v19;
  }
  else
  {
    v21 = 0;
  }

  if (a4)
  {
LABEL_13:
    if (!v21)
      *a4 = objc_retainAutorelease(v15);
  }
LABEL_15:

  return v21;
}

- (BOOL)fetchClientSideWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  int v7;
  BOOL v8;
  _QWORD v10[7];
  void (*v11[6])(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v11[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v11[2] = (void (*)(_QWORD, _QWORD))__50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke;
  v11[3] = (void (*)(_QWORD, _QWORD))&unk_1E1043190;
  v11[4] = (void (*)(_QWORD, _QWORD))self;
  v11[5] = (void (*)(_QWORD, _QWORD))&v12;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __50___LSDiskUsage_Private__fetchClientSideWithError___block_invoke_127;
  v10[3] = &unk_1E10431B8;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v12;
  objc_msgSend(v6, "getDiskUsage:completionHandler:", self, v10);
  v7 = *((unsigned __int8 *)v19 + 24);
  if (a3 && !*((_BYTE *)v19 + 24))
  {
    *a3 = objc_retainAutorelease((id)v13[5]);
    v7 = *((unsigned __int8 *)v19 + 24);
  }
  v8 = v7 != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

@end
