@implementation LCFModelStoreUtils

+ (void)SwitchToMobile
{
  uid_t v2;
  passwd *v3;
  uid_t pw_uid;

  v2 = geteuid();
  v3 = getpwnam("mobile");
  if (v3)
    pw_uid = v3->pw_uid;
  else
    pw_uid = 501;
  if (pw_uid != v2)
  {
    if (seteuid(pw_uid))
      NSLog(CFSTR("seteuid to mobile failed."));
  }
}

+ (BOOL)isPlatformiOS
{
  return 1;
}

+ (BOOL)isEnabledOnMacOS
{
  return 1;
}

+ (BOOL)isPlatformMacOS
{
  return 0;
}

+ (BOOL)isPlatformWatchOS
{
  return 0;
}

+ (BOOL)isPlatformtvOS
{
  return 0;
}

+ (BOOL)isSupportedPlatform
{
  return +[LCFModelStoreUtils isPlatformiOS](LCFModelStoreUtils, "isPlatformiOS")
      || +[LCFModelStoreUtils isPlatformtvOS](LCFModelStoreUtils, "isPlatformtvOS")
      || +[LCFModelStoreUtils isPlatformWatchOS](LCFModelStoreUtils, "isPlatformWatchOS")
      || +[LCFModelStoreUtils isPlatformMacOS](LCFModelStoreUtils, "isPlatformMacOS")
      && +[LCFModelStoreUtils isEnabledOnMacOS](LCFModelStoreUtils, "isEnabledOnMacOS");
}

+ (id)getBaseLocalPath
{
  __CFString *v2;
  size_t v4;
  char *v5;
  void *v6;

  if (+[LCFModelStoreUtils isPlatformiOS](LCFModelStoreUtils, "isPlatformiOS")
    || +[LCFModelStoreUtils isPlatformWatchOS](LCFModelStoreUtils, "isPlatformWatchOS")
    || +[LCFModelStoreUtils isPlatformtvOS](LCFModelStoreUtils, "isPlatformtvOS"))
  {
    v2 = CFSTR("/private/var/mobile/Library/Application Support/com.apple.LighthouseCoreMLModelStore");
  }
  else if (+[LCFModelStoreUtils isEnabledOnMacOS](LCFModelStoreUtils, "isEnabledOnMacOS")
         && +[LCFModelStoreUtils isPlatformMacOS](LCFModelStoreUtils, "isPlatformMacOS"))
  {
    v4 = confstr(0x10000, 0, 0);
    v5 = (char *)malloc_type_malloc(v4, 0x51DA0348uLL);
    confstr(0x10000, v5, 0x1F4uLL);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("/com.apple.LighthouseCoreMLModelStore/"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)sha256For:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

+ (id)sha256ForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 0, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      v13 = v3;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v3 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v12);

        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v3, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendData:", v14);

        ++v12;
        v13 = v3;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

  +[LCFModelStoreUtils sha256For:](LCFModelStoreUtils, "sha256For:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
