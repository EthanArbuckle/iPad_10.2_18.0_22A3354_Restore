@implementation HKHeartbeatSeriesSample(AFibBurdenControl)

+ (id)_aFibSeriesSampleWithStartDate:()AFibBurdenControl device:metadata:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "dateByAddingTimeInterval:", 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_aFibHeartbeatSeriesData_onceToken != -1)
    dispatch_once(&_aFibHeartbeatSeriesData_onceToken, &__block_literal_global_9);
  objc_msgSend(MEMORY[0x1E0CB67C0], "_heartbeatSeriesSampleWithData:startDate:endDate:device:metadata:", _aFibHeartbeatSeriesData___aFibHeartbeatSeriesData, v9, v10, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_nonAFibSeriesSampleWithStartDate:()AFibBurdenControl device:metadata:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "dateByAddingTimeInterval:", 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_nonAFibHeartbeatSeriesData_onceToken != -1)
    dispatch_once(&_nonAFibHeartbeatSeriesData_onceToken, &__block_literal_global_242);
  objc_msgSend(MEMORY[0x1E0CB67C0], "_heartbeatSeriesSampleWithData:startDate:endDate:device:metadata:", _nonAFibHeartbeatSeriesData___nonAFibHeartbeatSeriesData, v9, v10, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
