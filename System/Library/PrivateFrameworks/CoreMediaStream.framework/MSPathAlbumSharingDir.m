@implementation MSPathAlbumSharingDir

void __MSPathAlbumSharingDir_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  MSASPlatform();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathAlbumSharingDir");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MSPathAlbumSharingDir_path;
  MSPathAlbumSharingDir_path = v1;

  if (!MSPathAlbumSharingDir_path)
  {
    MSPlatform();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathMediaStreamDir");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("albumshare"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MSPathAlbumSharingDir_path;
    MSPathAlbumSharingDir_path = v4;

  }
}

@end
