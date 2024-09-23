@implementation BADownload

+ (id)classesForSerialization
{
  if (classesForSerialization_onceToken != -1)
    dispatch_once(&classesForSerialization_onceToken, &__block_literal_global_2);
  return (id)classesForSerialization_collections;
}

void __50__BADownload_VeryPrivate__classesForSerialization__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[NSSet _baassets_collectionClasses]();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)classesForSerialization_collections;
  classesForSerialization_collections = v0;

  v2 = (void *)classesForSerialization_collections;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3, v6, v7, v8, v9, v10, v11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)classesForSerialization_collections;
  classesForSerialization_collections = v4;

}

- (void)syncTo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  char *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "priority");
  v5 = 1000;
  if (v4 <= 1000)
    v5 = objc_msgSend(v9, "priority");
  -[BADownload setPriority:](self, "setPriority:", v5);
  -[BADownload setNecessity:](self, "setNecessity:", objc_msgSend(v9, "necessity"));
  -[BADownload stagedDownloadedFileURL](v9, v6);
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  -[BADownload setStagedDownloadedFileURL:](self, v7);

  v8 = -[BADownload internalState](v9);
  -[BADownload setInternalState:](self, v8);

}

- (BOOL)cloneDownloadToFinalDestinationURL:(id *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  id v23;
  int v24;
  BOOL v25;
  int *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id *v40;
  void *v41;
  char v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BADownload applicationGroupIdentifier](self, "applicationGroupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerURLForSecurityApplicationGroupIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("Library/Caches/com.apple.BackgroundAssets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0;
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v11, &v42);

    if (v12)
    {
      if (v42)
      {
LABEL_6:
        v40 = a4;
        v41 = v7;
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "substringToIndex:", 8);
        v15 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BAFile-%@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("tmp"));
        v17 = v10;
        v38 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLByAppendingPathComponent:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        while (1)
        {
          -[BADownload stagedDownloadedFileURL](self, v18);
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = (const char *)objc_msgSend(v21, "fileSystemRepresentation");
          v23 = objc_retainAutorelease(v19);
          v24 = clonefile(v22, (const char *)objc_msgSend(v23, "fileSystemRepresentation"), 3u);
          v25 = v24 == 0;

          if (!v24)
            break;
          v26 = __error();
          if (v20 == 0x7FFFFFFFFFFFFFFFLL || *v26 != 17)
          {
            v7 = v41;
            if (v40)
            {
              v43[0] = CFSTR("SourceURL");
              -[BADownload stagedDownloadedFileURL](self, v27);
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = (void *)v33;
              if (!v33)
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v33 = objc_claimAutoreleasedReturnValue();
              }
              v37 = (void *)v33;
              v43[1] = CFSTR("DestURL");
              v44[0] = v33;
              v35 = v23;
              if (!v23)
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v44[1] = v35;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                if (v34)
                  goto LABEL_30;
LABEL_34:

              }
              else
              {

                if (!v34)
                  goto LABEL_34;
              }
LABEL_30:

              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), v36);
              *v40 = (id)objc_claimAutoreleasedReturnValue();

            }
            v31 = (void *)v38;
            v30 = v39;
            if (!a3)
            {
LABEL_21:

              goto LABEL_22;
            }
LABEL_20:
            *a3 = 0;
            goto LABEL_21;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%ld.%@"), v16, ++v20, CFSTR("tmp"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLByAppendingPathComponent:", v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (a3)
          *a3 = objc_retainAutorelease(v23);
        a3 = v40;
        v7 = v41;
        v31 = (void *)v38;
        v30 = v39;
        if (!v40)
          goto LABEL_21;
        goto LABEL_20;
      }
      objc_msgSend(v7, "removeItemAtURL:error:", v10, 0);
    }
    objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);
    goto LABEL_6;
  }
  BAClientLogObject();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[BADownload(VeryPrivate) cloneDownloadToFinalDestinationURL:error:].cold.1(self, v29);

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 2, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = 0;
  if (a3)
    *a3 = 0;
LABEL_22:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BADownload)init
{
  BADownload *result;
  int v3;
  const char *v4;

  result = (BADownload *)os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "BADownload cannot be constructed using -init.";
    _os_log_fault_impl(&dword_21ABD8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BADownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BADownload)initWithCoder:(id)a3
{
  id v4;
  BADownload *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  SEL v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BADownload;
  v5 = -[BADownload init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BADownload setIdentifier:](v5, "setIdentifier:", v6);

    -[BADownload setInternalState:](v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("internalState")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("necessity")))
    {
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("necessity"));
      objc_opt_self();
      if (v7 >= 2)
        v8 = 0;
      else
        v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    -[BADownload setNecessity:](v5, "setNecessity:", v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    if (v10 >= 1000)
      v11 = 1000;
    else
      v11 = v10;
    -[BADownload setPriority:](v5, "setPriority:", v11);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BADownload setUniqueIdentifier:](v5, "setUniqueIdentifier:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationGroupIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BADownload setApplicationGroupIdentifier:](v5, "setApplicationGroupIdentifier:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedDownloadedFileURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v5, v15, v14, 64);

    -[BADownload setClientSpecifiedFileSize:](v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientSpecifiedFileSize")));
  }

  return v5;
}

- (void)setInternalState:(void *)a1
{
  _QWORD *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    obj[2] = a2;
    objc_sync_exit(obj);

  }
}

- (void)setStagedDownloadedFileURL:(void *)a1
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 64);
}

- (void)setClientSpecifiedFileSize:(void *)a1
{
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *obj;

  if (a1)
  {
    v4 = objc_msgSend(a1, "necessity");
    if (a2 || v4 != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      obj = a1;
      objc_sync_enter(obj);
      obj[4] = a2;
      objc_sync_exit(obj);

    }
    else
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
      if (v5)
        -[BADownload setClientSpecifiedFileSize:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
      qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: The provided fileSize for BADownload must be a posit"
                                 "ive number that matches the actual file size on the server.";
      __break(1u);
    }
  }
}

- (id)initPrivatelyWithApplicationGroupIdentifier:(id)a3
{
  id v4;
  BADownload *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BADownload *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BADownload;
  v5 = -[BADownload init](&v22, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Provided applicationGroupIdentifier must be a valid string."), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise");
LABEL_11:

    v18 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordForCurrentProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current process is not contained in an app bundle.So the request app group is not available: %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise");
LABEL_10:

    goto LABEL_11;
  }
  v7 = v6;
  objc_msgSend(v6, "groupContainerURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v4);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current app has no app groups it is a member of %@"), v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "raise");

    goto LABEL_10;
  }

  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BADownload setInternalState:](v5, 0);
  -[BADownload setPriority:](v5, "setPriority:", 0);
  -[BADownload setApplicationGroupIdentifier:](v5, "setApplicationGroupIdentifier:", v4);
  -[BADownload setNecessity:](v5, "setNecessity:", 0);
  -[BADownload setClientSpecifiedFileSize:](v5, 0);
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[BADownload applicationGroupIdentifier](v5, "applicationGroupIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@.%@"), v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BADownload setUniqueIdentifier:](v5, "setUniqueIdentifier:", v17);

LABEL_6:
  v18 = v5;
LABEL_12:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  BADownload *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  id v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[BADownload identifier](v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[BADownload internalState](v4), CFSTR("internalState"));
  objc_msgSend(v12, "encodeInteger:forKey:", -[BADownload necessity](v4, "necessity"), CFSTR("necessity"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BADownload priority](v4, "priority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("priority"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[BADownload clientSpecifiedFileSize](v4), CFSTR("clientSpecifiedFileSize"));
  -[BADownload uniqueIdentifier](v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("uniqueIdentifier"));

  -[BADownload applicationGroupIdentifier](v4, "applicationGroupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("applicationGroupIdentifier"));

  if (v4 && objc_getProperty(v4, v9, 64, 1))
  {
    v11 = objc_getProperty(v4, v10, 64, 1);
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("stagedDownloadedFileURL"));

  }
  objc_sync_exit(v4);

}

- (uint64_t)internalState
{
  _QWORD *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = a1;
  objc_sync_enter(v1);
  v2 = v1[2];
  objc_sync_exit(v1);

  return v2;
}

- (uint64_t)clientSpecifiedFileSize
{
  _QWORD *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = a1;
  objc_sync_enter(v1);
  v2 = v1[4];
  objc_sync_exit(v1);

  return v2;
}

- (id)stagedDownloadedFileURL
{
  if (result)
    return objc_getProperty(result, a2, 64, 1);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BADownload *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  id Property;
  id v22;
  void *v23;
  SEL v24;

  v5 = (void *)objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  if (v6 == v7)
    v5 = (void *)+[BAManifestDownload superclass](BAManifestDownload, "superclass");
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_msgSend(v5, "allocWithZone:", a3);
  -[BADownload applicationGroupIdentifier](v8, "applicationGroupIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initPrivatelyWithApplicationGroupIdentifier:", v10);

  if (v11)
  {
    -[BADownload identifier](v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
    objc_msgSend(v11, "setIdentifier:", v13);

    v14 = -[BADownload internalState](v8);
    -[BADownload setInternalState:](v11, v14);
    objc_msgSend(v11, "setPriority:", -[BADownload priority](v8, "priority"));
    if (v6 == v7)
    {
      objc_msgSend(v11, "setNecessity:", 0);
      v15 = 0;
    }
    else
    {
      objc_msgSend(v11, "setNecessity:", -[BADownload necessity](v8, "necessity"));
      v15 = -[BADownload clientSpecifiedFileSize](v8);
    }
    -[BADownload setClientSpecifiedFileSize:](v11, v15);
    -[BADownload uniqueIdentifier](v8, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
    objc_msgSend(v11, "setUniqueIdentifier:", v17);

    -[BADownload applicationGroupIdentifier](v8, "applicationGroupIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
    objc_msgSend(v11, "setApplicationGroupIdentifier:", v19);

    if (v8)
      Property = objc_getProperty(v8, v20, 64, 1);
    else
      Property = 0;
    v22 = Property;
    v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
    objc_setProperty_atomic(v11, v24, v23, 64);

  }
  objc_sync_exit(v8);

  return v11;
}

- (BADownloaderPriority)priority
{
  BADownload *v2;
  BADownloaderPriority priority;

  v2 = self;
  objc_sync_enter(v2);
  priority = v2->_priority;
  objc_sync_exit(v2);

  return priority;
}

- (void)setPriority:(int64_t)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BADownload *obj;

  if (a3 > 1000)
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v4)
      -[BADownload setPriority:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Priority cannot be set to a value greater than BADownl"
                               "oaderPriorityMax.";
    __break(1u);
  }
  else if (a3 >= -1000)
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_priority = a3;
    objc_sync_exit(obj);

    return;
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (v12)
    -[BADownload setPriority:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Priority cannot be set to a value less than BADownloaderPriorityMin.";
  __break(1u);
}

- (BOOL)isEssential
{
  BADownload *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_necessity == 1;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)necessity
{
  BADownload *v2;
  int64_t necessity;

  v2 = self;
  objc_sync_enter(v2);
  necessity = v2->_necessity;
  objc_sync_exit(v2);

  return necessity;
}

- (void)setNecessity:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BADownload *obj;

  objc_opt_self();
  if ((unint64_t)a3 >= 2)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v5)
      -[BADownload setNecessity:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Cannot provide an unsupported BADownloadNecessity.";
    __break(1u);
  }
  else
  {
    obj = self;
    objc_sync_enter(obj);
    obj->_necessity = a3;
    objc_sync_exit(obj);

  }
}

- (BADownloadState)state
{
  BADownload *v2;
  unint64_t v3;
  BADownloadState v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[BADownload internalState](v2);
  if (v3 > 8)
    v4 = BADownloadStateFailed;
  else
    v4 = qword_21ABEAE98[v3];
  objc_sync_exit(v2);

  return v4;
}

- (BADownload)copyAsNonEssential
{
  BADownload *v2;

  v2 = (BADownload *)-[BADownload copy](self, "copy");
  -[BADownload setNecessity:](v2, "setNecessity:", 0);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  BADownload *v4;
  BADownload *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (BADownload *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[BADownload uniqueIdentifier](self, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BADownload uniqueIdentifier](v5, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[BADownload identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BADownload identifier](v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[BADownload uniqueIdentifier](self, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BADownload identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BADownload identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BADownloadNecessityToString(-[BADownload necessity](self, "necessity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p): [ID:%@, Necessity:%@]"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  id Property;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BADownload identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (%p): %@\n"), v5, self, v6);

  v8 = -[BADownload internalState](self);
  if ((unint64_t)(v8 + 2) > 0xA)
    v9 = CFSTR("???");
  else
    v9 = off_24DDBF1D0[v8 + 2];
  objc_msgSend(v7, "appendFormat:", CFSTR("State: %@\n"), v9);
  objc_msgSend(v7, "appendFormat:", CFSTR("Priority: %lu\n"), -[BADownload priority](self, "priority"));
  BADownloadNecessityToString(-[BADownload necessity](self, "necessity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("Download Necessity: %@\n"), v10);

  -[BADownload uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("Unique identifier: %@\n"), v11);

  -[BADownload applicationGroupIdentifier](self, "applicationGroupIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("App Group identifier: %@\n"), v12);

  if (self)
    Property = objc_getProperty(self, v13, 64, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendFormat:", CFSTR("Staged file url: %@\n"), Property);
  objc_msgSend(v7, "appendFormat:", CFSTR("Client file size: %ld\n"), -[BADownload clientSpecifiedFileSize](self));
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSString)applicationGroupIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationGroupIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedDownloadedFileURL, 0);
  objc_storeStrong((id *)&self->_applicationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setClientSpecifiedFileSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setPriority:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setPriority:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setNecessity:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
