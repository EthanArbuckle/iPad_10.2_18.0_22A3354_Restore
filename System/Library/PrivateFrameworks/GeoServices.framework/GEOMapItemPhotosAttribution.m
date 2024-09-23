@implementation GEOMapItemPhotosAttribution

- (GEOMapItemPhotosAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOMapItemPhotosAttribution *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    GEOYelpPhotosURLs(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v13 = (void *)objc_msgSend(v12, "mutableCopy");
      v14 = v13;
      if (v9)
        objc_msgSend(v13, "addObjectsFromArray:", v9);

      v9 = v14;
    }

  }
  v17.receiver = self;
  v17.super_class = (Class)GEOMapItemPhotosAttribution;
  v15 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:yelpID:](&v17, sel_initWithSearchAttributionInfo_attributionURLs_yelpID_, v8, v9, v11);

  return v15;
}

- (GEOMapItemPhotosAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
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
  GEOMapItemPhotosAttribution *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "length")
    && (objc_msgSend(v8, "source"),
        v11 = (id *)objc_claimAutoreleasedReturnValue(),
        v12 = -[GEOSearchAttributionSource supportsAction:forComponent:](v11, 1, 1),
        v11,
        v12))
  {
    _actionURLSchemes(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          GEOActionURLViewPhotosURLs(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v19), v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
            objc_msgSend(v14, "addObjectsFromArray:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    objc_msgSend(v14, "addObjectsFromArray:", v9);
  }
  else
  {
    v14 = v9;
  }
  v23.receiver = self;
  v23.super_class = (Class)GEOMapItemPhotosAttribution;
  v21 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:poiID:](&v23, sel_initWithSearchAttributionInfo_attributionURLs_poiID_, v8, v14, v10);

  return v21;
}

- (NSArray)addPhotoURLs
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
    v4 = -[GEOSearchAttributionSource supportsAction:forComponent:](v3, 3, 1);

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
            GEOActionURLAddPhotoURLs(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v11), self->super._poiID);
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
  if (!yelpID || (GEOYelpAddPhotoURLs(yelpID), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = 0;
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

- (id)urlsForPhotoWithIdentifier:(id)a3
{
  id v4;
  id *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *yelpID;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSString length](self->super._poiID, "length")
    && (-[GEOSearchAttributionInfo source](self->super._info, "source"),
        v5 = (id *)objc_claimAutoreleasedReturnValue(),
        v6 = -[GEOSearchAttributionSource supportsAction:forComponent:](v5, 1, 1),
        v5,
        v6))
  {
    _actionURLSchemes(self->super._info);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          GEOActionURLViewSpecificPhotoURLs(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v13), self->super._poiID, v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count", (_QWORD)v24))
            objc_msgSend(v8, "addObjectsFromArray:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v17);

    }
  }
  else
  {
    yelpID = self->super._yelpID;
    if (!yelpID || (GEOYelpViewPhotoURLs(yelpID, v4), (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v9 = v19;
    v8 = (void *)objc_msgSend(v19, "mutableCopy");
    -[GEOMapItemAttribution _yelpHTTPURLForRequirement:withUID:writeAReview:](self, "_yelpHTTPURLForRequirement:withUID:writeAReview:", 3, v4, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v8, "addObject:", v20);
    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v22);

    }
  }

LABEL_23:
  return v8;
}

- (BOOL)canAddPhotosLocally
{
  id *v2;
  BOOL v3;

  -[GEOSearchAttributionInfo source](self->super._info, "source");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOSearchAttributionSource canLocallyHandleAction:forComponent:](v2, 3);

  return v3;
}

- (BOOL)canShowPhotosLocally
{
  id *v2;
  BOOL v3;

  -[GEOSearchAttributionInfo source](self->super._info, "source");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOSearchAttributionSource canLocallyHandleAction:forComponent:](v2, 1);

  return v3;
}

- (BOOL)shouldSuppressPhotoAttribution
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  int v6;

  -[GEOSearchAttributionInfo source](self->super._info, "source");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
    do
    {
      -[GEOSearchAttributionSource _readSuppressAttributionLogos]((uint64_t)v2);
      v4 = v2[7];
      v5 = v3 < v4;
      if (v3 >= v4)
        break;
      v6 = -[GEOSearchAttributionSource suppressAttributionLogosAtIndex:]((uint64_t)v2, v3++);
    }
    while (v6 != 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsReportingIssue
{
  void *v3;
  void *v4;
  char v5;

  _getValue(GeoServicesConfig_VendorsThatSupportReportingPhotos, (uint64_t)off_1EDF4DE38, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemAttribution providerID](self, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (BOOL)requiresAttributionInPhotoViewerHeader
{
  _BYTE *v2;
  BOOL v3;

  -[GEOSearchAttributionInfo source](self->super._info, "source");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[138] != 0;
  else
    v3 = 0;

  return v3;
}

@end
