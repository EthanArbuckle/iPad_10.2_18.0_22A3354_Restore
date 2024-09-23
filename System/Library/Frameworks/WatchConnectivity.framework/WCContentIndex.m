@implementation WCContentIndex

- (WCContentIndex)initWithContainingFolder:(id)a3
{
  id v4;
  WCContentIndex *v5;
  uint64_t v6;
  NSURL *itemURL;
  uint64_t v8;
  NSOperationQueue *operationQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WCContentIndex;
  v5 = -[WCContentIndex init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("contents.index"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    itemURL = v5->_itemURL;
    v5->_itemURL = (NSURL *)v6;

    v8 = objc_opt_new();
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = (NSOperationQueue *)v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v5->_operationQueue, "setQualityOfService:", 17);
    -[WCContentIndex loadContentIfNecessary](v5, "loadContentIfNecessary");
    objc_msgSend(MEMORY[0x24BDD1570], "addFilePresenter:", v5);
  }

  return v5;
}

- (void)invalidate
{
  -[WCContentIndex setInvalidated:](self, "setInvalidated:", 1);
  objc_msgSend(MEMORY[0x24BDD1570], "removeFilePresenter:", self);
}

- (void)loadContentIfNecessary
{
  NSObject *v3;
  uint8_t *v4;

  *a2 = 136446466;
  OUTLINED_FUNCTION_1_0((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[WCContentIndex loadContentIfNecessary]");
  OUTLINED_FUNCTION_11(&dword_216F21000, v3, (uint64_t)v3, "%{public}s could not get generation identifier for index file with error: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __40__WCContentIndex_loadContentIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  void *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v2 + 40);
  v3 = (id *)(v2 + 40);
  if (!v4)
  {
    obj = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a2, 0, &obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v3, obj);
    if (v6)
    {
      v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v11 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 1, 0, &v11);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v7, v11);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
  }
}

- (NSArray)index
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E8]), "initWithTarget:selector:object:", self, sel_loadContentIfNecessary, 0);
  -[WCContentIndex presentedItemOperationQueue](self, "presentedItemOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperations:waitUntilFinished:", v5, 1);

  -[WCContentIndex cachedContentIndex](self, "cachedContentIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSArray *)v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCContentIndex itemURL](self, "itemURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCContentIndex cachedContentIndex](self, "cachedContentIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WCCompactStringFromCollection(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, file: %@, index: %@>"), v5, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  WCContentIndex *v4;
  WCContentIndex *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WCContentIndex *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WCContentIndex itemURL](self, "itemURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCContentIndex itemURL](v5, "itemURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WCContentIndex itemURL](self, "itemURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)addContentIdentifier:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[WCContentIndex cachedContentIndex](self, "cachedContentIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[WCContentIndex commit](self, "commit");
  }
}

- (void)removeContentIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  if (v4)
  {
    -[WCContentIndex cachedContentIndex](self, "cachedContentIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      -[WCContentIndex cachedContentIndex](self, "cachedContentIndex");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v4);

      -[WCContentIndex commit](self, "commit");
    }
    else
    {
      wc_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[WCContentIndex removeContentIdentifier:].cold.1((uint64_t)v4, v8, v9);

    }
  }

}

- (void)commit
{
  NSObject *v3;
  uint8_t *v4;

  *a2 = 136446466;
  OUTLINED_FUNCTION_1_0((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[WCContentIndex commit]");
  OUTLINED_FUNCTION_11(&dword_216F21000, v3, (uint64_t)v3, "%{public}s could not coordinate writing to index file with error: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __24__WCContentIndex_commit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  id v12;
  id obj;

  v3 = a2;
  v4 = a1 + 40;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = (void *)MEMORY[0x24BDD1770];
    objc_msgSend(*(id *)(a1 + 32), "cachedContentIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    obj = 0;
    objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, &obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7, obj);

    if (v8)
    {
      v9 = *(_QWORD *)(*(_QWORD *)v4 + 8);
      v12 = *(id *)(v9 + 40);
      v10 = objc_msgSend(v8, "writeToURL:options:error:", v3, 1073741825, &v12);
      objc_storeStrong((id *)(v9 + 40), v12);
      if ((v10 & 1) != 0 || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40), "code") == 4)
        goto LABEL_10;
      wc_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __24__WCContentIndex_commit__block_invoke_cold_2(v4, v3, v11);
    }
    else
    {
      wc_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __24__WCContentIndex_commit__block_invoke_cold_1(v4, v11);
    }

LABEL_10:
  }

}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSMutableArray)cachedContentIndex
{
  return self->_cachedContentIndex;
}

- (void)setCachedContentIndex:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContentIndex, a3);
}

- (id)lastGenerationIdentifier
{
  return self->_lastGenerationIdentifier;
}

- (void)setLastGenerationIdentifier:(id)a3
{
  objc_storeStrong(&self->_lastGenerationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastGenerationIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedContentIndex, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
}

- (void)removeContentIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = "-[WCContentIndex removeContentIdentifier:]";
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_11(&dword_216F21000, a2, a3, "%{public}s identifier not in index %{public}@", (uint8_t *)&v3);
}

void __24__WCContentIndex_commit__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136446466;
  v6 = "-[WCContentIndex commit]_block_invoke";
  v7 = 2114;
  v8 = v3;
  OUTLINED_FUNCTION_11(&dword_216F21000, a2, v4, "%{public}s could not serialize content data %{public}@", (uint8_t *)&v5);

}

void __24__WCContentIndex_commit__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  NSPrintF();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446722;
  v8 = "-[WCContentIndex commit]_block_invoke";
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_216F21000, a3, OS_LOG_TYPE_ERROR, "%{public}s error %{public}@ writing file to %{public}@", buf, 0x20u);

}

@end
