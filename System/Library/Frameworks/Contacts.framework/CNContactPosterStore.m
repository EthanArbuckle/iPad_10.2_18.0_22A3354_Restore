@implementation CNContactPosterStore

+ (int64_t)maximumContactPostersPerContact
{
  return 7;
}

- (CNContactPosterStore)init
{
  CNContactMetadataPersistentStoreManager *v3;
  CNContactPosterStore *v4;

  v3 = objc_alloc_init(CNContactMetadataPersistentStoreManager);
  v4 = -[CNContactPosterStore initWithContactMetadataStoreManager:](self, "initWithContactMetadataStoreManager:", v3);

  return v4;
}

- (CNContactPosterStore)initWithContactMetadataStoreManager:(id)a3
{
  id v5;
  CNContactPosterStore *v6;
  CNContactPosterStore *v7;
  CNContactPosterStore *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactPosterStore;
  v6 = -[CNContactPosterStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeManager, a3);
    v8 = v7;
  }

  return v7;
}

- (id)performFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id obj;
  _QWORD v16[4];
  id v17;
  CNContactPosterStore *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__22;
  v31 = __Block_byref_object_dispose__22;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__22;
  v25 = __Block_byref_object_dispose__22;
  v26 = 0;
  -[CNContactPosterStore storeManager](self, "storeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__CNContactPosterStore_performFetchRequest_error___block_invoke;
  v16[3] = &unk_1E29F96E0;
  v8 = v6;
  v19 = &v21;
  v20 = &v27;
  v17 = v8;
  v18 = self;
  v9 = (id *)(v22 + 5);
  obj = (id)v22[5];
  objc_msgSend(v7, "performWorkWithManagedObjectContext:error:", v16, &obj);
  objc_storeStrong(v9, obj);

  v10 = (void *)v22[5];
  v11 = (id)v28[5];
  v12 = v11;
  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v10);

  v13 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v13;
}

void __50__CNContactPosterStore_performFetchRequest_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "persistentStoreRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectsToContactPosters:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (BOOL)performSaveRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id *v9;
  int v10;
  id obj;
  _QWORD v13[4];
  id v14;
  CNContactPosterStore *v15;
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
  char v27;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__22;
  v22 = __Block_byref_object_dispose__22;
  v23 = 0;
  -[CNContactPosterStore storeManager](self, "storeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__CNContactPosterStore_performSaveRequest_error___block_invoke;
  v13[3] = &unk_1E29F96E0;
  v8 = v6;
  v16 = &v18;
  v17 = &v24;
  v14 = v8;
  v15 = self;
  v9 = (id *)(v19 + 5);
  obj = (id)v19[5];
  objc_msgSend(v7, "performWorkWithManagedObjectContext:error:", v13, &obj);
  objc_storeStrong(v9, obj);

  v10 = *((unsigned __int8 *)v25 + 24);
  if (a4 && !*((_BYTE *)v25 + 24))
    *a4 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10 != 0;
}

void __49__CNContactPosterStore_performSaveRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  id obj;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "operationType");
  v5 = *(void **)(a1 + 32);
  if (v4 == 2)
  {
    objc_msgSend(v5, "persistentStoreRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(v3, "executeRequest:error:", v6, &obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8 != 0;
LABEL_5:

    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "operationType"))
  {
    objc_msgSend(*(id *)(a1 + 32), "contactIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "posters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_cn_takeLast:", objc_msgSend((id)objc_opt_class(), "maximumContactPostersPerContact"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(id *)(v13 + 40);
    objc_msgSend(v12, "updateOrInsertNewContactPosters:forContactIdentifier:inContext:error:", v11, v8, v3, &v17);
    objc_storeStrong((id *)(v13 + 40), v17);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(id *)(v14 + 40);
    v15 = objc_msgSend(v3, "save:", &v16);
    objc_storeStrong((id *)(v14 + 40), v16);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;

    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)updateOrInsertNewContactPosters:(id)a3 forContactIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactPosterFetchRequest recentPostersRequestForContactIdenfitiers:](CNContactPosterFetchRequest, "recentPostersRequestForContactIdenfitiers:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v14;
  objc_msgSend(v14, "persistentStoreRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeFetchRequest:error:", v15, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v17);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (!-[CNContactPosterStore updateExistingPosters:withContactPoster:](self, "updateExistingPosters:withContactPoster:", v16, v23))
        {
          -[CNContactPosterStore insertContactPoster:withContactIdentifier:inContext:](self, "insertContactPoster:withContactIdentifier:inContext:", v23, v11, v12);
          ++v20;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  -[CNContactPosterStore ensurePosterQuotasForPosters:addedPostersCount:inContext:](self, "ensurePosterQuotasForPosters:addedPostersCount:inContext:", v16, v20, v12);
  return 1;
}

- (BOOL)updateExistingPosters:(id)a3 withContactPoster:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__CNContactPosterStore_updateExistingPosters_withContactPoster___block_invoke;
  v10[3] = &unk_1E29FBCA8;
  v6 = v5;
  v11 = v6;
  objc_msgSend(a3, "_cn_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "updateWithContactPoster:", v6);

  return v8 != 0;
}

uint64_t __64__CNContactPosterStore_updateExistingPosters_withContactPoster___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v10 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  return v10;
}

- (void)ensurePosterQuotasForPosters:(id)a3 addedPostersCount:(int64_t)a4 inContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v7, "_cn_skip:", objc_msgSend((id)objc_opt_class(), "maximumContactPostersPerContact") - a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)insertContactPoster:(id)a3 withContactIdentifier:(id)a4 inContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("CNContactPoster"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pairedImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("CNContactImage"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pairedImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setupWithContactImage:pairedPoster:contactIdentifier:", v12, v9, v7);

    objc_msgSend(v9, "setupWithContactPoster:pairedImage:contactIdentifier:", v13, v11, v7);
  }
  else
  {
    objc_msgSend(v9, "setupWithContactPoster:contactIdentifier:", v13, v7);
  }

}

- (id)managedObjectsToContactPosters:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CNContactPosterManagedObject managedObjectToContactPosterTransform](CNContactPosterManagedObject, "managedObjectToContactPosterTransform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNContactMetadataPersistentStoreManager)storeManager
{
  return self->_storeManager;
}

- (void)setStoreManager:(id)a3
{
  objc_storeStrong((id *)&self->_storeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeManager, 0);
}

@end
