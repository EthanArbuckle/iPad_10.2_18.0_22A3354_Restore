@implementation GEOPlaceCollectionItem

- (GEOPlaceCollectionItem)initWithPlaceCollectionItem:(id)a3
{
  _QWORD *v5;
  GEOPlaceCollectionItem *v6;
  _BOOL4 v7;
  GEOPlaceCollectionItem *v8;
  NSObject *v9;
  const char *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOPlaceCollectionItem;
  v6 = -[GEOPlaceCollectionItem init](&v12, sel_init);
  if (!v6)
    goto LABEL_5;
  if (v5)
  {
    -[GEOPDPlaceCollectionItem _readItemId]((uint64_t)v5);
    v7 = v5[7] != 0;
    -[GEOPDPlaceCollectionItem _readItemId]((uint64_t)v5);
    if (v5[7])
    {
      objc_storeStrong((id *)&v6->_placeCollectionItem, a3);
LABEL_5:
      v8 = v6;
      goto LABEL_12;
    }
  }
  else
  {
    v7 = 0;
  }
  GEOGetCuratedCollectionsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = "NO";
    if (v7)
      v10 = "YES";
    *(_DWORD *)buf = 136315138;
    v14 = v10;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Place Collection Item could not be initialized because some data is missing/nPlace Collection Item hasItemId: %s", buf, 0xCu);
  }

  v8 = 0;
LABEL_12:

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[GEOPDPlaceCollectionItem description](self->_placeCollectionItem, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)itemDescription
{
  return (NSString *)-[GEOPDPlaceCollectionItem itemDescription](self->_placeCollectionItem, "itemDescription");
}

- (NSString)itemHTMLDescription
{
  return (NSString *)-[GEOPDPlaceCollectionItem itemHTMLDescription](self->_placeCollectionItem, "itemHTMLDescription");
}

- (GEOMapItemIdentifier)itemIdentifier
{
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;

  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDPlaceCollectionItem itemId]((id *)&self->_placeCollectionItem->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v4);

  return v5;
}

- (NSArray)photos
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _GEOPlaceDataPhoto *v12;
  _GEOPlaceDataPhoto *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDPlaceCollectionItem photos]((id *)&self->_placeCollectionItem->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOPDPlaceCollectionItem photos]((id *)&self->_placeCollectionItem->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = [_GEOPlaceDataPhoto alloc];
        v13 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v12, "initWithCaptionedPhoto:", v11, (_QWORD)v16);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v14;
}

- (BOOL)supportsPhotoFallback
{
  GEOPDPlaceCollectionItem *placeCollectionItem;

  placeCollectionItem = self->_placeCollectionItem;
  return placeCollectionItem && placeCollectionItem->_enableImageFallback;
}

- (NSURL)reviewUrl
{
  _QWORD *p_isa;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_isa = &self->_placeCollectionItem->super.super.isa;
  if (p_isa)
  {
    -[GEOPDPlaceCollectionItem _readUrl]((uint64_t)self->_placeCollectionItem);
    if (!p_isa[10])
    {
LABEL_7:
      p_isa = 0;
      return (NSURL *)p_isa;
    }
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[GEOPDPlaceCollectionItem url]((id *)&self->_placeCollectionItem->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (!p_isa)
    {
      GEOGetCuratedCollectionsLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[GEOPDPlaceCollectionItem url]((id *)&self->_placeCollectionItem->super.super.isa);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "PlaceCollectionItem does not have valid string url for the reivew: %@", (uint8_t *)&v9, 0xCu);

      }
      goto LABEL_7;
    }
  }
  return (NSURL *)p_isa;
}

- (NSString)reviewText
{
  return (NSString *)-[GEOPDPlaceCollectionItem punchOutText](self->_placeCollectionItem, "punchOutText");
}

- (GEOQuickLink)appClip
{
  GEOPDPlaceCollectionItem *placeCollectionItem;
  GEOQuickLink *v4;
  void *v5;
  GEOQuickLink *v6;

  placeCollectionItem = self->_placeCollectionItem;
  if (!placeCollectionItem)
    goto LABEL_5;
  -[GEOPDPlaceCollectionItem _readAppClip]((uint64_t)self->_placeCollectionItem);
  if (!placeCollectionItem->_appClip)
    goto LABEL_5;
  v4 = [GEOQuickLink alloc];
  -[GEOPDPlaceCollectionItem appClip]((id *)&self->_placeCollectionItem->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOQuickLink initWithQuickLink:](v4, "initWithQuickLink:", v5);

  if (-[GEOQuickLink type](v6, "type") != 2)
  {

LABEL_5:
    v6 = 0;
  }
  return v6;
}

- (BOOL)disableAppClipFallback
{
  GEOPDPlaceCollectionItem *placeCollectionItem;

  placeCollectionItem = self->_placeCollectionItem;
  return placeCollectionItem && placeCollectionItem->_disableAppClipFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollectionItem, 0);
}

@end
