@implementation ShouldUseSimpleETAService

id GeoServicesConfig_ShouldUseSimpleETAService_Metadata_block_invoke_91()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  GEOGetURLWithSource(18, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithInt:", v1 != 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
