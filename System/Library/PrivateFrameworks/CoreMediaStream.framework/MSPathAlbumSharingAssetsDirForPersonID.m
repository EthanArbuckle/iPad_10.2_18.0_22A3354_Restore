@implementation MSPathAlbumSharingAssetsDirForPersonID

void __MSPathAlbumSharingAssetsDirForPersonID_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("assets"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)MSPathAlbumSharingAssetsDirForPersonID_path;
  MSPathAlbumSharingAssetsDirForPersonID_path = v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", MSPathAlbumSharingAssetsDirForPersonID_path);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", MSPathAlbumSharingAssetsDirForPersonID_path, 1, 0, 0);

  }
}

@end
