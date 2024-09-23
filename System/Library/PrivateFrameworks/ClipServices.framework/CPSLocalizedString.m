@implementation CPSLocalizedString

void ___CPSLocalizedString_block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;
  id v9;

  v2 = (const char *)dyld_image_path_containing_address();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", v2, strlen(v2));
  v8 = (id)_CFBundleCopyFrameworkURLForExecutablePath();

  v4 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v2, 0, 0);
    v4 = _CFBundleCopyBundleURLForExecutableURL();
  }
  v9 = (id)v4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void ***)(a1 + 32);
  v7 = *v6;
  *v6 = (void *)v5;

}

@end
