@implementation AnalyticCollectionDisabled

id GeoAnalyticsConfig_AnalyticCollectionDisabled_Metadata_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isMacSetupUser"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
