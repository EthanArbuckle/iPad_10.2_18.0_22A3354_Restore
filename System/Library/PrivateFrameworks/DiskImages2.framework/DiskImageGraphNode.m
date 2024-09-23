@implementation DiskImageGraphNode

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  v6 = 0;
  if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("Tag"), objc_opt_class(), 0, a4))
  {
    v6 = 0;
    if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("UUID"), objc_opt_class(), 0, a4))
    {
      if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("ParentUUID"), objc_opt_class(), 1, a4)&& objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("Metadata"), objc_opt_class(), 1, a4))
      {
        v6 = objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("IsCache"), objc_opt_class(), 0, a4);
      }
      else
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

- (DiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v8;
  DiskImageGraphNode *v9;
  uint64_t v10;
  NSString *tag;
  id v12;
  void *v13;
  uint64_t v14;
  NSUUID *UUID;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSUUID *parentUUID;
  void *v23;
  uint64_t v24;
  NSDictionary *metadata;
  NSMutableArray *v26;
  NSMutableArray *children;
  objc_super v29;

  v6 = a4;
  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DiskImageGraphNode;
  v9 = -[DiskImageGraphNode init](&v29, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Tag"));
    v10 = objc_claimAutoreleasedReturnValue();
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    v12 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v8, "objectForKey:", CFSTR("UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithUUIDString:", v13);
    UUID = v9->_UUID;
    v9->_UUID = (NSUUID *)v14;

    objc_msgSend(v8, "objectForKey:", CFSTR("IsCache"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isCache = objc_msgSend(v16, "BOOLValue");

    if (v6)
      v17 = v8;
    else
      v17 = 0;
    objc_storeStrong((id *)&v9->_pstackDict, v17);
    objc_msgSend(v8, "objectForKey:", CFSTR("ParentUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v8, "objectForKey:", CFSTR("ParentUUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithUUIDString:", v20);
      parentUUID = v9->_parentUUID;
      v9->_parentUUID = (NSUUID *)v21;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("Metadata"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("Metadata"));
      v24 = objc_claimAutoreleasedReturnValue();
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v24;

    }
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    children = v9->_children;
    v9->_children = v26;

  }
  return v9;
}

+ (id)GraphNodeWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  __objc2_class **v12;
  void *v13;

  v7 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PluginName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = off_24CEEAAD8;
  if (v11)
    v12 = off_24CEEAC28;
  v13 = (void *)objc_msgSend(objc_alloc(*v12), "initWithDictionary:updateChangesToDict:workDir:error:", v10, v7, v9, a6);

  return v13;
}

- (DiskImageGraphNode)initWithTag:(id)a3 UUID:(id)a4 parentNode:(id)a5 metadata:(id)a6 isCache:(BOOL)a7
{
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  DiskImageGraphNode *v16;
  DiskImageGraphNode *v17;
  __CFString *v18;
  uint64_t v19;
  NSUUID *parentUUID;
  NSMutableArray *v21;
  NSMutableArray *children;
  objc_super v24;

  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)DiskImageGraphNode;
  v16 = -[DiskImageGraphNode init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    if (v12)
      v18 = v12;
    else
      v18 = &stru_24CF15F38;
    objc_storeStrong((id *)&v16->_tag, v18);
    objc_storeStrong((id *)&v17->_UUID, a4);
    objc_storeStrong((id *)&v17->_parent, a5);
    objc_msgSend(v14, "UUID");
    v19 = objc_claimAutoreleasedReturnValue();
    parentUUID = v17->_parentUUID;
    v17->_parentUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v17->_metadata, a6);
    v17->_isCache = a7;
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    children = v17->_children;
    v17->_children = v21;

  }
  return v17;
}

- (void)setTag:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_tag, a3);
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Tag"));

  }
}

- (void)setUUID:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_UUID, a3);
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("UUID"));

  }
}

- (void)setParent:(id)a3
{
  NSUUID *v5;
  NSUUID *parentUUID;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_parent, a3);
  objc_msgSend(v11, "UUID");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  parentUUID = self->_parentUUID;
  self->_parentUUID = v5;

  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("ParentUUID"));

  }
}

- (void)setMetadata:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Metadata"));

  }
}

- (void)setIsCache:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_isCache = a3;
  -[DiskImageGraphNode pstackDict](self, "pstackDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DiskImageGraphNode pstackDict](self, "pstackDict");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("IsCache"));

  }
}

- (id)getDescendants
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[DiskImageGraphNode children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DiskImageGraphNode addDecendantsToArray:](self, "addDecendantsToArray:", v5);
  return v5;
}

- (void)addDecendantsToArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DiskImageGraphNode children](self, "children", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(v10, "addDecendantsToArray:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[DiskImageGraphNode tag](self, "tag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiskImageGraphNode UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DiskImageGraphNode isCache](self, "isCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("Tag"), v6, CFSTR("UUID"), v7, CFSTR("IsCache"), 0);

  -[DiskImageGraphNode parentUUID](self, "parentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DiskImageGraphNode parentUUID](self, "parentUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("ParentUUID"));

  }
  -[DiskImageGraphNode metadata](self, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DiskImageGraphNode metadata](self, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("Metadata"));

  }
  return v8;
}

- (BOOL)deleteImage
{
  return 0;
}

- (id)URL
{
  return 0;
}

- (id)getChildren
{
  void *v2;
  void *v3;

  -[DiskImageGraphNode children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)tag
{
  return self->_tag;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)isCache
{
  return self->_isCache;
}

- (NSMutableDictionary)pstackDict
{
  return self->_pstackDict;
}

- (void)setPstackDict:(id)a3
{
  objc_storeStrong((id *)&self->_pstackDict, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (DiskImageGraphNode)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_pstackDict, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

- (id)toDIShadowNode
{
  DIShadowNode *v3;
  void *v4;
  DIShadowNode *v5;

  v3 = [DIShadowNode alloc];
  -[DiskImageGraphNode URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DIShadowNode initWithURL:isCache:](v3, "initWithURL:isCache:", v4, -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

- (id)childrenInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = (void *)objc_opt_new();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[DiskImageGraphNode children](self, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__DiskImageGraphNode_Info__childrenInfoWithExtra_error___block_invoke;
  v13[3] = &unk_24CEEF920;
  v17 = a3;
  v15 = &v22;
  v16 = &v18;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  if (a4)
  {
    v10 = (void *)v23[5];
    if (v10)
      *a4 = objc_retainAutorelease(v10);
  }
  if (*((_BYTE *)v19 + 24))
    v11 = 0;
  else
    v11 = v9;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __56__DiskImageGraphNode_Info__childrenInfoWithExtra_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v6 = *(unsigned __int8 *)(a1 + 56);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(a2, "infoWithExtra:error:", v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }
  else
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)recursiveInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[DiskImageGraphNode infoWithExtra:error:](self, "infoWithExtra:error:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[DiskImageGraphNode childrenInfoWithExtra:error:](self, "childrenInfoWithExtra:error:", v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("Children"));
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)infoWithExtra:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a3;
  v7 = (void *)objc_opt_new();
  -[DiskImageGraphNode UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("UUID"));

  -[DiskImageGraphNode URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("URL"));

  if (-[DiskImageGraphNode isCache](self, "isCache"))
    v12 = MEMORY[0x24BDBD1C8];
  else
    v12 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("IsCache"));
  -[DiskImageGraphNode tag](self, "tag");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[DiskImageGraphNode tag](self, "tag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      -[DiskImageGraphNode tag](self, "tag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("Tag"));

    }
  }
  if (!v5)
    goto LABEL_10;
  -[DiskImageGraphNode URL](self, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiskImageGraph getImageInfoDictWithURL:error:](DiskImageGraph, "getImageInfoDictWithURL:error:", v18, a4);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("Image Info"));

LABEL_10:
    v19 = v7;
  }

  return v19;
}

- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4
{
  return 0;
}

@end
