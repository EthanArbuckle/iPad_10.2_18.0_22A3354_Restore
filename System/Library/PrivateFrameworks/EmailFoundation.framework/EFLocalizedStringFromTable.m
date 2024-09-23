@implementation EFLocalizedStringFromTable

void ___EFLocalizedStringFromTable_block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;
  id v9;

  if (**(_QWORD **)(a1 + 32))
    ___EFLocalizedStringFromTable_block_invoke_cold_1();
  v2 = (const char *)dyld_image_path_containing_address();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFileSystemRepresentation:length:", v2, strlen(v2));
  v3 = _CFBundleCopyFrameworkURLForExecutablePath();

  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v2, 0, 0);
    v4 = _CFBundleCopyBundleURLForExecutableURL();
    if (!v4)
      __assert_rtn("_EFLocalizedStringFromTable_block_invoke", "EFLocalizableStrings.m", 32, "URL");
  }
  v9 = (id)v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void ***)(a1 + 32);
  v7 = *v6;
  *v6 = (void *)v5;

  if (!**(_QWORD **)(a1 + 32))
    __assert_rtn("_EFLocalizedStringFromTable_block_invoke", "EFLocalizableStrings.m", 35, "*bundle");

}

void ___EFLocalizedStringFromTable_block_invoke_cold_1()
{
  __assert_rtn("_EFLocalizedStringFromTable_block_invoke", "EFLocalizableStrings.m", 25, "!*bundle");
}

@end
