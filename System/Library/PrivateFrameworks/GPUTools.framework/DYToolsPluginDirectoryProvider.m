@implementation DYToolsPluginDirectoryProvider

- (DYToolsPluginDirectoryProvider)init
{
  -[DYToolsPluginDirectoryProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYToolsPluginDirectoryProvider)initWithDeveloperPath:(id)a3 includePrivatePlugins:(BOOL)a4
{
  DYToolsPluginDirectoryProvider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DYToolsPluginDirectoryProvider;
  v6 = -[DYPluginDirectoryProvider init](&v8, sel_init);
  if (v6)
  {
    v6->super._developerDirectory = (NSURL *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
    v6->_toolsPluginBundle = (NSString *)CFSTR("GPUToolsPlatform");
    v6->_toolsPrivatePluginBundle = (NSString *)CFSTR("GPUToolsPlatformPrivate");
    v6->_includePrivatePlugins = a4;
  }
  return v6;
}

- (void)enumerateDirectories:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObjectsFromArray:", -[DYPluginDirectoryProvider getPlatformDirectoriesWithBundleName:](self, "getPlatformDirectoriesWithBundleName:", self->_toolsPluginBundle));
  if (self->_includePrivatePlugins)
    objc_msgSend(v5, "addObjectsFromArray:", -[DYPluginDirectoryProvider getPlatformDirectoriesWithBundleName:](self, "getPlatformDirectoriesWithBundleName:", self->_toolsPrivatePluginBundle));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

@end
