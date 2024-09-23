@implementation GEOPublisher

- (GEOPublisher)initWithPublisher:(id)a3 usingAttribution:(id)a4
{
  id *v7;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  _BOOL4 v12;
  BOOL v13;
  GEOPublisher *v14;
  GEOPublisher *v15;
  uint64_t v16;
  NSString *publisherAttributionIdentifierString;
  NSObject *v18;
  char *v19;
  char *v20;
  GEOPublisher *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (id *)a3;
  v8 = a4;
  v9 = (uint64_t)v8;
  if (v7)
  {
    -[GEOPDPublisher _readPublisherId]((uint64_t)v7);
    v10 = v7[7] != 0;
    if (v9)
      goto LABEL_3;
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v10 = 0;
  if (!v8)
    goto LABEL_13;
LABEL_3:
  -[GEOPDAttribution _readVendorId](v9);
  v11 = *(_QWORD *)(v9 + 56);
  v12 = v11 != 0;
  if (v11)
    v13 = v10;
  else
    v13 = 0;
  if (v13)
  {
    v26.receiver = self;
    v26.super_class = (Class)GEOPublisher;
    v14 = -[GEOPublisher init](&v26, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_publisher, a3);
      -[GEOPDAttribution vendorId]((id *)v9);
      v16 = objc_claimAutoreleasedReturnValue();
      publisherAttributionIdentifierString = v15->_publisherAttributionIdentifierString;
      v15->_publisherAttributionIdentifierString = (NSString *)v16;

    }
    GEOGetCuratedCollectionsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[GEOPDPublisher publisherId](v7);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAttribution vendorId]((id *)v9);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "Succesfully initialized Publisher with Id: %@, vendorId: %@", buf, 0x16u);

    }
    self = v15;
    v21 = self;
    goto LABEL_22;
  }
LABEL_14:
  GEOGetCuratedCollectionsLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = "NO";
    if (v10)
      v24 = "YES";
    else
      v24 = "NO";
    if (v12)
      v23 = "YES";
    *(_DWORD *)buf = 136315394;
    v28 = v24;
    v29 = 2080;
    v30 = v23;
    _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Place Collection could not be initialized because some data is missing.\n Publisher hasPublisherId: %s, hasVendorId: %s", buf, 0x16u);
  }

  v21 = 0;
LABEL_22:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  GEOPublisher *v4;
  BOOL v5;

  v4 = (GEOPublisher *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[GEOPDPublisher isEqual:](self->_publisher, "isEqual:", v4->_publisher);
  }

  return v5;
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

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[GEOPDPublisher hash](self->_publisher, "hash");
  -[GEOPublisher identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (int64_t)totalCollectionCount
{
  GEOPDPublisher *publisher;

  publisher = self->_publisher;
  if (publisher)
    return publisher->_numCollections;
  else
    return 0;
}

- (GEOMapItemIdentifier)identifier
{
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;

  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDPublisher publisherId]((id *)&self->_publisher->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v4);

  return v5;
}

- (NSString)publisherDescription
{
  return (NSString *)-[GEOPDPublisher publisherDescription](self->_publisher, "publisherDescription");
}

- (NSURL)publisherURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[GEOPublisher identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "muid");
  -[GEOPublisher identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapURLBuilder URLForPublisher:provider:](GEOMapURLBuilder, "URLForPublisher:provider:", v4, objc_msgSend(v5, "resultProviderID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (BOOL)isSuppressed
{
  return -[GEOPDPublisher errorState]((uint64_t)self->_publisher) == 1;
}

- (BOOL)isBlocked
{
  return -[GEOPDPublisher errorState]((uint64_t)self->_publisher) == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherAttribution, 0);
  objc_storeStrong((id *)&self->_publisherAttributionIdentifierString, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end
