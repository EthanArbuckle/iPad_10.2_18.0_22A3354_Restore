@implementation GEOPlaceExternalAction

- (GEOPlaceExternalAction)initWithActionData:(id)a3 attributionMap:(id)a4
{
  id v7;
  id v8;
  GEOPlaceExternalAction *v9;
  GEOPlaceExternalAction *v10;
  GEOPlaceExternalAction *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOPlaceExternalAction;
    v9 = -[GEOPlaceExternalAction init](&v13, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_actionData, a3);
      -[GEOPlaceExternalAction _setupActionProvidersWithAttributionMap:](v10, "_setupActionProvidersWithAttributionMap:", v8);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setupActionProvidersWithAttributionMap:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GEOPlaceExternalActionProvider *v13;
  GEOPlaceExternalActionProvider *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *actionProviders;
  GEOPlaceExternalAction *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOPDActionData actionLinks]((id *)&self->_actionData->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = self;
  -[GEOPDActionData actionLinks]((id *)&self->_actionData->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = -[GEOPlaceExternalActionProvider initWithActionLink:attributionMap:]([GEOPlaceExternalActionProvider alloc], "initWithActionLink:attributionMap:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), v4);
        v14 = v13;
        if (v13)
        {
          -[GEOPlaceExternalActionProvider supportedIntegrations](v13, "supportedIntegrations");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16)
            objc_msgSend(v7, "addObject:", v14);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v17 = objc_msgSend(v7, "copy");
  actionProviders = v19->_actionProviders;
  v19->_actionProviders = (NSArray *)v17;

}

- (NSString)actionName
{
  return (NSString *)-[GEOPDActionData actionName](self->_actionData, "actionName");
}

- (NSString)symbolName
{
  return -[GEOPDActionData actionSymbolImageName]((id *)&self->_actionData->super.super.isa);
}

- (NSString)winningAdamId
{
  return -[GEOPDActionData winningAdamId]((id *)&self->_actionData->super.super.isa);
}

- (id)partnerActionForPartnerId:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_actionProviders;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSOrderedSet)appAdamIds
{
  NSOrderedSet *appAdamIds;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSOrderedSet *v15;
  NSOrderedSet *v16;
  NSOrderedSet *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  appAdamIds = self->_appAdamIds;
  if (appAdamIds)
    return appAdamIds;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", -[NSArray count](self->_actionProviders, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_actionProviders;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "appAdamId", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
        {
          objc_msgSend(v11, "appAdamId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v15 = (NSOrderedSet *)objc_msgSend(v5, "copy");
  v16 = self->_appAdamIds;
  self->_appAdamIds = v15;

  v17 = self->_appAdamIds;
  return v17;
}

- (NSString)categoryId
{
  return -[GEOPDActionData categoryId]((id *)&self->_actionData->super.super.isa);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOPlaceExternalAction actionName](self, "actionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceExternalAction categoryId](self, "categoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceExternalAction appAdamIds](self, "appAdamIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Action Name: %@, Category ID: %@, Adam IDs: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)possiblyHasSupportedIntegrations
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_actionProviders;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "supportedIntegrations", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)actionProviders
{
  return self->_actionProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionProviders, 0);
  objc_storeStrong((id *)&self->_appAdamIds, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
}

@end
