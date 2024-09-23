@implementation GEORelatedCollectionSection

- (GEORelatedCollectionSection)initWithRelatedCollectionSection:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id *v19;
  void *v20;
  GEOMapItemIdentifier *v21;
  id *v22;
  void *v23;
  GEOMapItemIdentifier *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  GEOMapItemIdentifier *v31;
  id *v32;
  void *v33;
  GEOMapItemIdentifier *v34;
  int v35;
  GEOCollectionResult *v36;
  void *v37;
  GEOCollectionResult *v38;
  uint64_t v39;
  NSObject *v40;
  GEORelatedCollectionSection *v41;
  GEORelatedCollectionSection *v42;
  uint64_t v43;
  NSArray *collections;
  GEORelatedCollectionSection *v46;
  id v47;
  void *v48;
  id *v49;
  void *v50;
  objc_super v51;
  uint8_t buf[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6[2], "count"))
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[GEOPDRelatedCollectionSection collectionIds](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v48 = v11;
      v49 = v6;
      v46 = self;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v47 = v7;
      v13 = v7;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v58 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v18, "collection");
            v19 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDCollectionResult collectionId](v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v21 = [GEOMapItemIdentifier alloc];
              objc_msgSend(v18, "collection");
              v22 = (id *)objc_claimAutoreleasedReturnValue();
              -[GEOPDCollectionResult collectionId](v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v21, "initWithMapsIdentifier:", v23);

              if (v24)
                objc_msgSend(v12, "addObject:", v24);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
        }
        while (v15);
      }

      objc_msgSend(v12, "intersectSet:", v11);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v49[2], "count"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v25 = v13;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v54 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            v31 = [GEOMapItemIdentifier alloc];
            objc_msgSend(v30, "collection");
            v32 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDCollectionResult collectionId](v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v31, "initWithMapsIdentifier:", v33);
            v35 = objc_msgSend(v12, "containsObject:", v34);

            if (v35)
            {
              v36 = [GEOCollectionResult alloc];
              objc_msgSend(v30, "collection");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = -[GEOCollectionResult initWithCollectionResult:](v36, "initWithCollectionResult:", v37);

              if (v38)
                objc_msgSend(v50, "addObject:", v38);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        }
        while (v27);
      }

      if (objc_msgSend(v50, "count"))
      {
        v39 = objc_msgSend(v50, "count");
        v6 = v49;
        self = v46;
        if (v39 == objc_msgSend(v49[2], "count"))
        {
          GEOGetCuratedCollectionsLog();
          v40 = objc_claimAutoreleasedReturnValue();
          v7 = v47;
          v11 = v48;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_DEBUG, "relatedCollectionSection contains an identifier that is not present in the mapsResults array, or mapsResults contains an item that we were not able to create a GEOCollectionResult from.", buf, 2u);
          }

          v41 = 0;
        }
        else
        {
          v51.receiver = v46;
          v51.super_class = (Class)GEORelatedCollectionSection;
          v42 = -[GEORelatedCollectionSection init](&v51, sel_init);
          v7 = v47;
          v11 = v48;
          if (v42)
          {
            v43 = objc_msgSend(v50, "copy");
            collections = v42->_collections;
            v42->_collections = (NSArray *)v43;

          }
          self = v42;
          v41 = self;
        }
      }
      else
      {
        v41 = 0;
        v11 = v48;
        v6 = v49;
        self = v46;
        v7 = v47;
      }

    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (NSArray)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
}

@end
