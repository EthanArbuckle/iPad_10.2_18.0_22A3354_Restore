@implementation BYExpressSetupBackupSource

- (BYExpressSetupBackupSource)initWithBackupItem:(id)a3 backupMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BYExpressSetupBackupSource *v8;
  objc_super v10;
  id obj;
  id location[2];
  id v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v13;
  v13 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)BYExpressSetupBackupSource;
  v13 = -[BYExpressSetupBackupSource init](&v10, "init");
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)v13 + 1, location[0]);
    objc_storeStrong((id *)v13 + 2, obj);
    v6 = objc_msgSend(obj, "expressSettings");
    v7 = (void *)*((_QWORD *)v13 + 3);
    *((_QWORD *)v13 + 3) = v6;

  }
  v8 = (BYExpressSetupBackupSource *)v13;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v13, 0);
  return v8;
}

- (BOOL)dataAvailable
{
  return 1;
}

- (id)sourceDeviceClass
{
  MBBackup *v2;
  id v3;

  v2 = -[RestorableBackupItem backup](self->_backupItem, "backup", a2, self);
  v3 = -[MBBackup deviceClass](v2, "deviceClass");

  return v3;
}

- (id)locationServicesOptIn
{
  NSNumber *v4;

  if ((-[SASExpressSettings hasLocationServicesOptIn](self->_expressSettings, "hasLocationServicesOptIn") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings locationServicesOptIn](self->_expressSettings, "locationServicesOptIn") & 1);
  }
  else if ((-[BYBackupMetadata hasLocationServicesOptIn](self->_backupMetadata, "hasLocationServicesOptIn") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata locationServicesOptIn](self->_backupMetadata, "locationServicesOptIn") & 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)appAnalyticsOptIn
{
  unsigned int v2;
  NSNumber *v5;

  if ((-[SASExpressSettings hasAppAnalyticsOptIn](self->_expressSettings, "hasAppAnalyticsOptIn") & 1) != 0)
  {
    v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings appAnalyticsOptIn](self->_expressSettings, "appAnalyticsOptIn") & 1);
  }
  else
  {
    v2 = -[BYBackupMetadata appAnalyticsOptIn](self->_backupMetadata, "appAnalyticsOptIn");
    if (v2)
    {
      if (v2 == 1)
        v5 = &__kCFBooleanTrue;
      else
        v5 = 0;
    }
    else
    {
      v5 = &__kCFBooleanFalse;
    }
  }
  return v5;
}

- (id)deviceAnalyticsOptIn
{
  unsigned int v2;
  NSNumber *v5;

  if ((-[SASExpressSettings hasDeviceAnalyticsOptIn](self->_expressSettings, "hasDeviceAnalyticsOptIn") & 1) != 0)
  {
    v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings deviceAnalyticsOptIn](self->_expressSettings, "deviceAnalyticsOptIn") & 1);
  }
  else
  {
    v2 = -[BYBackupMetadata deviceAnalyticsOptIn](self->_backupMetadata, "deviceAnalyticsOptIn");
    if (v2)
    {
      if (v2 == 1)
        v5 = &__kCFBooleanTrue;
      else
        v5 = 0;
    }
    else
    {
      v5 = &__kCFBooleanFalse;
    }
  }
  return v5;
}

- (id)siriOptIn
{
  NSNumber *v4;

  if ((-[SASExpressSettings hasSiriOptIn](self->_expressSettings, "hasSiriOptIn") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings siriOptIn](self->_expressSettings, "siriOptIn") & 1);
  }
  else if ((-[BYBackupMetadata hasSiriOptIn](self->_backupMetadata, "hasSiriOptIn") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata siriOptIn](self->_backupMetadata, "siriOptIn") & 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)locationServicesSettings
{
  return 0;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  return 0;
}

- (id)siriDataSharingOptIn
{
  NSNumber *v4;

  if ((-[SASExpressSettings hasSiriDataSharingOptIn](self->_expressSettings, "hasSiriDataSharingOptIn") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings siriDataSharingOptIn](self->_expressSettings, "siriDataSharingOptIn") & 1);
  }
  else if ((-[BYBackupMetadata hasSiriDataSharingOptIn](self->_backupMetadata, "hasSiriDataSharingOptIn") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata siriDataSharingOptIn](self->_backupMetadata, "siriDataSharingOptIn") & 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)siriVoiceTriggerEnabled
{
  NSNumber *v4;

  if ((-[SASExpressSettings hasSiriVoiceTriggerEnabled](self->_expressSettings, "hasSiriVoiceTriggerEnabled") & 1) != 0)v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings siriVoiceTriggerEnabled](self->_expressSettings, "siriVoiceTriggerEnabled") & 1);
  else
    v4 = 0;
  return v4;
}

- (id)screenTimeEnabled
{
  NSNumber *v4;

  if ((-[SASExpressSettings hasScreenTimeEnabled](self->_expressSettings, "hasScreenTimeEnabled") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings screenTimeEnabled](self->_expressSettings, "screenTimeEnabled") & 1);
  }
  else if ((-[BYBackupMetadata hasScreenTimeEnabled](self->_backupMetadata, "hasScreenTimeEnabled") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata screenTimeEnabled](self->_backupMetadata, "screenTimeEnabled") & 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  NSNumber *v4;

  if ((-[SASExpressSettings hasSoftwareUpdateAutoUpdateEnabled](self->_expressSettings, "hasSoftwareUpdateAutoUpdateEnabled") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings softwareUpdateAutoUpdateEnabled](self->_expressSettings, "softwareUpdateAutoUpdateEnabled") & 1);
  }
  else if ((-[BYBackupMetadata hasAutoUpdateEnabled](self->_backupMetadata, "hasAutoUpdateEnabled") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata autoUpdateEnabled](self->_backupMetadata, "autoUpdateEnabled") & 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  NSNumber *v4;

  if ((-[SASExpressSettings hasSoftwareUpdateAutoDownloadEnabled](self->_expressSettings, "hasSoftwareUpdateAutoDownloadEnabled") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[SASExpressSettings softwareUpdateAutoDownloadEnabled](self->_expressSettings, "softwareUpdateAutoDownloadEnabled") & 1);
  }
  else if ((-[BYBackupMetadata hasAutoDownloadEnabled](self->_backupMetadata, "hasAutoDownloadEnabled") & 1) != 0)
  {
    v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)-[BYBackupMetadata autoDownloadEnabled](self->_backupMetadata, "autoDownloadEnabled") & 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)userInterfaceStyleModeValue
{
  if ((-[SASExpressSettings hasAppearanceMode](self->_expressSettings, "hasAppearanceMode") & 1) != 0)
    return -[SASExpressSettings buddy_userInterfaceStyleModeValue](self->_expressSettings, "buddy_userInterfaceStyleModeValue");
  if ((-[BYBackupMetadata hasUserInterfaceStyleMode](self->_backupMetadata, "hasUserInterfaceStyleMode") & 1) != 0)
    return (int64_t)-[BYBackupMetadata userInterfaceStyleMode](self->_backupMetadata, "userInterfaceStyleMode");
  return 0;
}

- (id)watchMigrationData
{
  if ((-[SASExpressSettings hasWatchMigrationData](self->_expressSettings, "hasWatchMigrationData") & 1) != 0)
    return -[SASExpressSettings watchMigrationData](self->_expressSettings, "watchMigrationData");
  else
    return -[BYBackupMetadata nanoRegistryData](self->_backupMetadata, "nanoRegistryData");
}

- (id)walletProvisioningContext
{
  return 0;
}

- (id)walletMetadata
{
  if ((-[SASExpressSettings hasWalletData](self->_expressSettings, "hasWalletData") & 1) != 0)
    return -[SASExpressSettings walletData](self->_expressSettings, "walletData");
  if ((-[BYBackupMetadata hasWalletData](self->_backupMetadata, "hasWalletData") & 1) != 0)
    return -[BYBackupMetadata walletData](self->_backupMetadata, "walletData");
  return 0;
}

- (id)actionButtonData
{
  if ((-[BYBackupMetadata hasActionButtonData](self->_backupMetadata, "hasActionButtonData") & 1) != 0)
    return -[BYBackupMetadata actionButtonData](self->_backupMetadata, "actionButtonData");
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressSettings, 0);
  objc_storeStrong((id *)&self->_backupMetadata, 0);
  objc_storeStrong((id *)&self->_backupItem, 0);
}

@end
