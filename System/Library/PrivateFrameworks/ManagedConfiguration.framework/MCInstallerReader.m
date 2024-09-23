@implementation MCInstallerReader

+ (id)sharedReader
{
  if (sharedReader_once != -1)
    dispatch_once(&sharedReader_once, &__block_literal_global_25);
  return (id)sharedReader_obj_0;
}

void __33__MCInstallerReader_sharedReader__block_invoke()
{
  MCInstallerReader *v0;
  void *v1;

  v0 = objc_alloc_init(MCInstallerReader);
  v1 = (void *)sharedReader_obj_0;
  sharedReader_obj_0 = (uint64_t)v0;

}

- (id)pathsToInstalledProfilesWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  v3 = *(_QWORD *)&a3;
  +[MCManifest sharedManifest](MCManifest, "sharedManifest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiersOfProfilesWithFilterFlags:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v3 & 8) != 0)
      {
        v9 = (void *)__userProfileStorageDirectory;
        if (!__userProfileStorageDirectory)
        {
          MCUserProfileStorageDirectory();
          v13 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)__userProfileStorageDirectory;
          __userProfileStorageDirectory = v13;
          v11 = &__userProfileStorageDirectory;
          goto LABEL_8;
        }
      }
      else
      {
        v9 = (void *)__systemProfileStorageDirectory;
        if (!__systemProfileStorageDirectory)
        {
          MCSystemProfileStorageDirectory();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = &__systemProfileStorageDirectory;
          v12 = (void *)__systemProfileStorageDirectory;
          __systemProfileStorageDirectory = v10;
LABEL_8:

          v9 = (void *)*v11;
        }
      }
      v14 = v9;
      objc_msgSend(v8, "MCHashedFilenameWithExtension:", CFSTR("stub"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v6, v16);

      v6 = v7;
    }
    while (objc_msgSend(v5, "count") > (unint64_t)v7++);
  }
  return v5;
}

+ (void)_setSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)__systemProfileStorageDirectory;
  __systemProfileStorageDirectory = (uint64_t)v5;
  v9 = v5;

  v8 = (void *)__userProfileStorageDirectory;
  __userProfileStorageDirectory = (uint64_t)v6;

}

@end
