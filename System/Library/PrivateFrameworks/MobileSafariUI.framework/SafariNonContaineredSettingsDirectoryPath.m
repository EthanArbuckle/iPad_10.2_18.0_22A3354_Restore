@implementation SafariNonContaineredSettingsDirectoryPath

void __SafariNonContaineredSettingsDirectoryPath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  SafariNonContaineredLibraryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Safari"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)SafariNonContaineredSettingsDirectoryPath_path;
  SafariNonContaineredSettingsDirectoryPath_path = v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", SafariNonContaineredSettingsDirectoryPath_path, 0);

}

@end
