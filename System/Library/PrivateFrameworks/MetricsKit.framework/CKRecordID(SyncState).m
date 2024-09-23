@implementation CKRecordID(SyncState)

+ (const)mt_syncingFileExtension
{
  return CFSTR(".local");
}

+ (const)mt_syncedFileExtension
{
  return CFSTR(".cloud");
}

- (id)mt_syncingFileName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR(".local"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)mt_syncedFileName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "recordName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", CFSTR(".cloud"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
