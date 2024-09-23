@implementation MCMCommandQuery

- (BOOL)_executeQueryPlan:(id)a3 resultContainers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  BOOL v20;
  id v21;
  int v22;
  void *v23;
  BOOL v24;
  id *v26;
  id v27;
  id v28[2];

  v28[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MCMCommand context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "codeSignInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entitlements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "count"))
  {
    v14 = 0;
    v24 = 1;
    goto LABEL_21;
  }
  v26 = a5;
  v14 = 0;
  while (1)
  {
    objc_msgSend(v8, "firstObject", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    v28[0] = v14;
    -[MCMCommandQuery _executeQueryForContainerIdentity:error:](self, "_executeQueryForContainerIdentity:error:", v15, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v28[0];

    if (v16)
      break;
    if (v17)
      goto LABEL_17;
    if (-[MCMCommandQuery fuzzyMatchTransient](self, "fuzzyMatchTransient"))
    {
      v22 = objc_msgSend(v15, "transient");
      if (v22 == -[MCMCommandQuery transient](self, "transient"))
      {
        objc_msgSend(v15, "identityByChangingTransient:", objc_msgSend(v15, "transient") ^ 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v23);

      }
    }
    v14 = 0;
LABEL_13:

    if (!objc_msgSend(v8, "count"))
    {
      v24 = 1;
      goto LABEL_18;
    }
  }
  -[MCMCommandQuery containerConfig](self, "containerConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "supportsProtectedContainerWithRestrictedEntitlement");

  if (!v19)
  {
LABEL_7:
    objc_msgSend(v9, "addObject:", v16);
    v14 = v17;
    goto LABEL_13;
  }
  v27 = v17;
  v20 = +[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier secureRestrictedContainerIfNeededWithMetadata:entitlements:error:](MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier, "secureRestrictedContainerIfNeededWithMetadata:entitlements:error:", v16, v13, &v27);
  v21 = v27;

  if (v20)
  {
    v17 = v21;
    goto LABEL_7;
  }

  v17 = v21;
LABEL_17:

  v24 = 0;
  v14 = v17;
LABEL_18:
  if (v26 && v14)
  {
    v14 = objc_retainAutorelease(v14);
    *v26 = v14;
  }
LABEL_21:

  return v24;
}

- (id)_executeQueryForContainerIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMCommand context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v8, "containerForContainerIdentity:createIfNecessary:error:", v6, -[MCMCommandQuery createIfNecessary](self, "createIfNecessary"), &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v17;
  if (!v9)
  {
    if (!v10 || objc_msgSend(v10, "type") == 21)
    {

      v13 = 0;
      v12 = 0;
      goto LABEL_21;
    }
    v12 = 0;
    goto LABEL_18;
  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_debug_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEBUG, "Found %@", buf, 0xCu);
  }

  if (!-[MCMCommandQuery includeInfoInResult](self, "includeInfoInResult")
    && !-[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath")
    && !-[MCMCommandQuery includeCreator](self, "includeCreator"))
  {
    objc_msgSend(v9, "metadataMinimal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
    v13 = v10;
    if (!a4)
      goto LABEL_21;
    goto LABEL_19;
  }
  v16 = v10;
  objc_msgSend(v9, "metadataWithError:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (!v12)
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v13;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch metadata; container = %@, error = %@",
        buf,
        0x16u);
    }

    v12 = 0;
  }
  if (a4)
  {
LABEL_19:
    if (v13)
    {
      v13 = objc_retainAutorelease(v13);
      *a4 = v13;
    }
  }
LABEL_21:

  return v12;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (void)execute
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  MCMError *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id *v25;
  void *v26;
  uint64_t v27;
  id *v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _BOOL8 v37;
  id *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  _BOOL4 v48;
  void *context;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  MCMCommandQuery *v55;
  id v56;
  uint64_t *v57;
  id v58;
  id v59;
  id obj;
  id v61;
  id v62;
  id v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  _BYTE v78[128];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandQuery containerConfig](self, "containerConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containerClass");

  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentity");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4 == 13 || v4 == 7;
  v48 = v6;
  if (v4 == 7 || v4 == 13)
  {
    -[MCMCommandQuery groupIdentifiers](self, "groupIdentifiers");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MCMCommandQuery identifiers](self, "identifiers");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__8761;
  v69 = __Block_byref_object_dispose__8762;
  v70 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  objc_msgSend(v50, "codeSignInfo");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v52, "isSigned") & 1) == 0)
  {
    v13 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 98, 3);
LABEL_14:
    v14 = (id)v66[5];
    v66[5] = (uint64_t)v13;
LABEL_15:

    goto LABEL_16;
  }
  if (v8)
  {
LABEL_10:
    v9 = (void *)MEMORY[0x1D17D7010]();
    v10 = (id *)(v66 + 5);
    obj = (id)v66[5];
    -[MCMCommandQuery _queryPlanWithIdentifiers:isGroupClass:clientIdentity:error:](self, "_queryPlanWithIdentifiers:isGroupClass:clientIdentity:error:", v8, v48, v50, &obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    if (v11)
    {
      v12 = (id *)(v66 + 5);
      v59 = (id)v66[5];
      -[MCMCommandQuery _executeQueryPlan:resultContainers:error:](self, "_executeQueryPlan:resultContainers:error:", v11, v51, &v59);
      objc_storeStrong(v12, v59);
    }

    objc_autoreleasePoolPop(v9);
    goto LABEL_16;
  }
  if (v4 == 13 || v4 == 7)
  {
    -[MCMCommandQuery identifiers](self, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") == 0;

    if (!v16)
    {
      -[MCMCommandQuery identifiers](self, "identifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v50, "isAllowedToLookupGroupContainersOfClass:ownedByIdentifiers:", v4, v17);

      if ((v18 & 1) == 0)
      {
        v13 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 55, 3);
LABEL_40:
        v8 = 0;
        goto LABEL_14;
      }
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      -[MCMCommandQuery identifiers](self, "identifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v80;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v80 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
            +[MCMGroupManager defaultManager](MCMGroupManager, "defaultManager");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (id *)(v66 + 5);
            v63 = (id)v66[5];
            objc_msgSend(v24, "groupContainerIdentifiersForOwnerIdentifier:groupContainerClass:codeSignInfo:withError:", v23, v4, v52, &v63);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v25, v63);

            if (!v26)
            {

              goto LABEL_46;
            }
            objc_msgSend(v14, "unionSet:", v26);

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v78, 16);
          if (v20)
            continue;
          break;
        }
      }

      v27 = objc_msgSend(v14, "copy");
      goto LABEL_43;
    }
  }
  if (!-[MCMCommandQuery includeUnowned](self, "includeUnowned"))
  {
    if (v4 == 13 || v4 == 7)
    {
      +[MCMGroupManager defaultManager](MCMGroupManager, "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id *)(v66 + 5);
      v61 = (id)v66[5];
      objc_msgSend(v29, "groupContainerIdentifiersForOwnerIdentifier:groupContainerClass:codeSignInfo:withError:", v30, v4, v52, &v61);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v31, v61);

      if (v8)
        goto LABEL_10;
LABEL_16:
      -[MCMCommandQuery _finalizeWithContainers:error:](self, "_finalizeWithContainers:error:", v51, v66[5]);
      goto LABEL_17;
    }
    v32 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v52, "identifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithObject:", v14);
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_43:
    v8 = (void *)v27;

    if (v8)
      goto LABEL_10;
    goto LABEL_44;
  }
  v28 = (id *)(v66 + 5);
  v62 = (id)v66[5];
  -[MCMCommandQuery _containerIdentifiersIncludingUnownedForContainerClass:canAccessAllContainers:error:](self, "_containerIdentifiersIncludingUnownedForContainerClass:canAccessAllContainers:error:", v4, &v64, &v62);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v28, v62);
  if (!v8)
    goto LABEL_16;
  if (objc_msgSend(v8, "count"))
    goto LABEL_10;

LABEL_44:
  -[MCMCommandQuery groupIdentifiers](self, "groupIdentifiers");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v14 = (id)v33;
LABEL_46:
    v8 = 0;
    goto LABEL_15;
  }
  if (!v64)
  {
    v8 = 0;
    goto LABEL_16;
  }
  -[MCMCommandQuery _setOfUserIdentities](self, "_setOfUserIdentities");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {
    v13 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 115, 3);
    goto LABEL_40;
  }
  v14 = (id)v34;
  -[MCMCommand context](self, "context");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "containerCache");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[MCMCommandQuery transient](self, "transient");
  v38 = (id *)(v66 + 5);
  v58 = (id)v66[5];
  objc_msgSend(v36, "entriesForUserIdentities:contentClass:transient:error:", v14, v4, v37, &v58);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v38, v58);

  if (!-[MCMCommandQuery includeInfoInResult](self, "includeInfoInResult")
    && !-[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath")
    && !-[MCMCommandQuery includeCreator](self, "includeCreator"))
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v43 = v39;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v73 != v45)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "metadataMinimal");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v47);

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
      }
      while (v44);
    }

    goto LABEL_46;
  }
  container_log_handle_for_category();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v50;
    _os_log_impl(&dword_1CF807000, v40, OS_LOG_TYPE_INFO, "Query split into per-container ops since info or user managed assets path requested for all containers by client [%@]", buf, 0xCu);
  }

  -[MCMCommand reply](self, "reply");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __26__MCMCommandQuery_execute__block_invoke;
  v53[3] = &unk_1E8CB5E70;
  v42 = v39;
  v54 = v42;
  v55 = self;
  v56 = v51;
  v57 = &v65;
  objc_msgSend(v41, "handoffToSlowWorkloopforClientIdentity:withBlock:", v50, v53);

  v8 = 0;
LABEL_17:

  _Block_object_dispose(&v65, 8);
  objc_autoreleasePoolPop(context);
}

- (BOOL)includeUserManagedAssetsRelPath
{
  return self->_includeUserManagedAssetsRelPath;
}

- (BOOL)includeInfoInResult
{
  return self->_includeInfoInResult;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (BOOL)legacyPersonaPolicy
{
  return self->_legacyPersonaPolicy;
}

- (BOOL)legacyExtensionPolicy
{
  return self->_legacyExtensionPolicy;
}

- (BOOL)issueSandboxExtensions
{
  return self->_issueSandboxExtensions;
}

- (BOOL)includePathInResult
{
  return self->_includePathInResult;
}

- (BOOL)expectSingleResult
{
  return self->_expectSingleResult;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)fuzzyMatchTransient
{
  return self->_fuzzyMatchTransient;
}

- (BOOL)includeUnowned
{
  return self->_includeUnowned;
}

- (id)_containerIdentifiersIncludingUnownedForContainerClass:(unint64_t)a3 canAccessAllContainers:(BOOL *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MCMError *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24[2];

  v24[1] = *(id *)MEMORY[0x1E0C80C00];
  -[MCMCommand context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "codeSignInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entitlements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "allowed") & 1) == 0 && !objc_msgSend(v11, "otherIDLookup"))
  {
    objc_msgSend(v11, "lookupForContainerClass:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && !objc_msgSend(v15, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v14 = 1;
      goto LABEL_25;
    }
    switch(a3)
    {
      case 0xDuLL:
        goto LABEL_9;
      case 0xCuLL:
        if (!objc_msgSend(v11, "hasSystemContainer"))
        {
          if (!v16)
            goto LABEL_24;
          goto LABEL_20;
        }
        break;
      case 7uLL:
LABEL_9:
        +[MCMGroupManager defaultManager](MCMGroupManager, "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = 0;
        objc_msgSend(v17, "groupContainerIdentifiersForOwnerIdentifier:groupContainerClass:codeSignInfo:withError:", v18, a3, v10, v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (MCMError *)v24[0];

        if (!objc_msgSend(v12, "count"))
        {

          v12 = 0;
        }
        if (v13)
        {
          v14 = 0;
LABEL_25:

          goto LABEL_26;
        }
LABEL_16:
        if (!v16)
          goto LABEL_22;
        if (v12)
        {
LABEL_21:
          v21 = (void *)objc_msgSend(v16, "mutableCopy");
          objc_msgSend(v21, "unionSet:", v12);
          v22 = objc_msgSend(v21, "copy");

          v12 = (void *)v22;
LABEL_22:
          if (v12)
          {
            v14 = 0;
            v13 = 0;
            goto LABEL_25;
          }
LABEL_24:
          v13 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 55, 3);
          v14 = 0;
          v12 = 0;
          goto LABEL_25;
        }
LABEL_20:
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
    }
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithObject:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 1;
LABEL_26:
  *a4 = v14;
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  void *v4;
  char v5;

  if (!-[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath"))
    return 1;
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAllowedToAccessUserAssets");

  return v5;
}

- (MCMCommandQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandQuery *v9;
  uint64_t v10;
  NSSet *identifiers;
  uint64_t v12;
  MCMContainerConfiguration *containerConfig;
  uint64_t v14;
  NSSet *groupIdentifiers;
  uint64_t v16;
  NSUUID *internalUUID;
  uint64_t v18;
  MCMUserIdentity *userIdentity;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCMCommandQuery;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v21, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    v9->_platform = objc_msgSend(v8, "platform");
    v9->_explicitFlags = objc_msgSend(v8, "explicitFlags");
    objc_msgSend(v8, "identifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    identifiers = v9->_identifiers;
    v9->_identifiers = (NSSet *)v10;

    objc_msgSend(v8, "containerConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    containerConfig = v9->_containerConfig;
    v9->_containerConfig = (MCMContainerConfiguration *)v12;

    objc_msgSend(v8, "groupIdentifiers");
    v14 = objc_claimAutoreleasedReturnValue();
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v14;

    objc_msgSend(v8, "internalUUID");
    v16 = objc_claimAutoreleasedReturnValue();
    internalUUID = v9->_internalUUID;
    v9->_internalUUID = (NSUUID *)v16;

    v9->_extensionsUseProxiedClient = objc_msgSend(v8, "extensionsUseProxiedClient");
    v9->_extensionsPolicyUsesProxiedClient = objc_msgSend(v8, "extensionsPolicyUsesProxiedClient");
    v9->_createIfNecessary = objc_msgSend(v8, "createIfNecessary");
    v9->_includeInfoInResult = objc_msgSend(v8, "includeInfoInResult");
    v9->_includePathInResult = objc_msgSend(v8, "includePathInResult");
    v9->_uid = objc_msgSend(v8, "uid");
    objc_msgSend(v8, "userIdentity");
    v18 = objc_claimAutoreleasedReturnValue();
    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (MCMUserIdentity *)v18;

    v9->_transient = objc_msgSend(v8, "transient");
    v9->_fuzzyMatchTransient = objc_msgSend(v8, "fuzzyMatchTransient");
    v9->_fuzzyMatchInternalUUID = objc_msgSend(v8, "fuzzyMatchInternalUUID");
    v9->_includeUnowned = objc_msgSend(v8, "includeUnowned");
    v9->_expectSingleResult = objc_msgSend(v8, "expectSingleResult");
    v9->_legacyPersonaPolicy = objc_msgSend(v8, "legacyPersonaPolicy");
    v9->_legacyExtensionPolicy = objc_msgSend(v8, "legacyExtensionPolicy");
    v9->_includeUserManagedAssetsRelPath = objc_msgSend(v8, "includeUserManagedAssetsRelPath");
    v9->_includeCreator = objc_msgSend(v8, "includeCreator");
    if (v9->_legacyExtensionPolicy
      && v9->_includeUnowned
      && !-[NSSet count](v9->_identifiers, "count")
      && !-[NSSet count](v9->_groupIdentifiers, "count"))
    {
      v9->_issueSandboxExtensions = 0;
    }
    else
    {
      v9->_issueSandboxExtensions = objc_msgSend(v8, "issueSandboxExtensions");
    }
  }

  return v9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (id)_queryPlanWithIdentifiers:(id)a3 isGroupClass:(BOOL)a4 clientIdentity:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  MCMError *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  _BOOL8 v33;
  void *v34;
  uint64_t v35;
  MCMError *v36;
  uint64_t v37;
  NSObject *v38;
  MCMError *v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id *v47;
  id v48;
  id obj;
  void *v50;
  MCMError *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t buf[4];
  MCMCommandQuery *v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;

  v8 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandQuery _setOfUserIdentitiesForIdentifiers:isGroupClass:](self, "_setOfUserIdentitiesForIdentifiers:isGroupClass:", v10, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 115, 3);
    if (!v15)
      goto LABEL_33;
    goto LABEL_31;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v14 = v13;
  v43 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v65, 16);
  v15 = 0;
  if (v43)
  {
    v16 = *(_QWORD *)v67;
    v47 = a6;
    v48 = v10;
    v45 = v14;
    v46 = v13;
    v50 = v12;
    v42 = *(_QWORD *)v67;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v67 != v16)
        {
          v18 = v17;
          objc_enumerationMutation(v14);
          v17 = v18;
        }
        v51 = v15;
        v44 = v17;
        v53 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v17);
        objc_msgSend(v14, "objectForKeyedSubscript:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        obj = v19;
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
        if (v54)
        {
          v52 = *(_QWORD *)v62;
          while (2)
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v62 != v52)
                objc_enumerationMutation(obj);
              v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
              v55 = 1;
              -[MCMCommandQuery internalUUID](self, "internalUUID");
              v22 = objc_claimAutoreleasedReturnValue();
              if (v22
                && (v23 = (void *)v22,
                    v24 = -[MCMCommandQuery fuzzyMatchInternalUUID](self, "fuzzyMatchInternalUUID"),
                    v23,
                    !v24))
              {
                -[MCMCommandQuery internalUUID](self, "internalUUID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[MCMCommandQuery containerConfig](self, "containerConfig");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v11;
                v32 = -[MCMCommandQuery platform](self, "platform");
                v33 = -[MCMCommandQuery transient](self, "transient");
                -[MCMCommand context](self, "context");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "userIdentityCache");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v32;
                v11 = v31;
                +[MCMConcreteContainerIdentity containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMConcreteContainerIdentity, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v25, v53, v21, v28, v35, v33, v34, &v55);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                -[MCMCommandQuery containerConfig](self, "containerConfig");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = -[MCMCommandQuery platform](self, "platform");
                v27 = -[MCMCommandQuery transient](self, "transient");
                -[MCMCommand context](self, "context");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "userIdentityCache");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:", v53, v21, v25, v26, v27, v29, &v55);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
              }

              if (v30)
              {
                if (!objc_msgSend(v11, "isAllowedToLookupContainerIdentity:", v30))
                {
                  v39 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 55, 3);

                  v15 = v39;
                  a6 = v47;
                  v10 = v48;
                  v14 = v45;
                  v13 = v46;
                  v12 = v50;
                  goto LABEL_28;
                }
                objc_msgSend(v50, "addObject:", v30);
              }
              else
              {
                v36 = [MCMError alloc];
                v37 = -[MCMError initWithErrorType:](v36, "initWithErrorType:", v55);

                container_log_handle_for_category();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v57 = self;
                  v58 = 2048;
                  v59 = v55;
                  _os_log_error_impl(&dword_1CF807000, v38, OS_LOG_TYPE_ERROR, "Could not construct container identity from query; query = %@, error = %llu",
                    buf,
                    0x16u);
                }

                v51 = (MCMError *)v37;
              }

            }
            v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
            if (v54)
              continue;
            break;
          }
        }

        v17 = v44 + 1;
        a6 = v47;
        v10 = v48;
        v14 = v45;
        v13 = v46;
        v12 = v50;
        v15 = v51;
        v16 = v42;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v66, v65, 16);
    }
    while (v43);
  }
LABEL_28:

  if (v15)
  {
LABEL_31:

    v12 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }
LABEL_33:
  v40 = v12;

  return v40;
}

- (NSUUID)internalUUID
{
  return self->_internalUUID;
}

- (BOOL)transient
{
  return self->_transient;
}

- (unsigned)platform
{
  return self->_platform;
}

- (id)_setOfUserIdentitiesForIdentifiers:(id)a3 isGroupClass:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MCMCommandQuery *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  host_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  MCMCommandQuery *v112;
  void *v113;
  id obj;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  _BYTE v120[128];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint32_t multiuser_flags;
  void *v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  void *v144;
  uint64_t v145;

  v4 = a4;
  v145 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[MCMCommand context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentity");
  v9 = objc_claimAutoreleasedReturnValue();

  v113 = (void *)v9;
  v10 = (void *)v9;
  v11 = self;
  objc_msgSend(v10, "userIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[MCMCommandQuery userIdentity](self, "userIdentity");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "debugDescription");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    multiuser_flags = 138412290;
    v136 = v53;
    _os_log_debug_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEBUG, "userIdentity: %@", (uint8_t *)&multiuser_flags, 0xCu);

  }
  -[MCMCommandQuery containerConfig](v11, "containerConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "usesGlobalBundleUserIdentity");

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    -[MCMCommand context](v11, "context");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject userIdentityCache](v17, "userIdentityCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "globalBundleUserIdentity");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v22 = (void *)v19;
    objc_msgSend(v16, "setWithObject:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  -[MCMCommandQuery containerConfig](v11, "containerConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "usesGlobalSystemUserIdentity");

  if (v21)
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    -[MCMCommand context](v11, "context");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject userIdentityCache](v17, "userIdentityCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "globalSystemUserIdentity");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[MCMCommandQuery userIdentity](v11, "userIdentity");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[MCMCommandQuery userIdentity](v11, "userIdentity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isNoSpecificPersona");

    if (!v34)
    {
      if ((objc_msgSend(v12, "isNoSpecificPersona") & 1) == 0)
      {
        -[MCMCommandQuery userIdentity](v11, "userIdentity");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v12, "isEqual:", v45);

        if (!v46)
        {
          container_log_handle_for_category();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "shortDescription");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMCommandQuery userIdentity](v11, "userIdentity");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "shortDescription");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            multiuser_flags = 138412546;
            v136 = v95;
            v137 = 2112;
            v138 = (uint64_t)v97;
            _os_log_error_impl(&dword_1CF807000, v56, OS_LOG_TYPE_ERROR, "Ambiguous persona, client has adopted %@ but asks for %@", (uint8_t *)&multiuser_flags, 0x16u);

          }
          goto LABEL_17;
        }
      }
      v47 = (void *)MEMORY[0x1E0C99E60];
      -[MCMCommandQuery userIdentity](v11, "userIdentity");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setWithObject:", v48);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
      -[MCMCommandQuery userIdentity](v11, "userIdentity");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "shortDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      multiuser_flags = 138412290;
      v136 = v50;
      v51 = "Using explicit persona: %@";
LABEL_36:
      _os_log_debug_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEBUG, v51, (uint8_t *)&multiuser_flags, 0xCu);

      goto LABEL_8;
    }
  }
  multiuser_flags = 0;
  v35 = MEMORY[0x1D17D6F20]();
  if (!host_get_multiuser_config_flags(v35, &multiuser_flags) && (multiuser_flags & 0x80000000) != 0)
  {
    -[MCMCommand context](v11, "context");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "clientIdentity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "userIdentity");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "posixUser");
    v17 = objc_claimAutoreleasedReturnValue();

    -[MCMCommand context](v11, "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "userIdentityCache");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "userIdentityForPersonalPersonaWithPOSIXUser:", v17);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      multiuser_flags = 138412290;
      v136 = v41;
      _os_log_debug_impl(&dword_1CF807000, v42, OS_LOG_TYPE_DEBUG, "Using client persona: %@", (uint8_t *)&multiuser_flags, 0xCu);
    }

    goto LABEL_8;
  }
  if (!objc_msgSend(v12, "isNoSpecificPersona"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    objc_msgSend(v113, "userIdentity");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "shortDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    multiuser_flags = 138412290;
    v136 = v50;
    v51 = "Using client implicit persona: %@";
    goto LABEL_36;
  }
  if (!-[MCMCommandQuery legacyPersonaPolicy](v11, "legacyPersonaPolicy"))
  {
    -[MCMCommand context](v11, "context");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "userIdentityCache");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "allAccessibleUserIdentities");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      multiuser_flags = 138412290;
      v136 = v23;
      _os_log_debug_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEBUG, "Using all personas: %@", (uint8_t *)&multiuser_flags, 0xCu);
    }
LABEL_8:

    if (v23)
    {
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v121, v120, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v122;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v122 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v121, v120, 16);
        }
        while (v26);
      }
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v112 = v11;
  if (!v4)
  {
    v105 = v12;
    v57 = (void *)objc_opt_new();
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    obj = v6;
    v58 = v113;
    v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v130, 16);
    if (v116)
    {
      v115 = *(_QWORD *)v132;
      do
      {
        v59 = 0;
        do
        {
          if (*(_QWORD *)v132 != v115)
            objc_enumerationMutation(obj);
          v60 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v59);
          v119 = 1;
          -[MCMCommandQuery containerConfig](v11, "containerConfig");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:](MCMXPCMessageBase, "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:", v60, v58, objc_msgSend(v61, "containerClass"), &v119);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
            dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
          if (MCMRequirePersonaTelemetryOnly_result
            && v119 != 1
            && objc_msgSend(v62, "isNoSpecificPersona"))
          {
            container_log_handle_for_category();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v58, "codeSignInfo");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "identifier");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              -[MCMCommandQuery containerConfig](v11, "containerConfig");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "name");
              v71 = objc_claimAutoreleasedReturnValue();
              multiuser_flags = 138544386;
              v136 = v107;
              v137 = 2112;
              v138 = v71;
              v72 = (void *)v71;
              v139 = 2114;
              v140 = v60;
              v141 = 2114;
              v142 = v58;
              v143 = 2114;
              v144 = v62;
              _os_log_fault_impl(&dword_1CF807000, v63, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona (%{public}@ / %{public}@)", (uint8_t *)&multiuser_flags, 0x34u);

            }
            v119 = 1;
          }
          else
          {
            if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1)
              dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_16);
            if (MCMRequirePersonaAndConvertSystemToPersonal_result
              && v119 != 1
              && objc_msgSend(v62, "isNoSpecificPersona"))
            {
              container_log_handle_for_category();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v58, "codeSignInfo");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "identifier");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                -[MCMCommandQuery containerConfig](v11, "containerConfig");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "name");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                multiuser_flags = 138543874;
                v136 = v73;
                v137 = 2112;
                v138 = (uint64_t)v74;
                v139 = 2114;
                v140 = v60;
                _os_log_fault_impl(&dword_1CF807000, v64, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona - converting to Personal", (uint8_t *)&multiuser_flags, 0x20u);

              }
              v119 = 1;
              -[MCMCommand context](v11, "context");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "userIdentityCache");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "posixUser");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "userIdentityForPersonalPersonaWithPOSIXUser:", v67);
              v68 = objc_claimAutoreleasedReturnValue();

              v58 = v113;
              v62 = (void *)v68;
              v11 = v112;
            }
          }
          objc_msgSend(v57, "objectForKeyedSubscript:", v62);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v69)
          {
            v69 = (void *)objc_opt_new();
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v69, v62);
          }
          objc_msgSend(v57, "objectForKeyedSubscript:", v62);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "addObject:", v60);

          ++v59;
        }
        while (v116 != v59);
        v116 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v130, 16);
      }
      while (v116);
    }

    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v24 = v57;
    v75 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v126, v125, 16);
    v12 = v105;
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v127;
      do
      {
        for (j = 0; j != v76; ++j)
        {
          if (*(_QWORD *)v127 != v77)
            objc_enumerationMutation(v24);
          v79 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * j);
          objc_msgSend(v24, "objectForKeyedSubscript:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (void *)objc_msgSend(v80, "copy");
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v81, v79);

        }
        v76 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v126, v125, 16);
      }
      while (v76);
    }
    goto LABEL_16;
  }
  v119 = 1;
  if (-[MCMCommandQuery includeUnowned](v11, "includeUnowned"))
  {
    -[MCMCommandQuery identifiers](v11, "identifiers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "anyObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MCMCommand context](v11, "context");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "clientIdentity");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "codeSignInfo");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "identifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MCMCommand context](v11, "context");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "userIdentityCache");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "userIdentityForPersonalPersona");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[MCMCommandQuery containerConfig](v11, "containerConfig");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:](MCMXPCMessageBase, "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:", v44, v113, objc_msgSend(v87, "containerClass"), &v119);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
    if (MCMRequirePersonaTelemetryOnly_result && v119 != 1 && objc_msgSend(v88, "isNoSpecificPersona"))
    {
      container_log_handle_for_category();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v113, "codeSignInfo");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "identifier");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMCommandQuery containerConfig](v11, "containerConfig");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "name");
        v106 = v12;
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        multiuser_flags = 138544386;
        v136 = v98;
        v137 = 2112;
        v138 = (uint64_t)v100;
        v139 = 2114;
        v140 = v44;
        v141 = 2114;
        v142 = v113;
        v143 = 2114;
        v144 = v88;
        _os_log_fault_impl(&dword_1CF807000, v89, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona (%{public}@ / %{public}@)", (uint8_t *)&multiuser_flags, 0x34u);

        v12 = v106;
      }

      v119 = 1;
    }
    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1)
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_16);
      if (MCMRequirePersonaAndConvertSystemToPersonal_result
        && v119 != 1
        && objc_msgSend(v88, "isNoSpecificPersona"))
      {
        container_log_handle_for_category();
        v90 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v113, "codeSignInfo");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "identifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandQuery containerConfig](v11, "containerConfig");
          v102 = v12;
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "name");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          multiuser_flags = 138543874;
          v136 = v101;
          v137 = 2112;
          v138 = (uint64_t)v104;
          v139 = 2114;
          v140 = v44;
          _os_log_fault_impl(&dword_1CF807000, v90, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %@:%{public}@ while in one of the System personas or no persona - converting to Personal", (uint8_t *)&multiuser_flags, 0x20u);

          v12 = v102;
        }

        v119 = 1;
        -[MCMCommand context](v11, "context");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "userIdentityCache");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "posixUser");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "userIdentityForPersonalPersonaWithPOSIXUser:", v93);
        v94 = objc_claimAutoreleasedReturnValue();

        v88 = (void *)v94;
      }
    }
  }
  else
  {
    v88 = v86;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v88);

LABEL_17:
  v29 = (void *)objc_msgSend(v7, "copy");

  return v29;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalUUID, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_containerConfig, 0);
}

- (id)_setOfUserIdentities
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  host_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint32_t v41;
  NSObject *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  container_log_handle_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[MCMCommandQuery userIdentity](self, "userIdentity");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "debugDescription");
    v37 = objc_claimAutoreleasedReturnValue();
    v41 = 138412290;
    v42 = v37;
    _os_log_debug_impl(&dword_1CF807000, v6, OS_LOG_TYPE_DEBUG, "userIdentity: %@", (uint8_t *)&v41, 0xCu);

  }
  -[MCMCommandQuery containerConfig](self, "containerConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "usesGlobalBundleUserIdentity");

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[MCMCommand context](self, "context");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject userIdentityCache](v10, "userIdentityCache");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject globalBundleUserIdentity](v11, "globalBundleUserIdentity");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v15 = v12;
    objc_msgSend(v9, "setWithObject:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  -[MCMCommandQuery containerConfig](self, "containerConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "usesGlobalSystemUserIdentity");

  if (v14)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[MCMCommand context](self, "context");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject userIdentityCache](v10, "userIdentityCache");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject globalSystemUserIdentity](v11, "globalSystemUserIdentity");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[MCMCommandQuery userIdentity](self, "userIdentity");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18
    && (v19 = (void *)v18,
        -[MCMCommandQuery userIdentity](self, "userIdentity"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "isNoSpecificPersona"),
        v20,
        v19,
        !v21))
  {
    if ((objc_msgSend(v5, "isNoSpecificPersona") & 1) != 0
      || (-[MCMCommandQuery userIdentity](self, "userIdentity"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend(v5, "isEqual:", v32),
          v32,
          v33))
    {
      v34 = (void *)MEMORY[0x1E0C99E60];
      -[MCMCommandQuery userIdentity](self, "userIdentity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setWithObject:", v35);
      v16 = objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      -[MCMCommandQuery userIdentity](self, "userIdentity");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject shortDescription](v11, "shortDescription");
      v15 = objc_claimAutoreleasedReturnValue();
      v41 = 138412290;
      v42 = v15;
      v28 = "Using explicit persona: %@";
      v29 = v10;
      goto LABEL_24;
    }
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "shortDescription");
      v38 = objc_claimAutoreleasedReturnValue();
      -[MCMCommandQuery userIdentity](self, "userIdentity");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "shortDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138412546;
      v42 = v38;
      v43 = 2112;
      v44 = v40;
      _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Ambiguous persona, client has adopted %@ but asks for %@", (uint8_t *)&v41, 0x16u);

    }
    v16 = 0;
  }
  else
  {
    v41 = 0;
    v22 = MEMORY[0x1D17D6F20]();
    if (!host_get_multiuser_config_flags(v22, &v41) && (v41 & 0x80000000) != 0)
    {
      -[MCMCommand context](self, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "clientIdentity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "userIdentity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "posixUser");
      v10 = objc_claimAutoreleasedReturnValue();

      -[MCMCommand context](self, "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "userIdentityCache");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userIdentityForPersonalPersonaWithPOSIXUser:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
      v16 = objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
      v41 = 138412290;
      v42 = v11;
      v28 = "Using client persona: %@";
      v29 = v15;
LABEL_24:
      _os_log_debug_impl(&dword_1CF807000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v41, 0xCu);
      goto LABEL_8;
    }
    if (!objc_msgSend(v5, "isNoSpecificPersona"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
      v16 = objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      objc_msgSend(v5, "shortDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      v41 = 138412290;
      v42 = v11;
      _os_log_debug_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEBUG, "Using client implicit persona: %@", (uint8_t *)&v41, 0xCu);
      goto LABEL_9;
    }
    -[MCMCommand context](self, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "userIdentityCache");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allAccessibleUserIdentities");
    v16 = objc_claimAutoreleasedReturnValue();

    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v41 = 138412290;
      v42 = v16;
      _os_log_debug_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEBUG, "Using all personas: %@", (uint8_t *)&v41, 0xCu);
    }
  }
LABEL_10:

  return v16;
}

- (void)_finalizeWithContainers:(id)a3 error:(id)a4
{
  id v6;
  MCMError *v7;
  MCMError *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  MCMResultQuery *v20;
  void *v21;
  MCMError *v22;
  _BOOL8 v23;
  BOOL v24;
  id v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  MCMError *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  void *v40;
  MCMResultQuery *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  MCMError *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  MCMError *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (MCMError *)a4;
  v8 = v7;
  if (-[MCMCommandQuery expectSingleResult](self, "expectSingleResult"))
  {
    v8 = v7;
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v45 = objc_msgSend(v6, "count");
        _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Query expects single result but found %lu; returning CONTAINER_ERROR_AMBIGUOUS_RESULT",
          buf,
          0xCu);
      }

      objc_msgSend(v6, "removeAllObjects");
      v8 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 114, 3);

    }
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218242;
    v45 = v11;
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "Query result: count = %lu, error = %@", buf, 0x16u);
  }

  -[MCMCommand context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "codeSignInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqual:", CFSTR("com.apple.ContainerManagerTest")) & 1) != 0)
    goto LABEL_17;
  v16 = v6;
  -[MCMCommandQuery containerConfig](self, "containerConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "containerClass") & 0xFFFFFFFFFFFFFFFELL) != 0xC)
  {

    v6 = v16;
LABEL_17:

    goto LABEL_18;
  }
  v18 = -[MCMCommandQuery createIfNecessary](self, "createIfNecessary");

  v6 = v16;
  if (v18 && v8)
  {
    if (-[MCMError type](v8, "type") != 55)
    {
      container_log_handle_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        -[MCMCommandQuery containerConfig](self, "containerConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMCommandQuery groupIdentifiers](self, "groupIdentifiers");
        v32 = (MCMError *)objc_claimAutoreleasedReturnValue();
        v33 = -[MCMError type](v8, "type");
        -[MCMCommand context](self, "context");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "clientIdentity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v45 = (uint64_t)v31;
        v46 = 2114;
        v47 = v32;
        v48 = 2048;
        v49 = v33;
        v6 = v16;
        v50 = 2114;
        v51 = v8;
        v52 = 2114;
        v53 = v35;
        _os_log_fault_impl(&dword_1CF807000, v19, OS_LOG_TYPE_FAULT, "System container lookup failed, class = %@, identifier = %{public}@, error = (%llu)%{public}@, client = %{public}@", buf, 0x34u);

      }
    }
    goto LABEL_19;
  }
LABEL_18:
  if (!v8)
  {
    v41 = [MCMResultQuery alloc];
    v40 = (void *)objc_msgSend(v6, "copy");
    -[MCMCommand context](self, "context");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "clientIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MCMCommandQuery issueSandboxExtensions](self, "issueSandboxExtensions");
    v38 = -[MCMCommandQuery includePathInResult](self, "includePathInResult");
    v37 = -[MCMCommandQuery includeInfoInResult](self, "includeInfoInResult");
    v22 = v7;
    v23 = -[MCMCommandQuery legacyPersonaPolicy](self, "legacyPersonaPolicy");
    v24 = -[MCMCommandQuery legacyExtensionPolicy](self, "legacyExtensionPolicy");
    v25 = v6;
    v26 = -[MCMCommandQuery includeUserManagedAssetsRelPath](self, "includeUserManagedAssetsRelPath");
    v27 = -[MCMCommandQuery includeCreator](self, "includeCreator");
    v28 = -[MCMCommandQuery extensionsUseProxiedClient](self, "extensionsUseProxiedClient");
    BYTE4(v36) = -[MCMCommandQuery extensionsPolicyUsesProxiedClient](self, "extensionsPolicyUsesProxiedClient");
    BYTE3(v36) = v28;
    BYTE2(v36) = v27;
    BYTE1(v36) = v26;
    v6 = v25;
    LOBYTE(v36) = v24;
    v29 = v23;
    v7 = v22;
    v20 = -[MCMResultQuery initWithContainers:clientIdentity:issueSandboxExtensions:includePath:includeInfo:legacyPersonaPolicy:legacyExtensionPolicy:includeUserManagedAssetsRelPath:includeCreator:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:](v41, "initWithContainers:clientIdentity:issueSandboxExtensions:includePath:includeInfo:legacyPersonaPolicy:legacyExtensionPolicy:includeUserManagedAssetsRelPath:includeCreator:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:", v40, v21, v39, v38, v37, v29, v36);

    goto LABEL_21;
  }
LABEL_19:
  v20 = -[MCMResultBase initWithError:]([MCMResultQuery alloc], "initWithError:", v8);
LABEL_21:
  -[MCMCommand resultPromise](self, "resultPromise");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "completeWithResult:", v20);

}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (unsigned)uid
{
  return self->_uid;
}

- (BOOL)fuzzyMatchInternalUUID
{
  return self->_fuzzyMatchInternalUUID;
}

- (BOOL)extensionsUseProxiedClient
{
  return self->_extensionsUseProxiedClient;
}

- (BOOL)extensionsPolicyUsesProxiedClient
{
  return self->_extensionsPolicyUsesProxiedClient;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (BOOL)includeCreator
{
  return self->_includeCreator;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

uint64_t __26__MCMCommandQuery_execute__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id obj;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitOnLock:", 14);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v36;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v36 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v5);
        v24 = 0;
        v25 = &v24;
        v26 = 0x3032000000;
        v27 = __Block_byref_object_copy__8761;
        v28 = __Block_byref_object_dispose__8762;
        v29 = 0;
        v7 = v6;
        v18 = 0;
        v19 = &v18;
        v20 = 0x3032000000;
        v21 = __Block_byref_object_copy__8761;
        v22 = __Block_byref_object_dispose__8762;
        v23 = 0;
        objc_msgSend(*(id *)(a1 + 40), "reply");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __26__MCMCommandQuery_execute__block_invoke_2;
        v14[3] = &unk_1E8CB5E48;
        v14[4] = v7;
        v16 = &v18;
        v9 = v7;
        v15 = v9;
        v17 = &v24;
        objc_msgSend(v8, "dispatchSyncToFastWorkloopWithBlock:", v14);

        if (v19[5])
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:");
        }
        else
        {
          container_log_handle_for_category();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v11 = v25[5];
            *(_DWORD *)buf = 138412546;
            v31 = v9;
            v32 = 2112;
            v33 = v11;
            _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Could not resolve metadata for %@: error = %@", buf, 0x16u);
          }

        }
        _Block_object_dispose(&v18, 8);

        _Block_object_dispose(&v24, 8);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_finalizeWithContainers:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

void __26__MCMCommandQuery_execute__block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[4];
    *(_DWORD *)buf = 138412290;
    v13 = v10;
    _os_log_debug_impl(&dword_1CF807000, v2, OS_LOG_TYPE_DEBUG, "Fetching metadata for container [%@]", buf, 0xCu);
  }

  v3 = (void *)a1[5];
  v11 = 0;
  objc_msgSend(v3, "metadataWithError:", &v11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

+ (unint64_t)command
{
  return 39;
}

@end
