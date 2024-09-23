@implementation INUserSupportDirectoryPath

void __INUserSupportDirectoryPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CPSharedResourcesDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Assistant"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)INUserSupportDirectoryPath_sUserSupportDirectoryPath;
  INUserSupportDirectoryPath_sUserSupportDirectoryPath = v0;

}

@end
