@implementation GEOCollectionSuggestionResult

- (GEOCollectionSuggestionResult)initWithCollectionSuggestionResult:(id)a3 mapsResults:(id)a4
{
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id *v20;
  void *v21;
  GEOMapItemIdentifier *v22;
  id *v23;
  void *v24;
  GEOMapItemIdentifier *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  GEOMapItemIdentifier *v33;
  id *v34;
  void *v35;
  GEOMapItemIdentifier *v36;
  int v37;
  GEOCollectionResult *v38;
  void *v39;
  GEOCollectionResult *v40;
  uint64_t v41;
  NSObject *v42;
  GEOCollectionSuggestionResult *v43;
  uint64_t v44;
  NSArray *collections;
  GEOCollectionSuggestionResult *v46;
  id v48;
  GEOCollectionSuggestionResult *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  objc_super v54;
  uint8_t buf[16];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = (id *)a3;
  v8 = a4;
  if (v7 && (-[GEOPDCollectionSuggestionResult _readCollectionIds]((uint64_t)v7), objc_msgSend(v7[3], "count")))
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    -[GEOPDCollectionSuggestionResult collectionIds](v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v52 = v12;
      v48 = a3;
      v49 = self;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v50 = v8;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v61 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_msgSend(v19, "collection");
            v20 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDCollectionResult collectionId](v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              v22 = [GEOMapItemIdentifier alloc];
              objc_msgSend(v19, "collection");
              v23 = (id *)objc_claimAutoreleasedReturnValue();
              -[GEOPDCollectionResult collectionId](v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v22, "initWithMapsIdentifier:", v24);

              if (v25)
                objc_msgSend(v13, "addObject:", v25);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        }
        while (v16);
      }

      objc_msgSend(v13, "intersectSet:", v52);
      v26 = (void *)MEMORY[0x1E0C99DE8];
      -[GEOPDCollectionSuggestionResult _readCollectionIds]((uint64_t)v7);
      v51 = (uint64_t)v7;
      objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v7[3], "count"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v27 = v14;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v57 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            v33 = [GEOMapItemIdentifier alloc];
            objc_msgSend(v32, "collection");
            v34 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDCollectionResult collectionId](v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v33, "initWithMapsIdentifier:", v35);
            v37 = objc_msgSend(v13, "containsObject:", v36);

            if (v37)
            {
              v38 = [GEOCollectionResult alloc];
              objc_msgSend(v32, "collection");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = -[GEOCollectionResult initWithCollectionResult:](v38, "initWithCollectionResult:", v39);

              if (v40)
                objc_msgSend(v53, "addObject:", v40);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
        }
        while (v29);
      }

      if (objc_msgSend(v53, "count"))
      {
        v41 = objc_msgSend(v53, "count");
        -[GEOPDCollectionSuggestionResult _readCollectionIds](v51);
        v8 = v50;
        if (v41 != objc_msgSend(*(id *)(v51 + 24), "count"))
        {
          GEOGetCuratedCollectionsLog();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v42, OS_LOG_TYPE_ERROR, "collectionSuggestionResult contains an identifier that is not present in the mapsResults array, or mapsResults contains an item that we were not able to create a GEOCollectionResult from.", buf, 2u);
          }

        }
        v54.receiver = v49;
        v54.super_class = (Class)GEOCollectionSuggestionResult;
        v43 = -[GEOCollectionSuggestionResult init](&v54, sel_init);
        if (v43)
        {
          v44 = objc_msgSend(v53, "copy");
          collections = v43->_collections;
          v43->_collections = (NSArray *)v44;

          objc_storeStrong((id *)&v43->_collectionSuggestionResult, v48);
        }
        self = v43;
        v46 = self;
        v7 = (id *)v51;
      }
      else
      {
        v46 = 0;
        v8 = v50;
        v7 = (id *)v51;
        self = v49;
      }

      v12 = v52;
    }
    else
    {
      v46 = 0;
    }

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (GEOExploreGuides)exploreGuides
{
  GEOPDCollectionSuggestionResult *collectionSuggestionResult;
  GEOExploreGuides *v4;
  void *v5;
  GEOExploreGuides *v6;

  collectionSuggestionResult = self->_collectionSuggestionResult;
  if (collectionSuggestionResult
    && (-[GEOPDCollectionSuggestionResult _readExploreGuidesMetadata]((uint64_t)self->_collectionSuggestionResult),
        collectionSuggestionResult->_exploreGuidesMetadata))
  {
    v4 = [GEOExploreGuides alloc];
    -[GEOPDCollectionSuggestionResult exploreGuidesMetadata]((id *)&self->_collectionSuggestionResult->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOExploreGuides initWithExploreGuides:](v4, "initWithExploreGuides:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
}

@end
