@implementation LSMIResultRegistrantTrueDatabaseContext

- (LSMIResultRegistrantTrueDatabaseContext)initWithDatabase:(id)a3
{
  id v5;
  LSMIResultRegistrantTrueDatabaseContext *v6;
  LSMIResultRegistrantTrueDatabaseContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSMIResultRegistrantTrueDatabaseContext;
  v6 = -[LSMIResultRegistrantTrueDatabaseContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context.db, a3);

  return v7;
}

- (BOOL)fullBundleExistsForIdentifier:(id)a3 matchingNode:(id)a4
{
  id v6;
  LSContext *p_context;
  char v8;
  id v10;
  unsigned int v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11 = 0;
  p_context = &self->_context;
  memset(v12, 0, sizeof(v12));
  if (_LSBundleFindWithInfoAndNo_IOFilter((uint64_t)p_context, 0, a3, 0, v12, 2, 128, 0, 0, &v11, 0, 0))
  {
    if (v6)
    {
      v10 = 0;
      if (_LSBundleCopyNode(p_context->db, v11, 0, 0, &v10))
        v8 = 0;
      else
        v8 = objc_msgSend(v10, "isEqual:", v6);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)findOrRegisterContainerizedNodeReinitializingContext:(id)a3 installDictionary:(id)a4 personasWithAttributes:(id)a5 error:(id *)a6
{
  id v10;
  FSNode *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  unsigned int v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (FSNode *)a4;
  v12 = a5;
  v20 = 0;
  v13 = (void *)-[FSNode mutableCopy](v11, "mutableCopy");
  v14 = v13;
  if (v12)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("LSPersonaUniqueStrings"));
  v15 = _LSFindOrRegisterBundleNode(&self->_context, v10, 0, 0x2000001u, v11, &v20, 0);
  if (v15)
  {
    v21 = *MEMORY[0x1E0CB2938];
    v22[0] = CFSTR("could not register full bundle unit while registering parallel placeholder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v15, (uint64_t)"-[LSMIResultRegistrantTrueDatabaseContext findOrRegisterContainerizedNodeReinitializingContext:installDictionary:personasWithAttributes:error:]", 546, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  v18 = v20;
  if (a6 && !v20)
  {
    *a6 = objc_retainAutorelease(v17);
    v18 = v20;
  }

  return v18;
}

- (id)findContainerizedRecordForBundleUnit:(unsigned int)a3 error:(id *)a4
{
  return -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", &self->_context, *(_QWORD *)&a3, 0, a4);
}

- (id)unregisterApplicationWithBundleIdentifier:(id)a3 type:(unsigned int)a4 error:(id *)a5
{
  char v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unsigned int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  int v20;
  int v21;

  v6 = a4;
  v12 = a3;
  v21 = 0;
  if ((v6 & 4) != 0)
    v13 = v6 & 2 | 5;
  else
    v13 = v6 & 3;
  v14 = _LSUnregisterAppWithBundleID((void **)&self->_context.db, v12, v13, &v21, v8, v9, v10, v11);
  if (v14)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v14, (uint64_t)"-[LSMIResultRegistrantTrueDatabaseContext unregisterApplicationWithBundleIdentifier:type:error:]", 611, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    if (!a5)
      goto LABEL_10;
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __96__LSMIResultRegistrantTrueDatabaseContext_unregisterApplicationWithBundleIdentifier_type_error___block_invoke;
    v19[3] = &__block_descriptor_36_e8_v16__0_8l;
    v20 = v21;
    v16 = (void *)objc_msgSend(v19, "copy");
    v15 = 0;
    if (!a5)
      goto LABEL_10;
  }
  if (!v16)
    *a5 = objc_retainAutorelease(v15);
LABEL_10:
  v17 = (void *)MEMORY[0x186DAE9BC](v16);

  return v17;
}

void __96__LSMIResultRegistrantTrueDatabaseContext_unregisterApplicationWithBundleIdentifier_type_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer") & 1) != 0)
    goto LABEL_11;
  v4 = v3;
  objc_msgSend(v4, "applicationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("System"));

  if (v6)
  {
    v7 = *(_DWORD *)(a1 + 32);
    if ((v7 - 8) < 2)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSNoteSystemAppInstallOrUninstall((uint64_t)v8, 0);
LABEL_7:

      goto LABEL_8;
    }
    if (v7 == 10)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSNoteSystemAppInstallOrUninstall((uint64_t)v8, 1u);
      goto LABEL_7;
    }
  }
LABEL_8:
  if (*(_DWORD *)(a1 + 32) == 8)
  {
    +[LSApplicationRestrictionsManager sharedInstance]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSApplicationRestrictionsManager schedulePruneObsoleteTrustedSignerIdentities]((uint64_t)v9);

  }
  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(unsigned int *)(a1 + 32);
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendNotification:forAppProxies:Plugins:completion:", v11, v12, 0, 0);

LABEL_11:
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
