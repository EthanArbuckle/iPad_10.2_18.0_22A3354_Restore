@implementation _GEOEncyclopedicInfo

- (_GEOEncyclopedicInfo)initWithPlaceData:(id)a3 attributionMap:(id)a4
{
  id v7;
  id v8;
  _GEOEncyclopedicInfo *v9;
  _GEOEncyclopedicInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOEncyclopedicInfo;
  v9 = -[_GEOEncyclopedicInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeData, a3);
    objc_storeStrong((id *)&v10->_attributionMap, a4);
  }

  return v10;
}

- (BOOL)hasTextBlock
{
  void *v2;
  BOOL v3;

  -[_GEOEncyclopedicInfo textBlockText](self, "textBlockText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSString)textBlockTitle
{
  id *v2;
  void *v3;

  +[GEOPDTextBlock textBlockForPlaceData:](GEOPDTextBlock, "textBlockForPlaceData:", self->_placeData);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTextBlock title](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)textBlockText
{
  id *v2;
  void *v3;

  +[GEOPDTextBlock textBlockForPlaceData:](GEOPDTextBlock, "textBlockForPlaceData:", self->_placeData);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTextBlock text](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasPairOfFactoids
{
  return +[GEOPDFactoid factoidPairAvailableForPlaceData:](GEOPDFactoid, "factoidPairAvailableForPlaceData:", self->_placeData);
}

- (NSArray)factoids
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  GEOFactoid *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPDFactoid factoidsForPlaceData:](GEOPDFactoid, "factoidsForPlaceData:", self->_placeData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = -[GEOFactoid initWithFactoid:]([GEOFactoid alloc], "initWithFactoid:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v3, "count"))
    v10 = (void *)objc_msgSend(v3, "copy");
  else
    v10 = 0;

  return (NSArray *)v10;
}

- (NSArray)placeSummaryFactoids
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[_GEOEncyclopedicInfo factoids](self, "factoids");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_47);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (GEOMapItemAttribution)encyclopedicAttribution
{
  id *v3;
  id *v4;
  NSMapTable *attributionMap;
  void *v6;
  void *v7;
  GEOMapItemEncyclopedicAttribution *v8;
  void *v9;
  void *v10;
  GEOMapItemEncyclopedicAttribution *v11;

  +[GEOPDAttribution attributionForPlaceDataEncyclopedia:](GEOPDAttribution, "attributionForPlaceDataEncyclopedia:", self->_placeData);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    attributionMap = self->_attributionMap;
    -[GEOPDAttribution vendorId](v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [GEOMapItemEncyclopedicAttribution alloc];
      -[GEOPDAttribution attributionUrls](v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAttribution externalItemId](v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[GEOMapItemEncyclopedicAttribution initWithSearchAttributionInfo:attributionURLs:poiID:](v8, "initWithSearchAttributionInfo:attributionURLs:poiID:", v7, v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return (GEOMapItemAttribution *)v11;
}

- (BOOL)hasStandAloneFactoids
{
  return 0;
}

- (id)factoidAtIndex:(int)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (a3 < 0
    || (-[_GEOEncyclopedicInfo factoids](self, "factoids"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    -[_GEOEncyclopedicInfo factoids](self, "factoids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)firstFactoidForSemantic:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_GEOEncyclopedicInfo factoids](self, "factoids", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "semantic") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_placeData, 0);
}

@end
