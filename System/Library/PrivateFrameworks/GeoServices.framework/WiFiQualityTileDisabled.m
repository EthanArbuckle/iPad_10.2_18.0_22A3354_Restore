@implementation WiFiQualityTileDisabled

id GeoServicesConfig_WiFiQualityTileDisabled_Metadata_block_invoke_344()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "countryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(v2, "isEqualToString:", CFSTR("CN")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
