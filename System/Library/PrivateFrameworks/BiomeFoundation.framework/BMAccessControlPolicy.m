@implementation BMAccessControlPolicy

- (BOOL)allowsAccessToResource:(id)a3 withMode:(unint64_t)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  int v15;
  void *v16;
  int v17;

  v6 = a3;
  switch(objc_msgSend(v6, "type"))
  {
    case 1:
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", v7, a4);
      goto LABEL_6;
    case 2:
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[BMAccessControlPolicy allowsAccessToView:withMode:](self, "allowsAccessToView:withMode:", v7, a4);
      goto LABEL_6;
    case 3:
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[BMAccessControlPolicy allowsAccessToDatabase:withMode:](self, "allowsAccessToDatabase:withMode:", v7, a4);
      goto LABEL_6;
    case 4:
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[BMAccessControlPolicy allowsAccessToSet:withMode:](self, "allowsAccessToSet:withMode:", v7, a4);
LABEL_6:
      v9 = v8;

      goto LABEL_17;
    case 5:
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", CFSTR("BMSyncResource")))
      {

LABEL_10:
        v13 = -[BMAccessControlPolicy allowsAccessToSync](self, "allowsAccessToSync");
LABEL_11:
        v9 = v13;
        goto LABEL_17;
      }
      objc_msgSend(v6, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("BMSharedSyncResource"));

      if (v12)
        goto LABEL_10;
      objc_msgSend(v6, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", CFSTR("BMFlexibleStorageResource"));

      if (v15)
      {
        v13 = -[BMAccessControlPolicy allowsAccessToFlexibleStorage](self, "allowsAccessToFlexibleStorage");
        goto LABEL_11;
      }
      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", CFSTR("BMSetsResource"));

      if (v17)
      {
        v13 = -[BMAccessControlPolicy allowsAccessToSetsWithMode:](self, "allowsAccessToSetsWithMode:", a4);
        goto LABEL_11;
      }
LABEL_16:
      v9 = 0;
LABEL_17:

      return v9;
    default:
      goto LABEL_16;
  }
}

- (NSString)useCase
{
  return self->_useCase;
}

- (BOOL)allowsAccessToSetsWithMode:(unint64_t)a3
{
  void *process;
  uint64_t v6;

  process = self->_process;
  if (process)
  {
    v6 = objc_msgSend(process, "processType");
    LOBYTE(process) = 1;
    switch(v6)
    {
      case 2:
      case 3:
        return (char)process;
      case 5:
        process = self->_onBehalfOf;
        if (process)
          LOBYTE(process) = objc_msgSend(process, "allowsAccessToSetsWithMode:", a3);
        break;
      case 8:
        LOBYTE(process) = os_variant_allows_internal_security_policies();
        break;
      default:
        LOBYTE(process) = 0;
        break;
    }
  }
  return (char)process;
}

void __44__BMAccessControlPolicy_authorizedResources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    v9 = 2;
    v10 = v8 == 1 && v6 == 3;
    v11 = 3;
    if (!v10)
      v11 = v8;
    if (v8 == 2)
      v11 = 2;
    if (v6 != 2)
      v9 = v11;
    if (v8)
      v6 = v9;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v13);

  }
}

- (BOOL)allowsConnectionToComputeSourceService
{
  void *process;
  unint64_t v4;

  process = self->_process;
  if (process)
  {
    objc_msgSend(process, "identifier");

    v4 = -[BMProcess processType](self->_process, "processType");
    LOBYTE(process) = 1;
    switch(v4)
    {
      case 0uLL:
        goto LABEL_16;
      case 2uLL:
      case 3uLL:
      case 6uLL:
      case 7uLL:
        return (char)process;
      case 4uLL:
      case 5uLL:
        process = self->_onBehalfOf;
        if (process)
          LOBYTE(process) = objc_msgSend(process, "allowsConnectionToComputeSourceService");
        break;
      case 8uLL:
        LOBYTE(process) = os_variant_allows_internal_security_policies();
        break;
      default:
        if (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.write-only"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.writer"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.pruner"))|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
                CFSTR("com.apple.internal.biome.read-write"))
           || -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.write-only"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.writer"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.pruner"))))
        {
          LOBYTE(process) = 1;
        }
        else
        {
LABEL_16:
          LOBYTE(process) = 0;
        }
        break;
    }
  }
  return (char)process;
}

- (BOOL)allowsConnectionToWriteService
{
  void *v3;
  unint64_t v4;

  -[BMProcess identifier](self->_process, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = -[BMProcess processType](self->_process, "processType");
  if (v4 - 2 < 4 || v4 == 0)
    return 0;
  if (v4 == 8)
    return os_variant_allows_internal_security_policies();
  return -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.write-only"))|| os_variant_allows_internal_security_policies()&& -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.write-only"));
}

- (BOOL)allowsConnectionToAccessServiceWithDomain:(unint64_t)a3
{
  BMProcess **p_process;
  _BOOL4 v4;
  BMProcess *v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;

  p_process = &self->_process;
  if (!-[BMProcess processType](self->_process, "processType", a3))
    return 0;
  -[BMProcess identifier](*p_process, "identifier");

  if (-[BMProcess processType](*p_process, "processType") == 2
    || -[BMProcess processType](*p_process, "processType") == 3
    || -[BMProcess processType](*p_process, "processType") == 4
    || -[BMProcess processType](*p_process, "processType") == 5
    || -[BMProcess hasNonEmptyDictionaryForEntitlement:](*p_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.private.intelligenceplatform.use-cases"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.writer"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.pruner"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-only"))
    || -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.write-only"))|| os_variant_allows_internal_security_policies()&& (-[BMProcess processType](*p_process, "processType") == 8|| -[BMProcess hasNonEmptyDictionaryForEntitlement:](*p_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.internal.intelligenceplatform.use-cases"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.writer"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.pruner"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process,
          "hasNonEmptyArrayForEntitlement:",
          CFSTR("com.apple.internal.biome.read-write"))
     || -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.read-only"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](*p_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.write-only"))))
  {
    return 1;
  }
  v4 = -[BMProcess BOOLForEntitlement:](*p_process, "BOOLForEntitlement:", CFSTR("com.apple.private.security.storage.Biome"));
  v5 = *p_process;
  if (!v4)
  {
    if (-[BMProcess BOOLForEntitlement:](v5, "BOOLForEntitlement:", CFSTR("com.apple.rootless.storage.coreduet_knowledge_store"))|| -[BMProcess BOOLForEntitlement:](*p_process, "BOOLForEntitlement:", CFSTR("com.apple.coreduetd.allow")))
    {
      __biome_log_for_category(6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BMAccessControlPolicy allowsConnectionToAccessServiceWithDomain:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
      goto LABEL_34;
    }
    -[BMProcess identifier](*p_process, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqual:", CFSTR("com.apple.activitysharingd")))
    {

      goto LABEL_32;
    }
    -[BMProcess identifier](*p_process, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", CFSTR("com.apple.camera"));

    if (v19)
    {
LABEL_32:
      __biome_log_for_category(6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BMAccessControlPolicy allowsConnectionToAccessServiceWithDomain:].cold.3((uint64_t)p_process, v9);
      goto LABEL_34;
    }
    return 0;
  }
  -[BMProcess executableName](v5, "executableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(&unk_1E5E49EF8, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    __biome_log_for_category(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BMAccessControlPolicy allowsConnectionToAccessServiceWithDomain:].cold.1((id *)p_process, v9);
LABEL_34:
    v8 = !v4;

    return v8;
  }
  return 1;
}

- (BOOL)allowsConnectionToSetStoreUpdateService
{
  void *v3;
  unint64_t v4;
  BOOL result;

  -[BMProcess identifier](self->_process, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = -[BMProcess processType](self->_process, "processType");
  result = 0;
  switch(v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
      return result;
    case 2uLL:
    case 3uLL:
      goto LABEL_3;
    case 8uLL:
      result = os_variant_allows_internal_security_policies();
      break;
    default:
      if (!-[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.private.intelligenceplatform.use-cases"))&& (!os_variant_allows_internal_security_policies()|| !-[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.internal.intelligenceplatform.use-cases"))))
      {
        return 0;
      }
LABEL_3:
      result = 1;
      break;
  }
  return result;
}

- (id)explicitlyAuthorizedResourcesOfType:(unint64_t)a3 withAccessMode:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMAccessControlPolicy authorizedResources](self, "authorizedResources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v13, "type") == a3)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "unsignedIntegerValue");

            if (v15)
            {
              if (v15 == a4 || v15 == 3)
              {
                objc_msgSend(v13, "name");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v17);

              }
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)authorizedResources
{
  NSDictionary *authorizedResources;
  NSDictionary *v4;
  unint64_t v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSDictionary *v17;
  BMProcess *process;
  NSString *useCase;
  const char *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t ii;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t jj;
  void *v62;
  uint64_t v63;
  NSDictionary *v64;
  NSDictionary *v65;
  const __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  BMAccessControlPolicy *v71;
  os_unfair_lock_t lock;
  uint64_t v73;
  uint64_t v74;
  BMProcess *v75;
  uint64_t v76;
  NSString *v77;
  id v78;
  uint64_t v79;
  id obj;
  void *v81;
  void *v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[4];
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  const __CFString *v94;
  uint64_t v95;
  void (*v96)(uint64_t, void *, void *);
  void *v97;
  id v98;
  uint64_t v99;
  char v100;
  _QWORD v101[4];
  id v102;
  const __CFString *v103;
  uint64_t v104;
  void (*v105)(uint64_t, void *, void *);
  const __CFString *v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  authorizedResources = self->_authorizedResources;
  if (!authorizedResources)
  {
    v71 = self;
    v5 = -[BMProcess processType](self->_process, "processType");
    if (!v5 || v5 == 8 && (os_variant_allows_internal_security_policies() & 1) == 0)
    {
      v17 = self->_authorizedResources;
      v4 = (NSDictionary *)MEMORY[0x1E0C9AA70];
      v71->_authorizedResources = (NSDictionary *)MEMORY[0x1E0C9AA70];

      goto LABEL_133;
    }
    v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v6 = self->_useCase;
    *(_QWORD *)&v108 = CFSTR("__legacy__");
    v94 = CFSTR("com.apple.private.biome.read-only");
    v95 = (uint64_t)CFSTR("com.apple.private.biome.read-write");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v116 = v7;
    *((_QWORD *)&v108 + 1) = CFSTR("__writer__");
    v103 = CFSTR("com.apple.private.biome.write-only");
    v104 = (uint64_t)CFSTR("com.apple.private.biome.read-write");
    v105 = (void (*)(uint64_t, void *, void *))CFSTR("com.apple.private.biome.writer");
    v106 = CFSTR("com.apple.private.intelligenceplatform.use-cases");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v116 + 1) = v8;
    *(_QWORD *)&v109 = CFSTR("__pruner__");
    *(_QWORD *)&v121 = CFSTR("com.apple.private.biome.read-write");
    *((_QWORD *)&v121 + 1) = CFSTR("com.apple.private.biome.pruner");
    *(_QWORD *)&v122 = CFSTR("com.apple.private.biome.writer");
    *((_QWORD *)&v122 + 1) = CFSTR("com.apple.private.intelligenceplatform.use-cases");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v117 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v108, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v101[0] = CFSTR("com.apple.private.intelligenceplatform.use-cases");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (os_variant_allows_internal_security_policies())
    {
      obj = (id)objc_msgSend(v11, "mutableCopy");
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v113;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v113 != v14)
              objc_enumerationMutation(v12);
            BMAppleInternalVariantOfEntitlement(*(void **)(*((_QWORD *)&v112 + 1) + 8 * i));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              objc_msgSend(obj, "addObject:", v16);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
        }
        while (v13);
      }

    }
    else
    {
      obj = v11;
    }

    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    if (!v68)
    {
LABEL_132:

      v64 = (NSDictionary *)objc_msgSend(v70, "copy");
      v65 = v71->_authorizedResources;
      v71->_authorizedResources = v64;

      v4 = v64;
      goto LABEL_133;
    }
    v69 = *(_QWORD *)v90;
    v67 = CFSTR("com.apple.internal.biome.read-write");
LABEL_23:
    v76 = 0;
    while (1)
    {
      if (*(_QWORD *)v90 != v69)
        objc_enumerationMutation(obj);
      process = v71->_process;
      useCase = v71->_useCase;
      v78 = *(id *)(*((_QWORD *)&v89 + 1) + 8 * v76);
      v75 = process;
      v77 = useCase;
      if ((os_variant_allows_internal_security_policies() & 1) == 0
        && ((BMEntitlementIsAppleInternal(v78, v20) & 1) != 0 || -[BMProcess processType](v75, "processType") == 8))
      {
LABEL_34:
        v22 = (id)objc_opt_new();
        goto LABEL_99;
      }
      if ((objc_msgSend(v78, "isEqual:", CFSTR("com.apple.private.intelligenceplatform.use-cases"), v67) & 1) != 0
        || objc_msgSend(v78, "isEqual:", CFSTR("com.apple.internal.intelligenceplatform.use-cases")))
      {
        -[BMProcess dictionaryForEntitlement:](v75, "dictionaryForEntitlement:", v78);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v22 = (id)objc_opt_new();
          goto LABEL_98;
        }
        v21 = -[NSString isEqualToString:](v77, "isEqualToString:", CFSTR("__pruner__"))
           || -[NSString isEqualToString:](v77, "isEqualToString:", CFSTR("__writer__"));
        v83 = (id)objc_opt_new();
        v123 = 0u;
        v124 = 0u;
        v121 = 0u;
        v122 = 0u;
        objc_msgSend(v82, "allKeys");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v121, v120, 16);
        if (v73)
        {
          v74 = *(_QWORD *)v122;
          v81 = v29;
LABEL_52:
          v79 = 0;
          while (1)
          {
            if (*(_QWORD *)v122 != v74)
              objc_enumerationMutation(v29);
            v30 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v79);
            if ((v21 & 1) != 0
              || -[NSString isEqualToString:](v77, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v79)))
            {
              break;
            }
LABEL_93:
            if (++v79 == v73)
            {
              v73 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v121, v120, 16);
              if (!v73)
                goto LABEL_95;
              goto LABEL_52;
            }
          }
          objc_msgSend(v82, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            v84 = v31;
            v32 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v116, &v112, 16);
            if (!v32)
              goto LABEL_92;
            v85 = *(_QWORD *)v117;
            while (1)
            {
              v86 = v32;
              for (j = 0; j != v86; ++j)
              {
                if (*(_QWORD *)v117 != v85)
                  objc_enumerationMutation(v84);
                v34 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v35 = BMResourceTypeFromEntitlementResourceTypeString(v34);
                  if (v35)
                  {
                    v36 = (void *)objc_opt_new();
                    objc_msgSend(v84, "objectForKeyedSubscript:", v34);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      BMNonnullSetOfStringsFromEntitlementValue(v37);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v110 = 0u;
                      v111 = 0u;
                      v108 = 0u;
                      v109 = 0u;
                      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v108, &v103, 16);
                      if (v39)
                      {
                        v40 = v21;
                        v41 = *(_QWORD *)v109;
                        do
                        {
                          for (k = 0; k != v39; ++k)
                          {
                            if (*(_QWORD *)v109 != v41)
                              objc_enumerationMutation(v38);
                            objc_msgSend(v36, "setObject:forKeyedSubscript:", &unk_1E5E48A68, *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * k));
                          }
                          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v108, &v103, 16);
                        }
                        while (v39);
                        v21 = v40;
                        v29 = v81;
                      }
LABEL_76:

                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v101[0] = MEMORY[0x1E0C809B0];
                        v101[1] = 3221225472;
                        v101[2] = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke;
                        v101[3] = &unk_1E5E3C708;
                        v102 = v36;
                        objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v101);
                        v38 = v102;
                        goto LABEL_76;
                      }
                    }
                    if (v35 == 4)
                    {
                      v43 = v36;
                      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("HomeKit.Entity"));
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v44)
                        objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, CFSTR("HomeKit.Home"));
                      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Media.Entity"));
                      v45 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v45)
                        objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("MediaLibrary.Media"));
                      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Podcasts.Entity"));
                      v46 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v46)
                        objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, CFSTR("Podcasts.Podcast"));
                      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("Siri.PrivateLearning.MediaEntity"));
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v47)
                        objc_msgSend(v43, "setObject:forKeyedSubscript:", v47, CFSTR("Siri.PrivateLearning.Media"));

                    }
                    else if (v35 == 1)
                    {
                      BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(v36);
                    }
                    v94 = (const __CFString *)MEMORY[0x1E0C809B0];
                    v95 = 3221225472;
                    v96 = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2;
                    v97 = &unk_1E5E3C730;
                    v100 = v21;
                    v99 = v35;
                    v98 = v83;
                    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", &v94);

                    continue;
                  }
                }
              }
              v32 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v116, &v112, 16);
              if (!v32)
              {
LABEL_92:

                goto LABEL_93;
              }
            }
          }
          v22 = (id)objc_opt_new();

          v28 = v83;
        }
        else
        {
LABEL_95:

          v28 = v83;
          v22 = v28;
        }
      }
      else
      {
        if ((objc_msgSend(v78, "isEqual:", CFSTR("com.apple.private.biome.writer")) & 1) != 0
          || (objc_msgSend(v78, "isEqual:", CFSTR("com.apple.internal.biome.writer")) & 1) != 0
          || (objc_msgSend(v78, "isEqual:", CFSTR("com.apple.private.biome.pruner")) & 1) != 0
          || objc_msgSend(v78, "isEqual:", CFSTR("com.apple.internal.biome.pruner")))
        {
          v82 = (void *)objc_opt_new();
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          -[BMProcess nonnullSetOfStringsForEntitlement:](v75, "nonnullSetOfStringsForEntitlement:", v78);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v113;
            do
            {
              for (m = 0; m != v24; ++m)
              {
                if (*(_QWORD *)v113 != v25)
                  objc_enumerationMutation(v23);
                objc_msgSend(v82, "setObject:forKeyedSubscript:", &unk_1E5E48A80, *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * m));
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
            }
            while (v24);
          }

          BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(v82);
          v27 = (void *)objc_opt_new();
          v103 = (const __CFString *)MEMORY[0x1E0C809B0];
          v104 = 3221225472;
          v105 = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_199;
          v106 = (const __CFString *)&unk_1E5E3C758;
          v22 = v27;
          v107 = v22;
          objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", &v103);
        }
        else if ((objc_msgSend(v78, "isEqual:", CFSTR("com.apple.private.biome.write-only")) & 1) != 0
               || objc_msgSend(v78, "isEqual:", CFSTR("com.apple.internal.biome.write-only")))
        {
          v82 = (void *)objc_opt_new();
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          -[BMProcess nonnullSetOfStringsForEntitlement:](v75, "nonnullSetOfStringsForEntitlement:", v78);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v113;
            do
            {
              for (n = 0; n != v49; ++n)
              {
                if (*(_QWORD *)v113 != v50)
                  objc_enumerationMutation(v48);
                objc_msgSend(v82, "setObject:forKeyedSubscript:", &unk_1E5E48A98, *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * n));
              }
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
            }
            while (v49);
          }

          BMExpandBiomeLibraryPremigrationIdentifiersAccessModeDictionary(v82);
          v52 = (void *)objc_opt_new();
          v103 = (const __CFString *)MEMORY[0x1E0C809B0];
          v104 = 3221225472;
          v105 = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_201;
          v106 = (const __CFString *)&unk_1E5E3C758;
          v22 = v52;
          v107 = v22;
          objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", &v103);
        }
        else if ((objc_msgSend(v78, "isEqual:", CFSTR("com.apple.private.biome.read-only")) & 1) != 0
               || objc_msgSend(v78, "isEqual:", CFSTR("com.apple.internal.biome.read-only")))
        {
          v82 = (void *)objc_opt_new();
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          -[BMProcess nonnullSetOfStringsForEntitlement:](v75, "nonnullSetOfStringsForEntitlement:", v78);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v113;
            do
            {
              for (ii = 0; ii != v54; ++ii)
              {
                if (*(_QWORD *)v113 != v55)
                  objc_enumerationMutation(v53);
                objc_msgSend(v82, "setObject:forKeyedSubscript:", &unk_1E5E48A68, *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * ii));
              }
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
            }
            while (v54);
          }

          BMExpandBiomeStreamsPremigrationIdentifiersAccessModeDictionary(v82);
          v57 = (void *)objc_opt_new();
          v103 = (const __CFString *)MEMORY[0x1E0C809B0];
          v104 = 3221225472;
          v105 = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_2_202;
          v106 = (const __CFString *)&unk_1E5E3C758;
          v22 = v57;
          v107 = v22;
          objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", &v103);
        }
        else
        {
          if ((objc_msgSend(v78, "isEqual:", CFSTR("com.apple.private.biome.read-write")) & 1) == 0
            && !objc_msgSend(v78, "isEqual:", v67))
          {
            goto LABEL_34;
          }
          v82 = (void *)objc_opt_new();
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          -[BMProcess nonnullSetOfStringsForEntitlement:](v75, "nonnullSetOfStringsForEntitlement:", v78);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
          if (v59)
          {
            v60 = *(_QWORD *)v113;
            do
            {
              for (jj = 0; jj != v59; ++jj)
              {
                if (*(_QWORD *)v113 != v60)
                  objc_enumerationMutation(v58);
                objc_msgSend(v82, "setObject:forKeyedSubscript:", &unk_1E5E48A80, *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * jj));
              }
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
            }
            while (v59);
          }

          BMExpandBiomeStreamsPremigrationIdentifiersAccessModeDictionary(v82);
          v62 = (void *)objc_opt_new();
          v103 = (const __CFString *)MEMORY[0x1E0C809B0];
          v104 = 3221225472;
          v105 = __BMResourcesAndAccessModesListedUnderEntitlement_block_invoke_3;
          v106 = (const __CFString *)&unk_1E5E3C758;
          v22 = v62;
          v107 = v22;
          objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", &v103);
        }
        v28 = v107;
      }

LABEL_98:
LABEL_99:

      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __44__BMAccessControlPolicy_authorizedResources__block_invoke;
      v87[3] = &unk_1E5E3C6A8;
      v88 = v70;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v87);

      if (++v76 == v68)
      {
        v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
        v68 = v63;
        if (!v63)
          goto LABEL_132;
        goto LABEL_23;
      }
    }
  }
  v4 = authorizedResources;
LABEL_133:
  os_unfair_lock_unlock(lock);
  return v4;
}

- (BOOL)allowsAccessToClientCompute:(id)a3
{
  id v4;
  BMProcess *process;
  char v6;
  void *v7;
  BMAccessControlPolicy *onBehalfOf;
  char v9;

  v4 = a3;
  process = self->_process;
  if (process)
  {
    switch(-[BMProcess processType](process, "processType"))
    {
      case 1uLL:
      case 3uLL:
        -[BMProcess identifier](self->_process, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v7, "isEqual:", v4);

        break;
      case 2uLL:
      case 6uLL:
      case 7uLL:
        v6 = 1;
        break;
      case 4uLL:
      case 5uLL:
        onBehalfOf = self->_onBehalfOf;
        if (!onBehalfOf)
          goto LABEL_7;
        v9 = -[BMAccessControlPolicy allowsAccessToClientCompute:](onBehalfOf, "allowsAccessToClientCompute:", v4);
        goto LABEL_9;
      case 8uLL:
        v9 = os_variant_allows_internal_security_policies();
LABEL_9:
        v6 = v9;
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v6 = 0;
  }

  return v6;
}

- (BOOL)allowsAccessToStream:(id)a3 withMode:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  BMProcess **p_process;
  void *v11;
  char v12;
  int v13;
  int v14;
  char v15;
  BMAccessControlPolicy *onBehalfOf;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (!a4)
    goto LABEL_6;
  p_process = &self->_process;
  if (!self->_process)
    goto LABEL_6;
  if (!BMIdentifierIsPathSafe(v6))
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v8 = 1;
  switch(-[BMProcess processType](*p_process, "processType"))
  {
    case 0uLL:
    case 5uLL:
      goto LABEL_5;
    case 2uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 3uLL:
      BMSyncableStreamIdentifiers();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v7);

      if ((v12 & 1) == 0)
        goto LABEL_8;
      goto LABEL_14;
    case 4uLL:
      onBehalfOf = self->_onBehalfOf;
      if (!onBehalfOf
        || !-[BMAccessControlPolicy allowsAccessToStream:withMode:](onBehalfOf, "allowsAccessToStream:withMode:", v7, 2))
      {
        goto LABEL_5;
      }
      goto LABEL_14;
    case 8uLL:
      v15 = os_variant_allows_internal_security_policies();
      goto LABEL_16;
    default:
LABEL_8:
      v13 = objc_msgSend(v7, "hasSuffix:", CFSTR(":subscriptions"));
      v14 = objc_msgSend(v7, "hasSuffix:", CFSTR(":tombstones"));
      if (objc_msgSend(v7, "hasPrefix:", CFSTR("_DK")))
      {
        if (((v13 | v14) & 1) != 0)
          goto LABEL_5;
        if (-[BMProcess BOOLForEntitlement:](*p_process, "BOOLForEntitlement:", CFSTR("com.apple.rootless.storage.coreduet_knowledge_store")))
        {
LABEL_14:
          v8 = 1;
        }
        else
        {
          v15 = -[BMProcess BOOLForEntitlement:](*p_process, "BOOLForEntitlement:", CFSTR("com.apple.coreduetd.allow"));
LABEL_16:
          v8 = v15;
        }
        goto LABEL_6;
      }
      if (!v13)
      {
        if (v14)
        {
          objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 1, a4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v22, "containsObject:", v21);

          goto LABEL_6;
        }
        v8 = 1;
        -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 1, a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "containsObject:", v7) & 1) != 0)
          goto LABEL_38;
        if (-[BMProcess BOOLForEntitlement:](*p_process, "BOOLForEntitlement:", CFSTR("com.apple.private.security.storage.Biome")))
        {
          -[BMProcess executableName](*p_process, "executableName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(&unk_1E5E49F10, "containsObject:", v24);

          if ((v25 & 1) != 0)
            goto LABEL_36;
        }
        if (objc_msgSend(v7, "isEqual:", CFSTR("Discoverability.Signals")))
        {
          -[BMProcess identifier](*p_process, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isEqual:", CFSTR("com.apple.activitysharingd")))
          {

            goto LABEL_29;
          }
          -[BMProcess identifier](*p_process, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqual:", CFSTR("com.apple.camera"));

          if (v28)
          {
LABEL_29:
            __biome_log_for_category(6);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              goto LABEL_34;
            goto LABEL_35;
          }
          if (-[BMProcess BOOLForEntitlement:](*p_process, "BOOLForEntitlement:", CFSTR("com.apple.rootless.storage.coreduet_knowledge_store"))|| -[BMProcess BOOLForEntitlement:](*p_process, "BOOLForEntitlement:", CFSTR("com.apple.coreduetd.allow")))
          {
            __biome_log_for_category(6);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
LABEL_34:
              -[BMAccessControlPolicy allowsAccessToStream:withMode:].cold.1((uint64_t)p_process);
LABEL_35:

LABEL_36:
            v8 = 1;
LABEL_38:

            goto LABEL_6;
          }
        }
        v8 = 0;
        goto LABEL_38;
      }
      if ((a4 & 2) != 0)
        goto LABEL_5;
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 1, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v19, "containsObject:", v18);

LABEL_6:
      return v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_authorizedResources, 0);
  objc_storeStrong((id *)&self->_onBehalfOf, 0);
}

- (BMProcess)process
{
  return self->_process;
}

+ (BOOL)process:(id)a3 canActOnBehalfOfProcess:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "processType") != 4)
  {
    if (objc_msgSend(v5, "processType") != 5)
      goto LABEL_9;
    v9 = objc_msgSend(v6, "processType");
    if ((unint64_t)(v9 - 1) < 3)
    {
      v8 = 1;
      goto LABEL_10;
    }
    if (v9 != 8)
    {
LABEL_9:
      v8 = 0;
      goto LABEL_10;
    }
LABEL_8:
    v8 = os_variant_allows_internal_security_policies();
    goto LABEL_10;
  }
  v7 = objc_msgSend(v6, "processType");
  if (v7 == 8)
    goto LABEL_8;
  v8 = v7 == 1;
LABEL_10:

  return v8;
}

- (BOOL)allowsAccessToSetStoreUpdateServiceForSet:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  char v9;

  v4 = a3;
  -[BMProcess identifier](self->_process, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  v6 = -[BMProcess processType](self->_process, "processType");
  if (v6 > 8)
    goto LABEL_10;
  if (((1 << v6) & 0x35) == 0)
  {
    if (v6 == 3)
    {
      v7 = 1;
      goto LABEL_5;
    }
    if (v6 == 8)
    {
      v9 = os_variant_allows_internal_security_policies();
LABEL_11:
      v7 = v9;
      goto LABEL_5;
    }
LABEL_10:
    v9 = -[BMAccessControlPolicy allowsAccessToSet:withMode:](self, "allowsAccessToSet:withMode:", v4, 3);
    goto LABEL_11;
  }
LABEL_4:
  v7 = 0;
LABEL_5:

  return v7;
}

- (BOOL)allowsAccessToSet:(id)a3 withMode:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v10;
  BMAccessControlPolicy *onBehalfOf;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a4 && self->_process)
  {
    if (BMIdentifierIsPathSafe(v6))
    {
      v8 = 1;
      switch(-[BMProcess processType](self->_process, "processType"))
      {
        case 0uLL:
        case 4uLL:
          goto LABEL_5;
        case 2uLL:
        case 3uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 5uLL:
          onBehalfOf = self->_onBehalfOf;
          if (!onBehalfOf
            || !-[BMAccessControlPolicy allowsAccessToSet:withMode:](onBehalfOf, "allowsAccessToSet:withMode:", v7, 3))
          {
            goto LABEL_5;
          }
          break;
        case 8uLL:
          v8 = os_variant_allows_internal_security_policies();
          break;
        default:
          -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 4, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v10, "containsObject:", v7);

          break;
      }
    }
    else
    {
LABEL_5:
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)allowedModeForStream:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(":subscriptions")))
  {
    if (-[BMProcess processType](self->_process, "processType") == 2)
    {
      v5 = 3;
      goto LABEL_12;
    }
    if (-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", v4, 3)
      || -[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", v4, 2))
    {
      v5 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = 3;
  if (!-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", v4, 3))
  {
    v5 = 1;
    if (!-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", v4, 1))
    {
      v5 = 2;
      if (!-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", v4, 2))
        goto LABEL_11;
    }
  }
LABEL_12:

  return v5;
}

+ (id)policyForProcess:(id)a3 connectionFlags:(unint64_t)a4 useCase:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;

  v8 = a3;
  v9 = a5;
  if (!v8)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if ((a4 & 1) != 0)
  {
    __biome_log_for_category(6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[BMAccessControlPolicy policyForProcess:connectionFlags:useCase:].cold.1(v11);

    goto LABEL_7;
  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProcess:connectionFlags:useCase:", v8, a4, v9);
LABEL_8:

  return v10;
}

+ (id)policyForProcess:(id)a3 connectionFlags:(unint64_t)a4 onBehalfOfProcessWithAccessControlPolicy:(id)a5
{
  id v9;
  void *v10;
  id *v11;
  unint64_t v12;
  id v13;
  id v14;
  void *v15;

  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (a3 && v9)
  {
    v12 = a4 | 1;
    v13 = a3;
    v14 = objc_alloc((Class)a1);
    objc_msgSend(v10, "useCase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id *)objc_msgSend(v14, "initWithProcess:connectionFlags:useCase:", v13, v12, v15);

    objc_storeStrong(v11 + 1, a5);
  }

  return v11;
}

- (BMAccessControlPolicy)init
{

  return 0;
}

- (BMAccessControlPolicy)initWithProcess:(id)a3 connectionFlags:(unint64_t)a4 useCase:(id)a5
{
  id v9;
  id v10;
  BMAccessControlPolicy *v11;
  BMAccessControlPolicy *v12;
  uint64_t v13;
  NSString *useCase;
  NSDictionary *authorizedResources;
  BMAccessControlPolicy *v16;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMAccessControlPolicy;
    v11 = -[BMAccessControlPolicy init](&v18, sel_init);
    v12 = v11;
    if (v11)
    {
      v11->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v11->_process, a3);
      v13 = objc_msgSend(v10, "copy");
      useCase = v12->_useCase;
      v12->_useCase = (NSString *)v13;

      authorizedResources = v12->_authorizedResources;
      v12->_authorizedResources = 0;

      v12->_connectionFlags = a4;
    }
    self = v12;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)allowsAccessToDatabase:(id)a3 withMode:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v10;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a4 && self->_process)
  {
    if (BMIdentifierIsPathSafe(v6))
    {
      v8 = 1;
      switch(-[BMProcess processType](self->_process, "processType"))
      {
        case 0uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_5;
        case 2uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 8uLL:
          v8 = os_variant_allows_internal_security_policies();
          break;
        default:
          -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 3, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v10, "containsObject:", v7);

          break;
      }
    }
    else
    {
LABEL_5:
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)allowsAccessToView:(id)a3 withMode:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v10;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a4 && self->_process)
  {
    if (BMIdentifierIsPathSafe(v6))
    {
      v8 = 1;
      switch(-[BMProcess processType](self->_process, "processType"))
      {
        case 0uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_5;
        case 2uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 8uLL:
          v8 = os_variant_allows_internal_security_policies();
          break;
        default:
          -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 2, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v10, "containsObject:", v7);

          break;
      }
    }
    else
    {
LABEL_5:
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)allowsAccessToSync
{
  BMProcess *process;

  process = self->_process;
  if (process)
  {
    process = -[BMProcess processType](process, "processType");
    if (process)
      LOBYTE(process) = -[BMProcess processType](self->_process, "processType") == 3
                     || os_variant_allows_internal_security_policies()
                     && -[BMProcess processType](self->_process, "processType") == 8;
  }
  return (char)process;
}

- (BOOL)allowsAccessToFlexibleStorage
{
  BMProcess *process;
  uint64_t v4;

  process = self->_process;
  if (process)
  {
    v4 = -[BMProcess processType](process, "processType");
    LOBYTE(process) = 1;
    switch(v4)
    {
      case 0:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        goto LABEL_3;
      case 2:
        return (char)process;
      case 8:
        LOBYTE(process) = os_variant_allows_internal_security_policies();
        break;
      default:
        if (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-only"))|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.read-only"))))
        {
          LOBYTE(process) = 1;
        }
        else
        {
LABEL_3:
          LOBYTE(process) = 0;
        }
        break;
    }
  }
  return (char)process;
}

- (BOOL)allowsConnectionToComputePublisherService
{
  void *v3;
  unint64_t v4;
  BOOL result;

  -[BMProcess identifier](self->_process, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = -[BMProcess processType](self->_process, "processType");
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
      return 0;
    case 2uLL:
    case 3uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 8uLL:
      result = os_variant_allows_internal_security_policies();
      break;
    default:
      if (!-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-write"))&& !-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-only"))&& !-[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.private.intelligenceplatform.use-cases"))&& (!os_variant_allows_internal_security_policies()|| !-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.read-write"))&& !-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
               CFSTR("com.apple.internal.biome.read-only"))
         && !-[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.internal.intelligenceplatform.use-cases"))))
      {
        return 0;
      }
      result = 1;
      break;
  }
  return result;
}

- (BOOL)allowsComputePublisherAccessToStreams:(id)a3
{
  id v4;
  BMProcess *process;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  process = self->_process;
  if (process)
  {
    -[BMProcess identifier](process, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v4 = v4;
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v4);
            if (!BMIdentifierIsPathSafe(*(void **)(*((_QWORD *)&v22 + 1) + 8 * i)))
            {

              goto LABEL_24;
            }
          }
          v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v8)
            continue;
          break;
        }
      }

      LOBYTE(v6) = 1;
      switch(-[BMProcess processType](self->_process, "processType"))
      {
        case 0uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_24;
        case 2uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 3uLL:
          BMSyncableStreamIdentifiers();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bm_setBySubtractingSet:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "count"))
          {
            v4 = v12;
LABEL_14:
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            v4 = v4;
            v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v19;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v19 != v15)
                    objc_enumerationMutation(v4);
                  if (!-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), 1, (_QWORD)v18))
                  {
                    LOBYTE(v6) = 0;
                    goto LABEL_28;
                  }
                }
                v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              }
              while (v14);
            }
            LOBYTE(v6) = 1;
LABEL_28:

            break;
          }
          LOBYTE(v6) = 1;
          v4 = v12;
          break;
        case 8uLL:
          LOBYTE(v6) = os_variant_allows_internal_security_policies();
          break;
        default:
          goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_24:
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (BOOL)allowsComputeSourceAccessToStream:(id)a3
{
  void *v4;
  void *v5;
  BMProcess *process;
  BOOL v7;
  void *v9;
  char v10;
  char v11;
  BMAccessControlPolicy *onBehalfOf;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  process = self->_process;
  if (process
    && (-[BMProcess identifier](process, "identifier"),
        (id)objc_claimAutoreleasedReturnValue(),
        BMIdentifierIsPathSafe(v5)))
  {
    v7 = 1;
    switch(-[BMProcess processType](self->_process, "processType"))
    {
      case 0uLL:
      case 5uLL:
        goto LABEL_4;
      case 2uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 3uLL:
        BMSyncableStreamIdentifiers();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v5);

        if ((v10 & 1) == 0)
          goto LABEL_8;
        v7 = 1;
        break;
      case 4uLL:
        onBehalfOf = self->_onBehalfOf;
        if (!onBehalfOf)
          goto LABEL_4;
        v11 = -[BMAccessControlPolicy allowsComputeSourceAccessToStream:](onBehalfOf, "allowsComputeSourceAccessToStream:", v5);
        goto LABEL_12;
      case 8uLL:
        v11 = os_variant_allows_internal_security_policies();
        goto LABEL_12;
      default:
LABEL_8:
        v11 = -[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", v5, 2);
LABEL_12:
        v7 = v11;
        break;
    }
  }
  else
  {
LABEL_4:
    v7 = 0;
  }

  return v7;
}

- (BOOL)allowsProxyingBiomeEndpoint
{
  void *v3;
  void *v4;
  int v5;

  -[BMProcess identifier](self->_process, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", CFSTR("com.apple.coreduetd")))
  {

    return -[BMProcess BOOLForEntitlement:](self->_process, "BOOLForEntitlement:", CFSTR("com.apple.rootless.storage.coreduet_knowledge_store"));
  }
  -[BMProcess identifier](self->_process, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.knowledge-agent"));

  if (v5)
    return -[BMProcess BOOLForEntitlement:](self->_process, "BOOLForEntitlement:", CFSTR("com.apple.rootless.storage.coreduet_knowledge_store"));
  return 0;
}

- (void)_warnAboutInternalEntitlement:(id)a3 streamIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    -[BMProcess executablePath](self->_process, "executablePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsString:", CFSTR("/usr/local/")) & 1) == 0
      && (objc_msgSend(v8, "containsString:", CFSTR("/usr/appleinternal/")) & 1) == 0
      && (objc_msgSend(v8, "containsString:", CFSTR("/AppleInternal/")) & 1) == 0)
    {
      __biome_log_for_category(6);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543618;
        v11 = v7;
        v12 = 2114;
        v13 = v6;
        _os_log_impl(&dword_1AEB31000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: utilizing internal-only policy to allow access to '%{public}@' via entitlement '%{public}@'", (uint8_t *)&v10, 0x16u);
      }

    }
  }

}

+ (id)contextSyncMapping
{
  return &unk_1E5E4A478;
}

- (BOOL)allowsAccessToContextSyncStreams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  BMProcess *process;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  char v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[BMAccessControlPolicy contextSyncMapping](BMAccessControlPolicy, "contextSyncMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          __biome_log_for_category(6);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AEB31000, v23, OS_LOG_TYPE_INFO, "allowsAccessToContextSyncStreams: set is not exclusively ContextSync.LOI", buf, 2u);
          }

          goto LABEL_33;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      if (v9)
        continue;
      break;
    }
  }

  process = self->_process;
  if (!process)
  {
    __biome_log_for_category(6);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v25 = "allowsAccessToContextSyncStreams: _process == nil";
    goto LABEL_31;
  }
  -[BMProcess identifier](process, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v38;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v17);
          if ((BMIdentifierIsPathSafe(*(void **)(*((_QWORD *)&v37 + 1) + 8 * j)) & 1) == 0)
          {
            __biome_log_for_category(6);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AEB31000, v26, OS_LOG_TYPE_INFO, "allowsAccessToContextSyncStreams: !BMStreamIdentifierIsPathSafe(streamIdentifier)", buf, 2u);
            }

            goto LABEL_33;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v19)
          continue;
        break;
      }
    }

    v22 = 1;
    switch(-[BMProcess processType](self->_process, "processType"))
    {
      case 0uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_33;
      case 2uLL:
      case 3uLL:
        goto LABEL_34;
      case 8uLL:
        v22 = os_variant_allows_internal_security_policies();
        goto LABEL_34;
      default:
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v28 = v7;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
        if (!v29)
          goto LABEL_43;
        v30 = v29;
        v31 = *(_QWORD *)v34;
        break;
    }
    while (2)
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v28);
        if (!-[BMAccessControlPolicy allowsAccessToStream:withMode:](self, "allowsAccessToStream:withMode:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k), 1, (_QWORD)v33))
        {
          v22 = 0;
          goto LABEL_45;
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      if (v30)
        continue;
      break;
    }
LABEL_43:
    v22 = 1;
LABEL_45:

    goto LABEL_34;
  }
  __biome_log_for_category(6);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v25 = "allowsAccessToContextSyncStreams: !_process.identifier";
LABEL_31:
    _os_log_impl(&dword_1AEB31000, v24, OS_LOG_TYPE_INFO, v25, buf, 2u);
  }
LABEL_32:

LABEL_33:
  v22 = 0;
LABEL_34:

  return v22;
}

- (BOOL)allowsAccessToContextSync
{
  unint64_t v4;

  if (-[BMProcess processType](self->_process, "processType") == 2
    || -[BMProcess processType](self->_process, "processType") == 3)
  {
    return 1;
  }
  v4 = -[BMProcess processType](self->_process, "processType");
  if (v4 > 8)
    return -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-only"))|| -[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.private.intelligenceplatform.use-cases"))|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
              CFSTR("com.apple.internal.biome.read-only"))
         || -[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.internal.intelligenceplatform.use-cases")));
  if (((1 << v4) & 0xF1) != 0)
    return 0;
  if (((1 << v4) & 0xC) != 0)
    return 1;
  if (v4 != 8)
    return -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.private.biome.read-only"))|| -[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.private.intelligenceplatform.use-cases"))|| os_variant_allows_internal_security_policies()&& (-[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:", CFSTR("com.apple.internal.biome.read-write"))|| -[BMProcess hasNonEmptyArrayForEntitlement:](self->_process, "hasNonEmptyArrayForEntitlement:",
              CFSTR("com.apple.internal.biome.read-only"))
         || -[BMProcess hasNonEmptyDictionaryForEntitlement:](self->_process, "hasNonEmptyDictionaryForEntitlement:", CFSTR("com.apple.internal.intelligenceplatform.use-cases")));
  return os_variant_allows_internal_security_policies();
}

- (NSString)descriptionOfProcessAndUseCase
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = -[NSString hasPrefix:](self->_useCase, "hasPrefix:", CFSTR("__"));
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProcess executableName](self->_process, "executableName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
    v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("'%@'"), v5, v10);
  else
    v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("'%@' use case '%@'"), v5, self->_useCase);
  v8 = (void *)v7;

  return (NSString *)v8;
}

- (BOOL)allowsAccessToWriteServiceForStream:(id)a3 ofUser:(unsigned int)a4
{
  id v5;
  void *v6;
  unint64_t v8;
  void *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "hasSuffix:", CFSTR(":subscriptions")) & 1) != 0
    || (objc_msgSend(v5, "hasSuffix:", CFSTR(":tombstones")) & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[BMProcess identifier](self->_process, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v8 = -[BMProcess processType](self->_process, "processType");
      LOBYTE(v6) = 0;
      if (v8 - 2 >= 4)
      {
        if (v8)
        {
          if (v8 == 8)
          {
            LOBYTE(v6) = os_variant_allows_internal_security_policies();
          }
          else
          {
            -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 1, 2);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v5);

          }
        }
      }
    }
  }

  return (char)v6;
}

- (BOOL)allowsAccessToBiomeAgentForUser:(unsigned int)a3
{
  void *v5;
  unsigned int v6;
  unint64_t v7;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[BMProcess identifier](self->_process, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_13;
  v6 = -[BMProcess uid](self->_process, "uid");
  if (a3 < 0x1F5 || v6 >= 0x1F5)
  {
    __biome_log_for_category(6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BMAccessControlPolicy(DaemonToAgent) allowsAccessToBiomeAgentForUser:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    goto LABEL_13;
  }
  v7 = -[BMProcess processType](self->_process, "processType");
  if (v7 - 2 < 6 || v7 == 0)
  {
LABEL_13:
    LOBYTE(v18) = 0;
    return v18;
  }
  if (v7 == 8)
    return os_variant_allows_internal_security_policies();
  v19 = (void *)objc_opt_new();
  -[BMAccessControlPolicy explicitlyAuthorizedResourcesOfType:withAccessMode:](self, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 1, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unionSet:", v20);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v19;
  v18 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v22 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v21);
        if (!BMServiceDomainForStream(2, *(void **)(*((_QWORD *)&v24 + 1) + 8 * i)))
        {
          LOBYTE(v18) = 1;
          goto LABEL_25;
        }
      }
      v18 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_25:

  return v18;
}

- (BOOL)allowsAccessToProxyBiomeAgentEndpoint
{
  void *v3;
  void *v4;
  char v5;

  -[BMProcess identifier](self->_process, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || -[BMProcess processType](self->_process, "processType") != 2
    || !-[NSString isEqual:](self->_useCase, "isEqual:", CFSTR("__proxy__")))
  {
    return 0;
  }
  -[BMProcess identifier](self->_process, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.biomed"));

  return v5;
}

+ (BOOL)allowsConfiguringConnection:(id)a3 forUseCase:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  BMProcess *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  uint64_t *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v8 = (BMProcess *)a3;
  v9 = a4;
  if ((BMIdentifierIsPathSafe(v9) & 1) != 0)
  {
    -[NSXPCConnection bm_process](v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection bm_accessControlPolicy](v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "useCase");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v11, "useCase");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v9);

      if ((v15 & 1) == 0)
      {
        if (a6)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v49 = *MEMORY[0x1E0CB2D50];
          v50 = CFSTR("Use case already set");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 5, v21);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("__")) & 1) == 0)
    {
      objc_msgSend(v10, "useCases");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v9);

      if ((v17 & 1) != 0)
        goto LABEL_7;
    }
    if ((objc_msgSend((id)BMAnyClientUseCaseAllowList, "containsObject:", v9) & 1) != 0)
      goto LABEL_7;
    v22 = objc_msgSend(v9, "isEqual:", CFSTR("__proxy__"));
    v23 = objc_msgSend(v10, "processType");
    if (v22)
    {
      if (v23 != 2
        || (objc_msgSend(v10, "identifier"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v24, "isEqual:", CFSTR("com.apple.biomed")),
            v24,
            (v25 & 1) == 0))
      {
        if (objc_msgSend(v10, "processType") != 1
          || (objc_msgSend(v10, "identifier"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(&unk_1E5E49F28, "containsObject:", v26),
              v26,
              (v27 & 1) == 0))
        {
          if (a6)
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            v47 = *MEMORY[0x1E0CB2D50];
            v29 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v10, "executableName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("Process '%@' not authorized for use-case '%@'"), v21, v9);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v30;
            v31 = (void *)MEMORY[0x1E0C99D80];
            v32 = &v48;
            v33 = &v47;
LABEL_20:
            objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 4, v34);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_35:
            goto LABEL_36;
          }
          goto LABEL_37;
        }
      }
      goto LABEL_7;
    }
    if ((v23 == 2 || objc_msgSend(v10, "processType") == 7)
      && (objc_msgSend((id)BMBiomeDaemonUseCaseAllowList, "containsObject:", v9) & 1) != 0
      || objc_msgSend(v10, "processType") == 3)
    {
      goto LABEL_7;
    }
    if (objc_msgSend(v9, "isEqual:", CFSTR("__internal__")))
    {
      if ((os_variant_allows_internal_security_policies() & 1) != 0)
      {
        if (objc_msgSend(v10, "processType") != 8)
        {
          if (a6)
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            v43 = *MEMORY[0x1E0CB2D50];
            v35 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v10, "executableName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "stringWithFormat:", CFSTR("Process '%@' not authorized for use-case '%@'"), v21, v9);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v30;
            v31 = (void *)MEMORY[0x1E0C99D80];
            v32 = &v44;
            v33 = &v43;
            goto LABEL_20;
          }
LABEL_37:
          v18 = 0;
          goto LABEL_38;
        }
LABEL_7:
        v18 = 1;
LABEL_38:

        goto LABEL_39;
      }
      if (!a6)
        goto LABEL_37;
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use-case '%@' not authorized"), v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v39;
      v38 = 4;
    }
    else
    {
      if (!a6)
        goto LABEL_37;
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use case '%@' not found"), v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = 3;
    }
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), v38, v30);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if (a6)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid use case '%@'"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BMAccessErrorDomain"), 2, v11);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  v18 = 0;
LABEL_39:

  return v18;
}

+ (void)policyForProcess:(os_log_t)log connectionFlags:useCase:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AEB31000, log, OS_LOG_TYPE_FAULT, "Internal error: on-behalf-of connections must use different initializer", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)allowsConnectionToAccessServiceWithDomain:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;

  objc_msgSend((id)OUTLINED_FUNCTION_5((uint64_t)a1), "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*a1, "pid");
  v6 = 138543618;
  v7 = v4;
  v8 = 1024;
  v9 = v5;
  _os_log_fault_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_FAULT, "Process %{public}@(%d) is not allowed to have datavault entitlement", (uint8_t *)&v6, 0x12u);

  OUTLINED_FUNCTION_0_0();
}

- (void)allowsConnectionToAccessServiceWithDomain:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, a1, a3, "Utilizing temporary coreduet exception to access Biome", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)allowsConnectionToAccessServiceWithDomain:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_5(a1), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_ERROR, "Utilizing temporary exception to allow %@ access to Biome", (uint8_t *)&v4, 0xCu);

}

- (void)allowsAccessToStream:(uint64_t)a1 withMode:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_5(a1), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1AEB31000, v2, v3, "Utilizing temporary exception to allow %{public}@ access to %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
