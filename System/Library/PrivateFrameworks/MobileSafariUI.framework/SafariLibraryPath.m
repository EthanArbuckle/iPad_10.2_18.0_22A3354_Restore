@implementation SafariLibraryPath

void __SafariLibraryPath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  _SFSafariContainerPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v0;
  if (v0)
    objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library"));
  else
    SafariNonContaineredLibraryPath();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)SafariLibraryPath_path;
  SafariLibraryPath_path = v1;

}

@end
