@implementation NTKCachedComplicationSnapshotPath

void ___NTKCachedComplicationSnapshotPath_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  BSCurrentUserDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/Library/Caches"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("NanoTimeKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Complications"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_NTKCachedComplicationSnapshotPath_snapshotPath;
  _NTKCachedComplicationSnapshotPath_snapshotPath = v2;

}

@end
