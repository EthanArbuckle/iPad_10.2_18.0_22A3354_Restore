@implementation RegisteredFontAssetFileDirectoryPath

void __RegisteredFontAssetFileDirectoryPath_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library/UserFonts/FontAssets/"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingString:", CFSTR("/"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)RegisteredFontAssetFileDirectoryPath_sRegisteredFontAssetFileDirectoryPath;
  RegisteredFontAssetFileDirectoryPath_sRegisteredFontAssetFileDirectoryPath = v1;

}

@end
