@implementation CCSerializedSetChangeEnumerator

- (CCSerializedSetChangeEnumerator)initWithSetMessage:(id)a3
{
  id v5;
  CCSerializedSetChangeEnumerator *v6;
  CCSerializedSetChangeEnumerator *v7;
  uint64_t v8;
  NSArray *items;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCSerializedSetChangeEnumerator;
  v6 = -[CCSerializedSetChangeEnumerator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setMessage, a3);
    -[CCSerializedSetMessage items](v7->_setMessage, "items");
    v8 = objc_claimAutoreleasedReturnValue();
    items = v7->_items;
    v7->_items = (NSArray *)v8;

  }
  return v7;
}

- (BOOL)beginWithBookmark:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = objc_alloc(MEMORY[0x24BDD1540]);
      v18 = *MEMORY[0x24BDD0FC8];
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("The provided bookmark was of class %@, but we expected %@"), v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Set"), 2, v15);
      CCSetError(a4, v16);

      v7 = 0;
      goto LABEL_7;
    }
    self->_index = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    self->_index = 0;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)reset:(id *)a3
{
  self->_index = 0;
  return 1;
}

- (BOOL)hasNext
{
  unint64_t index;

  index = self->_index;
  return index < -[NSArray count](self->_items, "count");
}

- (id)_nextWithError:(id *)a3
{
  CCSerializedSetChangeEnumerator *v4;
  NSArray *items;
  void *v6;
  unint64_t v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  CCSetChange *v12;
  CCSharedItem *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unsigned __int16 v25;
  void *v26;
  id v27;
  CCItemInstance *v28;
  void *v29;
  CCSerializedSetChangeEnumerator *v30;
  void *v31;
  void *v32;
  CCItemInstance *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  CCSetChange *v40;
  CCSharedItem *v41;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  id *v46;
  CCSharedItem *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v4 = self;
  v56 = *MEMORY[0x24BDAC8D0];
  if (!-[CCSerializedSetChangeEnumerator hasNext](self, "hasNext"))
    return 0;
  items = v4->_items;
  ++v4->_index;
  -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0x25098F000uLL;
  v8 = -[CCSerializedSetMessage itemType](v4->_setMessage, "itemType");
  objc_msgSend(v6, "sharedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCItemMessage contentMessageForItemType:data:error:](CCItemMessage, "contentMessageForItemType:data:error:", v8, v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a3)
  {
    v12 = 0;
  }
  else
  {
    v46 = a3;
    v14 = [CCSharedItem alloc];
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "sharedItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "sharedIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[CCSharedItem initWithSharedIdentifier:content:](v14, "initWithSharedIdentifier:content:", v17, v11);

    v18 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v42 = v6;
    objc_msgSend(v6, "localInstances");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v45)
    {
      obj = v19;
      v44 = *(_QWORD *)v52;
      while (2)
      {
        v20 = 0;
        do
        {
          v21 = v11;
          if (*(_QWORD *)v52 != v44)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v20);
          v23 = v7;
          v24 = *(void **)(v7 + 2744);
          v25 = -[CCSerializedSetMessage itemType](v4->_setMessage, "itemType");
          objc_msgSend(v22, "metaContent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "metaContentMessageForItemType:data:error:", v25, v26, v46);
          v27 = (id)objc_claimAutoreleasedReturnValue();

          if (*v46)
          {
            v12 = 0;
            v11 = v21;
            v41 = v47;
            v6 = v42;
            v39 = obj;
            goto LABEL_15;
          }
          v28 = [CCItemInstance alloc];
          -[CCSharedItem sharedIdentifier](v47, "sharedIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v4;
          v31 = v18;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v22, "instanceIdentifier"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v21;
          v33 = -[CCItemInstance initWithSharedIdentifier:instanceIdentifier:content:metaContent:](v28, "initWithSharedIdentifier:instanceIdentifier:content:metaContent:", v29, v32, v21, v27);

          v18 = v31;
          v4 = v30;

          objc_msgSend(v18, "addObject:", v33);
          ++v20;
          v7 = v23;
        }
        while (v45 != v20);
        v19 = obj;
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v45)
          continue;
        break;
      }
    }

    v34 = (void *)objc_opt_new();
    -[CCSerializedSetMessage devices](v4->_setMessage, "devices");
    v35 = v18;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v42;
    objc_msgSend(v42, "deviceIndexes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __50__CCSerializedSetChangeEnumerator__nextWithError___block_invoke;
    v48[3] = &unk_250990350;
    v49 = v36;
    v50 = v34;
    v27 = v34;
    v38 = v36;
    v18 = v35;
    v39 = v38;
    objc_msgSend(v37, "enumerateUInt32ValuesWithBlock:", v48);

    v40 = [CCSetChange alloc];
    v41 = v47;
    v12 = -[CCSetChange initWithSharedItem:sharedItemChangeType:allDevices:addedDevices:removedDevices:allLocalInstances:addedLocalInstances:removedLocalInstances:](v40, "initWithSharedItem:sharedItemChangeType:allDevices:addedDevices:removedDevices:allLocalInstances:addedLocalInstances:removedLocalInstances:", v47, 0, v27, v27, v18, MEMORY[0x24BDBD1A8]);

LABEL_15:
  }

  return v12;
}

void __50__CCSerializedSetChangeEnumerator__nextWithError___block_invoke(uint64_t a1, unsigned int a2)
{
  CCDevice *v3;
  void *v4;
  CCDevice *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [CCDevice alloc];
  objc_msgSend(v6, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CCDevice initWithIdentifier:options:](v3, "initWithIdentifier:options:", v4, objc_msgSend(v6, "options"));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

- (id)next
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v7;

  v7 = 0;
  -[CCSerializedSetChangeEnumerator _nextWithError:](self, "_nextWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CCSerializedSetChangeEnumerator next].cold.1((uint64_t)v3, v4, v5);

  }
  return v2;
}

- (id)nextBookmark
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_index);
}

- (id)sharedItemCount:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCSerializedSetMessage sharedItemCount](self->_setMessage, "sharedItemCount", a3));
}

- (id)itemInstanceCount:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCSerializedSetMessage localItemInstanceCount](self->_setMessage, "localItemInstanceCount", a3));
}

- (BOOL)isBookmarkUpToDate:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
    v6 = v5 == -[NSArray count](self->_items, "count");
  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CCSerializedSetChangeEnumerator isBookmarkUpToDate:].cold.1((uint64_t)v4, v7);

    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_setMessage, 0);
}

- (void)next
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, a3, "Error enumerating serialized set change: %@", (uint8_t *)&v3);
}

- (void)isBookmarkUpToDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0(&dword_237B25000, a2, v5, "Unexpected bookmark class: %@", (uint8_t *)&v6);

}

@end
