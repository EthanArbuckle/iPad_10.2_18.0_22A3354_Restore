@implementation MKPlaceCuratedCollectionRefiner

- (MKPlaceCuratedCollectionRefiner)initWithCollectionIdentifier:(unint64_t)a3
{
  return -[MKPlaceCuratedCollectionRefiner initWithCollectionIdentifier:providerIdentifier:](self, "initWithCollectionIdentifier:providerIdentifier:", a3, 0);
}

- (MKPlaceCuratedCollectionRefiner)initWithCollectionIdentifier:(unint64_t)a3 providerIdentifier:(int)a4
{
  MKPlaceCuratedCollectionRefiner *v4;
  uint64_t v5;
  MKPlaceCuratedCollectionRefiner *v7;
  MKMapItemIdentifier *v8;
  uint64_t v9;
  MKMapItemIdentifier *collectionIdentifier;
  void *v11;
  void *v12;
  uint64_t v13;
  MKMapServiceCuratedCollectionTicket *identifierRefinementTicket;
  MKPlaceCuratedCollectionRefiner *v15;
  objc_super v17;
  uint8_t buf[16];
  _QWORD v19[2];

  v4 = self;
  v19[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    v17.receiver = self;
    v17.super_class = (Class)MKPlaceCuratedCollectionRefiner;
    v7 = -[MKPlaceCuratedCollectionRefiner init](&v17, sel_init);
    if (v7)
    {
      v8 = [MKMapItemIdentifier alloc];
      v9 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v8, "initWithMUID:resultProviderID:coordinate:", a3, v5, *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8));
      collectionIdentifier = v7->_collectionIdentifier;
      v7->_collectionIdentifier = (MKMapItemIdentifier *)v9;

      +[MKMapService sharedService](MKMapService, "sharedService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7->_collectionIdentifier;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ticketForCuratedCollections:isBatchLookup:traits:", v12, 0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      identifierRefinementTicket = v7->_identifierRefinementTicket;
      v7->_identifierRefinementTicket = (MKMapServiceCuratedCollectionTicket *)v13;

    }
    v4 = v7;
    v15 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: collectionIdentifier != 0", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (void)fetchWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MKMapServiceCuratedCollectionTicket *identifierRefinementTicket;
  NSObject *v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    LOWORD(location[0]) = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Assertion failed: completion != ((void *)0)";
LABEL_9:
    _os_log_fault_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)location, 2u);
    goto LABEL_4;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    LOWORD(location[0]) = 0;
    v9 = MEMORY[0x1E0C81028];
    v10 = "Assertion failed: callbackQueue != ((void *)0)";
    goto LABEL_9;
  }
  objc_initWeak(location, self);
  identifierRefinementTicket = self->_identifierRefinementTicket;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke;
  v11[3] = &unk_1E20D8BB8;
  objc_copyWeak(&v14, location);
  v12 = v6;
  v13 = v7;
  -[MKMapServiceCuratedCollectionTicket submitWithCallbackQueue:handler:networkActivity:](identifierRefinementTicket, "submitWithCallbackQueue:handler:networkActivity:", v12, v11, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(location);
LABEL_4:

}

void __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(CFSTR("Failed to refine curated collection for identifier"), "length"))
        objc_msgSend(v8, "setObject:forKey:", CFSTR("Failed to refine curated collection for identifier"), *MEMORY[0x1E0CB2D50]);
      objc_msgSend(v8, "setObject:forKey:", CFSTR("Failed to refine curated collection for identifier"), *MEMORY[0x1E0CB3388]);
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = MKErrorDomain;
      v11 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 2, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_2;
      block[3] = &unk_1E20D7F70;
      v13 = *(NSObject **)(a1 + 32);
      v14 = *(id *)(a1 + 40);
      v29 = v12;
      v30 = v14;
      v15 = v12;
      dispatch_async(v13, block);

      v16 = v30;
    }
    else
    {
      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_resolveMapItemsWithCollection:callbackQueue:completion:", v17, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

        goto LABEL_9;
      }
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(CFSTR("No curated collections for identifier"), "length"))
        objc_msgSend(v18, "setObject:forKey:", CFSTR("No curated collections for identifier"), *MEMORY[0x1E0CB2D50]);
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = MKErrorDomain;
      v21 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_3;
      v25[3] = &unk_1E20D7F70;
      v23 = *(NSObject **)(a1 + 32);
      v24 = *(id *)(a1 + 40);
      v26 = v22;
      v27 = v24;
      v15 = v22;
      dispatch_async(v23, v25);

      v16 = v27;
    }

  }
LABEL_9:

}

uint64_t __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_resolveMapItemsWithCollection:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  MKMapServiceCuratedCollectionItemsTicket *v14;
  MKMapServiceCuratedCollectionItemsTicket *mapItemRefinementTicket;
  MKMapServiceCuratedCollectionItemsTicket *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "itemIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKMapService sharedService](MKMapService, "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ticketForCuratedCollectionItems:collection:traits:", v12, self->_collectionIdentifier, 0);
  v14 = (MKMapServiceCuratedCollectionItemsTicket *)objc_claimAutoreleasedReturnValue();
  mapItemRefinementTicket = self->_mapItemRefinementTicket;
  self->_mapItemRefinementTicket = v14;

  objc_initWeak(&location, self);
  v16 = self->_mapItemRefinementTicket;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__MKPlaceCuratedCollectionRefiner__resolveMapItemsWithCollection_callbackQueue_completion___block_invoke;
  v18[3] = &unk_1E20D8BE0;
  objc_copyWeak(&v20, &location);
  v17 = v10;
  v19 = v17;
  -[MKMapServiceCuratedCollectionItemsTicket submitWithCallbackQueue:handler:networkActivity:](v16, "submitWithCallbackQueue:handler:networkActivity:", v9, v18, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __91__MKPlaceCuratedCollectionRefiner__resolveMapItemsWithCollection_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(CFSTR("Failed to refine map items for curated collection"), "length"))
        objc_msgSend(v11, "setObject:forKey:", CFSTR("Failed to refine map items for curated collection"), *MEMORY[0x1E0CB2D50]);
      objc_msgSend(v11, "setObject:forKey:", CFSTR("Failed to refine map items for curated collection"), *MEMORY[0x1E0CB3388]);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = MKErrorDomain;
      v14 = (void *)objc_msgSend(v11, "copy");
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 2, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v23 = v7;
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = v8;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "mapItem");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v22);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v19);
      }

      v7 = v23;
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemRefinementTicket, 0);
  objc_storeStrong((id *)&self->_identifierRefinementTicket, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end
