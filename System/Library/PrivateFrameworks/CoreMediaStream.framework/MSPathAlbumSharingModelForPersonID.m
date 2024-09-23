@implementation MSPathAlbumSharingModelForPersonID

void __MSPathAlbumSharingModelForPersonID_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Model.sqlite"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MSPathAlbumSharingModelForPersonID_path;
  MSPathAlbumSharingModelForPersonID_path = v1;

}

@end
