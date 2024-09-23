@implementation MSPathAlbumSharingDirForPersonID

void __MSPathAlbumSharingDirForPersonID_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  MSPathAlbumSharingDir();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _sanitizeString(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MSPathAlbumSharingDirForPersonID_path;
  MSPathAlbumSharingDirForPersonID_path = v3;

}

@end
