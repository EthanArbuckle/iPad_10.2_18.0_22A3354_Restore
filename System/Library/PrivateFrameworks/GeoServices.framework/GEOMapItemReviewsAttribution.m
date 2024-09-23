@implementation GEOMapItemReviewsAttribution

- (GEOMapItemReviewsAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GEOMapItemReviewsAttribution *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    GEOYelpReviewsURLs(v10);
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
  v17.super_class = (Class)GEOMapItemReviewsAttribution;
  v15 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:yelpID:](&v17, sel_initWithSearchAttributionInfo_attributionURLs_yelpID_, v8, v9, v11);

  return v15;
}

- (GEOMapItemReviewsAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
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
  GEOMapItemReviewsAttribution *v21;
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
        v12 = -[GEOSearchAttributionSource supportsAction:forComponent:](v11, 1, 2),
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
          GEOActionURLViewReviewsURLs(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v19), v10);
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
  v23.super_class = (Class)GEOMapItemReviewsAttribution;
  v21 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:poiID:](&v23, sel_initWithSearchAttributionInfo_attributionURLs_poiID_, v8, v14, v10);

  return v21;
}

- (NSArray)addReviewURLs
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
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->super._poiID, "length")
    && (-[GEOSearchAttributionInfo source](self->super._info, "source"),
        v3 = (id *)objc_claimAutoreleasedReturnValue(),
        v4 = -[GEOSearchAttributionSource supportsAction:forComponent:](v3, 3, 2),
        v3,
        v4))
  {
    _actionURLSchemes(self->super._info);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          GEOActionURLAddReviewURLs(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v11), self->super._poiID);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count", (_QWORD)v22))
            objc_msgSend(v6, "addObjectsFromArray:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v15);

    }
  }
  else
  {
    yelpID = self->super._yelpID;
    if (!yelpID || (GEOYelpAddReviewURLs(yelpID), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = 0;
      return (NSArray *)v6;
    }
    v7 = v17;
    v6 = (void *)objc_msgSend(v17, "mutableCopy");
    -[GEOMapItemAttribution _yelpHTTPURLForRequirement:withUID:writeAReview:](self, "_yelpHTTPURLForRequirement:withUID:writeAReview:", 2, 0, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v6, "addObject:", v18);
    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v20);

    }
  }

  return (NSArray *)v6;
}

- (id)urlsForReview:(id)a3
{
  void *v4;
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
  objc_msgSend(a3, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_24;
  }
  if (-[NSString length](self->super._poiID, "length")
    && (-[GEOSearchAttributionInfo source](self->super._info, "source"),
        v5 = (id *)objc_claimAutoreleasedReturnValue(),
        v6 = -[GEOSearchAttributionSource supportsAction:forComponent:](v5, 1, 2),
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
          GEOActionURLViewSpecificReviewURLs(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v13), self->super._poiID, v4);
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
    if (!yelpID || (GEOYelpViewReviewURLs(yelpID, v4), (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v9 = v19;
    v8 = (void *)objc_msgSend(v19, "mutableCopy");
    -[GEOMapItemAttribution _yelpHTTPURLForRequirement:withUID:writeAReview:](self, "_yelpHTTPURLForRequirement:withUID:writeAReview:", 2, v4, 0);
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

LABEL_24:
  return v8;
}

- (id)urlsForSelectedItemWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->super._yelpID)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v11), "_reviewsAttribution");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12 && *(_QWORD *)(v12 + 24))
            objc_msgSend(v6, "addObject:");

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&selected=%@"), self->super._yelpID);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(v6, "count");
    v18 = CFSTR("biz");
    if (v17 > 1)
      v18 = CFSTR("bizs");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("yelp5.5:///%@/%@?%@&xref=apple"), v18, v15, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("yelp5.3:///biz/%@?xref=apple"), self->super._yelpID);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99DE8];
    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count") + 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addObject:", v19);
    objc_msgSend(v23, "addObject:", v20);
    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v24);

  }
  else
  {
    -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

@end
