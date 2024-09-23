@implementation GEOMapItemEncyclopedicAttribution

- (GEOMapItemEncyclopedicAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  GEOMapItemEncyclopedicAttribution *v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "length")
    && (objc_msgSend(v8, "source"),
        v11 = (id *)objc_claimAutoreleasedReturnValue(),
        v12 = -[GEOSearchAttributionSource supportsAction:forComponent:](v11, 1, 0),
        v11,
        v12))
  {
    _actionURLSchemes(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          GEOActionURLViewPlaceURLs(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v19), v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
            objc_msgSend(v14, "addObjectsFromArray:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    v21 = (id)objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v9);
  }
  else
  {
    v14 = v9;
  }
  v24.receiver = self;
  v24.super_class = (Class)GEOMapItemEncyclopedicAttribution;
  v22 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:poiID:](&v24, sel_initWithSearchAttributionInfo_attributionURLs_poiID_, v8, v14, v10);

  return v22;
}

@end
