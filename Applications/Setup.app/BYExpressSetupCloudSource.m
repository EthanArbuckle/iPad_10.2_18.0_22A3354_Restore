@implementation BYExpressSetupCloudSource

- (BYExpressSetupCloudSource)initWithSettings:(id)a3
{
  id v3;
  BYExpressSetupCloudSource *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BYExpressSetupCloudSource;
  v8 = -[BYExpressSetupCloudSource init](&v6, "init");
  objc_storeStrong(&v8, v8);
  if (v8)
    objc_storeStrong((id *)v8 + 1, location[0]);
  v4 = (BYExpressSetupCloudSource *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (BOOL)dataAvailable
{
  SASExpressSettings *v2;
  BOOL v3;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings", a2, self);
  v3 = v2 != 0;

  return v3;
}

- (id)sourceDeviceClass
{
  SASExpressSettings *v2;
  id v3;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings", a2, self);
  v3 = -[SASExpressSettings deviceClass](v2, "deviceClass");

  return v3;
}

- (id)locationServicesOptIn
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasLocationServicesOptIn](v2, "hasLocationServicesOptIn");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings locationServicesOptIn](v4, "locationServicesOptIn") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)locationServicesSettings
{
  return 0;
}

- (id)appAnalyticsOptIn
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasAppAnalyticsOptIn](v2, "hasAppAnalyticsOptIn");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings appAnalyticsOptIn](v4, "appAnalyticsOptIn") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)deviceAnalyticsOptIn
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasDeviceAnalyticsOptIn](v2, "hasDeviceAnalyticsOptIn");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings deviceAnalyticsOptIn](v4, "deviceAnalyticsOptIn") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)siriOptIn
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasSiriOptIn](v2, "hasSiriOptIn");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings siriOptIn](v4, "siriOptIn") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  return 0;
}

- (id)siriDataSharingOptIn
{
  return 0;
}

- (id)siriVoiceTriggerEnabled
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasSiriVoiceTriggerEnabled](v2, "hasSiriVoiceTriggerEnabled");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings siriVoiceTriggerEnabled](v4, "siriVoiceTriggerEnabled") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)screenTimeEnabled
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasScreenTimeEnabled](v2, "hasScreenTimeEnabled");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings screenTimeEnabled](v4, "screenTimeEnabled") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasSoftwareUpdateAutoUpdateEnabled](v2, "hasSoftwareUpdateAutoUpdateEnabled");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings softwareUpdateAutoUpdateEnabled](v4, "softwareUpdateAutoUpdateEnabled") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  NSNumber *v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasSoftwareUpdateAutoDownloadEnabled](v2, "hasSoftwareUpdateAutoDownloadEnabled");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings softwareUpdateAutoDownloadEnabled](v4, "softwareUpdateAutoDownloadEnabled") & 1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)userInterfaceStyleModeValue
{
  SASExpressSettings *v2;
  int64_t v3;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings", a2, self);
  v3 = -[SASExpressSettings buddy_userInterfaceStyleModeValue](v2, "buddy_userInterfaceStyleModeValue");

  return v3;
}

- (id)watchMigrationData
{
  return 0;
}

- (id)walletProvisioningContext
{
  return 0;
}

- (id)walletMetadata
{
  SASExpressSettings *v2;
  unsigned __int8 v3;
  SASExpressSettings *v4;
  id v7;

  v2 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
  v3 = -[SASExpressSettings hasWalletData](v2, "hasWalletData");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupCloudSource expressSettings](self, "expressSettings");
    v7 = -[SASExpressSettings walletData](v4, "walletData");

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)actionButtonData
{
  return 0;
}

- (SASExpressSettings)expressSettings
{
  return self->_expressSettings;
}

- (void)setExpressSettings:(id)a3
{
  objc_storeStrong((id *)&self->_expressSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressSettings, 0);
}

@end
