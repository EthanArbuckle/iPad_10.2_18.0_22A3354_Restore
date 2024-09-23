@implementation CHGetUserCallHistoryDataStoreDirectoryURL

void __CHGetUserCallHistoryDataStoreDirectoryURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (__CHGetUserLibraryDirectoryURL_onceToken != -1)
    dispatch_once(&__CHGetUserLibraryDirectoryURL_onceToken, &__block_literal_global_12);
  v2 = (id)__CHGetUserLibraryDirectoryURL_sDirectoryURL;
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("CallHistoryDB"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CHGetUserCallHistoryDataStoreDirectoryURL_sDirectoryURL;
  CHGetUserCallHistoryDataStoreDirectoryURL_sDirectoryURL = v0;

}

@end
