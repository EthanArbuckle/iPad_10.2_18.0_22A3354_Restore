@implementation CHGetUserCallHistoryDataStoreClassCFileURL

void __CHGetUserCallHistoryDataStoreClassCFileURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CHGetUserCallHistoryDataStoreDirectoryURL();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("CallHistory.storedata"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CHGetUserCallHistoryDataStoreClassCFileURL_sFileURL;
  CHGetUserCallHistoryDataStoreClassCFileURL_sFileURL = v0;

}

@end
