@implementation NMSPathUtil

+ (id)mediaSyncInfoDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_nanoMusicSyncDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("MediaSyncInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)podcastsDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_nanoMusicSyncDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Podcasts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)recentMusicDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_nanoMusicSyncDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", &unk_24D655818);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)musicBackupDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_nanoMusicSyncDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", &unk_24D655830);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_nanoMusicSyncDirectory
{
  if (_nanoMusicSyncDirectory_onceToken != -1)
    dispatch_once(&_nanoMusicSyncDirectory_onceToken, &__block_literal_global);
  return (id)_nanoMusicSyncDirectory_path;
}

void __38__NMSPathUtil__nanoMusicSyncDirectory__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD17C8];
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = CFSTR("Library");
  v4[2] = CFSTR("NanoMusicSync");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathWithComponents:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_nanoMusicSyncDirectory_path;
  _nanoMusicSyncDirectory_path = v2;

}

@end
