@implementation _CPLResourcesMutableArray

- (_CPLResourcesMutableArray)initWithResources:(id)a3
{
  id v4;
  _CPLResourcesMutableArray *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *resourcesPerType;
  NSMutableDictionary *v8;
  NSMutableDictionary *updatedResourcesPerType;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_CPLResourcesMutableArray;
  v5 = -[_CPLResourcesMutableArray init](&v23, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resourcesPerType = v5->_resourcesPerType;
    v5->_resourcesPerType = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updatedResourcesPerType = v5->_updatedResourcesPerType;
    v5->_updatedResourcesPerType = v8;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v16 = v5->_resourcesPerType;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "resourceType", (_QWORD)v19));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v15, v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

  }
  return v5;
}

- (void)addResource:(id)a3
{
  NSMutableDictionary *resourcesPerType;
  void *v5;
  id v6;
  void *v7;
  NSMutableDictionary *updatedResourcesPerType;
  id v9;

  resourcesPerType = self->_resourcesPerType;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "resourceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](resourcesPerType, "setObject:forKey:", v6, v7);

  updatedResourcesPerType = self->_updatedResourcesPerType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "resourceType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](updatedResourcesPerType, "setObject:forKey:", v6, v9);

}

- (id)allResources
{
  return (id)-[NSMutableDictionary allValues](self->_resourcesPerType, "allValues");
}

- (id)reallyUpdatedResources
{
  return (id)-[NSMutableDictionary allValues](self->_updatedResourcesPerType, "allValues");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedResourcesPerType, 0);
  objc_storeStrong((id *)&self->_resourcesPerType, 0);
}

@end
