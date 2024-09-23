@implementation GEOMapItemPlaceAttribution

- (GEOMapItemPlaceAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
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
  GEOMapItemPlaceAttribution *v22;
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
  v24.super_class = (Class)GEOMapItemPlaceAttribution;
  v22 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:poiID:](&v24, sel_initWithSearchAttributionInfo_attributionURLs_poiID_, v8, v14, v10);

  return v22;
}

- (NSArray)checkInURLs
{
  id *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *yelpID;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->super._poiID, "length"))
  {
    -[GEOSearchAttributionInfo source](self->super._info, "source");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    v4 = -[GEOSearchAttributionSource supportsAction:forComponent:](v3, 4, 0);

    if (v4)
    {
      _actionURLSchemes(self->super._info);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            GEOActionURLCheckinURLs(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v11), self->super._poiID);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count", (_QWORD)v20))
              objc_msgSend(v6, "addObjectsFromArray:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  yelpID = self->super._yelpID;
  if (!yelpID || (GEOYelpCheckInURLs(yelpID), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSArray *)v6;
  }
  v7 = v17;
  v6 = (void *)objc_msgSend(v17, "mutableCopy");
  -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
LABEL_13:
    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs", (_QWORD)v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v15);

  }
LABEL_14:

  return (NSArray *)v6;
}

- (NSURL)webURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[GEOMapItemAttribution _yelpHTTPURLForRequirement:withUID:writeAReview:](self, "_yelpHTTPURLForRequirement:withUID:writeAReview:", 1, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

@end
