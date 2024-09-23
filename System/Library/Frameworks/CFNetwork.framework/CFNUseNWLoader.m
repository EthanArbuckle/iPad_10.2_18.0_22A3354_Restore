@implementation CFNUseNWLoader

void ____CFNUseNWLoader_block_invoke()
{
  char *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;

  v0 = getenv("CFN_USE_NW_LOADER");
  if (v0)
  {
    v1 = v0;
    if (!strcmp(v0, "1"))
      __CFNUseNWLoader::useNWLoader = 1;
    if (!strcmp(v1, "0"))
      __CFNUseNWLoader::useNWLoader = 2;
  }
  if (__CFNIsInDevelopmentEnvironment::onceToken != -1)
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_21_4777);
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CFNetwork")), "URLForResource:withExtension:", CFSTR("ForceNWLoader"), CFSTR("plist"));
    if (v2)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v2);
      v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)_CFGetProgname()));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v4, "BOOLValue"))
          v5 = 1;
        else
          v5 = 2;
        __CFNUseNWLoader::useNWLoader = v5;
      }
    }
  }
}

@end
