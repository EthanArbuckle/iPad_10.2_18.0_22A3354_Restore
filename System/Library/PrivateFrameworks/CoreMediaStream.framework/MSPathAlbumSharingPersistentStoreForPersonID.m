@implementation MSPathAlbumSharingPersistentStoreForPersonID

void __MSPathAlbumSharingPersistentStoreForPersonID_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PersonID.sqlite"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MSPathAlbumSharingPersistentStoreForPersonID_path;
  MSPathAlbumSharingPersistentStoreForPersonID_path = v1;

}

@end
