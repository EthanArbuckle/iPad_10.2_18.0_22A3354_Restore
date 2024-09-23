@implementation CoreThemeDefinitionMigrator

- (BOOL)_checkDiskSpace:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_msgSend(v5, "attributesOfItemAtPath:error:", -[NSURL path](self->_documentURL, "path"), 0);
  v7 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0D08]);
  v8 = (void *)objc_msgSend(v5, "attributesOfFileSystemForPath:error:", -[NSString stringByDeletingLastPathComponent](-[CoreThemeDefinitionMigrator temporaryMigrationPath](self, "temporaryMigrationPath"), "stringByDeletingLastPathComponent"), a3);
  if (v8)
  {
    v9 = *MEMORY[0x24BDD0D18];
    objc_msgSend((id)objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDD0D18]), "doubleValue");
    v11 = v10 * 0.5;
    objc_msgSend(v7, "doubleValue");
    if (v11 >= v12)
    {
      v19 = (void *)objc_msgSend((id)objc_msgSend(v5, "attributesOfFileSystemForPath:error:", -[NSURL path](self->_documentURL, "path"), 0), "objectForKey:", v9);
      v20 = objc_msgSend(v7, "unsignedLongLongValue");
      if (v20 <= objc_msgSend(v19, "unsignedLongLongValue"))
      {
        LOBYTE(v8) = 1;
        return (char)v8;
      }
      if (a3)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        v22 = CoreThemeDefinitionErrorDomain[0];
        v23 = (void *)MEMORY[0x24BDBCE70];
        v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Space too tight for migration on %@'s volume"), -[NSString lastPathComponent](-[NSURL path](self->_documentURL, "path"), "lastPathComponent"));
        v15 = objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, *MEMORY[0x24BDD0FD8], 0);
        v16 = v21;
        v17 = v22;
        v18 = 9;
        goto LABEL_8;
      }
    }
    else if (a3)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = CoreThemeDefinitionErrorDomain[0];
      v15 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Space too tight for migration on startup volume"), *MEMORY[0x24BDD0FD8], 0);
      v16 = v13;
      v17 = v14;
      v18 = 8;
LABEL_8:
      v25 = (void *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v15);
      LOBYTE(v8) = 0;
      *a3 = v25;
      return (char)v8;
    }
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (BOOL)_updateMetadata:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;

  v5 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", -[CoreThemeDefinitionMigrator temporaryMigrationPath](self, "temporaryMigrationPath"));
  v6 = *MEMORY[0x24BDBB580];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBB738], "metadataForPersistentStoreOfType:URL:options:error:", *MEMORY[0x24BDBB580], v5, 0, a3);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_oldVersion), CFSTR("PreviousCoreThemeDefinitionDataModelKey"));
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_newVersion), CFSTR("CoreThemeDefinitionDataModelKey"));
    v9 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v9, "UUIDString"), CFSTR("uuid"));

    v10 = objc_msgSend(MEMORY[0x24BDBB738], "setMetadata:forPersistentStoreOfType:URL:options:error:", v8, v6, v5, 0, a3);
    LOBYTE(v7) = v10;
  }
  return (char)v7;
}

- (CoreThemeDefinitionMigrator)initWithURL:(id)a3 oldVersion:(int64_t)a4 newVersion:(int64_t)a5
{
  CoreThemeDefinitionMigrator *v8;
  CoreThemeDefinitionMigrator *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  objc_super v19;
  char __s[1024];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)CoreThemeDefinitionMigrator;
  v8 = -[CoreThemeDefinitionMigrator init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_oldVersion = a4;
    v8->_newVersion = a5;
    v8->_documentURL = (NSURL *)a3;
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreThemeDefinition"));
    v11 = objc_msgSend(v10, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", a4), CFSTR("mom"));
    v12 = objc_msgSend(v10, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", a5), CFSTR("mom"));
    v13 = (void *)v12;
    if (v11)
    {
      v14 = objc_alloc(MEMORY[0x24BDBB6B0]);
      v15 = (void *)objc_msgSend(v14, "initWithContentsOfURL:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11));
      if (!v13)
        goto LABEL_9;
    }
    else
    {
      v15 = 0;
      if (!v12)
      {
LABEL_9:

        return 0;
      }
    }
    v16 = objc_alloc(MEMORY[0x24BDBB6B0]);
    v17 = objc_msgSend(v16, "initWithContentsOfURL:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13));
    v13 = (void *)v17;
    if (!v15 || !v17)
      goto LABEL_9;
    v9->_migrationManager = (NSMigrationManager *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6D0]), "initWithSourceModel:destinationModel:", v15, v17);

    -[NSString getFileSystemRepresentation:maxLength:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("CoreThemeDefinitionMigrationXXXXXX")), "getFileSystemRepresentation:maxLength:", __s, 1024);
    mktemp(__s);
    -[CoreThemeDefinitionMigrator setTemporaryMigrationPath:](v9, "setTemporaryMigrationPath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "stringWithFileSystemRepresentation:length:", __s, strlen(__s)), "stringByAppendingPathExtension:", objc_msgSend(a3, "pathExtension")));
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CoreThemeDefinitionMigrator setTemporaryMigrationPath:](self, "setTemporaryMigrationPath:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CoreThemeDefinitionMigrator;
  -[CoreThemeDefinitionMigrator dealloc](&v3, sel_dealloc);
}

- (id)mappingModelForMigrationWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  int64_t oldVersion;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  id v26;
  id v27;
  objc_class *v28;
  objc_class *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBB6C0], "inferredMappingModelForSourceModel:destinationModel:error:", -[NSMigrationManager sourceModel](self->_migrationManager, "sourceModel"), -[NSMigrationManager destinationModel](self->_migrationManager, "destinationModel"), a3);
  v5 = -[NSDictionary objectForKey:](-[NSManagedObjectModel entitiesByName](-[NSMigrationManager sourceModel](self->_migrationManager, "sourceModel"), "entitiesByName"), "objectForKey:", CFSTR("SimpleArtworkRenditionSpec"));
  v6 = -[NSDictionary objectForKey:](-[NSManagedObjectModel entitiesByName](-[NSMigrationManager sourceModel](self->_migrationManager, "sourceModel"), "entitiesByName"), "objectForKey:", CFSTR("SimpleArtworkElementProduction"));
  v7 = -[NSDictionary objectForKey:](-[NSManagedObjectModel entitiesByName](-[NSMigrationManager sourceModel](self->_migrationManager, "sourceModel"), "entitiesByName"), "objectForKey:", CFSTR("Asset"));
  oldVersion = self->_oldVersion;
  if (oldVersion <= 21)
  {
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_msgSend(v4, "entityMappings");
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v15, "destinationEntityName"), "isEqualToString:", CFSTR("Slice")))v12 = v15;
          if (-[NSEntityDescription isKindOfEntity:](-[NSMigrationManager sourceEntityForEntityMapping:](self->_migrationManager, "sourceEntityForEntityMapping:", v15), "isKindOfEntity:", v5))
          {
            v11 = v15;
          }
          if (-[NSEntityDescription isKindOfEntity:](-[NSMigrationManager sourceEntityForEntityMapping:](self->_migrationManager, "sourceEntityForEntityMapping:", v15), "isKindOfEntity:", v6))
          {
            v16 = (objc_class *)objc_opt_class();
            objc_msgSend(v15, "setEntityMigrationPolicyClassName:", NSStringFromClass(v16));
            objc_msgSend(v15, "setName:", objc_msgSend(CFSTR("POH_"), "stringByAppendingString:", objc_msgSend(v15, "name")));
          }
          if (-[NSEntityDescription isKindOfEntity:](-[NSMigrationManager sourceEntityForEntityMapping:](self->_migrationManager, "sourceEntityForEntityMapping:", v15), "isKindOfEntity:", v7))
          {
            v17 = (objc_class *)objc_opt_class();
            objc_msgSend(v15, "setEntityMigrationPolicyClassName:", NSStringFromClass(v17));
            objc_msgSend(v15, "setName:", objc_msgSend(CFSTR("POH_"), "stringByAppendingString:", objc_msgSend(v15, "name")));
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    v28 = (objc_class *)objc_opt_class();
    objc_msgSend(v12, "setEntityMigrationPolicyClassName:", NSStringFromClass(v28));
    objc_msgSend(v12, "setName:", objc_msgSend(CFSTR("POH_"), "stringByAppendingString:", objc_msgSend(v12, "name")));
    v29 = (objc_class *)objc_opt_class();
    objc_msgSend(v11, "setEntityMigrationPolicyClassName:", NSStringFromClass(v29));
    objc_msgSend(v11, "setName:", objc_msgSend(CFSTR("POH_"), "stringByAppendingString:", objc_msgSend(v11, "name")));
    v26 = objc_alloc_init(MEMORY[0x24BDBB6C0]);
    v4 = v26;
    v27 = obj;
LABEL_33:
    objc_msgSend(v26, "setEntityMappings:", v27);
    return v4;
  }
  if (oldVersion == 22)
  {
    v18 = (void *)objc_msgSend(v4, "entityMappings");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          if (-[NSEntityDescription isKindOfEntity:](-[NSMigrationManager sourceEntityForEntityMapping:](self->_migrationManager, "sourceEntityForEntityMapping:", v23), "isKindOfEntity:", v6))
          {
            v24 = (objc_class *)objc_opt_class();
            objc_msgSend(v23, "setEntityMigrationPolicyClassName:", NSStringFromClass(v24));
            objc_msgSend(v23, "setName:", objc_msgSend(CFSTR("POH_"), "stringByAppendingString:", objc_msgSend(v23, "name")));
          }
          if (-[NSEntityDescription isKindOfEntity:](-[NSMigrationManager sourceEntityForEntityMapping:](self->_migrationManager, "sourceEntityForEntityMapping:", v23), "isKindOfEntity:", v7))
          {
            v25 = (objc_class *)objc_opt_class();
            objc_msgSend(v23, "setEntityMigrationPolicyClassName:", NSStringFromClass(v25));
            objc_msgSend(v23, "setName:", objc_msgSend(CFSTR("POH_"), "stringByAppendingString:", objc_msgSend(v23, "name")));
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v20);
    }
    v26 = objc_alloc_init(MEMORY[0x24BDBB6C0]);
    v4 = v26;
    v27 = v18;
    goto LABEL_33;
  }
  return v4;
}

- (BOOL)migrateWithError:(id *)a3
{
  int64_t oldVersion;
  int64_t newVersion;
  id v5;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  oldVersion = self->_oldVersion;
  newVersion = self->_newVersion;
  if (oldVersion == newVersion)
    goto LABEL_2;
  if (oldVersion >= newVersion)
  {
    if (a3)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Migration code not written yet."), *MEMORY[0x24BDD0FD8], 0));
      LOBYTE(v5) = 0;
      *a3 = v10;
      return (char)v5;
    }
    goto LABEL_12;
  }
  LODWORD(v5) = -[CoreThemeDefinitionMigrator _checkDiskSpace:](self, "_checkDiskSpace:", a3);
  if ((_DWORD)v5)
  {
    v5 = -[CoreThemeDefinitionMigrator mappingModelForMigrationWithError:](self, "mappingModelForMigrationWithError:", a3);
    if (v5)
    {
      v8 = v5;
      v9 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", -[CoreThemeDefinitionMigrator temporaryMigrationPath](self, "temporaryMigrationPath"));
      LODWORD(v5) = -[NSMigrationManager migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:](self->_migrationManager, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", self->_documentURL, *MEMORY[0x24BDBB580], 0, v8, v9, *MEMORY[0x24BDBB580], 0, a3);
      if ((_DWORD)v5)
      {
        if (-[CoreThemeDefinitionMigrator _updateMetadata:](self, "_updateMetadata:", a3))
        {
LABEL_2:
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v12 = 0;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v9, &v12) & 1) == 0)
          NSLog(CFSTR("Failed to remove temporary, incompletely migrated document from %@:\n\t%@"), v9, v12);
LABEL_12:
        LOBYTE(v5) = 0;
      }
    }
  }
  return (char)v5;
}

- (NSString)temporaryMigrationPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTemporaryMigrationPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

@end
