@implementation GEOPlaceCollection

- (GEOPlaceCollection)initWithCollection:(id)a3 usingAttribution:(id)a4
{
  _QWORD *v7;
  id *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  GEOPlaceCollection *v16;
  GEOPlaceCollection *v17;
  void *v18;
  GEOPublisher *v19;
  void *v20;
  uint64_t v21;
  GEOPublisher *publisher;
  NSObject *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  GEOPlaceCollection *v28;
  uint64_t v29;
  NSString *publisherAttributionIdentifierString;
  NSObject *v31;
  NSObject *v32;
  char *v33;
  char *v34;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (id *)a4;
  if (v7)
  {
    -[GEOPDPlaceCollection _readCollectionId]((uint64_t)v7);
    v9 = v7[10] != 0;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "collectionTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  -[GEOPDPlaceCollection photos]((id *)v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  -[GEOPDAttribution vendorId](v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v9 && v11 && v13 && v15)
  {
    v36.receiver = self;
    v36.super_class = (Class)GEOPlaceCollection;
    v16 = -[GEOPlaceCollection init](&v36, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_collection, a3);
      -[GEOPDPlaceCollection publisher]((id *)&v17->_collection->super.super.isa);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = [GEOPublisher alloc];
        -[GEOPDPlaceCollection publisher]((id *)&v17->_collection->super.super.isa);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[GEOPublisher initWithPublisher:usingAttribution:](v19, "initWithPublisher:usingAttribution:", v20, v8);
        publisher = v17->_publisher;
        v17->_publisher = (GEOPublisher *)v21;

      }
      else
      {
        v20 = v17->_publisher;
        v17->_publisher = 0;
      }

      -[GEOPDAttribution vendorId](v8);
      v29 = objc_claimAutoreleasedReturnValue();
      publisherAttributionIdentifierString = v17->_publisherAttributionIdentifierString;
      v17->_publisherAttributionIdentifierString = (NSString *)v29;

      if (!v7 || !*((_DWORD *)v7 + 58))
      {
        GEOGetCuratedCollectionsLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_INFO, "Warning. Place Collection number of items is 0.", buf, 2u);
        }

      }
    }
    GEOGetCuratedCollectionsLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      -[GEOPDPlaceCollection collectionId]((id *)v7);
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionTitle");
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v33;
      v39 = 2112;
      v40 = v34;
      _os_log_impl(&dword_1885A9000, v32, OS_LOG_TYPE_DEBUG, "Succesfully initialized Place Collection with Id: %@, Title: %@", buf, 0x16u);

    }
    self = v17;
    v28 = self;
  }
  else
  {
    GEOGetCuratedCollectionsLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = "NO";
      if (v9)
        v25 = "YES";
      else
        v25 = "NO";
      if (v11)
        v26 = "YES";
      else
        v26 = "NO";
      *(_DWORD *)buf = 136315906;
      v38 = v25;
      if (v13)
        v27 = "YES";
      else
        v27 = "NO";
      v39 = 2080;
      v40 = v26;
      v41 = 2080;
      v42 = v27;
      if (v15)
        v24 = "YES";
      v43 = 2080;
      v44 = v24;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Place Collection could not be initialized because some data is missing.\nPlace Collection hasId: %s, hasTitle: %s, hasPhotos: %s, hasVendorID: %s", buf, 0x2Au);
    }

    v28 = 0;
  }

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  GEOPlaceCollection *v4;
  BOOL v5;

  v4 = (GEOPlaceCollection *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[GEOPDPlaceCollection isEqual:](self->_collection, "isEqual:", v4->_collection);
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[GEOPDPlaceCollection hash](self->_collection, "hash");
  -[GEOPlaceCollection collectionIdentifier](self, "collectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOPDPlaceCollection collectionLongTitle](self->_collection, "collectionLongTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[GEOPDPlaceCollection collectionTitle](self->_collection, "collectionTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[GEOPDPlaceCollection collectionId]((id *)&self->_collection->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Collection: %@, MUID: %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  return v7;
}

- (GEOCollectionPublisherAttribution)publisherAttribution
{
  GEOCollectionPublisherAttribution *publisherAttribution;
  void *v4;
  GEOCollectionPublisherAttribution *v5;
  GEOCollectionPublisherAttribution *v6;

  publisherAttribution = self->_publisherAttribution;
  if (!publisherAttribution)
  {
    +[GEOCollectionPublisherAttributionManager sharedInstance](GEOCollectionPublisherAttributionManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestAttributionForPublisher:", self->_publisherAttributionIdentifierString);
    v5 = (GEOCollectionPublisherAttribution *)objc_claimAutoreleasedReturnValue();
    v6 = self->_publisherAttribution;
    self->_publisherAttribution = v5;

    publisherAttribution = self->_publisherAttribution;
  }
  return publisherAttribution;
}

- (NSString)collectionTitle
{
  return (NSString *)-[GEOPDPlaceCollection collectionTitle](self->_collection, "collectionTitle");
}

- (NSString)collectionLongTitle
{
  return (NSString *)-[GEOPDPlaceCollection collectionLongTitle](self->_collection, "collectionLongTitle");
}

- (NSString)collectionDescription
{
  return (NSString *)-[GEOPDPlaceCollection collectionDescription](self->_collection, "collectionDescription");
}

- (NSString)collectionHTMLDescription
{
  return (NSString *)-[GEOPDPlaceCollection collectionHTMLDescription](self->_collection, "collectionHTMLDescription");
}

- (GEOMapItemIdentifier)collectionIdentifier
{
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;

  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDPlaceCollection collectionId]((id *)&self->_collection->super.super.isa);
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
  -[GEOPDPlaceCollection photos]((id *)&self->_collection->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOPDPlaceCollection photos]((id *)&self->_collection->super.super.isa);
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

- (NSArray)itemIds
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
  GEOMapItemIdentifier *v12;
  GEOMapItemIdentifier *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDPlaceCollection itemIds]((id *)&self->_collection->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[GEOPDPlaceCollection itemIds]((id *)&self->_collection->super.super.isa);
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
        v12 = [GEOMapItemIdentifier alloc];
        v13 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v12, "initWithMapsIdentifier:", v11, (_QWORD)v16);
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

- (unint64_t)numberOfItems
{
  GEOPDPlaceCollection *collection;
  void *v3;
  unint64_t v4;

  collection = self->_collection;
  if (collection && (*(_BYTE *)&collection->_flags & 4) != 0)
    return collection->_numItems;
  -[GEOPDPlaceCollection itemIds]((id *)&collection->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSDate)lastModifiedDate
{
  GEOPDPlaceCollection *collection;
  double modifiedTime;

  collection = self->_collection;
  if (collection)
    modifiedTime = collection->_modifiedTime;
  else
    modifiedTime = 0.0;
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", modifiedTime);
}

- (NSString)authorName
{
  return -[GEOPDPlaceCollection authorName]((id *)&self->_collection->super.super.isa);
}

- (GEOMapItemPhoto)authorPhoto
{
  GEOPDPlaceCollection *collection;
  _GEOPlaceDataPhoto *v4;
  void *v5;
  _GEOPlaceDataPhoto *v6;

  collection = self->_collection;
  if (collection && (-[GEOPDPlaceCollection _readAuthorPhoto]((uint64_t)self->_collection), collection->_authorPhoto))
  {
    v4 = [_GEOPlaceDataPhoto alloc];
    -[GEOPDPlaceCollection authorPhoto]((id *)&self->_collection->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v4, "initWithCaptionedPhoto:", v5);

  }
  else
  {
    v6 = 0;
  }
  return (GEOMapItemPhoto *)v6;
}

- (NSURL)collectionURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[GEOPlaceCollection collectionIdentifier](self, "collectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "muid");
  -[GEOPlaceCollection collectionIdentifier](self, "collectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapURLBuilder URLForCuratedCollection:provider:](GEOMapURLBuilder, "URLForCuratedCollection:provider:", v4, objc_msgSend(v5, "resultProviderID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (NSURL)publisherCollectionURL
{
  GEOPDPlaceCollection *collection;
  void *v4;
  void *v5;
  void *v6;

  collection = self->_collection;
  if (collection && (-[GEOPDPlaceCollection _readUrl]((uint64_t)self->_collection), collection->_url))
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[GEOPDPlaceCollection url]((id *)&self->_collection->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSURL *)v6;
}

- (BOOL)isSuppressed
{
  unsigned int v3;

  v3 = -[GEOPDPlaceCollection errorState]((os_unfair_lock_s *)self->_collection);
  if (v3 != 1)
    LOBYTE(v3) = -[GEOPublisher isSuppressed](self->_publisher, "isSuppressed");
  return v3;
}

- (BOOL)isBlocked
{
  return -[GEOPDPlaceCollection errorState]((os_unfair_lock_s *)self->_collection) == 2
      || -[GEOPublisher isBlocked](self->_publisher, "isBlocked");
}

- (GEOPlaceCollectionPullQuote)publisherBlockQuote
{
  GEOPlaceCollectionPullQuote *v3;
  void *v4;
  void *v5;
  GEOPlaceCollectionPullQuote *v6;

  v3 = [GEOPlaceCollectionPullQuote alloc];
  -[GEOPDPlaceCollection publisherDescriptionOfCollectionItem](self->_collection, "publisherDescriptionOfCollectionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceCollection publisherHTMLDescriptionOfCollectionItem](self->_collection, "publisherHTMLDescriptionOfCollectionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOPlaceCollectionPullQuote initWithPlainText:htmlText:](v3, "initWithPlainText:htmlText:", v4, v5);

  return v6;
}

- (NSArray)mediaLinks
{
  void *v2;
  void *v3;

  -[GEOPDPlaceCollection mediaLinks]((id *)&self->_collection->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __32__GEOPlaceCollection_mediaLinks__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOMediaLink mediaLinkFromProto:](GEOMediaLink, "mediaLinkFromProto:", a2);
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (NSString)publisherAttributionIdentifierString
{
  return self->_publisherAttributionIdentifierString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherAttributionIdentifierString, 0);
  objc_storeStrong((id *)&self->_publisherAttribution, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
