@implementation MTMetricsBaseEventDataProvider

- (id)knownFields
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTMetricsBaseEventDataProvider;
  -[MTBaseEventDataProvider knownFields](&v7, sel_knownFields);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("app"), CFSTR("appVersion"), CFSTR("baseVersion"), CFSTR("capacityData"), CFSTR("capacityDataAvailable"), CFSTR("capacityDisk"), CFSTR("capacitySystem"), CFSTR("capacitySystemAvailable"), CFSTR("clientEventId"), CFSTR("clientId"), CFSTR("connection"), CFSTR("cookies"), CFSTR("dsId"), CFSTR("environmentBuild"), CFSTR("environmentDataCenter"), CFSTR("environmentInstance"), CFSTR("eventTime"),
      CFSTR("hardwareFamily"),
      CFSTR("hardwareModel"),
      CFSTR("hostApp"),
      CFSTR("hostAppVersion"),
      CFSTR("isSignedIn"),
      CFSTR("os"),
      CFSTR("osBuildNumber"),
      CFSTR("osVersion"),
      CFSTR("page"),
      CFSTR("pageContext"),
      CFSTR("pageDetails"),
      CFSTR("pageId"),
      CFSTR("pageType"),
      CFSTR("pageUrl"),
      CFSTR("parentPageUrl"),
      CFSTR("pixelRatio"),
      CFSTR("resourceRevNum"),
      CFSTR("screenHeight"),
      CFSTR("screenWidth"),
      CFSTR("storeFrontHeader"),
      CFSTR("timezoneOffset"),
      CFSTR("userAgent"),
      CFSTR("windowInnerHeight"),
      CFSTR("windowInnerWidth"),
      CFSTR("windowOuterHeight"),
      CFSTR("windowOuterWidth"),
      CFSTR("xpPostFrequency"),
      CFSTR("xpSendMethod"),
      CFSTR("xpVersionMetricsKit"),
      0,
      CFSTR("hardwareFamily"),
      CFSTR("eventTime"),
      CFSTR("environmentInstance"),
      CFSTR("environmentDataCenter"),
      CFSTR("environmentBuild"),
      CFSTR("dsId"),
      CFSTR("cookies"),
      CFSTR("connection"),
      CFSTR("clientId"),
      CFSTR("clientEventId"),
      CFSTR("capacitySystemAvailable"),
      CFSTR("capacitySystem"),
      CFSTR("capacityDisk"),
      CFSTR("capacityDataAvailable"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
