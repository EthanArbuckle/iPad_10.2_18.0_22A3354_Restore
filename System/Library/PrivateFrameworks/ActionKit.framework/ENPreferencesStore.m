@implementation ENPreferencesStore

- (ENPreferencesStore)initWithStoreFilename:(id)a3
{
  id v4;
  ENPreferencesStore *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENPreferencesStore;
  v5 = -[ENPreferencesStore init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "pathnameForStoreFilename:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENPreferencesStore setPathname:](v5, "setPathname:", v6);

    -[ENPreferencesStore load](v5, "load");
  }

  return v5;
}

- (ENPreferencesStore)initWithURL:(id)a3
{
  id v4;
  ENPreferencesStore *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENPreferencesStore;
  v5 = -[ENPreferencesStore init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENPreferencesStore setPathname:](v5, "setPathname:", v6);

    -[ENPreferencesStore load](v5, "load");
  }

  return v5;
}

- (ENPreferencesStore)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Must call -initWithStoreFilename:"));

  return 0;
}

- (id)objectForKey:(id)a3
{
  id v4;
  ENPreferencesStore *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ENPreferencesStore store](v5, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  ENPreferencesStore *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[ENPreferencesStore store](v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v8, "removeObjectForKey:", v6);

  objc_sync_exit(v7);
  -[ENPreferencesStore save](v7, "save");

}

- (id)decodedObjectForKey:(id)a3
{
  id v4;
  ENPreferencesStore *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ENPreferencesStore store](v5, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchiveObjectWithData:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  ENPreferencesStore *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[ENPreferencesStore store](v8, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, v6);

    objc_sync_exit(v8);
    -[ENPreferencesStore save](v8, "save");

  }
}

- (void)save
{
  ENPreferencesStore *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  id v11;

  v2 = self;
  objc_sync_enter(v2);
  -[ENPreferencesStore store](v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 100, 0, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = v5;
  if (v4)
  {
    -[ENPreferencesStore pathname](v2, "pathname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    v8 = objc_msgSend(v4, "writeToFile:options:error:", v7, 1, &v10);
    v9 = v10;

    if ((v8 & 1) == 0)
      NSLog(CFSTR("ENPreferencesStore: Error writing prefs store. %@"), v9);
    v6 = v9;
  }
  else
  {
    NSLog(CFSTR("ENPreferencesStore: Error serializing prefs store. %@"), v5);
  }

}

- (void)removeAllItems
{
  ENPreferencesStore *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[ENPreferencesStore store](v2, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_sync_exit(v2);
  -[ENPreferencesStore save](v2, "save");
}

- (void)load
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ENPreferencesStore *v12;
  id v13;
  uint64_t v14;
  id v15;

  v3 = (void *)MEMORY[0x24BDBCE50];
  -[ENPreferencesStore pathname](self, "pathname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "dataWithContentsOfFile:options:error:", v4, 0, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (!v5)
  {
    v8 = v6;
    goto LABEL_6;
  }
  v13 = 0;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 1, &v14, &v13);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (!v7 || v14 != 100)
  {
    -[ENPreferencesStore pathname](self, "pathname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("ENPreferencesStore: Failed to open preferences store at %@: %@"), v9, v8);

LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENPreferencesStore pathname](self, "pathname");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItemAtPath:error:", v11, 0);

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  v12 = self;
  objc_sync_enter(v12);
  -[ENPreferencesStore setStore:](v12, "setStore:", v7);
  objc_sync_exit(v12);

}

- (NSString)pathname
{
  return self->_pathname;
}

- (void)setPathname:(id)a3
{
  objc_storeStrong((id *)&self->_pathname, a3);
}

- (NSMutableDictionary)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_pathname, 0);
}

+ (id)pathnameForStoreFilename:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19628], "appGroupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerURLForSecurityApplicationGroupIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Preferences"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "stringByAppendingPathComponent:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)preferenceStoreWithSecurityApplicationGroupIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerURLForSecurityApplicationGroupIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc((Class)a1);
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("com.evernote.evernote-sdk-ios.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithURL:", v9);

  return v10;
}

+ (id)defaultPreferenceStore
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStoreFilename:", CFSTR("com.evernote.evernote-sdk-ios.plist"));
}

@end
