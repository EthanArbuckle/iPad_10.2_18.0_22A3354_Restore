@implementation NSBundle

void __51__NSBundle_AppStoreComponents__asc_frameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppStoreComponents"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)asc_frameworkBundle_appStoreComponents;
  asc_frameworkBundle_appStoreComponents = v0;

  if (!asc_frameworkBundle_appStoreComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Could not find AppStoreComponents framework bundle"), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
}

@end
