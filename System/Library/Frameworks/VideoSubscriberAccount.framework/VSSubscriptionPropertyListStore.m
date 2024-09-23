@implementation VSSubscriptionPropertyListStore

- (VSSubscriptionPropertyListStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  VSSubscriptionPropertyListStore *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VSSubscriptionPropertyListStore;
  v6 = -[NSAtomicStore initWithPersistentStoreCoordinator:configurationName:URL:options:](&v12, sel_initWithPersistentStoreCoordinator_configurationName_URL_options_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[NSAtomicStore metadata](v6, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDictionary:", v8);

    VSSubscriptionPropertyListStoreType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x1E0C97A00]);

    -[NSAtomicStore setMetadata:](v6, "setMetadata:", v9);
  }
  return v6;
}

- (BOOL)load:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;

  -[VSSubscriptionPropertyListStore URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v5, 0, a3);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C97B20], "vs_subscriptionEntityForVersion:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSubscriptionPropertyListStore persistentStoreCoordinator](self, "persistentStoreCoordinator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "managedObjectModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "entitiesByName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v12;
        if (v13)
        {
          objc_msgSend(v12, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v20 = v11;
            v16 = v10;
            v17 = v14;

            v9 = v17;
            v10 = v16;
            v11 = v20;
          }

        }
        v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __40__VSSubscriptionPropertyListStore_load___block_invoke;
          v22[3] = &unk_1E93A0F38;
          v22[4] = self;
          v23 = v9;
          v24 = v18;
          objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v22);

        }
        -[NSAtomicStore addCacheNodes:](self, "addCacheNodes:", v18);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 258, 0);
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __40__VSSubscriptionPropertyListStore_load___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(void **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v6, "objectIDForEntity:referenceObject:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A78]), "initWithObjectID:", v9);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
      objc_msgSend(*(id *)(a1 + 40), "attributesByName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __40__VSSubscriptionPropertyListStore_load___block_invoke_2;
      v14[3] = &unk_1E939F248;
      v15 = v5;
      v16 = v10;
      v12 = v10;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

    }
  }

}

void __40__VSSubscriptionPropertyListStore_load___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v5, "vs_propertyListKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vs_propertyListValueTransformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "reverseTransformedValue:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v7, v11);

  }
}

- (BOOL)save:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  VSSubscriptionPropertyListStore *v23;
  id v25;
  id obj;
  _QWORD v27[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = self;
  -[NSAtomicStore cacheNodes](self, "cacheNodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v8, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "entity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v10, "attributesByName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __40__VSSubscriptionPropertyListStore_save___block_invoke;
        v27[3] = &unk_1E939F248;
        v27[4] = v8;
        v13 = v11;
        v28 = v13;
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v27);

        objc_msgSend(v10, "vs_referenceValueAttribute");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "vs_propertyListKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v13, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v25, "setObject:forKey:", v13, v16);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v25, 200, 0, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[VSSubscriptionPropertyListStore URL](v23, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v18, "URLByDeletingLastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (!objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, a3))goto LABEL_20;
      if (v18)
      {
        v21 = objc_msgSend(v17, "writeToURL:options:error:", v18, 1073741825, a3);
LABEL_21:

        goto LABEL_22;
      }
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 514, 0);
      v21 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  v21 = 0;
LABEL_22:

  return v21;
}

void __40__VSSubscriptionPropertyListStore_save___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;

  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vs_propertyListValueTransformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "transformedValue:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(v12, "vs_propertyListKey");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v9);

}

- (id)newCacheNodeForManagedObject:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C97A78];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithObjectID:", v7);

  -[VSSubscriptionPropertyListStore updateCacheNode:fromManagedObject:](self, "updateCacheNode:fromManagedObject:", v8, v5);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSAtomicStore addCacheNodes:](self, "addCacheNodes:", v9);

  return v8;
}

- (void)updateCacheNode:(id)a3 fromManagedObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "entity");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributesByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__VSSubscriptionPropertyListStore_updateCacheNode_fromManagedObject___block_invoke;
  v11[3] = &unk_1E939F248;
  v12 = v6;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __69__VSSubscriptionPropertyListStore_updateCacheNode_fromManagedObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

- (id)newReferenceObjectForManagedObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vs_referenceValueAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "vs_propertyListValueTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "transformedValue:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to construct reference object for managed object: %@"), v3);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The value parameter must not be nil."));
  }

  return v7;
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
