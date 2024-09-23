@implementation MSPathAlbumSharingDaemonPersistentStore

void __MSPathAlbumSharingDaemonPersistentStore_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  MSPathAlbumSharingDir();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Daemon.sqlite"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MSPathAlbumSharingDaemonPersistentStore_path;
  MSPathAlbumSharingDaemonPersistentStore_path = v0;

}

@end
