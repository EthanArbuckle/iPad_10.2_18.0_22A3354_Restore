@implementation GEOPlaceExternalActionProvider

- (GEOPlaceExternalActionProvider)initWithActionLink:(id)a3 attributionMap:(id)a4
{
  id v7;
  id v8;
  GEOPlaceExternalActionProvider *v9;
  GEOPlaceExternalActionProvider *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  GEOPlaceExternalActionProvider *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)GEOPlaceExternalActionProvider;
    v9 = -[GEOPlaceExternalActionProvider init](&v16, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_actionLink, a3);
      objc_storeWeak((id *)&v10->_attributionMap, v8);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = objc_claimAutoreleasedReturnValue();
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v12;

    }
    self = v10;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)supportedIntegrations
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMapTable **p_attributionMap;
  uint64_t v11;
  uint64_t v12;
  GEOPlaceExternalActionLink *v13;
  id WeakRetained;
  GEOPlaceExternalActionLink *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDActionLink links]((id *)&self->_actionLink->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[GEOPDActionLink links]((id *)&self->_actionLink->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    p_attributionMap = &self->_attributionMap;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (v12 && -[GEOPDLink linkType](*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11)) - 1 <= 3)
        {
          v13 = [GEOPlaceExternalActionLink alloc];
          WeakRetained = objc_loadWeakRetained((id *)p_attributionMap);
          v15 = -[GEOPlaceExternalActionLink initWithLinkData:attributionMap:](v13, "initWithLinkData:attributionMap:", v12, WeakRetained, (_QWORD)v18);

          if (v15)
            objc_msgSend(v5, "addObject:", v15);

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v16;
}

- (NSString)appAdamId
{
  return -[GEOPDActionLink appAdamId]((id *)&self->_actionLink->super.super.isa);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_attributionMap);
  objc_storeStrong((id *)&self->_actionLink, 0);
}

@end
