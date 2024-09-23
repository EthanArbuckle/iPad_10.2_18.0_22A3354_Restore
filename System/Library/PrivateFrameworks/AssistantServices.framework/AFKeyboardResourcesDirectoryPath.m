@implementation AFKeyboardResourcesDirectoryPath

void __AFKeyboardResourcesDirectoryPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  CPSharedResourcesDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Keyboard"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFKeyboardResourcesDirectoryPath_sKeyboardResourcesDirectoryPath;
  AFKeyboardResourcesDirectoryPath_sKeyboardResourcesDirectoryPath = v0;

}

@end
