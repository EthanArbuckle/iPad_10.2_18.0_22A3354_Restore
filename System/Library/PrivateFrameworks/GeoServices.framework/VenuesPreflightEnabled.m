@implementation VenuesPreflightEnabled

id GeoServicesConfig_VenuesPreflightEnabled_Metadata_block_invoke_312()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isInternalInstall"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
