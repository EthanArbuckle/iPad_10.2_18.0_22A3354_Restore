@implementation MPModelLibraryImportChangeRequestOperation

- (void)execute
{
  MPModelLibraryImportChangeRequestOperation *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  NSOperationQueue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MPModelLibraryStoreIDsImportChangeRequestOperation *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  MPModelLibraryGlobalPlaylistImportChangeRequestOperation *v16;
  id v17;
  void *v18;
  void *v19;
  id obj;
  _BOOL4 v21;
  dispatch_queue_t v22;
  void *v23;
  MPModelLibraryImportChangeRequestOperation *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  NSObject *v35;
  MPModelLibraryImportChangeRequestOperation *v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[5];
  id v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v24 = self;
  if (!self->_operationQueue)
  {
    v2 = self;
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 3);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelLibraryImportChangeRequestOperation.operationQueue"));
    v5 = v2->_operationQueue;
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setQualityOfService:](v5, "setQualityOfService:", objc_msgSend(v6, "qualityOfService"));

    self = v24;
  }
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__11626;
  v59[4] = __Block_byref_object_dispose__11627;
  v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__11626;
  v57[4] = __Block_byref_object_dispose__11627;
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MPModelLibraryImportChangeRequestOperation responseHandler](v24, "responseHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB34C8];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke;
  v53[3] = &unk_1E315F440;
  v55 = v57;
  v56 = v59;
  v17 = v9;
  v53[4] = v24;
  v54 = v17;
  objc_msgSend(v10, "blockOperationWithBlock:", v53);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryImportChangeRequest referralObject](v24->_request, "referralObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryImportChangeRequest modelObjects](v24->_request, "modelObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MPModelLibraryImportChangeRequest shouldLibraryAdd](v24->_request, "shouldLibraryAdd");
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__11626;
  v51 = __Block_byref_object_dispose__11627;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__11626;
  v45 = __Block_byref_object_dispose__11627;
  v46 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_2;
  v40[3] = &unk_1E3155278;
  v40[4] = &v41;
  v40[5] = &v47;
  objc_msgSend(v19, "enumerateItemIdentifiersUsingBlock:", v40);
  v22 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryImportChangeRequestOperation.accessQueue", 0);
  if (objc_msgSend((id)v48[5], "count"))
  {
    v11 = objc_alloc_init(MPModelLibraryStoreIDsImportChangeRequestOperation);
    -[MPModelLibraryStoreIDsImportChangeRequestOperation setShouldLibraryAdd:](v11, "setShouldLibraryAdd:", v21);
    -[MPModelLibraryStoreIDsImportChangeRequestOperation setMediaLibrary:](v11, "setMediaLibrary:", v8);
    -[MPModelLibraryStoreIDsImportChangeRequestOperation setStoreIDs:](v11, "setStoreIDs:", v48[5]);
    -[MPModelLibraryStoreIDsImportChangeRequestOperation setReferralObject:](v11, "setReferralObject:", v18);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_3;
    v34[3] = &unk_1E3155310;
    v38 = v59;
    v35 = v22;
    v36 = v24;
    v37 = v8;
    v39 = v57;
    -[MPModelLibraryStoreIDsImportChangeRequestOperation setResponseHandler:](v11, "setResponseHandler:", v34);
    objc_msgSend(v23, "addDependency:", v11);
    -[NSOperationQueue addOperation:](v24->_operationQueue, "addOperation:", v11);

  }
  if (objc_msgSend((id)v42[5], "count"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)v42[5];
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v61, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v16 = objc_alloc_init(MPModelLibraryGlobalPlaylistImportChangeRequestOperation);
          -[MPModelLibraryGlobalPlaylistImportChangeRequestOperation setShouldLibraryAdd:](v16, "setShouldLibraryAdd:", v21);
          -[MPModelLibraryGlobalPlaylistImportChangeRequestOperation setMediaLibrary:](v16, "setMediaLibrary:", v8);
          -[MPModelLibraryGlobalPlaylistImportChangeRequestOperation setGlobalPlaylistID:](v16, "setGlobalPlaylistID:", v15);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_10;
          v25[3] = &unk_1E3155380;
          v26 = v22;
          v28 = v59;
          v27 = v8;
          v29 = v57;
          -[MPModelLibraryGlobalPlaylistImportChangeRequestOperation setResponseHandler:](v16, "setResponseHandler:", v25);
          objc_msgSend(v23, "addDependency:", v16);
          -[NSOperationQueue addOperation:](v24->_operationQueue, "addOperation:", v16);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v61, 16);
      }
      while (v12);
    }

  }
  -[NSOperationQueue addOperation:](v24->_operationQueue, "addOperation:", v23);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);

}

- (MPModelLibraryImportChangeRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

uint64_t __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    else
      v3 = 0;
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "universalStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalPlaylistID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v5);
  }
  else
  {
    objc_msgSend(v19, "universalStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "subscriptionAdamID");
    if (v11)
    {
      v12 = v11;

    }
    else
    {
      objc_msgSend(v19, "universalStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "adamID");

      if (!v12)
        goto LABEL_11;
    }
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v14)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
LABEL_11:

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11[2];
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_4;
  block[3] = &unk_1E31552E8;
  v8 = *(NSObject **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v15 = v5;
  *(_OWORD *)v11 = *(_OWORD *)(a1 + 48);
  v9 = v11[0];
  v16 = *(_OWORD *)v11;
  v17 = *(_QWORD *)(a1 + 64);
  v10 = v5;
  v11[0] = v6;
  dispatch_sync(v8, block);

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_11;
  block[3] = &unk_1E3155358;
  v12 = v6;
  v13 = v5;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 40);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v15 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10[0] = v6;
  dispatch_sync(v7, block);

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  MPModelPlaylist *v6;
  MPIdentifierSet *v7;
  void *v8;
  MPIdentifierSet *v9;
  MPModelPlaylist *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(_QWORD *)(v3 + 40);
    v4 = (id *)(v3 + 40);
    if (!v5)
      objc_storeStrong(v4, v2);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = [MPModelPlaylist alloc];
    v7 = [MPIdentifierSet alloc];
    +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_12;
    v14 = &unk_1E3162A70;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    v9 = -[MPIdentifierSet initWithSource:modelKind:block:](v7, "initWithSource:modelKind:block:", CFSTR("LibraryImport"), v8, &v11);
    v10 = -[MPModelObject initWithIdentifiers:block:](v6, "initWithIdentifiers:block:", v9, &__block_literal_global_27_11639, v11, v12, v13, v14);

    if (v10)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v10);

  }
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_13;
  v6[3] = &unk_1E3162B80;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v5, v6);

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_13(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  MPIdentifierSet *v17;
  void *v18;
  id v19;
  MPIdentifierSet *v20;
  void *v21;
  id obj;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(_QWORD *)(v3 + 40);
    v4 = (id *)(v3 + 40);
    if (!v5)
      objc_storeStrong(v4, v2);
  }
  objc_msgSend(*(id *)(a1 + 40), "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeItemAdamID"), CFSTR("subscriptionStoreItemAdamID"), CFSTR("storeCloudAlbumID"), CFSTR("storeSagaID"), CFSTR("persistentID"), CFSTR("mediaType"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 48);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v12), "valuesForProperties:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", CFSTR("mediaType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "integerValue");

        v15 = (objc_class *)objc_opt_class();
        v16 = [v15 alloc];
        v17 = [MPIdentifierSet alloc];
        +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_5;
        v23[3] = &unk_1E31552A0;
        v24 = *(id *)(a1 + 56);
        v19 = v13;
        v25 = v19;
        v26 = v7;
        v20 = -[MPIdentifierSet initWithSource:modelKind:block:](v17, "initWithSource:modelKind:block:", CFSTR("LibraryImport"), v18, v23);
        v21 = (void *)objc_msgSend(v16, "initWithIdentifiers:block:", v20, &__block_literal_global_11648);

        if (v21)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v21);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_5(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a2;
  objc_msgSend(a1[4], "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_6;
  v11[3] = &unk_1E3162B80;
  v12 = a1[5];
  objc_msgSend(v6, "setLibraryIdentifiersWithDatabaseID:block:", v3, v11);

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_7;
  v9[3] = &unk_1E3163A30;
  v10 = a1[5];
  objc_msgSend(v6, "setUniversalStoreIdentifiersWithBlock:", v9);
  if (objc_msgSend(a1[6], "length"))
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_8;
    v7[3] = &unk_1E3162BA8;
    v5 = a1[6];
    v8 = a1[5];
    objc_msgSend(v6, "setPersonalStoreIdentifiersWithPersonID:block:", v5, v7);

  }
}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("persistentID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("storeItemAdamID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdamID:", objc_msgSend(v5, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("subscriptionStoreItemAdamID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubscriptionAdamID:", objc_msgSend(v6, "longLongValue"));

}

void __53__MPModelLibraryImportChangeRequestOperation_execute__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("storeCloudAlbumID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v5, "setCloudAlbumID:", v3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("storeSagaID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudID:", objc_msgSend(v4, "unsignedLongLongValue"));

}

@end
