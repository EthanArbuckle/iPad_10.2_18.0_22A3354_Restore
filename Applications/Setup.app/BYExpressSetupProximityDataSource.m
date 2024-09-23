@implementation BYExpressSetupProximityDataSource

- (BYExpressSetupProximityDataSource)initWithInformation:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  BYExpressSetupProximityDataSource *v7;
  objc_super v9;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)BYExpressSetupProximityDataSource;
  v11 = -[BYExpressSetupProximityDataSource init](&v9, "init");
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 1, location[0]);
    v4 = objc_msgSend(location[0], "backupMetadata");
    v5 = (id)BYMetadataFromDataArchive(v4);
    v6 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v5;

  }
  v7 = (BYExpressSetupProximityDataSource *)v11;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (BOOL)dataAvailable
{
  SASProximityInformation *v2;
  BOOL v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = v2 != 0;

  return v3;
}

- (id)sourceDeviceClass
{
  SASProximityInformation *v2;
  id v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = -[SASProximityInformation deviceClass](v2, "deviceClass");

  return v3;
}

- (id)locationServicesOptIn
{
  SASProximityInformation *v2;
  NSNumber *v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SASProximityInformation locationServicesOptIn](v2, "locationServicesOptIn"));

  return v3;
}

- (id)locationServicesSettings
{
  SASProximityInformation *v2;
  id v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = -[SASProximityInformation locationServicesData](v2, "locationServicesData");

  return v3;
}

- (id)appAnalyticsOptIn
{
  SASProximityInformation *v2;
  id v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = -[SASProximityInformation appAnalyticsOptIn](v2, "appAnalyticsOptIn");

  return v3;
}

- (id)deviceAnalyticsOptIn
{
  SASProximityInformation *v2;
  id v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = -[SASProximityInformation deviceAnalyticsOptIn](v2, "deviceAnalyticsOptIn");

  return v3;
}

- (id)siriOptIn
{
  SASProximityInformation *v2;
  id v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = -[SASProximityInformation siriOptIn](v2, "siriOptIn");

  return v3;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  SASProximityInformation *v2;
  id v3;

  v2 = -[BYExpressSetupProximityDataSource information](self, "information", a2, self);
  v3 = -[SASProximityInformation siriVoiceProfileAvailabilityMetadata](v2, "siriVoiceProfileAvailabilityMetadata");

  return v3;
}

- (id)siriDataSharingOptIn
{
  BYBackupMetadata *v2;
  BYBackupMetadata *v3;
  unsigned __int8 v4;
  BYBackupMetadata *v5;
  id location[2];
  BYExpressSetupProximityDataSource *v8;
  NSNumber *v9;

  v8 = self;
  location[1] = (id)a2;
  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  location[0] = -[BYBackupMetadata expressSettings](v2, "expressSettings");

  if (location[0] && (objc_msgSend(location[0], "hasSiriDataSharingOptIn") & 1) != 0)
  {
    v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(location[0], "siriDataSharingOptIn") & 1);
  }
  else
  {
    v3 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
    v4 = -[BYBackupMetadata hasSiriDataSharingOptIn](v3, "hasSiriDataSharingOptIn");

    if ((v4 & 1) != 0)
    {
      v5 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
      v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata siriDataSharingOptIn](v5, "siriDataSharingOptIn") & 1);

    }
    else
    {
      v9 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)siriVoiceTriggerEnabled
{
  BYBackupMetadata *v2;
  id location[3];
  NSNumber *v5;

  location[2] = self;
  location[1] = (id)a2;
  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  location[0] = -[BYBackupMetadata expressSettings](v2, "expressSettings");

  if ((objc_msgSend(location[0], "hasSiriVoiceTriggerEnabled") & 1) != 0)
    v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(location[0], "siriVoiceTriggerEnabled") & 1);
  else
    v5 = 0;
  objc_storeStrong(location, 0);
  return v5;
}

- (id)screenTimeEnabled
{
  BYBackupMetadata *v2;
  id location[2];
  BYExpressSetupProximityDataSource *v5;
  NSNumber *v6;

  v5 = self;
  location[1] = (id)a2;
  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  location[0] = -[BYBackupMetadata expressSettings](v2, "expressSettings");

  if (location[0] && (objc_msgSend(location[0], "hasScreenTimeEnabled") & 1) != 0)
  {
    v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(location[0], "screenTimeEnabled") & 1);
  }
  else if ((-[BYBackupMetadata hasScreenTimeEnabled](v5->_backupMetadata, "hasScreenTimeEnabled") & 1) != 0)
  {
    v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata screenTimeEnabled](v5->_backupMetadata, "screenTimeEnabled") & 1);
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  BYBackupMetadata *v2;
  BYBackupMetadata *v3;
  unsigned __int8 v4;
  BYBackupMetadata *v5;
  id location[2];
  BYExpressSetupProximityDataSource *v8;
  NSNumber *v9;

  v8 = self;
  location[1] = (id)a2;
  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  location[0] = -[BYBackupMetadata expressSettings](v2, "expressSettings");

  if ((objc_msgSend(location[0], "hasSoftwareUpdateAutoUpdateEnabled") & 1) != 0)
  {
    v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(location[0], "softwareUpdateAutoUpdateEnabled") & 1);
  }
  else
  {
    v3 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
    v4 = -[BYBackupMetadata hasAutoUpdateEnabled](v3, "hasAutoUpdateEnabled");

    if ((v4 & 1) != 0)
    {
      v5 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
      v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata autoUpdateEnabled](v5, "autoUpdateEnabled") & 1);

    }
    else
    {
      v9 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  BYBackupMetadata *v2;
  BYBackupMetadata *v3;
  unsigned __int8 v4;
  BYBackupMetadata *v5;
  id location[2];
  BYExpressSetupProximityDataSource *v8;
  NSNumber *v9;

  v8 = self;
  location[1] = (id)a2;
  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  location[0] = -[BYBackupMetadata expressSettings](v2, "expressSettings");

  if ((objc_msgSend(location[0], "hasSoftwareUpdateAutoDownloadEnabled") & 1) != 0)
  {
    v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)objc_msgSend(location[0], "softwareUpdateAutoDownloadEnabled") & 1);
  }
  else
  {
    v3 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
    v4 = -[BYBackupMetadata hasAutoDownloadEnabled](v3, "hasAutoDownloadEnabled");

    if ((v4 & 1) != 0)
    {
      v5 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
      v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata autoDownloadEnabled](v5, "autoDownloadEnabled") & 1);

    }
    else
    {
      v9 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (int64_t)userInterfaceStyleModeValue
{
  BYBackupMetadata *v2;
  BYBackupMetadata *v3;
  unsigned __int8 v4;
  BYBackupMetadata *v5;
  id location[2];
  BYExpressSetupProximityDataSource *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  location[0] = -[BYBackupMetadata expressSettings](v2, "expressSettings");

  if (location[0] && (objc_msgSend(location[0], "hasAppearanceMode") & 1) != 0)
  {
    v9 = objc_msgSend(location[0], "buddy_userInterfaceStyleModeValue");
  }
  else
  {
    v3 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
    v4 = -[BYBackupMetadata hasUserInterfaceStyleMode](v3, "hasUserInterfaceStyleMode");

    if ((v4 & 1) != 0)
    {
      v5 = -[BYExpressSetupProximityDataSource backupMetadata](v8, "backupMetadata");
      v9 = -[BYBackupMetadata userInterfaceStyleMode](v5, "userInterfaceStyleMode");

    }
    else
    {
      v9 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return (int64_t)v9;
}

- (id)watchMigrationData
{
  BYBackupMetadata *v2;
  BYBackupMetadata *v3;
  id location[2];
  BYExpressSetupProximityDataSource *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  location[0] = -[BYBackupMetadata expressSettings](v2, "expressSettings");

  if ((objc_msgSend(location[0], "hasWatchMigrationData") & 1) != 0)
  {
    v7 = objc_msgSend(location[0], "watchMigrationData");
  }
  else
  {
    v3 = -[BYExpressSetupProximityDataSource backupMetadata](v6, "backupMetadata");
    v7 = -[BYBackupMetadata nanoRegistryData](v3, "nanoRegistryData");

  }
  objc_storeStrong(location, 0);
  return v7;
}

- (id)walletProvisioningContext
{
  return 0;
}

- (id)walletMetadata
{
  BYBackupMetadata *v2;
  id v3;
  unsigned __int8 v4;
  BYBackupMetadata *v5;
  id v6;
  BYBackupMetadata *v7;
  unsigned __int8 v8;
  BYBackupMetadata *v9;
  id v12;

  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  v3 = -[BYBackupMetadata expressSettings](v2, "expressSettings");
  v4 = objc_msgSend(v3, "hasWalletData");

  if ((v4 & 1) != 0)
  {
    v5 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
    v6 = -[BYBackupMetadata expressSettings](v5, "expressSettings");
    v12 = objc_msgSend(v6, "walletData");

  }
  else
  {
    v7 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
    v8 = -[BYBackupMetadata hasWalletData](v7, "hasWalletData");

    if ((v8 & 1) != 0)
    {
      v9 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
      v12 = -[BYBackupMetadata walletData](v9, "walletData");

    }
    else
    {
      v12 = 0;
    }
  }
  return v12;
}

- (id)actionButtonData
{
  BYBackupMetadata *v2;
  unsigned __int8 v3;
  BYBackupMetadata *v4;
  id v7;

  v2 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
  v3 = -[BYBackupMetadata hasActionButtonData](v2, "hasActionButtonData");

  if ((v3 & 1) != 0)
  {
    v4 = -[BYExpressSetupProximityDataSource backupMetadata](self, "backupMetadata");
    v7 = -[BYBackupMetadata actionButtonData](v4, "actionButtonData");

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (SASProximityInformation)information
{
  return self->_information;
}

- (void)setInformation:(id)a3
{
  objc_storeStrong((id *)&self->_information, a3);
}

- (BYBackupMetadata)backupMetadata
{
  return self->_backupMetadata;
}

- (void)setBackupMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_backupMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupMetadata, 0);
  objc_storeStrong((id *)&self->_information, 0);
}

@end
