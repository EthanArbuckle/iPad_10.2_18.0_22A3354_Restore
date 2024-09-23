@implementation GEOPublisherSuggestionResult

- (GEOPublisherSuggestionResult)initWithPublisherSuggestionResult:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
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
  GEOPublisherResult *v36;
  void *v37;
  GEOPublisherResult *v38;
  uint64_t v39;
  NSObject *v40;
  GEOPublisherSuggestionResult *v41;
  uint64_t v42;
  NSArray *publishers;
  GEOPublisherSuggestionResult *v44;
  NSObject *v45;
  NSObject *v47;
  GEOPublisherSuggestionResult *v48;
  id v49;
  id *v50;
  void *v51;
  objc_super v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[16];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6[2], "count"))
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[GEOPDPublisherSuggestionResult publisherIds](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v11, "count"))
    {
      v48 = self;
      v50 = v6;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
      v12 = objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v49 = v7;
      v13 = v7;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
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
            objc_msgSend(v18, "publisher");
            v19 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPublisherResult publisherId](v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v21 = [GEOMapItemIdentifier alloc];
              objc_msgSend(v18, "publisher");
              v22 = (id *)objc_claimAutoreleasedReturnValue();
              -[GEOPDPublisherResult publisherId](v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v21, "initWithMapsIdentifier:", v23);

              if (v24)
                -[NSObject addObject:](v12, "addObject:", v24);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        }
        while (v15);
      }

      v47 = v11;
      -[NSObject intersectSet:](v12, "intersectSet:", v11);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v50[2], "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v25 = v13;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
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
            objc_msgSend(v30, "publisher");
            v32 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPublisherResult publisherId](v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v31, "initWithMapsIdentifier:", v33);
            v35 = -[NSObject containsObject:](v12, "containsObject:", v34);

            if (v35)
            {
              v36 = [GEOPublisherResult alloc];
              objc_msgSend(v30, "publisher");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = -[GEOPublisherResult initWithPublisherResult:](v36, "initWithPublisherResult:", v37);

              if (v38)
                objc_msgSend(v51, "addObject:", v38);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        }
        while (v27);
      }

      if (objc_msgSend(v51, "count"))
      {
        v39 = objc_msgSend(v51, "count");
        v6 = v50;
        v11 = v47;
        if (v39 != objc_msgSend(v50[2], "count"))
        {
          GEOGetCuratedCollectionsLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_DEBUG, "GEOPublisherSuggestionResult contains an identifier that is not present in the mapsResults array, or mapsResults contains an item that we were not able to create a GEOPublisherResult from.", buf, 2u);
          }

        }
        v52.receiver = v48;
        v52.super_class = (Class)GEOPublisherSuggestionResult;
        v41 = -[GEOPublisherSuggestionResult init](&v52, sel_init);
        if (v41)
        {
          v42 = objc_msgSend(v51, "copy");
          publishers = v41->_publishers;
          v41->_publishers = (NSArray *)v42;

        }
        self = v41;
        v44 = self;
      }
      else
      {
        GEOGetCuratedCollectionsLog();
        v45 = objc_claimAutoreleasedReturnValue();
        v6 = v50;
        v11 = v47;
        self = v48;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v45, OS_LOG_TYPE_ERROR, "GEOPublisherSuggestionResult GEOPublisherResult array is empty, returning nil", buf, 2u);
        }

        v44 = 0;
      }
      v7 = v49;

    }
    else
    {
      GEOGetCuratedCollectionsLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "No suggestionResultIdentifiers in the GEOPublisherSuggestionResult, returning nil", buf, 2u);
      }
      v44 = 0;
    }

  }
  else
  {
    GEOGetCuratedCollectionsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "GEOPublisherSuggestionResult No publisher Ids in the publisherSuggestionResult, returning nil", buf, 2u);
    }
    v44 = 0;
  }

  return v44;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishers, 0);
}

@end
