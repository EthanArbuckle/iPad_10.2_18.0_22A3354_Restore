@implementation MAConcreteEdge

- (MAConcreteEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  id v14;
  id v15;
  MAConcreteEdge *v16;
  uint64_t v17;
  NSString *label;
  uint64_t v19;
  NSMutableDictionary *properties;
  objc_super v22;

  v14 = a3;
  v15 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MAConcreteEdge;
  v16 = -[MAEdge initWithSourceNode:targetNode:](&v22, sel_initWithSourceNode_targetNode_, a4, a5);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    label = v16->_label;
    v16->_label = (NSString *)v17;

    v16->_domain = a6;
    v16->_weight = a7;
    v19 = objc_msgSend(v15, "mutableCopy");
    properties = v16->_properties;
    v16->_properties = (NSMutableDictionary *)v19;

  }
  return v16;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  MAConcreteEdge *v5;
  NSMutableDictionary *properties;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  properties = v5->_properties;
  if (properties)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

- (BOOL)hasProperties
{
  MAConcreteEdge *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_properties, "count") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)propertiesCount
{
  MAConcreteEdge *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_properties, "count");
  objc_sync_exit(v2);

  return v3;
}

- (id)propertyKeys
{
  MAConcreteEdge *v2;
  NSMutableDictionary *properties;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  properties = v2->_properties;
  if (properties && -[NSMutableDictionary count](properties, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](v2->_properties, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)propertyDictionary
{
  MAConcreteEdge *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v2->_properties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  MAConcreteEdge *v5;
  NSMutableDictionary *properties;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  v5 = self;
  objc_sync_enter(v5);
  properties = v5->_properties;
  if (properties)
  {
    v17 = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary keyEnumerator](properties, "keyEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[NSMutableDictionary objectForKeyedSubscript:](v5->_properties, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11, v12, &v17);

        if (v17)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  objc_sync_exit(v5);

}

- (unsigned)domain
{
  return self->_domain;
}

- (float)weight
{
  return self->_weight;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
