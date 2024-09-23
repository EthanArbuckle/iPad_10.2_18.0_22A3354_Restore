@implementation GEOCollectionResult

- (GEOCollectionResult)initWithCollectionResult:(id)a3
{
  id *v4;
  GEOCollectionResult *v5;
  void *v6;
  GEOCollectionResult *v7;
  GEOPDCollectionResult *v8;
  NSObject *p_super;
  uint8_t v11[8];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  objc_super v19;

  v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOCollectionResult;
  v5 = -[GEOCollectionResult init](&v19, sel_init);
  if (!v5)
    goto LABEL_7;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__26;
  v17 = __Block_byref_object_dispose__26;
  v18 = 0;
  -[GEOPDCollectionResult components](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__GEOCollectionResult_initWithCollectionResult___block_invoke;
  v12[3] = &unk_1E1C029D0;
  v12[4] = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v7 = (GEOCollectionResult *)v14[5];
  if (v7)
  {
    objc_storeStrong((id *)&v5->_collectionComponent, (id)v14[5]);
    v8 = v4;
    p_super = &v5->_collectionResult->super.super;
    v5->_collectionResult = v8;
  }
  else
  {
    GEOGetCuratedCollectionsLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1885A9000, p_super, OS_LOG_TYPE_ERROR, "Collection Result could not be initialized because some data is missing.\n collectionComponent is nil.", v11, 2u);
    }
  }

  _Block_object_dispose(&v13, 8);
  if (v7)
LABEL_7:
    v7 = v5;

  return v7;
}

void __48__GEOCollectionResult_initWithCollectionResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _WORD *v7;
  __int16 v8;
  _WORD *v9;

  v7 = a2;
  if (v7)
  {
    v8 = v7[50];
    if ((v8 & 0x80) != 0 && *((_DWORD *)v7 + 22) == 65 && ((v8 & 0x20) == 0 || !*((_DWORD *)v7 + 20)))
    {
      v9 = v7;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v7 = v9;
      *a4 = 1;
    }
  }

}

- (GEOPlaceCollection)collection
{
  GEOPlaceCollection *collection;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  GEOPDComponent *collectionComponent;
  GEOPlaceCollection *v11;
  void *v12;
  void *v13;
  GEOPlaceCollection *v14;
  GEOPlaceCollection *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  collection = self->_collection;
  if (!collection)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[GEOPDComponent values]((id *)&self->_collectionComponent->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (v9)
          {
            if (*(_QWORD *)(v9 + 392))
            {
              collectionComponent = self->_collectionComponent;
              if (collectionComponent)
              {
                if (collectionComponent->_attribution)
                {
                  v11 = [GEOPlaceCollection alloc];
                  -[GEOPDComponentValue placeCollection]((id *)v9);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GEOPDComponent attribution]((id *)&self->_collectionComponent->super.super.isa);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = -[GEOPlaceCollection initWithCollection:usingAttribution:](v11, "initWithCollection:usingAttribution:", v12, v13, (_QWORD)v17);
                  v15 = self->_collection;
                  self->_collection = v14;

                  goto LABEL_15;
                }
              }
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_15:

    collection = self->_collection;
  }
  return collection;
}

- (NSArray)placeCollectionItems
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCollectionResult components]((id *)&self->_collectionResult->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__GEOCollectionResult_placeCollectionItems__block_invoke;
  v8[3] = &unk_1E1C078D0;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  if (objc_msgSend(v5, "count"))
    v6 = (void *)objc_msgSend(v5, "copy");
  else
    v6 = 0;

  return (NSArray *)v6;
}

void __43__GEOCollectionResult_placeCollectionItems__block_invoke(uint64_t a1, void *a2)
{
  _WORD *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOPlaceCollectionItem *v11;
  void *v12;
  GEOPlaceCollectionItem *v13;
  _WORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = v3[50];
    if ((v4 & 0x80) != 0 && *((_DWORD *)v3 + 22) == 74 && ((v4 & 0x20) == 0 || !*((_DWORD *)v3 + 20)))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v14 = v3;
      -[GEOPDComponent values]((id *)v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
            if (v10 && *(_QWORD *)(v10 + 384))
            {
              v11 = [GEOPlaceCollectionItem alloc];
              -[GEOPDComponentValue placeCollectionItem]((id *)v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = -[GEOPlaceCollectionItem initWithPlaceCollectionItem:](v11, "initWithPlaceCollectionItem:", v12);

              if (v13)
                objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

            }
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }

      v3 = v14;
    }
  }

}

+ (id)collectionResultsFromResponse:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a3, "resultsWithResultType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__GEOCollectionResult_collectionResultsFromResponse___block_invoke;
  v8[3] = &unk_1E1C078F8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __53__GEOCollectionResult_collectionResultsFromResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOCollectionResult *v4;
  GEOCollectionResult *v5;

  v3 = a2;
  v5 = -[GEOCollectionResult initWithCollectionResult:]([GEOCollectionResult alloc], "initWithCollectionResult:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_collectionComponent, 0);
  objc_storeStrong((id *)&self->_collectionResult, 0);
}

@end
