@implementation WFWebArchive

- (WFWebArchive)initWithMainResource:(id)a3 subresources:(id)a4 subframeArchives:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFWebArchive *v12;
  WFWebArchive *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && (v12 = -[WFWebArchive init](self, "init"), (self = v12) != 0))
  {
    objc_storeStrong((id *)&v12->_mainResource, a3);
    objc_storeStrong((id *)&self->_subresources, a4);
    objc_storeStrong((id *)&self->_subframeArchives, a5);
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (WFWebArchive)initWithData:(id)a3
{
  void *v4;
  WFWebArchive *v5;

  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFWebArchive initWithSerializedRepresentation:](self, "initWithSerializedRepresentation:", v4);

  return v5;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[WFWebArchive serializedRepresentation](self, "serializedRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (WFWebArchive)initWithSerializedRepresentation:(id)a3
{
  id v4;
  WFWebArchive *v5;
  WFWebResource *v6;
  void *v7;
  uint64_t v8;
  WFWebResource *mainResource;
  void *v10;
  uint64_t v11;
  NSArray *subresources;
  void *v13;
  uint64_t v14;
  NSArray *subframeArchives;
  WFWebArchive *v16;

  v4 = a3;
  v5 = -[WFWebArchive init](self, "init");
  if (!v5)
    goto LABEL_4;
  v6 = [WFWebResource alloc];
  objc_msgSend(v4, "objectForKey:", CFSTR("WebMainResource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFWebResource initWithSerializedRepresentation:](v6, "initWithSerializedRepresentation:", v7);
  mainResource = v5->_mainResource;
  v5->_mainResource = (WFWebResource *)v8;

  if (v5->_mainResource)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("WebSubresources"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_map:", &__block_literal_global_5168);
    v11 = objc_claimAutoreleasedReturnValue();
    subresources = v5->_subresources;
    v5->_subresources = (NSArray *)v11;

    objc_msgSend(v4, "objectForKey:", CFSTR("WebSubframeArchives"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "if_map:", &__block_literal_global_7);
    v14 = objc_claimAutoreleasedReturnValue();
    subframeArchives = v5->_subframeArchives;
    v5->_subframeArchives = (NSArray *)v14;

    v16 = v5;
  }
  else
  {
LABEL_4:
    v16 = 0;
  }

  return v16;
}

- (id)serializedRepresentation
{
  void *v3;
  WFWebResource *mainResource;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  mainResource = self->_mainResource;
  if (mainResource)
  {
    -[WFWebResource serializedRepresentation](mainResource, "serializedRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("WebMainResource"));

  }
  if (-[NSArray count](self->_subresources, "count"))
  {
    -[NSArray if_map:](self->_subresources, "if_map:", &__block_literal_global_11_5165);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("WebSubresources"));

  }
  if (-[NSArray count](self->_subframeArchives, "count"))
  {
    -[NSArray if_map:](self->_subframeArchives, "if_map:", &__block_literal_global_13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("WebSubframeArchives"));

  }
  return v3;
}

- (WFWebArchive)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WFWebArchive *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WebMainResource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("WebSubresources"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WebSubframeArchives"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[WFWebArchive initWithMainResource:subresources:subframeArchives:](self, "initWithMainResource:subresources:subframeArchives:", v5, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  WFWebResource *mainResource;
  id v5;

  mainResource = self->_mainResource;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mainResource, CFSTR("WebMainResource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subresources, CFSTR("WebSubresources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subframeArchives, CFSTR("WebSubframeArchives"));

}

- (WFWebResource)mainResource
{
  return self->_mainResource;
}

- (NSArray)subresources
{
  return self->_subresources;
}

- (NSArray)subframeArchives
{
  return self->_subframeArchives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subframeArchives, 0);
  objc_storeStrong((id *)&self->_subresources, 0);
  objc_storeStrong((id *)&self->_mainResource, 0);
}

uint64_t __40__WFWebArchive_serializedRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializedRepresentation");
}

uint64_t __40__WFWebArchive_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializedRepresentation");
}

WFWebArchive *__49__WFWebArchive_initWithSerializedRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFWebArchive *v3;

  v2 = a2;
  v3 = -[WFWebArchive initWithSerializedRepresentation:]([WFWebArchive alloc], "initWithSerializedRepresentation:", v2);

  return v3;
}

WFWebResource *__49__WFWebArchive_initWithSerializedRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFWebResource *v3;

  v2 = a2;
  v3 = -[WFWebResource initWithSerializedRepresentation:]([WFWebResource alloc], "initWithSerializedRepresentation:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)containedImageFiles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[WFWebArchive subresources](self, "subresources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v8), "containedImageFile");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WFWebArchive subframeArchives](self, "subframeArchives", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "containedImageFiles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  return v3;
}

@end
