@implementation CCDataResourceReadAccess

+ (id)defaultInstanceWithUseCase:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  CCSetsRootDirectoryURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithRootDirectoryURL:useCase:", v5, v3);

  return v6;
}

- (CCDataResourceReadAccess)initWithRootDirectoryURL:(id)a3 useCase:(id)a4
{
  id v7;
  id v8;
  CCDataResourceReadAccess *v9;
  CCDataResourceReadAccess *v10;
  objc_class *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  BMAccessClient *accessClient;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CCDataResourceReadAccess;
  v9 = -[CCDataResourceReadAccess init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootDirectoryURL, a3);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "cStringUsingEncoding:", 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v10->_useCase, a4);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE0C070]), "initWithUseCase:", v8);
    accessClient = v10->_accessClient;
    v10->_accessClient = (BMAccessClient *)v17;

  }
  return v10;
}

- (id)databaseReadAccessForSet:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[CCDataResourceReadAccess _accessAssertionForSet:](self, "_accessAssertionForSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__5;
    v17 = __Block_byref_object_dispose__5;
    v18 = 0;
    queue = self->_queue;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke;
    v9[3] = &unk_250990E28;
    v9[4] = self;
    v10 = v4;
    v12 = &v13;
    v11 = v5;
    dispatch_sync(queue, v9);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v2 = *(void **)(a1 + 32);
  v30 = 0;
  objc_msgSend(v2, "_defaultDataSiteWithError:", &v30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v30;
  if (v3)
  {
    objc_msgSend(v3, "dataResourceForSet:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (CCDataResourceStatusIsNotDiscoverable(-[NSObject resourceStatus](v5, "resourceStatus")))
      {
        __biome_log_for_category();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke_cold_3(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_accessForSetData:accessAssertion:", v6, *(_QWORD *)(a1 + 48));
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v7 = *(NSObject **)(v29 + 40);
        *(_QWORD *)(v29 + 40) = v28;
      }
    }
    else
    {
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke_cold_2(v7, v21, v22, v23, v24, v25, v26, v27);
    }

  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke_cold_1((uint64_t)v4, v6, v15, v16, v17, v18, v19, v20);
  }

}

- (BOOL)enumerateReadableSets:(id *)a3 usingBlock:(id)a4
{
  return -[CCDataResourceReadAccess enumerateReadableSets:itemType:usingBlock:](self, "enumerateReadableSets:itemType:usingBlock:", a3, (unsigned __int16)CCTypeIdentifierUnknown, a4);
}

- (BOOL)enumerateReadableSets:(id *)a3 itemType:(unsigned __int16)a4 usingBlock:(id)a5
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  NSObject *queue;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  __CFString *v35;
  void *v37;
  void *v39;
  void *v40;
  id obj;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD *v45;
  uint64_t *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD *v56;
  uint64_t *v57;
  id v58;
  _QWORD block[7];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[3];
  char v77;
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  __CFString *v82;
  uint64_t v83;

  v5 = a4;
  v83 = *MEMORY[0x24BDAC8D0];
  v42 = a5;
  if ((unsigned __int16)CCTypeIdentifierUnknown == (_DWORD)v5)
  {
    v7 = 0;
LABEL_4:
    v39 = (void *)v7;
    objc_msgSend(MEMORY[0x24BE0C0A0], "current");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = 0;
    v76[1] = v76;
    v76[2] = 0x2020000000;
    v77 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x2020000000;
    v75 = 0;
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__5;
    v70 = __Block_byref_object_dispose__5;
    v71 = 0;
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__5;
    v64 = __Block_byref_object_dispose__5;
    v65 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke;
    block[3] = &unk_250990E50;
    block[4] = self;
    block[5] = &v60;
    block[6] = &v66;
    dispatch_sync(queue, block);
    v10 = (void *)v67[5];
    if (!v61[5] || v10)
    {
      CCSetError(a3, v10);
      v14 = 0;
      v13 = 0;
LABEL_46:
      _Block_object_dispose(&v60, 8);

      _Block_object_dispose(&v66, 8);
      _Block_object_dispose(&v72, 8);

      _Block_object_dispose(v76, 8);
      goto LABEL_47;
    }
    if ((objc_msgSend(v40, "hasDatavaultEntitlement") & 1) != 0 || objc_msgSend(v40, "processType") == 3)
    {
      -[CCDataResourceReadAccess _accessAssertionForSetDirectory](self, "_accessAssertionForSetDirectory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        v13 = 0;
LABEL_45:

        goto LABEL_46;
      }
      v12 = (void *)v61[5];
      v58 = 0;
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke_2;
      v54[3] = &unk_250990E78;
      v55 = v42;
      v56 = v76;
      v57 = &v72;
      v13 = objc_msgSend(v12, "enumerateDataResources:setIdentifier:descriptors:includingTombstoned:usingBlock:", &v58, v7, 0, 0, v54);
      v14 = v58;
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v73[3];
        if ((v13 & 1) != 0)
        {
          v17 = CFSTR("Success");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failure, error: %@"), v14);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 134218242;
        v80 = v16;
        v81 = 2112;
        v82 = v17;
        _os_log_impl(&dword_237B25000, v15, OS_LOG_TYPE_DEFAULT, "Enumerated %lu readable sets for datavault-entitled process with result: %@", buf, 0x16u);
        if ((v13 & 1) == 0)

      }
      if (v14)
        CCSetError(a3, v14);
      v32 = v55;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", v40, 0, self->_useCase);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "explicitlyAuthorizedResourcesOfType:withAccessMode:", 4, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v19;
      if (v39)
      {
        v52[0] = MEMORY[0x24BDAC760];
        v52[1] = 3221225472;
        v52[2] = __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke_8;
        v52[3] = &unk_250990EA0;
        v53 = v39;
        objc_msgSend(v20, "objectsPassingTest:", v52);
        v21 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v21;
      }
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
      obj = v22;
      v14 = 0;
      if (v23)
      {
        v24 = *(_QWORD *)v49;
        v13 = 1;
        v25 = MEMORY[0x24BDBD1A8];
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v49 != v24)
              objc_enumerationMutation(obj);
            v27 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
            -[CCDataResourceReadAccess _accessAssertionForSetIdentifier:descriptors:](self, "_accessAssertionForSetIdentifier:descriptors:", v27, v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              v29 = (void *)v61[5];
              v47 = v14;
              v43[0] = MEMORY[0x24BDAC760];
              v43[1] = 3221225472;
              v43[2] = __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke_2_10;
              v43[3] = &unk_250990E78;
              v44 = v42;
              v45 = v76;
              v46 = &v72;
              v30 = objc_msgSend(v29, "enumerateDataResources:setIdentifier:descriptors:includingTombstoned:usingBlock:", &v47, v27, 0, 0, v43);
              v31 = v47;

              v13 &= v30;
              v14 = v31;
            }

          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v78, 16);
        }
        while (v23);
      }
      else
      {
        v13 = 1;
      }

      __biome_log_for_category();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = v73[3];
        if ((v13 & 1) != 0)
        {
          v35 = CFSTR("Success");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failure, error: %@"), v14);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 134218242;
        v80 = v34;
        v81 = 2112;
        v82 = v35;
        _os_log_impl(&dword_237B25000, v33, OS_LOG_TYPE_DEFAULT, "Enumerated %lu readable sets for sets-entitled process with result: %@", buf, 0x16u);
        if ((v13 & 1) == 0)

      }
      if (v14)
        CCSetError(a3, v14);
      v11 = v37;
      v32 = obj;
    }

    goto LABEL_45;
  }
  CCTypeIdentifierRegistryBridge();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifierForItemType:", v5);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  CCInvalidSetItemTypeIdentifierErrorForIdentifier(v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CCSetError(a3, v18);

  v13 = 0;
LABEL_47:

  return v13 & 1;
}

void __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_defaultDataSiteWithError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "setWithError:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      (*(void (**)(void))(a1[4] + 16))();
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
        *a3 = 1;
    }
  }

}

uint64_t __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

void __70__CCDataResourceReadAccess_enumerateReadableSets_itemType_usingBlock___block_invoke_2_10(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "setWithError:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      (*(void (**)(void))(a1[4] + 16))();
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
        *a3 = 1;
    }
  }

}

- (id)localDeviceIdForSet:(id)a3
{
  id v4;
  void *v5;
  CCDatabaseSetStateReader *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  -[CCDataResourceReadAccess databaseReadAccessForSet:](self, "databaseReadAccessForSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[CCDatabaseSetStateReader initWithDatabaseAccess:]([CCDatabaseSetStateReader alloc], "initWithDatabaseAccess:", v5);
    v12 = 0;
    -[CCDatabaseSetStateReader constructDeviceMapping:](v6, "constructDeviceMapping:", &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    objc_msgSend(v7, "localDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CCDataResourceReadAccess localDeviceIdForSet:].cold.1((uint64_t)v4, (uint64_t)v8, v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_accessAssertionForSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  CCTypeIdentifierRegistryBridge();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifierForItemType:", objc_msgSend(v4, "itemType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "descriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCDataResourceReadAccess _accessAssertionForSetIdentifier:descriptors:](self, "_accessAssertionForSetIdentifier:descriptors:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CCDataResourceReadAccess _accessAssertionForSet:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

    v8 = 0;
  }

  return v8;
}

- (id)_accessAssertionForSetIdentifier:(id)a3 descriptors:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  BMAccessClient *accessClient;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  NSString *useCase;
  NSString *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BE0C0B0];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithType:name:descriptors:", 4, v6, v8);

  accessClient = self->_accessClient;
  v20 = 0;
  -[BMAccessClient requestAccessToResource:mode:error:](accessClient, "requestAccessToResource:mode:error:", v9, 1, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
    v15 = v12 == 0;
  else
    v15 = 0;
  if (v15)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      useCase = self->_useCase;
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = useCase;
      _os_log_impl(&dword_237B25000, v14, OS_LOG_TYPE_DEFAULT, "[BiomeAccess] CCDataResourceReadAccess obtained access assertion for set identifier: %@ using useCase: %@", buf, 0x16u);
    }

    v16 = v11;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = self->_useCase;
      *(_DWORD *)buf = 138412802;
      v22 = v6;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v12;
      _os_log_error_impl(&dword_237B25000, v14, OS_LOG_TYPE_ERROR, "[BiomeAccess] CCDataResourceReadAccess could not obtain access assertion for set identifier: %@ using useCase: %@ with error: %@", buf, 0x20u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)_accessAssertionForSetDirectory
{
  id v3;
  void *v4;
  BMAccessClient *accessClient;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  NSString *useCase;
  id v14;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE0C0B0]);
  v4 = (void *)objc_msgSend(v3, "initWithType:name:descriptors:", 5, *MEMORY[0x24BE0C030], MEMORY[0x24BDBD1A8]);
  accessClient = self->_accessClient;
  v14 = 0;
  -[BMAccessClient requestAccessToResource:mode:error:](accessClient, "requestAccessToResource:mode:error:", v4, 1, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 0;
  if (v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      useCase = self->_useCase;
      *(_DWORD *)buf = 138412290;
      v16 = useCase;
      _os_log_impl(&dword_237B25000, v9, OS_LOG_TYPE_DEFAULT, "[BiomeAccess] CCDataResourceReadAccess obtained access assertion for sets directory using useCase: %@", buf, 0xCu);
    }

    v11 = v6;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CCDataResourceReadAccess _accessAssertionForSetDirectory].cold.1((uint64_t)self, (uint64_t)v7, v9);

    v11 = 0;
  }

  return v11;
}

- (id)_defaultDataSiteWithError:(id *)a3
{
  CCDataSite *dataSite;
  CCDataSite *v6;
  CCDataSite *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dataSite = self->_dataSite;
  if (!dataSite)
  {
    +[CCDataSite defaultDataSiteWithRootDirectoryURL:create:error:](CCDataSite, "defaultDataSiteWithRootDirectoryURL:create:error:", self->_rootDirectoryURL, 0, a3);
    v6 = (CCDataSite *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dataSite;
    self->_dataSite = v6;

    dataSite = self->_dataSite;
  }
  return dataSite;
}

- (id)_accessForSetData:(id)a3 accessAssertion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  CCDatabaseEmptyAccess *v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "databaseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((v11 & 1) == 0)
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_237B25000, v13, OS_LOG_TYPE_DEFAULT, "(%@) Database has not been created at path: %@", (uint8_t *)&v16, 0x16u);

    }
    goto LABEL_7;
  }
  +[CCDatabaseReader readerForDatabaseAtURL:accessAssertion:](CCDatabaseReader, "readerForDatabaseAtURL:accessAssertion:", v8, v7);
  v12 = (CCDatabaseEmptyAccess *)objc_claimAutoreleasedReturnValue();
  if (!v12)
LABEL_7:
    v12 = objc_alloc_init(CCDatabaseEmptyAccess);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSite, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

void __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "Failed to resolve data site: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_237B25000, a1, a3, "Failed to resolve set data", a5, a6, a7, a8, 0);
}

void __53__CCDataResourceReadAccess_databaseReadAccessForSet___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_237B25000, a1, a3, "Attempting to obtain read access on a tombstoned set", a5, a6, a7, a8, 0);
}

- (void)localDeviceIdForSet:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0(&dword_237B25000, a2, a3, "Failed to resolve localDeviceIdentifier for set: %@ error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_accessAssertionForSet:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237B25000, a2, a3, "[BiomeAccess] CCDataResourceReadAccess - could not resolve set identifier for set: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_accessAssertionForSetDirectory
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0(&dword_237B25000, a2, a3, "[BiomeAccess] CCDataResourceReadAccess could not obtain access assertion for sets directory using useCase: %@ with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
