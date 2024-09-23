@implementation MIUserManagement

- (MIUserManagement)init
{
  MIUserManagement *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIUserManagement;
  v2 = -[MIUserManagement init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.installd.umAccessQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MIUserManagement_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_defaultInstance;
}

void __34__MIUserManagement_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_defaultInstance;
  sharedInstance_defaultInstance = (uint64_t)v0;

}

- (BOOL)_onQueue_refreshPersonaInformationWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  MIPersonaAttributes *v27;
  uint64_t v28;
  void *v29;
  MIPersonaAttributes *v30;
  uint64_t v31;
  NSDictionary *personaAttributesMap;
  uint64_t v34;
  id v35;
  unint64_t v36;
  MIUserManagement *v37;
  id *p_primaryPersonaUniqueString;
  id *p_enterprisePersonaUniqueString;
  id *location;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[MIUserManagement internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v41 = (void *)objc_opt_new();
  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v7 = objc_msgSend(v6, "personaGenerationIdentifierWithError:", &v47);
  v8 = v47;

  if (!v7)
  {
    _CreateAndLogError((uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]", 67, CFSTR("MIInstallerErrorDomain"), 4, v8, 0, CFSTR("Failed to read UM's persona generation identifier when resolving persona"), v9, v34);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  -[MIUserManagement personaAttributesMap](self, "personaAttributesMap");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    v12 = -[MIUserManagement personaGenerationIdentifier](self, "personaGenerationIdentifier");

    if (v7 == v12)
    {
      v13 = 1;
      v14 = v8;
      goto LABEL_29;
    }
  }
  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v8;
  objc_msgSend(v15, "listAllPersonaAttributesWithError:", &v46);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v46;

  if (!v16)
  {
    _CreateAndLogError((uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]", 79, CFSTR("MIInstallerErrorDomain"), 4, v17, 0, CFSTR("Failed to read persona attributes from UM"), v18, v34);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v17;
LABEL_26:

    if (a3)
    {
      v14 = objc_retainAutorelease(v14);
      v13 = 0;
      *a3 = v14;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_29;
  }
  v35 = v17;
  v36 = v7;
  v37 = self;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v19 = v16;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v20)
  {
    v21 = v20;
    p_enterprisePersonaUniqueString = (id *)&self->_enterprisePersonaUniqueString;
    location = (id *)&self->_systemPersonaUniqueString;
    v22 = *(_QWORD *)v43;
    p_primaryPersonaUniqueString = (id *)&self->_primaryPersonaUniqueString;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v24, "userPersonaUniqueString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          if (objc_msgSend(v24, "isSystemPersona"))
            objc_storeStrong(location, v25);
          if (objc_msgSend(v24, "isEnterprisePersona"))
            objc_storeStrong(p_enterprisePersonaUniqueString, v25);
          if (objc_msgSend(v24, "isPersonalPersona"))
            objc_storeStrong(p_primaryPersonaUniqueString, v25);
          objc_msgSend(v24, "userPersonaBundleIDList");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
            v26 = (void *)objc_opt_new();
          v27 = [MIPersonaAttributes alloc];
          v28 = objc_msgSend(v24, "userPersonaType");
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[MIPersonaAttributes initWithPersonaString:personaType:associatedBundleIDs:](v27, "initWithPersonaString:personaType:associatedBundleIDs:", v25, v28, v29);
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v30, v25);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v21);
  }

  v31 = objc_msgSend(v41, "copy");
  personaAttributesMap = v37->_personaAttributesMap;
  v37->_personaAttributesMap = (NSDictionary *)v31;

  v37->_personaGenerationIdentifier = v36;
  v13 = 1;
  v14 = v35;
LABEL_29:

  return v13;
}

- (NSString)primaryPersonaUniqueString
{
  NSObject *v3;
  _QWORD block[5];

  -[MIUserManagement internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MIUserManagement_primaryPersonaUniqueString__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_primaryPersonaUniqueString;
}

void __46__MIUserManagement_primaryPersonaUniqueString__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = 0;
  v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  v3 = v4;
  if ((v2 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();

}

- (NSString)enterprisePersonaUniqueString
{
  NSObject *v3;
  _QWORD block[5];

  -[MIUserManagement internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MIUserManagement_enterprisePersonaUniqueString__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_enterprisePersonaUniqueString;
}

void __49__MIUserManagement_enterprisePersonaUniqueString__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = 0;
  v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  v3 = v4;
  if ((v2 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();

}

- (NSString)systemPersonaUniqueString
{
  NSObject *v3;
  _QWORD block[5];

  -[MIUserManagement internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MIUserManagement_systemPersonaUniqueString__block_invoke;
  block[3] = &unk_1E6CB6CA8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_systemPersonaUniqueString;
}

void __45__MIUserManagement_systemPersonaUniqueString__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = 0;
  v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  v3 = v4;
  if ((v2 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();

}

- (BOOL)isKnownPersonaUniqueString:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;
  int v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Invalid")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("PersonalPersonaPlaceholderString")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[MIUserManagement internalQueue](self, "internalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__MIUserManagement_isKnownPersonaUniqueString_error___block_invoke;
    v11[3] = &unk_1E6CB6CD0;
    v11[4] = self;
    v13 = &v15;
    v12 = v6;
    v14 = &v21;
    dispatch_sync(v8, v11);

    v9 = *((unsigned __int8 *)v22 + 24);
    if (a4 && !*((_BYTE *)v22 + 24))
    {
      *a4 = objc_retainAutorelease((id)v16[5]);
      v9 = *((unsigned __int8 *)v22 + 24);
    }
    v7 = v9 != 0;

  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v7;
}

void __53__MIUserManagement_isKnownPersonaUniqueString_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "personaAttributesMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIUserManagement isKnownPersonaUniqueString:error:]_block_invoke", 173, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Client provided persona %@ is not among available personas on the system"), v7, *(_QWORD *)(a1 + 40));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
}

- (id)multiPersonaSADAppBundleIDsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[MIUserManagement internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MIUserManagement_multiPersonaSADAppBundleIDsWithError___block_invoke;
  block[3] = &unk_1E6CB6CF8;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  v6 = (void *)v17[5];
  if (a3 && !v6)
  {
    *a3 = objc_retainAutorelease((id)v11[5]);
    v6 = (void *)v17[5];
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __57__MIUserManagement_multiPersonaSADAppBundleIDsWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (_QWORD *)a1[4];
    v6 = (void *)v5[3];
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v5, "personaAttributesMap");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIDs");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    else
    {
      v8 = 0;
      v13 = objc_opt_new();
      v14 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }

  }
}

- (id)personaForBundleID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v15 = v6;
    MOLogWrite();
  }
  -[MIUserManagement internalQueue](self, "internalQueue", v15);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MIUserManagement_personaForBundleID_error___block_invoke;
  block[3] = &unk_1E6CB6D48;
  v18 = &v21;
  block[4] = self;
  v19 = &v25;
  v8 = v6;
  v17 = v8;
  v20 = &v31;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v22 + 24))
  {
    if (v32[5])
      goto LABEL_11;
    +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryPersonaString");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v32[5];
    v32[5] = v10;

    v12 = *((_BYTE *)v22 + 24) == 0;
    if (!a4)
      goto LABEL_11;
  }
  else
  {
    v12 = 1;
    if (!a4)
      goto LABEL_11;
  }
  if (v12)
    *a4 = objc_retainAutorelease((id)v26[5]);
LABEL_11:
  v13 = (id)v32[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v13;
}

void __45__MIUserManagement_personaForBundleID_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &v11);
  objc_storeStrong((id *)(v3 + 40), v11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "personaAttributesMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__MIUserManagement_personaForBundleID_error___block_invoke_2;
    v8[3] = &unk_1E6CB6D20;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __45__MIUserManagement_personaForBundleID_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v8 = a3;
  if ((objc_msgSend(v8, "personaType") & 0xFFFFFFFFFFFFFFFBLL) == 2)
  {
    objc_msgSend(v8, "bundleIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        MOLogWrite();
      *a4 = 1;
    }

  }
}

- (unint64_t)personaTypeForPersonaUniqueString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  -[MIUserManagement personaAttributesMap](self, "personaAttributesMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MIUserManagement personaAttributesMap](self, "personaAttributesMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "personaType");

  }
  else
  {
    v9 = 1000;
  }

  return v9;
}

- (void)setPrimaryPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setEnterprisePersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSystemPersonaUniqueString:(id)a3
{
  objc_storeStrong((id *)&self->_systemPersonaUniqueString, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (unint64_t)personaGenerationIdentifier
{
  return self->_personaGenerationIdentifier;
}

- (void)setPersonaGenerationIdentifier:(unint64_t)a3
{
  self->_personaGenerationIdentifier = a3;
}

- (NSDictionary)personaAttributesMap
{
  return self->_personaAttributesMap;
}

- (void)setPersonaAttributesMap:(id)a3
{
  objc_storeStrong((id *)&self->_personaAttributesMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaAttributesMap, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_systemPersonaUniqueString, 0);
  objc_storeStrong((id *)&self->_enterprisePersonaUniqueString, 0);
  objc_storeStrong((id *)&self->_primaryPersonaUniqueString, 0);
}

@end
