@implementation IXPromisedAppReference

- (IXPromisedAppReference)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedAppReference;
  return -[IXOwnedDataPromise initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPromisedAppReference;
  -[IXDataPromise encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acquireReferenceToAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 forClient:(unint64_t)a5 ifMatchingPredicate:(id)a6 error:(id *)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = a6;
  v13 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@/%lu"), v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:client:forAppWithIdentity:inDomain:ifMatchingPredicate:error:", v14, a5, v13, a4, v12, a7);

  return v15;
}

+ (id)acquireReferenceToAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 forClient:(unint64_t)a5 matchingAppInRecord:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v12 = a3;
  objc_msgSend(a6, "uniqueInstallIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uniqueInstallIdentifier = %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "acquireReferenceToAppWithIdentity:inDomain:forClient:ifMatchingPredicate:error:", v12, a4, a5, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (IXPromisedAppReference)initWithName:(id)a3 client:(unint64_t)a4 forAppWithIdentity:(id)a5 inDomain:(unint64_t)a6 ifMatchingPredicate:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  IXPromisedAppReference *v17;
  IXPromisedAppReference *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  IXPromisedAppReference *v26;
  _QWORD v28[4];
  IXPromisedAppReference *v29;
  uint64_t *v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  objc_super v38;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)IXPromisedAppReference;
  v17 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v38, sel_initWithName_client_diskSpaceNeeded_, v14, a4, 0);
  v18 = v17;
  if (!v17)
    goto LABEL_7;
  -[IXDataPromise seed](v17, "seed");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInstallationDomain:", a6);

  -[IXDataPromise seed](v18, "seed");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIdentity:", v15);

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke;
  v31[3] = &unk_1E4DC41B0;
  v31[4] = &v32;
  objc_msgSend(v21, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise seed](v18, "seed");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v28[1] = 3221225472;
  v28[2] = __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke_10;
  v28[3] = &unk_1E4DC4B18;
  v30 = &v32;
  v29 = v18;
  objc_msgSend(v23, "_remote_createAppReferenceDataPromiseWithSeed:ifMatchingPredicate:completion:", v24, v16, v28);

  v25 = (void *)v33[5];
  if (!v25)
  {

    _Block_object_dispose(&v32, 8);
LABEL_7:
    v26 = v18;
    goto LABEL_8;
  }
  if (a8)
    *a8 = objc_retainAutorelease(v25);

  _Block_object_dispose(&v32, 8);
  v26 = 0;
LABEL_8:

  return v26;
}

void __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXPromisedAppReference initWithName:client:forAppWithIdentity:inDomain:ifMatchingPredicate:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  else
    objc_msgSend(*(id *)(a1 + 32), "_updateInitWithSeed:notifyDaemon:", a2, 0);

}

- (id)placeholderPromiseForInstallType:(unint64_t)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[IXDataPromise seed](self, "seed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "creatorIdentifier");
  v20 = 0;
  IXApplicationRecordForIdentityInDomain(v7, objc_msgSend(v6, "installationDomain"), &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v9)
  {
    objc_msgSend(v9, "URL");
    v11 = objc_claimAutoreleasedReturnValue();
    v19 = v10;
    +[IXPlaceholder placeholderForInstallable:client:installType:metadata:error:](IXPlaceholder, "placeholderForInstallable:client:installType:metadata:error:", v11, v8, a3, 0, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    v14 = v10;
    v10 = (id)v11;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      MIStringForInstallationDomain();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v22 = "-[IXPromisedAppReference placeholderPromiseForInstallType:withError:]";
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v10;
      _os_log_error_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_ERROR, "%s: Could not get LSApplicationRecord for app with identity %@ in domain %@ : %@", buf, 0x2Au);

    }
    MIStringForInstallationDomain();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[IXPromisedAppReference placeholderPromiseForInstallType:withError:]", 124, CFSTR("IXErrorDomain"), 0x32uLL, v10, 0, CFSTR("Could not get LSApplicationRecord for app with identity %@ in domain %@"), v16, (uint64_t)v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }

  if (a4 && !v12)
    *a4 = objc_retainAutorelease(v13);

  return v12;
}

- (void)resetWithCompletion:(id)a3
{
  char *v3;
  void (**v4)(id, void *);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = kIXLoggingSubsystem;
  v4 = (void (**)(id, void *))a3;
  IXGetLoggingHandle((uint64_t)v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXPromisedAppReference resetWithCompletion:].cold.1(v5);

  _CreateError((uint64_t)"-[IXPromisedAppReference resetWithCompletion:]", 140, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Resetting a promised app referece doesn't make sense."), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

}

- (IXApplicationIdentity)identity
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IXApplicationIdentity *)v3;
}

- (unint64_t)installationDomain
{
  void *v2;
  unint64_t v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "installationDomain");

  return v3;
}

- (IXPromisedAppReference)initWithSeed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXPromisedAppReference;
  return -[IXOwnedDataPromise initWithSeed:](&v4, sel_initWithSeed_, a3);
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (void)resetWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[IXPromisedAppReference resetWithCompletion:]";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: Resetting a promised app referece doesn't make sense. : %@", (uint8_t *)&v1, 0x16u);
}

@end
