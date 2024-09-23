@implementation SafariNonContaineredLibraryPath

void __SafariNonContaineredLibraryPath_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SafariNonContaineredLibraryPath_path;
  SafariNonContaineredLibraryPath_path = v0;

}

@end
