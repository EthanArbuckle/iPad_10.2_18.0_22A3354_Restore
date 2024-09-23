@implementation GKEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_components, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "componentSystem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "removeComponentWithEntity:", self);
          objc_msgSend(v8, "setEntity:", 0);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)GKEntity;
  -[GKEntity dealloc](&v11, sel_dealloc);
}

+ (GKEntity)entity
{
  return (GKEntity *)objc_alloc_init((Class)a1);
}

- (GKEntity)init
{
  GKEntity *v2;
  uint64_t v3;
  NSMutableDictionary *components;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKEntity;
  v2 = -[GKEntity init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    components = v2->_components;
    v2->_components = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (GKEntity)initWithCoder:(id)a3
{
  id v4;
  GKEntity *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *components;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[14];

  v23[12] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[GKEntity init](self, "init");
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    v23[6] = objc_opt_class();
    v23[7] = objc_opt_class();
    v23[8] = objc_opt_class();
    v23[9] = objc_opt_class();
    v23[10] = objc_opt_class();
    v23[11] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_components"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          components = v5->_components;
          objc_msgSend(v14, "componentName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](components, "setObject:forKey:", v14, v16);

          objc_msgSend(v14, "setEntity:", v5);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *components;
  id v4;
  id v5;

  components = self->_components;
  v4 = a3;
  -[NSMutableDictionary allValues](components, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_components"));

}

- (void)updateWithDeltaTime:(NSTimeInterval)seconds
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_components, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 == v7)
        {
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_msgSend(v9, "usesPerComponentUpdate") & 1) != 0)
            continue;
        }
        else
        {
          objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_msgSend(v9, "usesPerComponentUpdate") & 1) != 0)
            continue;
        }
        objc_msgSend(v9, "updateWithDeltaTime:", seconds);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSArray)components
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_components, "allValues");
}

- (void)addComponent:(GKComponent *)component
{
  NSMutableDictionary *components;
  void *v5;
  GKComponent *v6;

  components = self->_components;
  v6 = component;
  -[GKComponent componentName](v6, "componentName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](components, "setObject:forKey:", v6, v5);

  -[GKComponent setEntity:](v6, "setEntity:", self);
  -[GKComponent didAddToEntity](v6, "didAddToEntity");

}

- (void)removeComponentForClass:(Class)componentClass
{
  void *v4;
  void *v5;
  id v6;

  NSStringFromClass(componentClass);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_components, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "willRemoveFromEntity");
    -[NSMutableDictionary removeObjectForKey:](self->_components, "removeObjectForKey:", v6);
    objc_msgSend(v5, "setEntity:", 0);
  }

}

- (GKComponent)componentForClass:(Class)componentClass
{
  NSMutableDictionary *components;
  void *v4;
  void *v5;

  components = self->_components;
  NSStringFromClass(componentClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](components, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKComponent *)v5;
}

- (id)copy
{
  return -[GKEntity copyWithZone:](self, "copyWithZone:", MEMORY[0x22E2A4F5C](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

- (void)removeComponent:(id)a3
{
  NSMutableDictionary *components;
  void *v4;
  id v5;

  components = self->_components;
  v5 = a3;
  objc_msgSend(v5, "componentName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](components, "removeObjectForKey:", v4);

  objc_msgSend(v5, "setEntity:", 0);
}

- (id)componentForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_components, "objectForKey:", a3);
}

@end
