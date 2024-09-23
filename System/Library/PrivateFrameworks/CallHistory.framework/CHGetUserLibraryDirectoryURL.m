@implementation CHGetUserLibraryDirectoryURL

void ____CHGetUserLibraryDirectoryURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (__CHGetUserHomeDirectoryURL_onceToken != -1)
    dispatch_once(&__CHGetUserHomeDirectoryURL_onceToken, &__block_literal_global_13);
  v2 = (id)__CHGetUserHomeDirectoryURL_sDirectoryURL;
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__CHGetUserLibraryDirectoryURL_sDirectoryURL;
  __CHGetUserLibraryDirectoryURL_sDirectoryURL = v0;

}

@end
