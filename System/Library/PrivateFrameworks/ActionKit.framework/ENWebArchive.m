@implementation ENWebArchive

- (ENWebArchive)initWithMainResource:(id)a3 subresources:(id)a4 subframeArchives:(id)a5
{
  id v8;
  id v9;
  id v10;
  ENWebArchive *v11;
  ENWebArchive *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ENWebArchive;
  v11 = -[ENWebArchive init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ENWebArchive setMainResource:](v11, "setMainResource:", v8);
    -[ENWebArchive setSubresources:](v12, "setSubresources:", v9);
    -[ENWebArchive setSubframeArchives:](v12, "setSubframeArchives:", v10);
  }

  return v12;
}

- (id)propertyList
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ENWebArchive mainResource](self, "mainResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ENWebArchive mainResource](self, "mainResource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("WebMainResource"));

  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ENWebArchive subresources](self, "subresources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "propertyList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("WebSubresources"));
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[ENWebArchive subframeArchives](self, "subframeArchives", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "propertyList");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("WebSubframeArchives"));
  return v3;
}

- (id)data
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v7;

  -[ENWebArchive propertyList](self, "propertyList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    NSLog(CFSTR("Error serializing web archive to data: %@"), v7);

  return v4;
}

- (ENWebResource)mainResource
{
  return self->_mainResource;
}

- (void)setMainResource:(id)a3
{
  objc_storeStrong((id *)&self->_mainResource, a3);
}

- (NSArray)subresources
{
  return self->_subresources;
}

- (void)setSubresources:(id)a3
{
  objc_storeStrong((id *)&self->_subresources, a3);
}

- (NSArray)subframeArchives
{
  return self->_subframeArchives;
}

- (void)setSubframeArchives:(id)a3
{
  objc_storeStrong((id *)&self->_subframeArchives, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subframeArchives, 0);
  objc_storeStrong((id *)&self->_subresources, 0);
  objc_storeStrong((id *)&self->_mainResource, 0);
}

+ (ENWebArchive)webArchiveWithData:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[ENWebArchive webArchiveWithDictionary:](ENWebArchive, "webArchiveWithDictionary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("Error deserializing web archive from data: %@"), v6);
    v4 = 0;
  }

  return (ENWebArchive *)v4;
}

+ (ENWebArchive)webArchiveWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  ENWebArchive *v20;
  void *v21;
  ENWebArchive *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebMainResource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebSubresources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WebSubframeArchives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        +[ENWebResource webResourceWithDictionary:](ENWebResource, "webResourceWithDictionary:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }

  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        +[ENWebArchive webArchiveWithDictionary:](ENWebArchive, "webArchiveWithDictionary:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

  v20 = [ENWebArchive alloc];
  +[ENWebResource webResourceWithDictionary:](ENWebResource, "webResourceWithDictionary:", v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ENWebArchive initWithMainResource:subresources:subframeArchives:](v20, "initWithMainResource:subresources:subframeArchives:", v21, v6, v13);

  return v22;
}

@end
