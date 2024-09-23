@implementation _GEOMapFeatureAccessRequest

- (_GEOMapFeatureAccessRequest)initWithTileLoader:(id)a3
{
  id v5;
  _GEOMapFeatureAccessRequest *v6;
  _GEOMapFeatureAccessRequest *v7;
  uint64_t v8;
  NSMutableArray *clientIdentifiers;
  uint64_t v10;
  geo_isolater *clientIdentifiersIsolater;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_GEOMapFeatureAccessRequest;
  v6 = -[_GEOMapFeatureAccessRequest init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tileLoader, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    clientIdentifiers = v7->_clientIdentifiers;
    v7->_clientIdentifiers = (NSMutableArray *)v8;

    v10 = geo_isolater_create();
    clientIdentifiersIsolater = v7->_clientIdentifiersIsolater;
    v7->_clientIdentifiersIsolater = (geo_isolater *)v10;

  }
  return v7;
}

- (void)addTileRequest:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = v3;
    geo_isolate_sync();

    v3 = v4;
  }

}

- (void)cancel
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  _GEOMapFeatureAccessRequest *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__69;
  v21 = __Block_byref_object_dispose__69;
  v22 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __37___GEOMapFeatureAccessRequest_cancel__block_invoke;
  v14 = &unk_1E1C00760;
  v15 = self;
  v16 = &v17;
  geo_isolate_sync();
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (id)v18[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[GEOTileLoader cancelAllForClient:](self->_tileLoader, "cancelAllForClient:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v23, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v17, 8);
}

- (GEOTileLoader)tileLoader
{
  return self->_tileLoader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifiersIsolater, 0);
  objc_storeStrong((id *)&self->_clientIdentifiers, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
}

@end
