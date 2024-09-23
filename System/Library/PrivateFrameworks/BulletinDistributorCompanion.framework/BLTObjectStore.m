@implementation BLTObjectStore

- (BLTObjectStore)initWithPath:(id)a3 elementClass:(Class)a4
{
  id v7;
  BLTObjectStore *v8;
  BLTObjectStore *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLTObjectStore;
  v8 = -[BLTObjectStore init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    v9->_elementClass = a4;
  }

  return v9;
}

- (id)keys
{
  void *v3;
  NSString *path;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BLTObjectStore *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  v36 = *MEMORY[0x24BDD0CF0];
  v37[0] = *MEMORY[0x24BDD0CF8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", path, 1, v5, &v34);
  v6 = v34;

  if (v6)
  {
    blt_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BLTObjectStore keys].cold.2();
    v27 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_path;
    v33 = 0;
    objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v9, &v33);
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = v33;

    if (v6)
    {
      blt_general_log();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        -[BLTObjectStore keys].cold.1();
      v27 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[NSObject count](v7, "count"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v7;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v10)
      {
        v11 = v10;
        v23 = v7;
        v24 = 0;
        v12 = *(_QWORD *)v30;
        do
        {
          v13 = 0;
          v25 = v11;
          do
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
            objc_msgSend(v14, "fromHex", v23, v24);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_msgSend(v27, "addObject:", v15);
            }
            else
            {
              objc_msgSend(v14, "hex");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = self;
              -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = 0;
              objc_msgSend(v20, "moveItemAtPath:toPath:error:", v17, v19, &v28);
              v21 = v28;

              if (!v21)
                objc_msgSend(v27, "addObject:", v14);

              self = v18;
              v11 = v25;
            }

            ++v13;
          }
          while (v11 != v13);
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v11);
        v7 = v23;
        v6 = v24;
      }
    }

  }
  return v27;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "hex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v7, &v21);
    v9 = v21;
    if (v9)
    {
      blt_general_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[BLTObjectStore objectForKey:].cold.3((uint64_t)v9, v10);

    }
    objc_msgSend(v8, "decodeObjectOfClass:forKey:", self->_elementClass, *MEMORY[0x24BDD0E88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishDecoding");

  }
  else
  {
    blt_general_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BLTObjectStore objectForKey:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  return v11;
}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "hex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v6, "removeItemAtPath:error:", v5, &v7);

}

- (void)storeObject:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  NSString *path;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  char v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", self->_path, &v32);
  if (v32)
    v10 = v9;
  else
    v10 = 0;

  if ((v10 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  v33 = *MEMORY[0x24BDD0CF0];
  v34[0] = *MEMORY[0x24BDD0CF8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", path, 1, v13, &v31);
  v14 = v31;

  if (!v14)
  {
LABEL_6:
    objc_msgSend(v7, "hex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    v18 = v17;
    if (v6 && v17)
    {
      objc_msgSend(v17, "encodeObject:forKey:", v6, *MEMORY[0x24BDD0E88]);
      objc_msgSend(v18, "encodedData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v19, "writeToFile:options:error:", v16, 268435457, &v30);
      v20 = v30;

    }
    else
    {
      blt_general_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[BLTObjectStore storeObject:withKey:].cold.3(v21, v22, v23, v24, v25, v26, v27, v28);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.objectstore"), 123, &unk_24D7864C8);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v20)
    {
      blt_general_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[BLTObjectStore storeObject:withKey:].cold.1();

    }
    v14 = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)keys
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2173D9000, v0, v1, "%s error creating object store directory: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)objectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "object data not found in store", a5, a6, a7, a8, 0);
}

- (void)objectForKey:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2173D9000, v0, v1, "%s: %@ exception loading object from %@", v2);
}

- (void)objectForKey:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Error initializing unarchiver for object store: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)storeObject:withKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_2173D9000, v0, v1, "%s: %@ error writing data to %@", v2);
}

- (void)storeObject:withKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2173D9000, v0, v1, "%s: %@ exception archiving object", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)storeObject:(uint64_t)a3 withKey:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2173D9000, a1, a3, "Error storing object in object store", a5, a6, a7, a8, 0);
}

@end
