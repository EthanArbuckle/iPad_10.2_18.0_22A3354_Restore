@implementation IAPNavigationAccessory

- (IAPNavigationAccessory)initWithDict:(id)a3
{
  id v4;
  IAPNavigationAccessory *v5;
  IAPNavigationAccessory *v6;
  uint64_t v7;
  NSSet *components;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  IAPNavigationAccessoryComponent *v18;
  IAPNavigationAccessoryComponent *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IAPNavigationAccessory;
  v5 = -[IAPNavigationAccessory init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->__wasFoundInLastUpdate = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    components = v6->_components;
    v6->_components = (NSSet *)v7;

    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (v10)
      v6->_identifier = v10;
    objc_msgSend(v4, "objectForKey:", CFSTR("components"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
              v18 = [IAPNavigationAccessoryComponent alloc];
              v19 = -[IAPNavigationAccessoryComponent initWithDict:](v18, "initWithDict:", v17, (_QWORD)v21);
              if (v19)
                -[NSSet addObject:](v6->_components, "addObject:", v19);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v14);
        }

      }
    }

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t identifier;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    v6 = identifier == objc_msgSend(v4, "identifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IAPNavigationAccessory - identifier: %d, components: %@>"), self->_identifier, self->_components);
}

- (BOOL)requestedSourceNameForAnyComponent
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_components;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "requestSourceName", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)requestedSourceSupportsRouteGuidanceForAnyComponent
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_components;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "requestSourceSupportsRouteGuidance", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NSSet)components
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)_wasFoundInLastUpdate
{
  return self->__wasFoundInLastUpdate;
}

- (void)set_wasFoundInLastUpdate:(BOOL)a3
{
  self->__wasFoundInLastUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

@end
