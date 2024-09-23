@implementation GEOSearchSectionGuide

- (GEOSearchSectionGuide)init
{
  GEOSearchSectionGuide *result;

  result = (GEOSearchSectionGuide *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSearchSectionGuide)initWithPlaceCollections:(id)a3
{
  id v4;
  GEOSearchSectionGuide *v5;
  uint64_t v6;
  NSArray *placeCollections;
  GEOSearchSectionGuide *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOSearchSectionGuide;
    v5 = -[GEOSearchSectionGuide init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      placeCollections = v5->_placeCollections;
      v5->_placeCollections = (NSArray *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (GEOSearchSectionGuide)initWithSearchSectionGuide:(id)a3 mapsResults:(id)a4
{
  id *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id *v21;
  void *v22;
  GEOMapItemIdentifier *v23;
  id *v24;
  void *v25;
  GEOMapItemIdentifier *v26;
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
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  GEOSearchSectionGuide *v48;
  id v50;
  id v51;
  GEOSearchSectionGuide *v52;
  void *v53;
  id *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6[2], "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __64__GEOSearchSectionGuide_initWithSearchSectionGuide_mapsResults___block_invoke;
    v68[3] = &unk_1E1BFF5C8;
    v9 = v8;
    v69 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v68);
    v10 = (void *)MEMORY[0x1E0C99E60];
    -[GEOPDSearchSectionGuide guideIds](v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:](GEOMapItemIdentifier, "mapItemIdentifiersFromMapsIdentifiers:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v53 = v13;
      v54 = v6;
      v51 = v7;
      v52 = self;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v50 = v9;
      v15 = v9;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v65 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v20, "collection", v50);
            v21 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDCollectionResult collectionId](v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = [GEOMapItemIdentifier alloc];
              objc_msgSend(v20, "collection");
              v24 = (id *)objc_claimAutoreleasedReturnValue();
              -[GEOPDCollectionResult collectionId](v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v23, "initWithMapsIdentifier:", v25);

              if (v26)
                objc_msgSend(v14, "addObject:", v26);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v17);
      }

      objc_msgSend(v14, "intersectSet:", v53);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v54[2], "count"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v27 = v15;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v61 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
            v33 = [GEOMapItemIdentifier alloc];
            objc_msgSend(v32, "collection");
            v34 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDCollectionResult collectionId](v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v33, "initWithMapsIdentifier:", v35);
            v37 = objc_msgSend(v14, "containsObject:", v36);

            if (v37)
            {
              v38 = [GEOCollectionResult alloc];
              objc_msgSend(v32, "collection");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = -[GEOCollectionResult initWithCollectionResult:](v38, "initWithCollectionResult:", v39);

              if (v40)
                objc_msgSend(v55, "addObject:", v40);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        }
        while (v29);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v55, "count"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v42 = v55;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      v6 = v54;
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v44; ++k)
          {
            if (*(_QWORD *)v57 != v45)
              objc_enumerationMutation(v42);
            objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "collection", v50);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
              objc_msgSend(v41, "addObject:", v47);

          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
        }
        while (v44);
      }

      self = -[GEOSearchSectionGuide initWithPlaceCollections:](v52, "initWithPlaceCollections:", v41);
      v48 = self;
      v9 = v50;
      v7 = v51;
      v13 = v53;
    }
    else
    {
      v48 = 0;
    }

  }
  else
  {
    v48 = 0;
  }

  return v48;
}

void __64__GEOSearchSectionGuide_initWithSearchSectionGuide_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "resultType") == 2 && objc_msgSend(v3, "hasCollection"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollections, 0);
}

@end
