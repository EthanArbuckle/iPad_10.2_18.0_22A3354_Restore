@implementation _GEOTransitConnectionInfo

- (_GEOTransitConnectionInfo)initWithConnection:(id)a3 providerID:(int)a4
{
  id v7;
  _GEOTransitConnectionInfo *v8;
  _GEOTransitConnectionInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_GEOTransitConnectionInfo;
  v8 = -[_GEOTransitConnectionInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_providerID = a4;
  }

  return v9;
}

- (unint64_t)muid
{
  GEOPDTransitConnection *connection;

  connection = self->_connection;
  if (connection)
    return connection->_muid;
  else
    return 0;
}

- (NSString)name
{
  return -[GEOPDTransitConnection entityNameString]((id *)&self->_connection->super.super.isa);
}

- (NSArray)labelItems
{
  return (NSArray *)-[GEOPDTransitConnection transitLabels]((id *)&self->_connection->super.super.isa);
}

- (int)providerID
{
  return self->_providerID;
}

- (NSURL)urlToOpen
{
  GEOMapURLBuilder *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = [GEOMapURLBuilder alloc];
  -[_GEOTransitConnectionInfo name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapURLBuilder initForInternalBusiness:id:provider:](v3, "initForInternalBusiness:id:provider:", v4, -[_GEOTransitConnectionInfo muid](self, "muid"), -[_GEOTransitConnectionInfo providerID](self, "providerID"));

  -[GEOPDTransitConnection mapsId]((id *)&self->_connection->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shardedId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasCenter");

  if (v8)
  {
    -[GEOPDTransitConnection mapsId]((id *)&self->_connection->super.super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shardedId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "center");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    objc_msgSend(v5, "setBusinessCoordinate:");

  }
  objc_msgSend(v5, "setMapType:", 3);
  objc_msgSend(v5, "buildForWeb");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v12;
}

- (GEOMapItemIdentifier)itemIdentifier
{
  GEOMapItemIdentifier *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  GEOMapItemIdentifier *v9;

  v3 = [GEOMapItemIdentifier alloc];
  v4 = -[_GEOTransitConnectionInfo muid](self, "muid");
  v5 = -[_GEOTransitConnectionInfo providerID](self, "providerID");
  -[GEOPDTransitConnection mapsId]((id *)&self->_connection->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shardedId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinate");
  v9 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v3, "initWithMUID:resultProviderID:coordinate:", v4, v5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
