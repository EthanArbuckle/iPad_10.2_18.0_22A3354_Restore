@implementation DYStandardPluginDirectoryProvider

+ (id)_developerDirectory
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke;
  block[3] = &unk_250D587B0;
  block[4] = a1;
  if (_developerDirectory_once != -1)
    dispatch_once(&_developerDirectory_once, block);
  return (id)_developerDirectory_s_developerDirectory;
}

void __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  if (!v1)
    __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke_cold_1();
  v2 = (void *)v1;
  v6 = (id)objc_opt_new();
  v3 = getenv("GT_DEVELOPER_DIR");
  if ((v3 || (v3 = getenv("XCODE_DEVELOPER_DIR_PATH")) != 0)
    && objc_msgSend(v6, "fileExistsAtPath:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3)))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", objc_msgSend((id)objc_msgSend(v6, "stringWithFileSystemRepresentation:length:", v3, strlen(v3)), "stringByStandardizingPath"));
  }
  else
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "bundleURL"), "URLByDeletingLastPathComponent"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", CFSTR("Developer"));
  }
  v5 = v4;
  if (objc_msgSend(v6, "fileExistsAtPath:", objc_msgSend(v4, "path")))
    _developerDirectory_s_developerDirectory = objc_msgSend(v5, "copy");

}

- (DYStandardPluginDirectoryProvider)init
{
  -[DYStandardPluginDirectoryProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYStandardPluginDirectoryProvider)initWithBundle:(id)a3 includeDeveloperDirectory:(BOOL)a4 includeBundleDirectory:(BOOL)a5
{
  DYStandardPluginDirectoryProvider *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DYStandardPluginDirectoryProvider;
  v8 = -[DYPluginDirectoryProvider init](&v10, sel_init);
  if (v8)
  {
    v8->_bundle = (NSBundle *)a3;
    v8->_includeDeveloperDirectory = a4;
    v8->_includeBundleDirectory = a5;
    v8->super._developerDirectory = (NSURL *)objc_msgSend((id)objc_opt_class(), "_developerDirectory");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYStandardPluginDirectoryProvider;
  -[DYStandardPluginDirectoryProvider dealloc](&v3, sel_dealloc);
}

- (void)enumerateDirectories:(id)a3
{
  void *v5;
  NSURL *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v6 = -[NSURL URLByStandardizingPath](-[NSBundle bundleURL](self->_bundle, "bundleURL"), "URLByStandardizingPath");
  if (self->_includeBundleDirectory)
    (*((void (**)(id, NSURL *))a3 + 2))(a3, v6);
  (*((void (**)(id, NSURL *))a3 + 2))(a3, -[NSURL URLByStandardizingPath](-[NSBundle builtInPlugInsURL](self->_bundle, "builtInPlugInsURL"), "URLByStandardizingPath"));
  if (getenv("GT_SIBLING_PLUGINS"))
    (*((void (**)(id, NSURL *))a3 + 2))(a3, -[NSURL URLByDeletingLastPathComponent](v6, "URLByDeletingLastPathComponent"));
  if (self->_includeDeveloperDirectory)
  {
    if (self->super._developerDirectory)
    {
      v7 = -[NSDictionary objectForKey:](-[NSBundle infoDictionary](self->_bundle, "infoDictionary"), "objectForKey:", CFSTR("CFBundleName"));
      v8 = -[DYPluginDirectoryProvider getPlatformDirectoriesWithBundleName:](self, "getPlatformDirectoriesWithBundleName:", v7);
      (*((void (**)(id, NSURL *))a3 + 2))(a3, -[NSURL URLByAppendingPathComponent:](self->super._developerDirectory, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Library/%@/PlugIns"), v7)));
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }
    }
  }

}

void __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke_cold_1()
{
  __assert_rtn("+[DYStandardPluginDirectoryProvider _developerDirectory]_block_invoke", ", 0, "gputools");
}

@end
