@implementation ATXAppLaunchMacDesktopEventProvider

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v4;
  id v5;
  double v6;
  void *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunchMacDesktopEventProvider;
  -[ATXAppLaunchMacEventProvider biomePublisherWithBookmark:devicePlatform:startTime:](&v9, sel_biomePublisherWithBookmark_devicePlatform_startTime_, v5, 3, v6 + -2419200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ATXAppLaunchMacDesktopEventProvider;
  v5 = -[ATXAppLaunchMacEventProvider isEventFromProvider:](&v7, sel_isEventFromProvider_, v4)
    && (objc_msgSend(v4, "isMacDesktop") & 1) != 0;

  return v5;
}

- (id)description
{
  return CFSTR("MacDesktopAppLaunches");
}

@end
