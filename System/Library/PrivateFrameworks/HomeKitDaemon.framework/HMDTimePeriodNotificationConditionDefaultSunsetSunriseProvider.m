@implementation HMDTimePeriodNotificationConditionDefaultSunsetSunriseProvider

- (id)sunriseTimeForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "homeLocationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDLocation sunriseTimeForLocation:](HMDLocation, "sunriseTimeForLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sunsetTimeForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "homeLocationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDLocation sunsetTimeForLocation:](HMDLocation, "sunsetTimeForLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
