@implementation INAppResolver

- (id)resolvedAppIntentMatchingDescriptor:(id)a3 availableActions:(id)a4 availableEntities:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (INDescriptorContainsBundleIdentifiers(v8))
  {
    v11 = v8;
    if (-[INAppResolver cacheHasResultForDescriptor:](self, "cacheHasResultForDescriptor:", v11))
    {
      -[INAppResolver cachedResultForKey:](self, "cachedResultForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[INAppResolver _resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:](self, "_resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:", v11, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppResolver cacheResult:forDescriptor:](self, "cacheResult:forDescriptor:", v12, v11);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)cachedResultForKey:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  id v5;
  void *v6;
  void *v7;
  id v8;

  p_cacheLock = &self->_cacheLock;
  v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[INAppResolver cachedResults](self, "cachedResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cacheLock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (BOOL)cacheHasResultForDescriptor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_cacheLock;
  void *v6;
  void *v7;
  char isKindOfClass;

  v4 = a3;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[INAppResolver cachedResults](self, "cachedResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    isKindOfClass = 0;
  }
  os_unfair_lock_unlock(p_cacheLock);

  return isKindOfClass & 1;
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

+ (id)sharedResolver
{
  if (sharedResolver_onceToken != -1)
    dispatch_once(&sharedResolver_onceToken, &__block_literal_global_21451);
  return (id)sharedResolver_sharedResolver;
}

- (id)resolvedAppMatchingDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (INDescriptorContainsBundleIdentifiers(v4))
  {
    v5 = v4;
    if (-[INAppResolver cacheHasResultForDescriptor:](self, "cacheHasResultForDescriptor:", v5))
    {
      -[INAppResolver cachedResultForKey:](self, "cachedResultForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[INAppResolver _resolvedAppMatchingDescriptor:](self, "_resolvedAppMatchingDescriptor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppResolver cacheResult:forDescriptor:](self, "cacheResult:forDescriptor:", v6, v5);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_resolvedAppMatchingDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  INAppDescriptor *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  INAppDescriptor *v43;
  void *v44;
  INAppDescriptor *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  INAppDescriptor *v53;
  INAppDescriptor *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  void *v68;
  INAppDescriptor *v69;
  id v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x18D7810F0]();
  -[INAppResolver optionsForCurrentContextWithIntentClassName:](self, "optionsForCurrentContextWithIntentClassName:", 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v94 = v5;
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    objc_msgSend(v4, "counterpartIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v115, v122, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v116 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * i), 0, 0);
          objc_msgSend(v18, "applicationState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isInstalled"))
          {
            v20 = INApplicationRecordMatchesRequirementsFromDescriptor(v18, v4, v99);

            if ((v20 & 1) != 0)
            {
              objc_msgSend(v4, "descriptorWithRecord:", v18);
              v12 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_68;
            }
          }
          else
          {

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v115, v122, 16);
      }
      while (v15);
    }

    -[INAppResolver resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:](self, "resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v21 = objc_alloc(MEMORY[0x1E0CA5870]);
      objc_msgSend(v13, "bundleURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v21, "initWithURL:allowPlaceholder:error:", v22, 0, 0);

      objc_msgSend(v23, "applicationState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isInstalled"))
      {
        v25 = INApplicationRecordMatchesRequirementsFromDescriptor(v23, v4, v99);

        if ((v25 & 1) != 0)
        {
          objc_msgSend(v4, "descriptorWithRecord:", v23);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_67;
        }
      }
      else
      {

      }
      v26 = v13;

      v4 = v26;
    }
    objc_msgSend(v4, "extensionBundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[INAppResolver _systemAppMapper](self, "_systemAppMapper");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "extensionBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "resolvedAppMatchingExtensionBundleIdentifier:", v29);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
LABEL_68:

        v5 = v94;
        goto LABEL_69;
      }
    }
    v93 = v13;
    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[INAppResolver _counterpartMapper](self, "_counterpartMapper");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localIdentifiersForCounterpartIdentifier:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v112;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v112 != v36)
            objc_enumerationMutation(v33);
          v38 = -[INAppDescriptor initWithBundleIdentifier:]([INAppDescriptor alloc], "initWithBundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * j));
          objc_msgSend(v23, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
      }
      while (v35);
    }

    -[INAppResolver _systemAppMapper](self, "_systemAppMapper");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "matchForBundleIdentifier:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v41;
    if (v41)
    {
      if (objc_msgSend(v41, "appIsUnavailableOnCurrentPlatform"))
      {
        v12 = v4;
        goto LABEL_66;
      }
      v43 = [INAppDescriptor alloc];
      objc_msgSend(v41, "bundleIdentifierForCurrentPlatform");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[INAppDescriptor initWithBundleIdentifier:](v43, "initWithBundleIdentifier:", v44);

      v42 = v41;
      objc_msgSend(v23, "addObject:", v45);

    }
    objc_msgSend(v4, "extensionBundleIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = v42;
      objc_msgSend(v4, "extensionBundleIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppResolver _frameworkMapper](self, "_frameworkMapper");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[INAppResolver _frameworkMapper](self, "_frameworkMapper");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v48);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        v53 = -[INAppDescriptor initWithBundleIdentifier:]([INAppDescriptor alloc], "initWithBundleIdentifier:", v50);
        objc_msgSend(v23, "addObject:", v53);

      }
      if (v52)
      {
        v54 = -[INAppDescriptor initWithBundleIdentifier:]([INAppDescriptor alloc], "initWithBundleIdentifier:", v52);
        objc_msgSend(v23, "addObject:", v54);

      }
      v42 = v47;
    }
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __48__INAppResolver__resolvedAppMatchingDescriptor___block_invoke;
    v108[3] = &unk_1E228B6F0;
    v92 = v4;
    v55 = v4;
    v109 = v55;
    v56 = v99;
    v110 = v56;
    objc_msgSend(v23, "if_compactMap:", v108);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeAllObjects");
    if (objc_msgSend(v57, "count") == 1)
    {
      v58 = v57;
LABEL_63:
      objc_msgSend(v58, "anyObject");
      v61 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_64;
    }
    if ((unint64_t)objc_msgSend(v57, "count") < 2)
    {
      v60 = objc_msgSend(v57, "count");
      if (v42 && !v60)
      {
        v61 = v55;
LABEL_64:
        v12 = v61;
        goto LABEL_65;
      }
    }
    else
    {
      objc_msgSend(v57, "allObjects");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObjectsFromArray:", v59);

    }
    if (!objc_msgSend(v57, "count"))
    {
      v88 = v57;
      v90 = v42;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v105;
        do
        {
          for (k = 0; k != v64; ++k)
          {
            if (*(_QWORD *)v105 != v65)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * k);
            v68 = (void *)MEMORY[0x18D7810F0]();
            if (INApplicationRecordMatchesRequirementsFromDescriptor(v67, v55, v56))
            {
              v69 = -[INAppDescriptor initWithApplicationRecord:]([INAppDescriptor alloc], "initWithApplicationRecord:", v67);
              objc_msgSend(v23, "addObject:", v69);

            }
            objc_autoreleasePoolPop(v68);
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
        }
        while (v64);
      }

      v57 = v88;
      v42 = v90;
    }
    if (objc_msgSend(v23, "count") == 1)
    {
      v58 = v23;
      goto LABEL_63;
    }
    v91 = v42;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v71 = v23;
    v97 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
    if (!v97)
    {

      goto LABEL_92;
    }
    v89 = v57;
    v12 = 0;
    v95 = v55;
    v96 = *(_QWORD *)v101;
    v98 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_72:
    v72 = 0;
    while (1)
    {
      if (*(_QWORD *)v101 != v96)
        objc_enumerationMutation(v71);
      v73 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v72);
      objc_msgSend(v55, "localizedName", v89);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (v74)
        break;
      objc_msgSend(v55, "bundleIdentifier");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v79)
        goto LABEL_87;
      objc_msgSend(v55, "bundleIdentifier");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "bundleIdentifier");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "commonPrefixWithString:options:", v81, 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v75, "length"))
      {
        objc_msgSend(v55, "bundleIdentifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "substringFromIndex:", objc_msgSend(v75, "length"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v73, "bundleIdentifier");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "substringFromIndex:", objc_msgSend(v75, "length"));
        v84 = v33;
        v85 = v71;
        v86 = v12;
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = INEditDistanceBetweenStrings(v76, v87);
        v12 = v86;
        v71 = v85;
        v33 = v84;
        v55 = v95;
        goto LABEL_77;
      }
LABEL_83:

LABEL_87:
      if (v97 == ++v72)
      {
        v97 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
        if (!v97)
        {

          v57 = v89;
          if (v12)
          {
            objc_msgSend(v12, "setRequiresUserConfirmation:", v98 > 0);
            goto LABEL_93;
          }
LABEL_92:
          v12 = v55;
LABEL_93:
          v42 = v91;
LABEL_65:

          v4 = v92;
LABEL_66:

          v13 = v93;
LABEL_67:

          goto LABEL_68;
        }
        goto LABEL_72;
      }
    }
    objc_msgSend(v55, "localizedName");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "localizedName");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = INEditDistanceBetweenStrings(v75, v76);
LABEL_77:

    if (v77 >= v98 || v77 > 5)
      goto LABEL_87;
    v75 = v12;
    v12 = v73;
    v98 = v77;
    goto LABEL_83;
  }
  v7 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);

  objc_msgSend(v9, "applicationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isInstalled"))
  {

    goto LABEL_6;
  }
  v11 = INApplicationRecordMatchesRequirementsFromDescriptor(v9, v4, v99);

  if ((v11 & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v4, "descriptorWithRecord:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_69:
  objc_autoreleasePoolPop(v5);

  return v12;
}

- (id)resolvedIntentMatchingDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (INDescriptorContainsBundleIdentifiers(v4))
  {
    v5 = v4;
    if (-[INAppResolver cacheHasResultForDescriptor:](self, "cacheHasResultForDescriptor:", v5))
    {
      -[INAppResolver cachedResultForKey:](self, "cachedResultForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[INAppResolver _resolvedIntentMatchingDescriptor:](self, "_resolvedIntentMatchingDescriptor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppResolver cacheResult:forDescriptor:](self, "cacheResult:forDescriptor:", v6, v5);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_resolvedIntentMatchingDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  INAppResolver *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  INAppResolver *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  INIntentDescriptor *v57;
  void *v58;
  INIntentDescriptor *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  INIntentDescriptor *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  INIntentDescriptor *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t m;
  void *v98;
  void *v99;
  INIntentDescriptor *v100;
  void *v101;
  id v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  uint64_t v108;
  id v109;
  void *v110;
  char v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t n;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  id v131;
  id v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  void *context;
  void *v159;
  INIntentDescriptor *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  INIntentDescriptor *v167;
  INIntentDescriptor *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  uint64_t v172;
  INAppResolver *objc;
  INAppResolver *obj;
  id obja;
  id objd;
  id objb;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _QWORD v186[4];
  id v187;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  uint64_t v206;

  v206 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x18D7810F0]();
  -[INAppResolver resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:](self, "resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v157 = (void *)v5;
  if (v5)
  {
    v6 = (void *)v5;
    v168 = [INIntentDescriptor alloc];
    objc_msgSend(v4, "intentClassName");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionBundleIdentifier");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiExtensionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "counterpartIdentifiers");
    objc = self;
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "teamIdentifier");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "preferredCallProvider");
    objc_msgSend(v6, "supportedIntents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleURL");
    v12 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v168, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v165, v163, v7, v8, v159, v9, v153, v148, v10, v11, v13, v14);

    self = objc;
    v4 = (id)v169;
  }
  objc_msgSend(v4, "extensionBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[INAppResolver _systemAppMapper](self, "_systemAppMapper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "preferredCallProvider");
    objc_msgSend(v4, "intentClassName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resolvedIntentMatchingExtensionBundleIdentifier:preferredCallProvider:intentClassName:", v17, v18, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_108;
  }
  objc_msgSend(v4, "intentClassName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppResolver optionsForCurrentContextWithIntentClassName:](self, "optionsForCurrentContextWithIntentClassName:", v21);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x1E0CA5870]);
    objc_msgSend(v4, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithBundleIdentifier:allowPlaceholder:error:", v24, 0, 0);

    objc_msgSend(v25, "applicationState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isInstalled"))
    {
      v27 = INApplicationRecordMatchesRequirementsFromIntentDescriptor(v25, v4, v164);

      if (v27)
      {
        objc_msgSend(v25, "localizedName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "displayableBundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = v29;
        }
        else
        {
          objc_msgSend(v25, "bundleIdentifier");
          v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        v109 = v31;

        objc_msgSend(v25, "bundleIdentifier");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "isEqualToString:", v109);

        v171 = v109;
        if ((v111 & 1) != 0)
        {
          objb = v28;
        }
        else
        {
          v112 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v109, 0, 0);
          objc_msgSend(v112, "localizedName");
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          if (v113)
          {
            objc_msgSend(v112, "localizedName");
            v114 = objc_claimAutoreleasedReturnValue();

            objb = (id)v114;
          }
          else
          {
            objb = v28;
          }

        }
        v167 = [INIntentDescriptor alloc];
        objc_msgSend(v4, "intentClassName");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bundleIdentifier");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "extensionBundleIdentifier");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uiExtensionBundleIdentifier");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "in_counterpartIdentifiers");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "teamIdentifier");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = objc_msgSend(v4, "preferredCallProvider");
        objc_msgSend(v25, "in_supportedIntents");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundleURL");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "in_documentTypes");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v167, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v152, objb, v162, v171, v156, v134, v147, v143, v135, v136, v137, v138);

        v20 = (id)v139;
        goto LABEL_107;
      }
    }
    else
    {

    }
  }
  v32 = self;
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  objc_msgSend(v4, "counterpartIdentifiers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v198;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v198 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * i), 0, 0);
        objc_msgSend(v38, "applicationState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "isInstalled"))
        {
          v40 = INApplicationRecordMatchesRequirementsFromIntentDescriptor(v38, v4, v164);

          if (v40)
          {
            objc_msgSend(v38, "localizedName");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "displayableBundleIdentifier");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = v83;
            if (v83)
            {
              v85 = v83;
            }
            else
            {
              objc_msgSend(v38, "bundleIdentifier");
              v85 = (id)objc_claimAutoreleasedReturnValue();
            }
            v86 = v85;

            objc_msgSend(v38, "bundleIdentifier");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "isEqualToString:", v86);

            if ((v88 & 1) != 0)
            {
              v170 = v82;
            }
            else
            {
              v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v86, 0, 0);
              objc_msgSend(v89, "localizedName");
              v90 = (void *)objc_claimAutoreleasedReturnValue();

              if (v90)
              {
                objc_msgSend(v89, "localizedName");
                v91 = objc_claimAutoreleasedReturnValue();

                v170 = (void *)v91;
              }
              else
              {
                v170 = v82;
              }

            }
            v160 = [INIntentDescriptor alloc];
            objc_msgSend(v4, "intentClassName");
            objd = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "bundleIdentifier");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "extensionBundleIdentifier");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "uiExtensionBundleIdentifier");
            v150 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "in_counterpartIdentifiers");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "teamIdentifier");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend(v4, "preferredCallProvider");
            objc_msgSend(v38, "in_supportedIntents");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "bundleURL");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "in_documentTypes");
            v106 = v4;
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v160, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", objd, v170, v145, v86, v155, v150, v142, v141, v103, v104, v105, v107);

            v4 = v106;
            v20 = (id)v108;

            goto LABEL_107;
          }
        }
        else
        {

        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
    }
    while (v35);
  }

  objc_msgSend(v4, "bundleIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v32;
  if (v41)
  {
    -[INAppResolver _systemAppMapper](v32, "_systemAppMapper");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v4, "preferredCallProvider");
    objc_msgSend(v4, "intentClassName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "resolvedIntentMatchingAppBundleIdentifier:preferredCallProvider:intentClassName:", v44, v45, v46);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_107;
  }
  v47 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "extensionBundleIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v4, "extensionBundleIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppResolver _frameworkMapper](v32, "_frameworkMapper");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v49);
    v51 = objc_claimAutoreleasedReturnValue();

    -[INAppResolver _frameworkMapper](v32, "_frameworkMapper");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v49);
    v53 = objc_claimAutoreleasedReturnValue();

    if (v51 | v53)
    {
      if (objc_msgSend(v4, "preferredCallProvider") == 2)
      {
        -[INAppResolver _systemAppMapper](v32, "_systemAppMapper");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "bundleIdentifiersForIntentExecutionMatchingBundleIdentifier:", CFSTR("com.apple.facetime"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "firstObject");
        v56 = objc_claimAutoreleasedReturnValue();

        v53 = v56;
        v42 = v32;
      }
      v57 = [INIntentDescriptor alloc];
      objc_msgSend(v4, "extensionBundleIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v57, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", 0, 0, v51, v53, v58, 0, 0, 0, objc_msgSend(v4, "preferredCallProvider"), 0, 0, 0);

      objc_msgSend(v47, "addObject:", v59);
    }

  }
  obj = v42;
  -[INAppResolver _systemAppMapper](v42, "_systemAppMapper");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bundleIdentifiersForIntentExecutionMatchingBundleIdentifier:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v63 = v62;
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
  v65 = v64;
  if (v64)
  {
    v66 = *(_QWORD *)v194;
    v67 = v64;
    do
    {
      for (j = 0; j != v67; ++j)
      {
        if (*(_QWORD *)v194 != v66)
          objc_enumerationMutation(v63);
        v69 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:]([INIntentDescriptor alloc], "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", 0, 0, *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * j), 0, 0, 0, 0, 0, 0, 0, 0, 0);
        objc_msgSend(v47, "addObject:", v69);

      }
      v67 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
    }
    while (v67);
  }

  -[INAppResolver _counterpartMapper](obj, "_counterpartMapper");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "localIdentifiersForCounterpartIdentifier:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  obja = v72;
  v73 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v190;
    do
    {
      for (k = 0; k != v74; ++k)
      {
        if (*(_QWORD *)v190 != v75)
          objc_enumerationMutation(obja);
        v77 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:]([INIntentDescriptor alloc], "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", 0, 0, *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * k), 0, 0, 0, 0, 0, 0, 0, 0, 0);
        objc_msgSend(v47, "addObject:", v77);

      }
      v74 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
    }
    while (v74);
  }

  v186[0] = MEMORY[0x1E0C809B0];
  v186[1] = 3221225472;
  v186[2] = __51__INAppResolver__resolvedIntentMatchingDescriptor___block_invoke;
  v186[3] = &unk_1E228B718;
  v154 = v4;
  v78 = v4;
  v187 = v78;
  v79 = v164;
  v188 = v79;
  objc_msgSend(v47, "if_compactMap:", v186);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "removeAllObjects");
  if (objc_msgSend(v80, "count") == 1)
  {
    v81 = v80;
LABEL_69:
    objc_msgSend(v81, "anyObject");
    v102 = (id)objc_claimAutoreleasedReturnValue();
LABEL_70:
    v20 = v102;
    goto LABEL_71;
  }
  if ((unint64_t)objc_msgSend(v80, "count") < 2)
  {
    v115 = objc_msgSend(v80, "count");
    if (v65 && !v115)
    {
      v102 = v78;
      goto LABEL_70;
    }
  }
  else
  {
    objc_msgSend(v80, "allObjects");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObjectsFromArray:", v92);

  }
  if (!objc_msgSend(v80, "count"))
  {
    v144 = v63;
    v149 = v80;
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v182, v202, 16);
    if (v94)
    {
      v95 = v94;
      v96 = *(_QWORD *)v183;
      do
      {
        for (m = 0; m != v95; ++m)
        {
          if (*(_QWORD *)v183 != v96)
            objc_enumerationMutation(v93);
          v98 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * m);
          v99 = (void *)MEMORY[0x18D7810F0]();
          if (INApplicationRecordMatchesRequirementsFromIntentDescriptor(v98, v78, v79))
          {
            v100 = -[INAppDescriptor initWithApplicationRecord:]([INIntentDescriptor alloc], "initWithApplicationRecord:", v98);
            -[INIntentDescriptor mergeWithDescriptor:](v100, "mergeWithDescriptor:", v78);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v101);

          }
          objc_autoreleasePoolPop(v99);
        }
        v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v182, v202, 16);
      }
      while (v95);
    }

    v63 = v144;
    v80 = v149;
  }
  if (objc_msgSend(v47, "count") == 1)
  {
    v81 = v47;
    goto LABEL_69;
  }
  v151 = v80;
  v180 = 0u;
  v181 = 0u;
  v178 = 0u;
  v179 = 0u;
  v116 = v47;
  v166 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v178, v201, 16);
  if (!v166)
  {

    goto LABEL_110;
  }
  v146 = v63;
  v20 = 0;
  v117 = *(_QWORD *)v179;
  v172 = 0x7FFFFFFFFFFFFFFFLL;
  v161 = v78;
  do
  {
    for (n = 0; n != v166; ++n)
    {
      if (*(_QWORD *)v179 != v117)
        objc_enumerationMutation(v116);
      v119 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * n);
      objc_msgSend(v78, "localizedName");
      v120 = (void *)objc_claimAutoreleasedReturnValue();

      if (v120)
      {
        objc_msgSend(v78, "localizedName");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "localizedName");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = INEditDistanceBetweenStrings(v121, v122);
      }
      else
      {
        objc_msgSend(v78, "bundleIdentifier");
        v125 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v125)
          continue;
        objc_msgSend(v78, "bundleIdentifier");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "bundleIdentifier");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "commonPrefixWithString:options:", v127, 0);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v121, "length"))
          goto LABEL_96;
        objc_msgSend(v78, "bundleIdentifier");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "substringFromIndex:", objc_msgSend(v121, "length"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v119, "bundleIdentifier");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "substringFromIndex:", objc_msgSend(v121, "length"));
        v130 = v117;
        v131 = v116;
        v132 = v20;
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        v123 = INEditDistanceBetweenStrings(v122, v133);
        v20 = v132;
        v116 = v131;
        v117 = v130;
        v78 = v161;
      }

      if (v123 < v172 && v123 <= 5)
      {
        v121 = v20;
        v20 = v119;
        v172 = v123;
LABEL_96:

        continue;
      }
    }
    v166 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v178, v201, 16);
  }
  while (v166);

  v63 = v146;
  if (v20)
  {
    objc_msgSend(v20, "setRequiresUserConfirmation:", v172 > 0);
    goto LABEL_111;
  }
LABEL_110:
  v20 = v78;
LABEL_111:
  v80 = v151;
LABEL_71:

  v4 = v154;
LABEL_107:

LABEL_108:
  objc_autoreleasePoolPop(context);

  return v20;
}

- (id)resolvedUserActivityMatchingDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (INDescriptorContainsBundleIdentifiers(v4))
  {
    v5 = v4;
    if (-[INAppResolver cacheHasResultForDescriptor:](self, "cacheHasResultForDescriptor:", v5))
    {
      -[INAppResolver cachedResultForKey:](self, "cachedResultForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[INAppResolver _resolvedUserActivityMatchingDescriptor:](self, "_resolvedUserActivityMatchingDescriptor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppResolver cacheResult:forDescriptor:](self, "cacheResult:forDescriptor:", v6, v5);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_resolvedUserActivityMatchingDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  INUserActivityDescriptor *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  INAppResolver *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  __objc2_class **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  INUserActivityDescriptor *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  INUserActivityDescriptor *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  char v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  INUserActivityDescriptor *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  INUserActivityDescriptor *v69;
  void *v70;
  INUserActivityDescriptor *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  INUserActivityDescriptor *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *context;
  uint64_t v121;
  id v122;
  void *v123;
  id v124;
  uint64_t v125;
  id obj;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  id v132;
  id v133;
  INAppResolver *v134;
  INUserActivityDescriptor *v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[4];
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x18D7810F0]();
  -[INAppResolver optionsForCurrentContextWithIntentClassName:](self, "optionsForCurrentContextWithIntentClassName:", 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppResolver resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:](self, "resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v119 = (void *)v5;
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [INUserActivityDescriptor alloc];
    objc_msgSend(v4, "userActivityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v128 = v4;
    v9 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "counterpartIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "teamIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supportedIntents");
    v15 = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](v7, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v8, v10, v11, v12, v13, v14, v16, v17);

    self = v15;
    v4 = (id)v18;
  }
  -[INAppResolver resolveDescriptorByLinkingFileProvidersToFilesApp:](self, "resolveDescriptorByLinkingFileProvidersToFilesApp:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v19;
  if (v19)
  {
    v20 = v19;

    v4 = v20;
  }
  v21 = off_1E2286000;
  objc_msgSend(v4, "extensionBundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = v4;
  if (v22)
  {
    -[INAppResolver _systemAppMapper](self, "_systemAppMapper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resolvedAppMatchingExtensionBundleIdentifier:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = [INUserActivityDescriptor alloc];
      objc_msgSend(v4, "userActivityType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "extensionBundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "counterpartIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "teamIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "supportedIntents");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v25;
LABEL_8:
      objc_msgSend(v34, "bundleURL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](v26, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v27, v28, v29, v30, v31, v32, v33, v35);

      v4 = v129;
LABEL_36:

      goto LABEL_87;
    }
  }
  objc_msgSend(v4, "bundleIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    v38 = objc_alloc(MEMORY[0x1E0CA5870]);
    objc_msgSend(v4, "bundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v38, "initWithBundleIdentifier:allowPlaceholder:error:", v39, 0, 0);

    objc_msgSend(v25, "applicationState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "isInstalled"))
    {
      v41 = INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v25, v4, v130);

      if ((v41 & 1) != 0)
      {
        v26 = [INUserActivityDescriptor alloc];
        objc_msgSend(v4, "userActivityType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "extensionBundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "in_counterpartIdentifiers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "teamIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "in_supportedIntents");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v4;
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  v134 = self;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  objc_msgSend(v4, "counterpartIdentifiers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v152, v159, 16);
  if (!v42)
    goto LABEL_26;
  v43 = v42;
  v44 = *(_QWORD *)v153;
  do
  {
    for (i = 0; i != v43; ++i)
    {
      if (*(_QWORD *)v153 != v44)
        objc_enumerationMutation(v25);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * i), 0, 0);
      objc_msgSend(v27, "applicationState");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v46, "isInstalled"))
      {
        v47 = INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v27, v4, v130);

        if ((v47 & 1) != 0)
        {
          v135 = [INUserActivityDescriptor alloc];
          objc_msgSend(v4, "userActivityType");
          v131 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "localizedName");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "bundleIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "extensionBundleIdentifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "in_counterpartIdentifiers");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "teamIdentifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "in_supportedIntents");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "bundleURL");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](v135, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v131, v62, v63, v64, v65, v66, v67, v68);

          v4 = v129;
          goto LABEL_36;
        }
      }
      else
      {

      }
    }
    v43 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v152, v159, 16);
  }
  while (v43);
LABEL_26:

  v48 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[INAppResolver _counterpartMapper](v134, "_counterpartMapper");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "localIdentifiersForCounterpartIdentifier:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v52 = v51;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v149;
    do
    {
      for (j = 0; j != v54; ++j)
      {
        if (*(_QWORD *)v149 != v55)
          objc_enumerationMutation(v52);
        v57 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:]([INUserActivityDescriptor alloc], "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", 0, 0, *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * j), 0, 0, 0, 0, 0);
        objc_msgSend(v48, "addObject:", v57);

      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v148, v158, 16);
    }
    while (v54);
  }

  -[INAppResolver _systemAppMapper](v134, "_systemAppMapper");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "matchForBundleIdentifier:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v60;
  if (v60)
  {
    if (objc_msgSend(v60, "appIsUnavailableOnCurrentPlatform"))
    {
      v36 = (INUserActivityDescriptor *)v4;
      goto LABEL_86;
    }
    v69 = [INUserActivityDescriptor alloc];
    objc_msgSend(v60, "bundleIdentifierForCurrentPlatform");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](v69, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", 0, 0, v70, 0, 0, 0, 0, 0);

    objc_msgSend(v48, "addObject:", v71);
    v61 = v60;
  }
  v145[0] = MEMORY[0x1E0C809B0];
  v145[1] = 3221225472;
  v145[2] = __57__INAppResolver__resolvedUserActivityMatchingDescriptor___block_invoke;
  v145[3] = &unk_1E228B740;
  v127 = v4;
  v146 = v127;
  v72 = v130;
  v147 = v72;
  objc_msgSend(v48, "if_compactMap:", v145);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "removeAllObjects");
  if (objc_msgSend(v73, "count") == 1)
  {
    objc_msgSend(v73, "anyObject");
    v36 = (INUserActivityDescriptor *)objc_claimAutoreleasedReturnValue();
    goto LABEL_85;
  }
  v117 = v73;
  if ((unint64_t)objc_msgSend(v73, "count") >= 2)
  {
    objc_msgSend(v73, "allObjects");
    v74 = v61;
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObjectsFromArray:", v75);

    v61 = v74;
  }
  else
  {
    v76 = objc_msgSend(v73, "count");
    if (v61 && !v76)
    {
      v77 = (INUserActivityDescriptor *)v127;
LABEL_59:
      v36 = v77;
      goto LABEL_84;
    }
  }
  v136 = v52;
  if (!objc_msgSend(v117, "count"))
  {
    v115 = v61;
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v157, 16);
    v79 = v127;
    if (v78)
    {
      v80 = v78;
      v81 = *(_QWORD *)v142;
      v122 = v72;
      v123 = v48;
      v121 = *(_QWORD *)v142;
      do
      {
        v82 = 0;
        v125 = v80;
        do
        {
          if (*(_QWORD *)v142 != v81)
            objc_enumerationMutation(obj);
          v83 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v82);
          v84 = (void *)MEMORY[0x18D7810F0]();
          if (INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v83, v79, v72))
          {
            v132 = v84;
            v85 = objc_alloc(v21[363]);
            objc_msgSend(v79, "userActivityType");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "localizedName");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "bundleIdentifier");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "extensionBundleIdentifier");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "in_counterpartIdentifiers");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "teamIdentifier");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "in_supportedIntents");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "bundleURL");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = (void *)objc_msgSend(v85, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v86, v87, v88, v89, v90, v91, v92, v93);

            v79 = v127;
            v4 = v129;

            v48 = v123;
            v21 = off_1E2286000;

            v80 = v125;
            v81 = v121;

            v72 = v122;
            objc_msgSend(v123, "addObject:", v94);

            v84 = v132;
          }
          objc_autoreleasePoolPop(v84);
          ++v82;
        }
        while (v80 != v82);
        v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v157, 16);
      }
      while (v80);
    }

    v52 = v136;
    v61 = v115;
  }
  if (objc_msgSend(v48, "count") == 1)
  {
    objc_msgSend(v48, "anyObject");
    v77 = (INUserActivityDescriptor *)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  v116 = v61;
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v95 = v48;
  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v137, v156, 16);
  if (!v96)
  {

    v100 = v127;
    goto LABEL_82;
  }
  v97 = v96;
  v124 = v48;
  v36 = 0;
  v98 = *(_QWORD *)v138;
  v99 = 0x7FFFFFFFFFFFFFFFLL;
  v100 = v127;
  v133 = v95;
  while (2)
  {
    v101 = 0;
    while (2)
    {
      if (*(_QWORD *)v138 != v98)
        objc_enumerationMutation(v133);
      v102 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v101);
      objc_msgSend(v100, "localizedName");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (v103)
      {
        objc_msgSend(v100, "localizedName");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "localizedName");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = INEditDistanceBetweenStrings(v104, v105);
        goto LABEL_67;
      }
      objc_msgSend(v100, "bundleIdentifier");
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      if (v108)
      {
        objc_msgSend(v100, "bundleIdentifier");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "bundleIdentifier");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "commonPrefixWithString:options:", v110, 0);
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v104, "length"))
        {
          objc_msgSend(v100, "bundleIdentifier");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "substringFromIndex:", objc_msgSend(v104, "length"));
          v105 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v102, "bundleIdentifier");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "substringFromIndex:", objc_msgSend(v104, "length"));
          v113 = (void *)objc_claimAutoreleasedReturnValue();

          v106 = INEditDistanceBetweenStrings(v105, v113);
          v100 = v127;
LABEL_67:

          if (v106 >= v99 || v106 > 5)
            goto LABEL_77;
          v104 = v36;
          v36 = v102;
          v99 = v106;
        }

      }
LABEL_77:
      v52 = v136;
      if (v97 != ++v101)
        continue;
      break;
    }
    v97 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v137, v156, 16);
    if (v97)
      continue;
    break;
  }

  v48 = v124;
  if (v36)
  {
    -[INAppDescriptor setRequiresUserConfirmation:](v36, "setRequiresUserConfirmation:", v99 > 0);
    goto LABEL_83;
  }
LABEL_82:
  v36 = v100;
LABEL_83:
  v4 = v129;
  v61 = v116;
LABEL_84:
  v73 = v117;
LABEL_85:

LABEL_86:
LABEL_87:

  objc_autoreleasePoolPop(context);
  return v36;
}

- (id)resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  INAppDescriptor *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  INAppDescriptor *v21;
  void *v22;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5848]);
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:error:", v6, 0);

    if (v7)
    {
      objc_msgSend(v7, "containingBundleRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v7;
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }
      v11 = v9;

      v21 = [INAppDescriptor alloc];
      objc_msgSend(v11, "localizedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "in_counterpartIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "teamIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "in_supportedIntents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "in_documentTypes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](v21, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v12, v13, v14, v15, v16, v17, v18, v19);
      v7 = v22;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)resolveDescriptorByLinkingFileProvidersToFilesApp:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  INUserActivityDescriptor *v11;
  INUserActivityDescriptor *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CA5848]);
    objc_msgSend(v3, "extensionBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:error:", v6, 0);

    objc_msgSend(v7, "extensionPointRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui"));

    v11 = 0;
    if (v10)
    {
      v12 = [INUserActivityDescriptor alloc];
      objc_msgSend(v3, "userActivityType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "extensionBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "counterpartIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "teamIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "supportedIntents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](v12, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v13, v14, CFSTR("com.apple.DocumentsApp"), v15, v16, v17, v18, v19);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)localIdentifiersForCounterpartIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[INAppResolver _counterpartMapper](self, "_counterpartMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifiersForCounterpartIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)counterpartIdentifiersForLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[INAppResolver _counterpartMapper](self, "_counterpartMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "counterpartIdentifiersForLocalIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_resolvedAppIntentMatchingDescriptor:(id)a3 availableActions:(id)a4 availableEntities:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  INAppIntentDescriptor *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  INAppIntentDescriptor *v50;
  void *v51;
  void *v52;
  void *v53;
  INAppIntentDescriptor *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  INAppIntentDescriptor *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  INAppIntentDescriptor *v107;
  NSObject *v108;
  void *v109;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  void *v121;
  void *context;
  void *v123;
  id v124;
  id v125;
  void *v126;
  void *v127;
  INAppIntentDescriptor *obja;
  id obj;
  void *v130;
  INAppIntentDescriptor *v131;
  INAppResolver *v132;
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  id v139;
  _QWORD v140[5];
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  uint8_t v147[128];
  uint8_t buf[4];
  const char *v149;
  __int16 v150;
  void *v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[INAppResolver linkActionProvider](self, "linkActionProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cacheActions:", v9);

  }
  if (v10)
  {
    -[INAppResolver linkActionProvider](self, "linkActionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cacheEntities:", v10);

  }
  v124 = v10;
  context = (void *)MEMORY[0x18D7810F0]();
  v132 = self;
  -[INAppResolver resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:](self, "resolveDescriptorBySwappingIdentifiersWithExtensionIfApplicable:", v8);
  v13 = objc_claimAutoreleasedReturnValue();
  v121 = (void *)v13;
  if (v13)
  {
    v14 = (void *)v13;
    obja = [INAppIntentDescriptor alloc];
    objc_msgSend(v8, "intentIdentifier");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedName");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v118 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "counterpartIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "teamIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "supportedIntents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedEntities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "documentTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[INAppIntentDescriptor initWithIntentIdentifier:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:supportedEntities:bundleURL:documentTypes:](obja, "initWithIntentIdentifier:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:supportedEntities:bundleURL:documentTypes:", v130, v126, v15, v16, v17, v18, v19, v20, v21, v22);

    v9 = v118;
    v8 = (id)v23;
  }
  objc_msgSend(v8, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v24;
  if (v24)
  {
    v25 = v24;
    if (objc_msgSend(v24, "length"))
    {
      -[INAppResolver _systemAppMapper](v132, "_systemAppMapper");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "intentIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "matchForBundleIdentifier:intentName:", v25, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v117 = v28;
      if (v28)
      {
        v29 = v124;
        if (objc_msgSend(v28, "appIsUnavailableOnCurrentPlatform"))
        {
          v30 = v8;
        }
        else
        {
          v119 = v9;
          objc_msgSend(v28, "bundleIdentifierForCurrentPlatform");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v43 && objc_msgSend(v43, "length"))
          {
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v44, 0, 0);
            -[INAppResolver linkActionProvider](v132, "linkActionProvider");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "supportedActionIdentifiersForBundleIdentifier:", v44);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            -[INAppResolver linkActionProvider](v132, "linkActionProvider");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "supportedEntityIdentifiersForBundleIdentifier:", v44);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = [INAppIntentDescriptor alloc];
            objc_msgSend(v8, "intentIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v47);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v49);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v50;
            v29 = v124;
            v55 = -[INAppIntentDescriptor initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:](v54, "initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:", v51, v45, v52, v53);

            v30 = (id)v55;
          }
          else
          {
            v56 = (void *)INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
            {
              v111 = v56;
              objc_msgSend(v8, "intentIdentifier");
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v149 = "-[INAppResolver _resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:]";
              v150 = 2112;
              v151 = v112;
              _os_log_fault_impl(&dword_18BEBC000, v111, OS_LOG_TYPE_FAULT, "%s Platform bundle identifier unexpectedly nil: %@", buf, 0x16u);

              v29 = v124;
            }
            v30 = v8;
          }

          v9 = v119;
        }
        goto LABEL_83;
      }
      -[INAppResolver linkActionProvider](v132, "linkActionProvider");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "supportedActionIdentifiersForBundleIdentifier:", v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v116 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v25, 0, 0);
      if (v116)
      {
        objc_msgSend(v116, "applicationState");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isInstalled"))
        {
          v37 = objc_msgSend(v35, "count");

          if (!v37)
            goto LABEL_31;
          -[INAppResolver linkActionProvider](v132, "linkActionProvider");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "supportedEntityIdentifiersForBundleIdentifier:", v123);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (INActionsAndApplicationRecordMatchesRequirementsFromDescriptor(v35, v36, v116, v8))
          {
            v39 = [INAppIntentDescriptor alloc];
            objc_msgSend(v8, "intentIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v35);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v36);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = -[INAppIntentDescriptor initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:](v39, "initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:", v40, v116, v41, v42);

            v29 = v124;
LABEL_82:

            v30 = v131;
LABEL_83:

            goto LABEL_84;
          }
        }

      }
LABEL_31:
      objc_msgSend(v8, "counterpartIdentifiers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      v127 = v8;
      v120 = v9;
      if (v57)
      {
        v59 = v57;
      }
      else
      {
        objc_msgSend(v8, "bundleIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[INAppResolver localIdentifiersForCounterpartIdentifier:](v132, "localIdentifiersForCounterpartIdentifier:", v60);
        v59 = (id)objc_claimAutoreleasedReturnValue();

      }
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v61 = v59;
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
      v115 = v35;
      v125 = v61;
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v143;
LABEL_36:
        v65 = 0;
        while (1)
        {
          if (*(_QWORD *)v143 != v64)
            objc_enumerationMutation(v61);
          v66 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * v65);
          v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v66, 0, 0);
          v68 = v67;
          if (v67)
          {
            objc_msgSend(v67, "applicationState");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v69, "isInstalled");

            if (v70)
            {
              -[INAppResolver linkActionProvider](v132, "linkActionProvider");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "supportedActionIdentifiersForBundleIdentifier:", v66);
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v72, "count"))
              {
                -[INAppResolver linkActionProvider](v132, "linkActionProvider");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "supportedEntityIdentifiersForBundleIdentifier:", v66);
                v74 = (void *)objc_claimAutoreleasedReturnValue();

                if ((INActionsAndApplicationRecordMatchesRequirementsFromDescriptor(v72, v74, v68, v127) & 1) != 0)
                {
                  v82 = [INAppIntentDescriptor alloc];
                  v8 = v127;
                  objc_msgSend(v127, "intentIdentifier");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v72);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v74);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v131 = -[INAppIntentDescriptor initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:](v82, "initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:", v83, v68, v84, v85);

                  v29 = v124;
                  v86 = v125;
                  v87 = v125;
                  v9 = v120;
                  v35 = v115;
                  goto LABEL_81;
                }

                v61 = v125;
              }

            }
          }

          if (v63 == ++v65)
          {
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v142, v147, 16);
            if (!v63)
              break;
            goto LABEL_36;
          }
        }
      }

      -[INAppResolver linkActionProvider](v132, "linkActionProvider");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "bundleIdentifiers");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = MEMORY[0x1E0C809B0];
      v78 = (void *)MEMORY[0x1E0C99E60];
      v140[0] = MEMORY[0x1E0C809B0];
      v140[1] = 3221225472;
      v140[2] = __89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke;
      v140[3] = &unk_1E228B768;
      v140[4] = v132;
      v8 = v127;
      v79 = v127;
      v141 = v79;
      v113 = v76;
      objc_msgSend(v76, "if_compactMap:", v140);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setWithArray:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      v114 = v81;
      if (objc_msgSend(v81, "count"))
      {
        v35 = v115;
        if (objc_msgSend(v81, "count") == 1)
        {
          objc_msgSend(v81, "anyObject");
          v131 = (INAppIntentDescriptor *)objc_claimAutoreleasedReturnValue();
          v9 = v120;
          v29 = v124;
          goto LABEL_77;
        }
        objc_msgSend(v81, "allObjects");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v138[0] = v77;
        v138[1] = 3221225472;
        v138[2] = __89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke_2;
        v138[3] = &unk_1E228B790;
        v139 = v123;
        objc_msgSend(v105, "if_firstObjectPassingTest:", v138);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v120;
        if (v106)
        {
          v107 = v106;
        }
        else
        {
          objc_msgSend(v81, "anyObject");
          v107 = (INAppIntentDescriptor *)objc_claimAutoreleasedReturnValue();
        }
        v131 = v107;
        v29 = v124;
        v86 = v125;
        v87 = v113;

LABEL_80:
LABEL_81:

        goto LABEL_82;
      }
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v88 = v81;
      v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
      if (!v89)
      {

        goto LABEL_75;
      }
      v90 = v89;
      v131 = 0;
      v133 = *(_QWORD *)v135;
      v91 = 0x7FFFFFFFFFFFFFFFLL;
      obj = v88;
LABEL_53:
      v92 = 0;
      while (1)
      {
        if (*(_QWORD *)v135 != v133)
          objc_enumerationMutation(obj);
        v93 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v92);
        objc_msgSend(v79, "localizedName");
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (v94)
          break;
        objc_msgSend(v79, "bundleIdentifier");
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v99)
          goto LABEL_68;
        objc_msgSend(v79, "bundleIdentifier");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "bundleIdentifier");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "commonPrefixWithString:options:", v101, 0);
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v95, "length"))
        {
          objc_msgSend(v79, "bundleIdentifier");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "substringFromIndex:", objc_msgSend(v95, "length"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v93, "bundleIdentifier");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "substringFromIndex:", objc_msgSend(v95, "length"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          v97 = INEditDistanceBetweenStrings(v96, v104);
          v8 = v127;
          goto LABEL_58;
        }
LABEL_64:

LABEL_68:
        if (v90 == ++v92)
        {
          v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
          if (!v90)
          {

            if (v131)
            {
              -[INAppDescriptor setRequiresUserConfirmation:](v131, "setRequiresUserConfirmation:", v91 > 0);
              goto LABEL_76;
            }
LABEL_75:
            v131 = (INAppIntentDescriptor *)v79;
LABEL_76:
            v9 = v120;
            v29 = v124;
            v35 = v115;
LABEL_77:
            v86 = v125;
            v87 = v113;
            goto LABEL_80;
          }
          goto LABEL_53;
        }
      }
      objc_msgSend(v79, "localizedName");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedName");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = INEditDistanceBetweenStrings(v95, v96);
LABEL_58:

      if (v97 >= v91 || v97 > 5)
        goto LABEL_68;
      v95 = v131;
      v131 = v93;
      v91 = v97;
      goto LABEL_64;
    }
  }
  objc_msgSend(v8, "intentIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("MTUpdateAlarmIntent"));

  v33 = INSiriLogContextIntents;
  if (v32)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v149 = "-[INAppResolver _resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:]";
      _os_log_impl(&dword_18BEBC000, v33, OS_LOG_TYPE_INFO, "%s MTUpdateAlarmIntent is only on watchOS.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v108 = v33;
    objc_msgSend(v8, "intentIdentifier");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v149 = "-[INAppResolver _resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:]";
    v150 = 2112;
    v151 = v109;
    _os_log_error_impl(&dword_18BEBC000, v108, OS_LOG_TYPE_ERROR, "%s Resolved bundleIdentifier unexpectedly nil for %@", buf, 0x16u);

  }
  v30 = v8;
  v29 = v124;
LABEL_84:

  objc_autoreleasePoolPop(context);
  return v30;
}

- (void)cacheResult:(id)a3 forDescriptor:(id)a4
{
  id v6;
  os_unfair_lock_s *p_cacheLock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[INAppResolver cachedResults](self, "cachedResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v11)
  {
    objc_msgSend(v8, "setObject:forKey:", v11, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v6);

  }
  os_unfair_lock_unlock(p_cacheLock);

}

- (void)invalidateCache
{
  os_unfair_lock_s *p_cacheLock;
  void *v4;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[INAppResolver cachedResults](self, "cachedResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_cacheLock);
}

- (void)installedApplicationsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isPlaceholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = objc_msgSend(v7, "BOOLValue");
  if ((v8 & 1) == 0)
  {
    -[INAppResolver invalidateCache](self, "invalidateCache");
    -[INAppResolver linkActionProvider](self, "linkActionProvider");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "evictCache");

  }
}

- (id)optionsForCurrentContextWithIntentClassName:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[INAppResolver _optionsForIntentClassName:](self, "_optionsForIntentClassName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[INAppResolver globalOptions](self, "globalOptions");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_globalOptions, a3);
}

- (void)setOptions:(id)a3 forIntentClassName:(id)a4
{
  id v6;
  os_unfair_lock_s *p_resolverOptionsLock;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    p_resolverOptionsLock = &self->_resolverOptionsLock;
    os_unfair_lock_lock(&self->_resolverOptionsLock);
    -[INAppResolver intentClassNameToResolverOptions](self, "intentClassNameToResolverOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v10)
      objc_msgSend(v8, "setObject:forKey:", v10, v6);
    else
      objc_msgSend(v8, "removeObjectForKey:", v6);

    os_unfair_lock_unlock(p_resolverOptionsLock);
  }

}

- (id)_optionsForIntentClassName:(id)a3
{
  os_unfair_lock_s *p_resolverOptionsLock;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    p_resolverOptionsLock = &self->_resolverOptionsLock;
    v5 = a3;
    os_unfair_lock_lock(p_resolverOptionsLock);
    -[INAppResolver intentClassNameToResolverOptions](self, "intentClassNameToResolverOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_resolverOptionsLock);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (INAppResolver)init
{
  INAppResolver *v2;
  INLinkActionProvider *v3;
  INLinkActionProvider *linkActionProvider;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedResults;
  NSMutableDictionary *v7;
  NSMutableDictionary *intentClassNameToResolverOptions;
  void *v9;
  INAppResolver *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)INAppResolver;
  v2 = -[INAppResolver init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(INLinkActionProvider);
    linkActionProvider = v2->_linkActionProvider;
    v2->_linkActionProvider = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedResults = v2->_cachedResults;
    v2->_cachedResults = v5;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    intentClassNameToResolverOptions = v2->_intentClassNameToResolverOptions;
    v2->_intentClassNameToResolverOptions = v7;

    v2->_resolverOptionsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    v10 = v2;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  v4.receiver = self;
  v4.super_class = (Class)INAppResolver;
  -[INAppResolver dealloc](&v4, sel_dealloc);
}

- (INExecutionCounterpartMapper)_counterpartMapper
{
  INExecutionCounterpartMapper *counterpartMapper;
  INExecutionCounterpartMapper *v4;
  INExecutionCounterpartMapper *v5;

  counterpartMapper = self->_counterpartMapper;
  if (!counterpartMapper)
  {
    v4 = objc_alloc_init(INExecutionCounterpartMapper);
    v5 = self->_counterpartMapper;
    self->_counterpartMapper = v4;

    counterpartMapper = self->_counterpartMapper;
  }
  return counterpartMapper;
}

- (INExecutionFrameworkMapper)_frameworkMapper
{
  INExecutionFrameworkMapper *frameworkMapper;
  INExecutionFrameworkMapper *v4;
  INExecutionFrameworkMapper *v5;

  frameworkMapper = self->_frameworkMapper;
  if (!frameworkMapper)
  {
    v4 = objc_alloc_init(INExecutionFrameworkMapper);
    v5 = self->_frameworkMapper;
    self->_frameworkMapper = v4;

    frameworkMapper = self->_frameworkMapper;
  }
  return frameworkMapper;
}

- (INSystemAppMapper)_systemAppMapper
{
  INSystemAppMapper *systemAppMapper;
  INSystemAppMapper *v4;
  INSystemAppMapper *v5;

  systemAppMapper = self->_systemAppMapper;
  if (!systemAppMapper)
  {
    v4 = objc_alloc_init(INSystemAppMapper);
    v5 = self->_systemAppMapper;
    self->_systemAppMapper = v4;

    systemAppMapper = self->_systemAppMapper;
  }
  return systemAppMapper;
}

- (INLinkActionProvider)linkActionProvider
{
  return self->_linkActionProvider;
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (INAppResolverOptions)globalOptions
{
  return self->_globalOptions;
}

- (NSMutableDictionary)intentClassNameToResolverOptions
{
  return self->_intentClassNameToResolverOptions;
}

- (os_unfair_lock_s)resolverOptionsLock
{
  return self->_resolverOptionsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentClassNameToResolverOptions, 0);
  objc_storeStrong((id *)&self->_globalOptions, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_linkActionProvider, 0);
  objc_storeStrong((id *)&self->_systemAppMapper, 0);
  objc_storeStrong((id *)&self->_frameworkMapper, 0);
  objc_storeStrong((id *)&self->_counterpartMapper, 0);
}

INAppIntentDescriptor *__89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  INAppIntentDescriptor *v9;
  void *v10;
  void *v11;
  void *v12;
  INAppIntentDescriptor *v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "linkActionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedActionIdentifiersForBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "linkActionProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "supportedEntityIdentifiersForBundleIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
    if (v8
      && INActionsAndApplicationRecordMatchesRequirementsFromDescriptor(v5, v7, v8, *(void **)(a1 + 40)))
    {
      v9 = [INAppIntentDescriptor alloc];
      objc_msgSend(*(id *)(a1 + 40), "intentIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[INAppIntentDescriptor initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:](v9, "initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:", v10, v8, v11, v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __89__INAppResolver__resolvedAppIntentMatchingDescriptor_availableActions_availableEntities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "counterpartIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

INUserActivityDescriptor *__57__INAppResolver__resolvedUserActivityMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  INUserActivityDescriptor *v17;
  INUserActivityDescriptor *v19;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
  if (v7)
  {
    objc_msgSend(v7, "applicationState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isInstalled"))
    {
      v17 = 0;
      goto LABEL_7;
    }
    v9 = INApplicationRecordMatchesRequirementsFromUserActivityDescriptor(v7, *(void **)(a1 + 32), *(void **)(a1 + 40));

    if (v9)
    {
      v19 = [INUserActivityDescriptor alloc];
      objc_msgSend(*(id *)(a1 + 32), "userActivityType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "in_counterpartIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "teamIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "in_supportedIntents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "bundleURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](v19, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v8, v10, v11, v12, v13, v14, v15, v16);

LABEL_7:
      goto LABEL_8;
    }
  }
  v17 = 0;
LABEL_8:

  return v17;
}

id __51__INAppResolver__resolvedIntentMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  INIntentDescriptor *v8;
  int v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
  if (v7)
  {
    objc_msgSend(v7, "applicationState");
    v8 = (INIntentDescriptor *)objc_claimAutoreleasedReturnValue();
    if (!-[INAppDescriptor isInstalled](v8, "isInstalled"))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = INApplicationRecordMatchesRequirementsFromIntentDescriptor(v7, *(void **)(a1 + 32), *(void **)(a1 + 40));

    if (v9)
    {
      v8 = -[INAppDescriptor initWithApplicationRecord:]([INIntentDescriptor alloc], "initWithApplicationRecord:", v7);
      -[INIntentDescriptor mergeWithDescriptor:](v8, "mergeWithDescriptor:", *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

id __48__INAppResolver__resolvedAppMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
  if (!v7)
    goto LABEL_6;
  objc_msgSend(v7, "applicationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInstalled") & 1) == 0)
  {

    goto LABEL_6;
  }
  v9 = INApplicationRecordMatchesRequirementsFromDescriptor(v7, *(void **)(a1 + 32), *(void **)(a1 + 40));

  if (!v9)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "descriptorWithRecord:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

+ (id)supportedIntentsOverridesForThirdPartyBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C9AA70], "objectForKey:", a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INAppResolverLogInitIfNeeded_once != -1)
    dispatch_once(&INAppResolverLogInitIfNeeded_once, &__block_literal_global_5);
}

void __31__INAppResolver_sharedResolver__block_invoke()
{
  INAppResolver *v0;
  void *v1;

  v0 = objc_alloc_init(INAppResolver);
  v1 = (void *)sharedResolver_sharedResolver;
  sharedResolver_sharedResolver = (uint64_t)v0;

}

@end
