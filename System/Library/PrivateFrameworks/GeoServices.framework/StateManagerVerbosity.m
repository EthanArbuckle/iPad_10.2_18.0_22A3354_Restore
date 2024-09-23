@implementation StateManagerVerbosity

id GeoOfflineConfig_StateManagerVerbosity_Metadata_block_invoke_17()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithInt:", objc_msgSend(v1, "isInternalInstall"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
