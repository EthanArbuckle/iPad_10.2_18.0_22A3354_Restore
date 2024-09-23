@implementation CCDataResource

+ (BOOL)directoryContainsDataResource:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Set.db"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  LOBYTE(v4) = access((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0) == 0;

  return (char)v4;
}

- (CCDataResource)initWithDataSite:(id)a3 directoryURL:(id)a4
{
  id v7;
  id v8;
  CCDataResource *v9;
  CCDataResource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCDataResource;
  v9 = -[CCDataResource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSite, a3);
    objc_storeStrong((id *)&v10->_directoryURL, a4);
  }

  return v10;
}

- (NSURL)databaseURL
{
  return -[NSURL URLByAppendingPathComponent:](self->_directoryURL, "URLByAppendingPathComponent:", CFSTR("Set.db"));
}

- (unint64_t)resourceStatus
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v10;

  v10 = 0;
  -[CCDataResource tombstoneDate:](self, "tombstoneDate:", &v10);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = 0;
  if (!v10)
  {
    if (v2)
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(v5, "timeIntervalSinceDate:", v3);
      v7 = v6;

      v8 = 3;
      if (v7 < *(double *)&CCDataResourceTombstonedInterval)
        v8 = 2;
      if (v7 >= *(double *)&CCDataResourceDeletingInterval)
        v4 = 4;
      else
        v4 = v8;
    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

- (id)tombstoneDate:(id *)a3
{
  ssize_t v5;
  NSObject *v6;
  void *v7;
  unint64_t value;

  value = 0;
  v5 = getxattr(-[NSURL fileSystemRepresentation](self->_directoryURL, "fileSystemRepresentation"), "com.apple.cascade.tombstonedate", &value, 8uLL, 0, 0);
  if (v5)
  {
    if (v5 < 0)
    {
      if (*__error() != 93)
      {
        __biome_log_for_category();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CCDataResource tombstoneDate:].cold.1((uint64_t)self, v6);

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        CCSetError(a3, v7);

      }
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(value / 0xF4240));
      v5 = objc_claimAutoreleasedReturnValue();
    }
  }
  return (id)v5;
}

- (BOOL)markTombstoned:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  double v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t value;
  uint8_t buf[4];
  CCDataResource *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CCDataResource tombstoneDate:](self, "tombstoneDate:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "Resesource: %@, has existing tombstone date: %@, not resetting", buf, 0x16u);
    }

    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "timeIntervalSince1970");
    value = (uint64_t)(v10 * 1000000.0);
    v11 = setxattr(-[NSURL fileSystemRepresentation](self->_directoryURL, "fileSystemRepresentation"), "com.apple.cascade.tombstonedate", &value, 8uLL, 0, 0);
    v9 = v11 == 0;
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CCDataResource markTombstoned:error:].cold.1((uint64_t)self, v13);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v13 = objc_claimAutoreleasedReturnValue();
      CCSetError(a4, v13);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_237B25000, v13, OS_LOG_TYPE_DEFAULT, "Successfully set tombstone date for resource: %@, date: %@", buf, 0x16u);
    }

  }
  return v9;
}

- (BOOL)clearTombstoneStatus:(id *)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  CCDataResource *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[CCDataResource tombstoneDate:](self, "tombstoneDate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CCDataResource clearTombstoneStatus:].cold.1((uint64_t)self, v8);
    goto LABEL_10;
  }
  v6 = removexattr(-[NSURL fileSystemRepresentation](self->_directoryURL, "fileSystemRepresentation"), "com.apple.cascade.tombstonedate", 0);
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_237B25000, v8, OS_LOG_TYPE_DEFAULT, "Successfully cleared tombstone date for resource: %@", (uint8_t *)&v11, 0xCu);
    }
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CCDataResource clearTombstoneStatus:].cold.2((uint64_t)self, v8);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  CCSetError(a3, v8);
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)removeResource:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  CCDataResource *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  -[CCDataResource setWithError:](self, "setWithError:", &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  v7 = v6;
  if (!v5 || v6)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CCDataResource removeResource:].cold.1();

    CCSetError(a3, v7);
    v15 = 0;
  }
  else
  {
    CCTypeIdentifierRegistryBridge();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifierForItemType:", objc_msgSend(v5, "itemType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x24BE0C0B0]);
      objc_msgSend(v5, "descriptors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithType:name:descriptors:", 4, v9, v11);

      v13 = objc_alloc(MEMORY[0x24BE0C070]);
      v14 = (void *)objc_msgSend(v13, "initWithUseCase:", *MEMORY[0x24BE0C068]);
      v23 = 0;
      v15 = objc_msgSend(v14, "removeResource:error:", v12, &v23);
      v16 = v23;
      if (v16)
        v15 = 0;
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          -[CCDataResource directoryURL](self, "directoryURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v26 = self;
          v27 = 2112;
          v28 = v19;
          _os_log_impl(&dword_237B25000, v18, OS_LOG_TYPE_DEFAULT, "Successfully removed tombstoned resource: %@ at path: %@", buf, 0x16u);

        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[CCDataResource removeResource:].cold.3();

        CCSetError(a3, v16);
      }

    }
    else
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CCDataResource removeResource:].cold.2(v5, v12);
      v15 = 0;
    }

  }
  return v15;
}

- (id)setWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CCSet *v11;
  void *v12;
  void *v13;
  id v14;
  CCSet *v15;
  id v16;
  void *v17;
  id v19;
  id v20;

  v4 = (void *)MEMORY[0x24BE0C098];
  -[CCDataResource directoryURL](self, "directoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceFromDataResourcePath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (CCTypeIdentifierRegistryBridge(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "name"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "itemTypeForSetIdentifier:", v9),
        v9,
        v8,
        (_DWORD)v10 != (unsigned __int16)CCTypeIdentifierUnknown))
  {
    objc_msgSend(v7, "descriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    +[CCSetDescriptor setDescriptorsFromResourceDescriptors:error:](CCSetDescriptor, "setDescriptorsFromResourceDescriptors:error:", v12, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;

    if (!v13 || v14)
    {
      CCSetError(a3, v14);
      v11 = 0;
    }
    else
    {
      v19 = 0;
      v15 = -[CCSet initWithItemType:descriptors:error:]([CCSet alloc], "initWithItemType:descriptors:error:", v10, v13, &v19);
      v16 = v19;
      v17 = v16;
      if (!v15 || v16)
      {
        CCSetError(a3, v16);
        v11 = 0;
      }
      else
      {
        v11 = v15;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_directoryURL, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CCDataResource *v4;
  CCDataResource *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CCDataResource *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NSURL path](self->_directoryURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCDataResource directoryURL](v5, "directoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)performMaintenanceOnDatabase:(id)a3 modifiedCount:(unint64_t *)a4 shouldDefer:(id)a5
{
  return +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:](CCDatabaseUpdater, "compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:", a3, a4, a5);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("CCDataResource: %@"), self->_directoryURL);
}

- (CCDataSite)dataSite
{
  return self->_dataSite;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_dataSite, 0);
}

- (void)tombstoneDate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_1(v3);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_237B25000, a2, v4, "Could not retrieve tombstone xattr for resource: %@, error: %s", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)markTombstoned:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_1(v3);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_237B25000, a2, v4, "Could not set tombstone xattr for resource: %@, error: %s", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)clearTombstoneStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_237B25000, a2, OS_LOG_TYPE_DEBUG, "Resource: %@ has no existing tombstone date, not clearing", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)clearTombstoneStatus:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_1(v3);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_237B25000, a2, v4, "Could not remove tombstone xattr for resource: %@, error: %s", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)removeResource:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v0, (uint64_t)v0, "Could not resolve set for tombstoned resource: %@ with error: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)removeResource:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "itemType");
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "Could not resolve set identifier for item type %hu'", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)removeResource:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_237B25000, v0, (uint64_t)v0, "Could not remove tombstoned resource: %@ with error: %@", v1);
  OUTLINED_FUNCTION_1();
}

@end
