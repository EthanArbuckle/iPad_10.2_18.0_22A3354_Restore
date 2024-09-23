@implementation SFSafariNonContaineredSettingsDirectoryPath

void ___SFSafariNonContaineredSettingsDirectoryPath_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Safari/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_SFSafariNonContaineredSettingsDirectoryPath::path;
  _SFSafariNonContaineredSettingsDirectoryPath::path = v0;

}

@end
