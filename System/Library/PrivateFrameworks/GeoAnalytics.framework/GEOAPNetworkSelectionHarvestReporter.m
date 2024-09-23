@implementation GEOAPNetworkSelectionHarvestReporter

+ (void)reportNetworkSelectionHarvestData:(id)a3
{
  +[GEOAPPortal captureNetSelectionHarvestWithHarvestData:](GEOAPPortal, "captureNetSelectionHarvestWithHarvestData:", a3);
}

+ (void)reportCellConnectionQualityHarvestRecord:(id)a3
{
  id v3;

  objc_msgSend(a3, "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[GEOAPPortal captureNetSelectionHarvestWithHarvestData:](GEOAPPortal, "captureNetSelectionHarvestWithHarvestData:", v3);

}

@end
