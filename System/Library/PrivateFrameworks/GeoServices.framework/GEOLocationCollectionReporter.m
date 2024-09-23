@implementation GEOLocationCollectionReporter

+ (void)reportRealtimeLocationCollection:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(getGEOAPLocationCollectionReporterClass(), "reportRealtimeLocationCollection:", v3);

}

+ (void)reportBatchLocationCollection:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(getGEOAPLocationCollectionReporterClass(), "reportBatchLocationCollection:", v3);

}

+ (void)reportCalibratedPressureCollection:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(getGEOAPLocationCollectionReporterClass(), "reportCalibratedPressureCollection:", v3);

}

@end
