@implementation GEONetworkSelectionHarvestReporter

+ (void)reportCellConnectionQualityHarvestRecord:(id)a3
{
  id v3;
  id GEOAPPortalClass;
  id v5;

  v3 = a3;
  GEOAPPortalClass = getGEOAPPortalClass();
  objc_msgSend(v3, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(GEOAPPortalClass, "captureNetSelectionHarvestWithHarvestData:", v5);
}

@end
