@implementation CCDictionaryLog

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  char v24;
  NSDictionary *log;
  NSURL *logFileURL;
  int protectionClass;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  NSDictionary *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  char v41;
  id *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (-[CCDictionaryLog isReadOnly](self, "isReadOnly"))
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v57 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("instance: %@ is read only."), self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = 3;
LABEL_17:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), v14, v12);
    v23 = objc_claimAutoreleasedReturnValue();
    CCSetError(a5, v23);
    v24 = 0;
    goto LABEL_18;
  }
  v15 = objc_msgSend(v8, "count");
  if (v15 != objc_msgSend(v9, "count"))
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v55 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected number of objects: %@ for keys: %@"), v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    v14 = 1;
    goto LABEL_17;
  }
  v42 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v16 = objc_msgSend(v8, "count");
  if (objc_msgSend(v8, "count"))
  {
    for (i = 0; i < objc_msgSend(v8, "count"); ++i)
    {
      objc_msgSend(v8, "objectAtIndex:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", i);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (-[NSDictionary objectForKey:](self->_log, "objectForKey:", v19),
            (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (objc_msgSend(v20, "isEqual:", v18))
        {
          __biome_log_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v49 = v18;
            v50 = 2112;
            v51 = v19;
            _os_log_debug_impl(&dword_237B25000, v21, OS_LOG_TYPE_DEBUG, "object: %@ is already recorded for key: %@", buf, 0x16u);
          }

          --v16;
          goto LABEL_14;
        }
        objc_msgSend(v11, "setObject:forKey:", v20, v19);
      }
      -[NSDictionary setObject:forKey:](self->_log, "setObject:forKey:", v18, v19);
LABEL_14:

    }
  }
  if (!v16)
  {
    v24 = 1;
    goto LABEL_19;
  }
  logFileURL = self->_logFileURL;
  log = self->_log;
  protectionClass = self->_protectionClass;
  v47 = 0;
  v24 = CCWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v47);
  v29 = v47;
  v12 = v29;
  if ((v24 & 1) != 0)
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v49 = v8;
      v50 = 2112;
      v51 = v9;
      v52 = 2112;
      v53 = v11;
      _os_log_debug_impl(&dword_237B25000, v23, OS_LOG_TYPE_DEBUG, "Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x20u);
    }
  }
  else
  {
    v40 = v29;
    v41 = v24;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = v9;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v11, "objectForKey:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = self->_log;
          if (v36)
            -[NSDictionary setObject:forKey:](v37, "setObject:forKey:", v36, v35);
          else
            -[NSDictionary removeObjectForKey:](v37, "removeObjectForKey:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v32);
    }

    v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@"), v8, v30, v11);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v23, "setObject:forKey:", v38, *MEMORY[0x24BDD0FC8]);

    if (v40)
      -[NSObject setObject:forKey:](v23, "setObject:forKey:", v40, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 8, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    CCSetError(v42, v12);
    __biome_log_for_category();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();

    v24 = v41;
  }
LABEL_18:

LABEL_19:
  return v24;
}

- (BOOL)isReadOnly
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (a3 && a4)
  {
    v21 = a3;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[CCDictionaryLog writeUpdatedObjects:forKeys:error:](self, "writeUpdatedObjects:forKeys:error:", v11, v12, a5);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = a4;
    v17 = a3;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Invalid {object: %@ key: %@}"), v17, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 1, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    CCSetError(a5, v18);
    v13 = 0;
  }

  return v13;
}

- (id)objectForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_log, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (CCDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return -[CCDictionaryLog initWithFilename:protectionClass:directory:readOnly:create:error:](self, "initWithFilename:protectionClass:directory:readOnly:create:error:", a3, 0xFFFFFFFFLL, a4, a5, 1, a6);
}

- (CCDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  CCDictionaryLog *v16;
  uint64_t v17;
  NSURL *logFileURL;
  CCDictionaryLog *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  uint64_t v26;
  _QWORD v27[2];

  v9 = a7;
  v10 = a6;
  v27[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CCDictionaryLog;
  v16 = -[CCDictionaryLog init](&v25, sel_init);
  if (!v16)
    goto LABEL_5;
  if (!v14 || !v15)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid {filename: %@, directory: %@}"), v14, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 2, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a8, v23);

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:relativeToURL:", v14, v15);
  v17 = objc_claimAutoreleasedReturnValue();
  logFileURL = v16->_logFileURL;
  v16->_logFileURL = (NSURL *)v17;

  v16->_protectionClass = a4;
  if (!-[CCDictionaryLog _loadLogOrCreate:readOnly:error:](v16, "_loadLogOrCreate:readOnly:error:", v9, v10, a8))
  {
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v19 = v16;
LABEL_8:

  return v19;
}

- (CCDictionaryLog)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  NSURL *logFileURL;
  NSDictionary *v11;
  id v12;
  NSDictionary *log;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_class *v31;
  uint64_t v32;
  NSDictionary *v33;
  char v34;
  NSObject *v35;
  NSDictionary *v36;
  NSDictionary *v37;
  void *v39;
  id *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[2];

  v6 = a4;
  v49[1] = *MEMORY[0x24BDAC8D0];
  -[NSURL path](self->_logFileURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  logFileURL = self->_logFileURL;
  v41 = 0;
  CCReadPropertyList((uint64_t)logFileURL, !v6, (uint64_t)&v41);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v12 = v41;
  log = self->_log;
  self->_log = v11;

  if (self->_log)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v6)
        goto LABEL_24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_24;
      v40 = a5;
      v39 = (void *)MEMORY[0x24BDD1540];
      v48 = *MEMORY[0x24BDD0FC8];
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@"), v16, v18, self->_log, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 5, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v20;
    }
    else
    {
      v40 = a5;
      v29 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0FC8];
      v30 = (void *)MEMORY[0x24BDD17C8];
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("Unexpected plist class (%@) of object: %@ at path: %@"), v16, self->_log, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 5, v19);
      v21 = objc_claimAutoreleasedReturnValue();
    }

    __biome_log_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();
    v12 = (id)v21;
    a5 = v40;
  }
  else
  {
    v22 = objc_msgSend(v12, "code");
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22 == 260)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.2();

      v25 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD1398];
      v45 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v25;
      v28 = 6;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.3();

      if (v12)
      {
        v42 = *MEMORY[0x24BDD1398];
        v43 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = 7;
    }
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), v28, v26);
    v32 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v32;
  }

  if (!a3)
  {
    CCSetError(a5, v12);
    v34 = 0;
    goto LABEL_29;
  }
  if (v6)
  {
    v33 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x24BDBD1B8];

LABEL_24:
    v34 = 1;
    goto LABEL_29;
  }
  __biome_log_for_category();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.1();

  v36 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v37 = self->_log;
  self->_log = v36;

  v34 = CCWritePropertyList((uint64_t)self->_log, self->_logFileURL, self->_protectionClass, (uint64_t)a5);
LABEL_29:

  return v34;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCDictionaryLog;
  -[CCDictionaryLog description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_logFileURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" logFile: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_log, "count");
}

- (id)allKeys
{
  return -[NSDictionary allKeys](self->_log, "allKeys");
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CCDictionaryLog objectForKey:](self, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_10:
    v17 = v8;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (id)objc_msgSend(v7, "mutableCopy");
    goto LABEL_10;
  }
  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    goto LABEL_10;
  }
  v9 = (void *)MEMORY[0x24BDD1540];
  v19 = *MEMORY[0x24BDD0FC8];
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Unexpected object: %@ for key: %@ expected: %@"), v7, v6, v12, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  CCSetError(a4, v15);
  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();

  v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *log;
  NSURL *logFileURL;
  int protectionClass;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[CCDictionaryLog isReadOnly](self, "isReadOnly"))
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("instance: %@ is read only."), self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11 = 3;
LABEL_10:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), v11, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError(a4, v19);

    v15 = 0;
    goto LABEL_20;
  }
  if (!v6)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid key: %@"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v18;
    v11 = 1;
    goto LABEL_10;
  }
  -[NSDictionary objectForKey:](self->_log, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSDictionary removeObjectForKey:](self->_log, "removeObjectForKey:", v6);
    logFileURL = self->_logFileURL;
    log = self->_log;
    protectionClass = self->_protectionClass;
    v23 = 0;
    v15 = CCWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v23);
    v16 = v23;
    if ((v15 & 1) != 0)
    {
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[CCDictionaryLog clearObjectForKey:error:].cold.2();
      v9 = v16;
    }
    else
    {
      -[NSDictionary setObject:forKey:](self->_log, "setObject:forKey:", v8, v6);
      v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to write removal for key: %@ reverting to prior object: %@"), v6, v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v17, "setObject:forKey:", v20, *MEMORY[0x24BDD0FC8]);

      if (v16)
        -[NSObject setObject:forKey:](v17, "setObject:forKey:", v16, *MEMORY[0x24BDD1398]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 8, v17);
      v9 = objc_claimAutoreleasedReturnValue();

      CCSetError(a4, v9);
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();

    }
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CCDictionaryLog clearObjectForKey:error:].cold.1();
    v15 = 1;
  }
LABEL_20:

  return v15;
}

- (BOOL)clear:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSURL *logFileURL;
  char v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!-[CCDictionaryLog isReadOnly](self, "isReadOnly"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_logFileURL, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && objc_msgSend(v7, "fileExistsAtPath:", v8))
    {
      logFileURL = self->_logFileURL;
      v17 = 0;
      v11 = objc_msgSend(v7, "removeItemAtURL:error:", logFileURL, &v17);
      v12 = v17;
      if ((v11 & 1) == 0)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to remove log file at path: %@"), v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x24BDD0FC8]);

        if (v12)
          objc_msgSend(v13, "setObject:forKey:", v12, *MEMORY[0x24BDD1398]);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 8, v13);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        CCSetError(a3, v6);
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();

        goto LABEL_3;
      }
    }
    else
    {
      v12 = 0;
    }
    -[NSDictionary removeAllObjects](self->_log, "removeAllObjects");
    v9 = 1;
    v6 = v12;
    goto LABEL_14;
  }
  v5 = (void *)MEMORY[0x24BDD1540];
  v18 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("instance: %@ is read only."), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.DictionaryLog"), 3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CCSetError(a3, v8);
LABEL_3:
  v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CCDictionaryLog isEqualToDictionaryLog:](self, "isEqualToDictionaryLog:", v4);

  return v5;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (-[NSURL isEqual:](self->_logFileURL, "isEqual:", v4[1])
    && self->_protectionClass == *((_DWORD *)v4 + 6))
  {
    v5 = -[NSDictionary isEqual:](self->_log, "isEqual:", v4[2]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSURL hash](self->_logFileURL, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_protectionClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSDictionary hash](self->_log, "hash");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_logFileURL, 0);
}

- (void)_loadLogOrCreate:readOnly:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "Initializing empty log file at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadLogOrCreate:readOnly:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "No prior log found at path: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loadLogOrCreate:readOnly:error:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_237B25000, v0, OS_LOG_TYPE_ERROR, "Failed to read prior log file at path: %@ error: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadLogOrCreate:readOnly:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_237B25000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clearObjectForKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_237B25000, v0, v1, "No object exists for key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clearObjectForKey:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_237B25000, v0, OS_LOG_TYPE_DEBUG, "Removed object: %@ for key: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
