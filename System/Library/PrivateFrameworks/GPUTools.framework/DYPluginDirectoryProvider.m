@implementation DYPluginDirectoryProvider

- (DYPluginDirectoryProvider)init
{
  uint64_t v4;
  objc_super v6;

  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    -[DYPluginDirectoryProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

    return 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DYPluginDirectoryProvider;
    return -[DYPluginDirectoryProvider init](&v6, sel_init);
  }
}

- (void)enumerateDirectories:(id)a3
{
  -[DYPluginDirectoryProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)getPlatformDirectoriesWithBundleName:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSURL *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!self->_developerDirectory)
    return 0;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Developer/Library/%@/PlugIns"), a3);
  v8 = -[NSURL URLByAppendingPathComponent:](self->_developerDirectory, "URLByAppendingPathComponent:", CFSTR("Platforms"));
  v9 = *MEMORY[0x24BDBCC60];
  v10 = (void *)objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDBCCD0], *MEMORY[0x24BDBCC60], 0), 0, 0);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        v17 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v17, v9, 0);
        if (objc_msgSend((id)objc_msgSend(v15, "pathExtension"), "isEqualToString:", CFSTR("platform")))
        {
          if (objc_msgSend(v17, "BOOLValue"))
            objc_msgSend(v6, "addObject:", objc_msgSend(v15, "URLByAppendingPathComponent:", v7));
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  return v6;
}

@end
