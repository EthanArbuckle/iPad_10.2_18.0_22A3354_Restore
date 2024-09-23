@implementation BYExpressSetupDataProvider

- (BYExpressSetupDataProvider)initWithChronicle:(id)a3 displayZoomExecutor:(id)a4 capabilities:(id)a5 settingsManager:(id)a6 buddyPreferences:(id)a7 buddyPreferencesExcludedFromBackup:(id)a8 managedConfiguration:(id)a9 deviceProvider:(id)a10
{
  id v15;
  NSMutableArray *v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  BYExpressSetupDataProvider *v20;
  objc_super v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id obj;
  id location[2];
  id v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = 0;
  objc_storeStrong(&v27, a6);
  v26 = 0;
  objc_storeStrong(&v26, a7);
  v25 = 0;
  objc_storeStrong(&v25, a8);
  v24 = 0;
  objc_storeStrong(&v24, a9);
  v23 = 0;
  objc_storeStrong(&v23, a10);
  v15 = v31;
  v31 = 0;
  v22.receiver = v15;
  v22.super_class = (Class)BYExpressSetupDataProvider;
  v31 = -[BYExpressSetupDataProvider init](&v22, "init");
  objc_storeStrong(&v31, v31);
  if (v31)
  {
    objc_storeStrong((id *)v31 + 11, location[0]);
    v16 = objc_opt_new(NSMutableArray);
    v17 = (void *)*((_QWORD *)v31 + 3);
    *((_QWORD *)v31 + 3) = v16;

    objc_storeStrong((id *)v31 + 12, obj);
    objc_storeStrong((id *)v31 + 13, v28);
    objc_storeStrong((id *)v31 + 14, v27);
    objc_storeStrong((id *)v31 + 15, v26);
    objc_storeStrong((id *)v31 + 16, v25);
    objc_storeStrong((id *)v31 + 17, v24);
    objc_storeStrong((id *)v31 + 18, v23);
    v18 = dispatch_queue_create("Siri Voice Profile Queue", 0);
    v19 = (void *)*((_QWORD *)v31 + 19);
    *((_QWORD *)v31 + 19) = v18;

    *((_BYTE *)v31 + 33) = 0;
  }
  v20 = (BYExpressSetupDataProvider *)v31;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v31, 0);
  return v20;
}

- (BOOL)_eligibleForChlorine
{
  BYExpressSetupDataProvider *v2;
  BYCapabilities *v3;
  BOOL cachedEligibleForChlorine;

  v2 = self;
  objc_sync_enter(v2);
  if (!self->_didCacheEligibleForChlorine)
  {
    v3 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
    self->_cachedEligibleForChlorine = -[BYCapabilities eligibleForChlorine](v3, "eligibleForChlorine") & 1;

    self->_didCacheEligibleForChlorine = 1;
  }
  cachedEligibleForChlorine = self->_cachedEligibleForChlorine;
  objc_sync_exit(v2);

  return cachedEligibleForChlorine;
}

- (id)description
{
  id v2;
  id v3;
  id v4;
  id v5;
  id location[2];
  BYExpressSetupDataProvider *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(location[0], "appendFormat:", CFSTR("<%@: %p>\n"), objc_opt_class(v8), v8);
  v2 = -[BYExpressSetupDataProvider _descriptionForDataSource:](v8, "_descriptionForDataSource:", v8);
  objc_msgSend(location[0], "appendFormat:", CFSTR("Resolved: %@\n"), v2);

  v3 = -[BYExpressSetupDataProvider dataSource](v8, "dataSource");
  v4 = -[BYExpressSetupDataProvider _descriptionForDataSource:](v8, "_descriptionForDataSource:", v3);
  objc_msgSend(location[0], "appendFormat:", CFSTR("Data source: %@\n"), v4);

  v5 = location[0];
  objc_storeStrong(location, 0);
  return v5;
}

- (id)dataSource
{
  BYExpressSetupBackupSource *v2;
  unsigned __int8 v3;
  BYExpressSetupProximityDataSource *v4;
  unsigned __int8 v5;
  BYExpressSetupCloudSource *v6;
  unsigned __int8 v7;
  BYExpressSetupDefaultSource *v8;
  BYExpressSetupDefaultSource *v9;
  BYExpressSetupBackupSource *v12;

  v2 = -[BYExpressSetupDataProvider backupDataSource](self, "backupDataSource");
  v3 = -[BYExpressSetupBackupSource dataAvailable](v2, "dataAvailable");

  if ((v3 & 1) != 0)
  {
    v12 = -[BYExpressSetupDataProvider backupDataSource](self, "backupDataSource");
  }
  else
  {
    v4 = -[BYExpressSetupDataProvider proximitySetupDataSource](self, "proximitySetupDataSource");
    v5 = -[BYExpressSetupProximityDataSource dataAvailable](v4, "dataAvailable");

    if ((v5 & 1) != 0)
    {
      v12 = -[BYExpressSetupDataProvider proximitySetupDataSource](self, "proximitySetupDataSource");
    }
    else
    {
      v6 = -[BYExpressSetupDataProvider cloudDataSource](self, "cloudDataSource");
      v7 = -[BYExpressSetupCloudSource dataAvailable](v6, "dataAvailable");

      if ((v7 & 1) != 0)
      {
        v12 = -[BYExpressSetupDataProvider cloudDataSource](self, "cloudDataSource");
      }
      else
      {
        v8 = -[BYExpressSetupDataProvider defaultSource](self, "defaultSource");

        if (!v8)
        {
          v9 = objc_alloc_init(BYExpressSetupDefaultSource);
          -[BYExpressSetupDataProvider setDefaultSource:](self, "setDefaultSource:", v9);

        }
        v12 = -[BYExpressSetupDataProvider defaultSource](self, "defaultSource");
      }
    }
  }
  return v12;
}

- (unint64_t)dataSourceType
{
  BYExpressSetupCloudSource *v2;
  BYExpressSetupProximityDataSource *v3;
  BYExpressSetupBackupSource *v4;
  BYExpressSetupDefaultSource *v5;
  id location[2];
  BYExpressSetupDataProvider *v8;
  unint64_t v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
  if (!location[0])
    goto LABEL_10;
  v2 = -[BYExpressSetupDataProvider cloudDataSource](v8, "cloudDataSource");

  if (location[0] != v2)
  {
    v3 = -[BYExpressSetupDataProvider proximitySetupDataSource](v8, "proximitySetupDataSource");

    if (location[0] == v3)
    {
      v9 = 3;
      goto LABEL_11;
    }
    v4 = -[BYExpressSetupDataProvider backupDataSource](v8, "backupDataSource");

    if (location[0] == v4)
    {
      v9 = 2;
      goto LABEL_11;
    }
    v5 = -[BYExpressSetupDataProvider defaultSource](v8, "defaultSource");

    if (location[0] == v5)
    {
      v9 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v9 = 4;
LABEL_11:
  objc_storeStrong(location, 0);
  return v9;
}

- (id)pairedWatches
{
  id v2;
  id v3;
  id v4;

  v2 = +[NRMigrator sharedMigrator](NRMigrator, "sharedMigrator", a2);
  v3 = -[BYExpressSetupDataProvider watchMigrationData](self, "watchMigrationData");
  v4 = objc_msgSend(v2, "devicesFromMigrationConsentRequestData:", v3);

  return v4;
}

- (id)expressSetupFeatures
{
  id v2;
  id obj[2];
  BYExpressSetupDataProvider *v5;

  v5 = self;
  obj[1] = (id)a2;
  if (!self->_listedFeatures)
  {
    v2 = objc_msgSend((id)objc_opt_class(v5), "featuresArrayForDataSource:eligibleForChlorine:", v5, -[BYExpressSetupDataProvider _eligibleForChlorine](v5, "_eligibleForChlorine"));
    obj[0] = objc_msgSend(v2, "mutableCopy");

    if (!-[BYExpressSetupDataProvider willRestoreOrMigrate](v5, "willRestoreOrMigrate"))
      objc_msgSend(obj[0], "removeObject:", &off_100290E50);
    objc_storeStrong((id *)&v5->_listedFeatures, obj[0]);
    objc_storeStrong(obj, 0);
  }
  return v5->_listedFeatures;
}

- (BYExpressSetupDataSource)resolvedDataSource
{
  return self;
}

- (id)underlyingDataSource
{
  return -[BYExpressSetupDataProvider dataSource](self, "dataSource", a2, self);
}

+ (id)stringForDataSourceType:(unint64_t)a3
{
  id result;
  __CFString *v4;

  switch(a3)
  {
    case 0uLL:
      result = CFSTR("Undefined");
      break;
    case 1uLL:
      result = CFSTR("Default");
      break;
    case 2uLL:
      result = CFSTR("Backup");
      break;
    case 3uLL:
      result = CFSTR("Proximity");
      break;
    case 4uLL:
      v4 = CFSTR("iCloud");
      goto LABEL_7;
    default:
LABEL_7:
      result = v4;
      break;
  }
  return result;
}

+ (id)featuresArrayForDataSource:(id)a3 eligibleForChlorine:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  char v24;
  id v25;
  char v26;
  id v27;
  id v28;
  BOOL v29;
  id location[2];
  id v31;

  v31 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  v28 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_msgSend(location[0], "siriOptIn");

  if (v5)
  {
    objc_msgSend(v28, "addObject:", &off_100290E68);
    v6 = objc_msgSend(location[0], "siriDataSharingOptIn");

    if (v6)
      objc_msgSend(v28, "addObject:", &off_100290E80);
  }
  v7 = objc_msgSend(location[0], "locationServicesOptIn");
  v26 = 0;
  v8 = 1;
  if (!v7)
  {
    v27 = objc_msgSend(location[0], "locationServicesSettings");
    v26 = 1;
    v8 = v27 != 0;
  }
  if ((v26 & 1) != 0)

  if (v8)
    objc_msgSend(v28, "addObject:", &off_100290E98);
  if (v29)
  {
    if ((objc_msgSend(v31, "_shouldAddFeatureDeviceAndAppAnalyticsForDataSource:", location[0]) & 1) != 0)
      objc_msgSend(v28, "addObject:", &off_100290EB0);
  }
  else
  {
    v9 = objc_msgSend(location[0], "deviceAnalyticsOptIn");

    if (v9)
      objc_msgSend(v28, "addObject:", &off_100290EC8);
    v10 = objc_msgSend(location[0], "appAnalyticsOptIn");

    if (v10)
      objc_msgSend(v28, "addObject:", &off_100290EE0);
  }
  v11 = objc_msgSend(location[0], "screenTimeEnabled");

  if (v11)
    objc_msgSend(v28, "addObject:", &off_100290EF8);
  v12 = objc_msgSend(location[0], "softwareUpdateAutoDownloadEnabled");
  v24 = 0;
  v13 = 0;
  if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
  {
    v25 = objc_msgSend(location[0], "softwareUpdateAutoUpdateEnabled");
    v24 = 1;
    v13 = objc_msgSend(v25, "BOOLValue");
  }
  if ((v24 & 1) != 0)

  if ((v13 & 1) != 0)
    objc_msgSend(v28, "addObject:", &off_100290F10);
  if (objc_msgSend(location[0], "userInterfaceStyleModeValue"))
    objc_msgSend(v28, "addObject:", &off_100290F28);
  v14 = objc_msgSend(location[0], "watchMigrationData");

  if (v14)
  {
    v15 = +[NRMigrator sharedMigrator](NRMigrator, "sharedMigrator");
    v16 = objc_msgSend(location[0], "watchMigrationData");
    v23 = objc_msgSend(v15, "devicesFromMigrationConsentRequestData:", v16);

    if (objc_msgSend(v23, "count"))
      objc_msgSend(v28, "addObject:", &off_100290E50);
    objc_storeStrong(&v23, 0);
  }
  v17 = objc_msgSend(location[0], "walletProvisioningContext", v23);
  v18 = objc_msgSend(v17, "setupAssistantCredentials");
  v19 = objc_msgSend(v18, "count");

  if (v19)
    objc_msgSend(v28, "addObject:", &off_100290F40);
  v20 = objc_msgSend(location[0], "actionButtonData");

  if (v20)
    objc_msgSend(v28, "addObject:", &off_100290F58);
  v21 = objc_msgSend(v28, "copy");
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (id)stringForDataSourceFeatures:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD __b[8];
  id v14;
  id v15;
  id v16;
  id location[2];
  BYExpressSetupDataProvider *v18;
  _BYTE v19[128];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class(v18);
  v16 = objc_msgSend(v3, "featuresArrayForDataSource:eligibleForChlorine:", location[0], -[BYExpressSetupDataProvider _eligibleForChlorine](v18, "_eligibleForChlorine"));
  v15 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  v4 = v16;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(v4);
        v14 = *(id *)(__b[1] + 8 * i);
        v8 = objc_msgSend(v14, "unsignedIntegerValue", 0);
        v9 = v15;
        v10 = -[BYExpressSetupDataProvider _stringForFeature:](v18, "_stringForFeature:", v8, v8);
        objc_msgSend(v9, "addObject:", v10);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
    }
    while (v5);
  }

  v11 = objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (BOOL)dataAvailable
{
  return 1;
}

- (id)sourceDeviceClass
{
  id v2;
  id v3;

  v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource", a2, self);
  v3 = objc_msgSend(v2, "sourceDeviceClass");

  return v3;
}

- (id)locationServicesOptIn
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 1))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "locationServicesOptIn");

  }
  return v5;
}

- (id)locationServicesSettings
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 1))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "locationServicesSettings");

  }
  return v5;
}

- (id)appAnalyticsOptIn
{
  id v2;
  id location[2];
  BYExpressSetupDataProvider *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 3))
  {
    v6 = 0;
  }
  else if (-[BYExpressSetupDataProvider _isRestrictedForFeature:](v5, "_isRestrictedForFeature:", 3))
  {
    v6 = 0;
  }
  else
  {
    location[0] = -[BYExpressSetupDataProvider deviceAnalyticsOptIn](v5, "deviceAnalyticsOptIn");
    if (location[0])
    {
      if ((objc_msgSend(location[0], "BOOLValue") & 1) != 0)
      {
        v2 = -[BYExpressSetupDataProvider dataSource](v5, "dataSource");
        v6 = objc_msgSend(v2, "appAnalyticsOptIn");

      }
      else
      {
        v6 = &__kCFBooleanFalse;
      }
    }
    else
    {
      v6 = 0;
    }
    objc_storeStrong(location, 0);
  }
  return v6;
}

- (id)deviceAnalyticsOptIn
{
  id v2;
  char v4;
  char v5;
  id v7;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 2))
  {
    v7 = 0;
  }
  else
  {
    v5 = -[BYExpressSetupDataProvider _countrySupportsFastDeviceAnalyticsOptIn](self, "_countrySupportsFastDeviceAnalyticsOptIn");
    v4 = -[BYExpressSetupDataProvider _isRestrictedForFeature:](self, "_isRestrictedForFeature:", 2);
    if ((v5 & 1) == 0 || (v4 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
      v7 = objc_msgSend(v2, "deviceAnalyticsOptIn");

    }
  }
  return v7;
}

- (id)siriOptIn
{
  id v2;
  id v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BYCapabilities *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  _BOOL8 v22;
  id v23;
  os_log_t v25;
  BOOL v26;
  id v27;
  char v28;
  id v29;
  char v30;
  char v31;
  id v32;
  void **block;
  int v34;
  int v35;
  id (*v36)(uint64_t);
  void *v37;
  id v38[2];
  uint64_t v39;
  uint64_t *v40;
  int v41;
  int v42;
  char v43;
  os_log_type_t v44;
  os_log_t oslog;
  char v46;
  char v47;
  uint8_t buf[15];
  os_log_type_t v49;
  id location[2];
  BYExpressSetupDataProvider *v51;
  id v52;
  uint8_t v53[48];
  uint8_t v54[24];

  v51 = self;
  location[1] = (id)a2;
  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 5))
  {
    v52 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](v51, "dataSource");
    v3 = objc_msgSend(v2, "siriOptIn");
    v4 = v3 == 0;

    if (v4)
    {
      location[0] = (id)_BYLoggingFacility(v5);
      v49 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
      {
        v6 = location[0];
        v7 = v49;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Express Data Provider: Siri is nil", buf, 2u);
      }
      objc_storeStrong(location, 0);
      v52 = 0;
    }
    else
    {
      v47 = -[BYExpressSetupDataProvider _isRestrictedForFeature:](v51, "_isRestrictedForFeature:", 5);
      v46 = 0;
      v8 = -[BYExpressSetupDataProvider capabilities](v51, "capabilities");
      v9 = 0;
      if ((-[BYCapabilities canShowSiriScreen](v8, "canShowSiriScreen") & 1) != 0)
        v9 = -[BYExpressSetupDataProvider _siriWantsToRun](v51, "_siriWantsToRun");

      v46 = v9 & 1;
      v10 = -[BYExpressSetupDataProvider dataSource](v51, "dataSource");
      v11 = objc_msgSend(v10, "siriOptIn");
      v12 = objc_msgSend(v11, "BOOLValue") ^ 1;

      if ((v12 & 1) != 0)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v13);
        v44 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_10003CBAC((uint64_t)v54, v46 & 1, v47 & 1);
          _os_log_impl((void *)&_mh_execute_header, oslog, v44, "Express Data Provider: Siri is disabled. Siri conditions: wantsToRun = %d, restricted = %d", v54, 0xEu);
        }
        objc_storeStrong((id *)&oslog, 0);
        if ((v47 & 1) != 0 || (v46 & 1) == 0)
        {
          v52 = 0;
        }
        else
        {
          v14 = -[BYExpressSetupDataProvider dataSource](v51, "dataSource");
          v52 = objc_msgSend(v14, "siriOptIn");

        }
      }
      else
      {
        v39 = 0;
        v40 = &v39;
        v41 = 0x20000000;
        v42 = 32;
        v43 = 0;
        v15 = -[BYExpressSetupDataProvider voiceProfileQueue](v51, "voiceProfileQueue");
        block = _NSConcreteStackBlock;
        v34 = -1073741824;
        v35 = 0;
        v36 = sub_1001304EC;
        v37 = &unk_100281780;
        v38[1] = &v39;
        v38[0] = v51;
        dispatch_sync(v15, &block);

        v16 = objc_msgSend(sub_100130530(), "sharedPreferences");
        v17 = objc_msgSend(v16, "allSiriLanguageCodesForSystemLanguageCode:isGoodFit:", 0, 0);
        v32 = objc_msgSend(v17, "count");

        v31 = -[BYExpressSetupDataProvider _supportsAlwaysOnHeySiri](v51, "_supportsAlwaysOnHeySiri");
        v30 = 0;
        v18 = 1;
        if (v31)
          v18 = *((_BYTE *)v40 + 24);
        v30 = v18 & 1;
        v19 = objc_msgSend(sub_100130530(), "sharedPreferences");
        v29 = objc_msgSend(v19, "languageCode");

        v28 = 0;
        v20 = 0;
        if ((unint64_t)v32 > 1)
        {
          v20 = 0;
          if (!v29)
            v20 = *((_BYTE *)v40 + 24) ^ 1;
        }
        v28 = v20 & 1;
        v21 = -[BYExpressSetupDataProvider dataSource](v51, "dataSource");
        v27 = objc_msgSend(v21, "siriVoiceTriggerEnabled");

        v22 = +[BYExpressSetupDataProvider _shouldAllowEnablingSiriWithVoiceTriggerEnabledSetting:hasNeededTrainingData:](BYExpressSetupDataProvider, "_shouldAllowEnablingSiriWithVoiceTriggerEnabledSetting:hasNeededTrainingData:", v27, v30 & 1);
        v26 = v22;
        v25 = (os_log_t)(id)_BYLoggingFacility(v22);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          sub_10013061C((uint64_t)v53, v46 & 1, v28 & 1, v47 & 1, v31 & 1, v40[3] & 1, (uint64_t)v27, v26);
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Express Data Provider: Siri conditions: wantsToRun = %d, needsLanguageDisambiguation = %d, restricted = %d, supportsAOP = %d, hasVoiceProfileIniCloud = %d, voiceTriggerEnabledSetting = %@, shouldAllowEnablingSiriWithVoiceTriggerDetails = %d", v53, 0x30u);
        }
        objc_storeStrong((id *)&v25, 0);
        if ((v47 & 1) != 0 || (v46 & 1) == 0 || (v28 & 1) != 0 || !v26)
        {
          v52 = 0;
        }
        else
        {
          v23 = -[BYExpressSetupDataProvider dataSource](v51, "dataSource");
          v52 = objc_msgSend(v23, "siriOptIn");

        }
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(v38, 0);
        _Block_object_dispose(&v39, 8);
      }
    }
  }
  return v52;
}

+ (BOOL)_shouldAllowEnablingSiriWithVoiceTriggerEnabledSetting:(id)a3 hasNeededTrainingData:(BOOL)a4
{
  id location[3];
  BOOL v7;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
    v7 = (objc_msgSend(location[0], "BOOLValue") & 1) == 0 || a4;
  else
    v7 = 0;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 5))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "siriVoiceProfileAvailabilityMetadata");

  }
  return v5;
}

- (id)siriDataSharingOptIn
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 5))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "siriDataSharingOptIn");

  }
  return v5;
}

- (id)siriVoiceTriggerEnabled
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 5))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "siriVoiceTriggerEnabled");

  }
  return v5;
}

- (id)screenTimeEnabled
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 7))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "screenTimeEnabled");

  }
  return v5;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 8))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "softwareUpdateAutoUpdateEnabled");

  }
  return v5;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 8))
  {
    v5 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
    v5 = objc_msgSend(v2, "softwareUpdateAutoDownloadEnabled");

  }
  return v5;
}

- (int64_t)userInterfaceStyleModeValue
{
  id v2;
  id v5;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 9))
    return 0;
  v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
  v5 = objc_msgSend(v2, "userInterfaceStyleModeValue");

  return (int64_t)v5;
}

- (id)watchMigrationData
{
  BYCapabilities *v2;
  char v3;
  id v4;
  id v7;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 10))
  {
    v7 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
    v3 = -[BYCapabilities supportsAppleWatch](v2, "supportsAppleWatch") ^ 1;

    if ((v3 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v4 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
      v7 = objc_msgSend(v4, "watchMigrationData");

    }
  }
  return v7;
}

- (PKPaymentSetupAssistantProvisioningContext)walletProvisioningContext
{
  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 11))
    return (PKPaymentSetupAssistantProvisioningContext *)0;
  else
    return self->_walletProvisioningContext;
}

- (id)walletMetadata
{
  id v2;
  id v3;

  v2 = -[BYExpressSetupDataProvider dataSource](self, "dataSource", a2, self);
  v3 = objc_msgSend(v2, "walletMetadata");

  return v3;
}

- (id)actionButtonData
{
  BYDeviceProvider *v2;
  char v3;
  id v4;
  id v7;

  if (-[BYExpressSetupDataProvider _isControllerSkippedForFeature:](self, "_isControllerSkippedForFeature:", 12))
  {
    v7 = 0;
  }
  else
  {
    v2 = -[BYExpressSetupDataProvider deviceProvider](self, "deviceProvider");
    v3 = -[BYDeviceProvider hasActionButton](v2, "hasActionButton") ^ 1;

    if ((v3 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v4 = -[BYExpressSetupDataProvider dataSource](self, "dataSource");
      v7 = objc_msgSend(v4, "actionButtonData");

    }
  }
  return v7;
}

- (void)prepare:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BYExpressSetupDataProvider *v9;
  id v10;
  id location[2];
  BYExpressSetupDataProvider *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100130D18;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_fetchSiriVoiceProfileAvailability
{
  id v2;
  uint64_t v3;
  NSLocale *v4;
  NSString *v5;
  NSString *v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  unsigned __int8 v10;
  os_log_t v12;
  BOOL v13;
  id location;
  os_log_type_t v15;
  os_log_t v16;
  os_log_type_t v17;
  os_log_t oslog;
  id v19[2];
  BYExpressSetupDataProvider *v20;
  BOOL v21;
  uint8_t v22[32];
  uint8_t v23[16];
  uint8_t buf[24];

  v20 = self;
  v19[1] = (id)a2;
  if (-[BYExpressSetupDataProvider _supportsAlwaysOnHeySiri](self, "_supportsAlwaysOnHeySiri"))
  {
    v2 = objc_msgSend(sub_100130530(), "sharedPreferences");
    v19[0] = objc_msgSend(v2, "languageCode");

    if (!v19[0])
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v3);
      v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100038C28((uint64_t)buf, (uint64_t)v19[0]);
        _os_log_impl((void *)&_mh_execute_header, oslog, v17, "Language code from AFPreferences = %@", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v4 = +[NSLocale currentLocale](NSLocale, "currentLocale");
      v5 = -[NSLocale localeIdentifier](v4, "localeIdentifier");
      v6 = +[NSLocale canonicalLanguageIdentifierFromString:](NSLocale, "canonicalLanguageIdentifierFromString:", v5);
      v7 = v19[0];
      v19[0] = v6;

      v16 = (os_log_t)(id)_BYLoggingFacility(v8);
      v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        sub_100038C28((uint64_t)v23, (uint64_t)v19[0]);
        _os_log_impl((void *)&_mh_execute_header, v16, v15, "Canonical language identifier from NSLocale = %@", v23, 0xCu);
      }
      objc_storeStrong((id *)&v16, 0);
    }
    location = -[BYExpressSetupDataProvider siriVoiceProfileAvailabilityMetadata](v20, "siriVoiceProfileAvailabilityMetadata");
    v9 = -[BYExpressSetupDataProvider _hasiCloudSiriTrainingDataForLanguage:withMetadata:](v20, "_hasiCloudSiriTrainingDataForLanguage:withMetadata:", v19[0], location);
    v13 = v9;
    v12 = (os_log_t)(id)_BYLoggingFacility(v9);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[BYExpressSetupDataProvider hasVoiceProfileIniCloud](v20, "hasVoiceProfileIniCloud");
      sub_10005A460((uint64_t)v22, v10 & 1, (uint64_t)v19[0]);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Has stored voice profile = %d, language = %@", v22, 0x12u);
    }
    objc_storeStrong((id *)&v12, 0);
    v21 = v13;
    objc_storeStrong(&location, 0);
    objc_storeStrong(v19, 0);
  }
  else
  {
    return 0;
  }
  return v21;
}

- (void)applyExpressSettings
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  _QWORD __b[8];
  id v10;
  uint8_t buf[15];
  os_log_type_t v12;
  os_log_t oslog[2];
  BYExpressSetupDataProvider *v14;
  _BYTE v15[128];

  v14 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v12;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Apply express settings...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  memset(__b, 0, sizeof(__b));
  v4 = -[BYExpressSetupDataProvider expressSetupFeatures](v14, "expressSetupFeatures");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v5; ++i)
      {
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(v4);
        v10 = *(id *)(__b[1] + 8 * i);
        v8 = objc_msgSend(v10, "unsignedIntegerValue", 0);
        -[BYExpressSetupDataProvider applyDataSourceSetting:forFeature:](v14, "applyDataSourceSetting:forFeature:", 1, v8, v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    }
    while (v5);
  }

}

- (void)revertExpressSettings
{
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  _QWORD __b[8];
  id v11;
  uint8_t buf[15];
  os_log_type_t v13;
  os_log_t oslog[2];
  BYExpressSetupDataProvider *v15;
  _BYTE v16[128];

  v15 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[NSMutableArray count](self->_appliedFeatures, "count");
  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v2);
    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog[0];
      v4 = v13;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Revert express settings", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    memset(__b, 0, sizeof(__b));
    v5 = v15->_appliedFeatures;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(_QWORD *)__b[2] != v7)
            objc_enumerationMutation(v5);
          v11 = *(id *)(__b[1] + 8 * i);
          v9 = objc_msgSend(v11, "unsignedIntegerValue", 0);
          -[BYExpressSetupDataProvider _applyDataSourceSetting:forFeature:](v15, "_applyDataSourceSetting:forFeature:", 0, v9, v9);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](v15->_appliedFeatures, "removeAllObjects");
  }
}

- (id)_stringForFeature:(unint64_t)a3
{
  id result;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("Location Services");
      break;
    case 2uLL:
      result = CFSTR("Device Analytics");
      break;
    case 3uLL:
      result = CFSTR("App Analytics");
      break;
    case 4uLL:
      result = CFSTR("Device And App Analytics");
      break;
    case 5uLL:
      result = CFSTR("Siri");
      break;
    case 6uLL:
      result = CFSTR("Siri Data Sharing");
      break;
    case 7uLL:
      result = CFSTR("Screen Time");
      break;
    case 8uLL:
      result = CFSTR("Auto Update");
      break;
    case 9uLL:
      result = CFSTR("Appearance");
      break;
    case 0xAuLL:
      result = CFSTR("Watch");
      break;
    case 0xBuLL:
      result = CFSTR("Apple Wallet");
      break;
    case 0xCuLL:
      result = CFSTR("Action Button");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)applyDataSourceSetting:(BOOL)a3 forFeature:(unint64_t)a4
{
  NSMutableArray *appliedFeatures;
  NSNumber *v5;
  id location;
  os_log_type_t v7;
  os_log_t oslog;
  unint64_t v9;
  BOOL v10;
  SEL v11;
  BYExpressSetupDataProvider *v12;
  uint8_t buf[24];

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = a4;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    location = -[BYExpressSetupDataProvider _stringForFeature:](v12, "_stringForFeature:", v9);
    sub_100039500((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Applying value from data source for %{public}@...", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BYExpressSetupDataProvider _applyDataSourceSetting:forFeature:](v12, "_applyDataSourceSetting:forFeature:", v10, v9);
  if (v10)
  {
    appliedFeatures = v12->_appliedFeatures;
    v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9);
    -[NSMutableArray addObject:](appliedFeatures, "addObject:", v5);

  }
}

- (id)_descriptionForDataSource:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v21;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = objc_alloc_init((Class)NSMutableString);
  v3 = objc_opt_class(location[0]);
  objc_msgSend(v21, "appendFormat:", CFSTR("<%@: %p {\n"), v3, location[0]);
  v4 = objc_msgSend(location[0], "locationServicesOptIn");
  v5 = objc_msgSend(location[0], "locationServicesSettings");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tLocation Services: (opt-in: %@, data: %@)\n"), v4, v5);

  v6 = objc_msgSend(location[0], "deviceAnalyticsOptIn");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tDevice Analytics: %@\n"), v6);

  v7 = objc_msgSend(location[0], "appAnalyticsOptIn");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tApp Analytics: %@\n"), v7);

  v8 = objc_msgSend(location[0], "siriOptIn");
  v9 = objc_msgSend(location[0], "siriVoiceProfileAvailabilityMetadata");
  v10 = objc_msgSend(location[0], "siriDataSharingOptIn");
  v11 = objc_msgSend(location[0], "siriVoiceTriggerEnabled");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tSiri: (opt-in: %@, metadata: %@, data sharing: %@, voice trigger enabled: %@)\n"), v8, v9, v10, v11);

  v12 = objc_msgSend(location[0], "screenTimeEnabled");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tScreen Time: %@\n"), v12);

  v13 = objc_msgSend(location[0], "softwareUpdateAutoUpdateEnabled");
  v14 = objc_msgSend(location[0], "softwareUpdateAutoDownloadEnabled");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tAuto Update: (update: %@, download: %@)\n"), v13, v14);

  objc_msgSend(v21, "appendFormat:", CFSTR("\tAppearance: %ld\n"), objc_msgSend(location[0], "userInterfaceStyleModeValue"));
  v15 = objc_msgSend(location[0], "watchMigrationData");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tWatch: %@\n"), v15);

  v16 = objc_msgSend(location[0], "walletProvisioningContext");
  v17 = objc_msgSend(v16, "setupAssistantCredentials");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tApple Wallet: %lu credentials\n"), objc_msgSend(v17, "count"));

  v18 = objc_msgSend(location[0], "actionButtonData");
  objc_msgSend(v21, "appendFormat:", CFSTR("\tAction Button: %@\n"), v18);

  objc_msgSend(v21, "appendString:", CFSTR("}>"));
  v19 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (void)_applyDataSourceSetting:(BOOL)a3 forFeature:(unint64_t)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  BFFSettingsManager *v9;
  unsigned __int8 v10;
  BFFSettingsManager *v11;
  id v12;
  id v13;
  unsigned __int8 v14;
  BYChronicle *v15;
  BFFSettingsManager *v16;
  BYPreferencesController *v17;
  BFFSettingsManager *v18;
  BYPreferencesController *v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  BFFSettingsManager *v23;
  BYPreferencesController *v24;
  BFFSettingsManager *v25;
  BYPreferencesController *v26;
  id v27;
  id v28;
  unsigned __int8 v29;
  char v30;
  BYChronicle *v31;
  BFFSettingsManager *v32;
  BYPreferencesController *v33;
  BFFSettingsManager *v34;
  BYPreferencesController *v35;
  BFFSettingsManager *v36;
  BYPreferencesController *v37;
  char v38;
  char v39;
  BFFSettingsManager *v40;
  id v41;
  char v42;
  id v43;
  uint64_t v44;
  id v45;
  BFFSettingsManager *v46;
  BYPreferencesController *v47;
  NSNumber *v48;
  BYPreferencesController *v49;
  NSNumber *v50;
  id v51;
  BOOL v52;
  id v53;
  id v54;
  unsigned __int8 v55;
  id v56;
  BYPreferencesController *v57;
  id v58;
  unsigned __int8 v59;
  BYPreferencesController *v60;
  id v61;
  unsigned __int8 v62;
  BYPreferencesController *v63;
  id v64;
  BYPreferencesController *v65;
  BYPreferencesController *v66;
  id v67;
  BFFSettingsManager *v68;
  BYPreferencesController *v69;
  BFFSettingsManager *v70;
  BYPreferencesController *v71;
  PKPaymentSetupAssistantProvisioningContext *v72;
  BuddyMiscState *v73;
  id v74;
  BFFSettingsManager *v75;
  id v76;
  BYPreferencesController *v77;
  NSNumber *v78;
  id v79;
  id v80;
  os_log_type_t v81;
  os_log_t v82;
  char v83;
  id v84;
  char v85;
  id v86;
  uint64_t v87;
  id v88;
  os_log_type_t v89;
  os_log_t v90;
  id v91;
  os_log_type_t v92;
  os_log_t v93;
  char v94;
  id v95;
  char v96;
  id v97;
  char v98;
  os_log_type_t v99;
  os_log_t oslog;
  char v101;
  id v102;
  char v103;
  id v104;
  char v105;
  char v106;
  char v107;
  id v108;
  char v109;
  id v110;
  char v111;
  id location[2];
  BOOL v113;
  SEL v114;
  BYExpressSetupDataProvider *v115;
  uint8_t v116[16];
  uint8_t v117[16];
  uint8_t v118[16];
  uint8_t buf[8];

  v115 = self;
  v114 = a2;
  v113 = a3;
  location[1] = (id)a4;
  switch(a4)
  {
    case 1uLL:
      v4 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
      v5 = objc_msgSend(v4, "locationServicesSettings");

      if (v5)
      {
        location[0] = 0;
        if (v113)
        {
          v6 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
          v7 = objc_msgSend(v6, "locationServicesSettings");
          v8 = location[0];
          location[0] = v7;

        }
        v9 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        +[BuddyLocationServicesController setSettingsFromArchivedPreferences:settingsManager:](BuddyLocationServicesController, "setSettingsFromArchivedPreferences:settingsManager:", location[0], v9);

        objc_storeStrong(location, 0);
      }
      else
      {
        v111 = 0;
        v109 = 0;
        v107 = 0;
        v10 = 0;
        if (v113)
        {
          v110 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
          v109 = 1;
          v108 = objc_msgSend(v110, "locationServicesOptIn");
          v107 = 1;
          v10 = objc_msgSend(v108, "BOOLValue");
        }
        if ((v107 & 1) != 0)

        if ((v109 & 1) != 0)
        v111 = v10 & 1;
        v11 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        +[BuddyLocationServicesController setSettingEnabled:presented:settingsManager:](BuddyLocationServicesController, "setSettingEnabled:presented:settingsManager:", v10 & 1, v113, v11);

      }
      break;
    case 2uLL:
      if (v113)
      {
        v12 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v13 = objc_msgSend(v12, "deviceAnalyticsOptIn");
        v14 = objc_msgSend(v13, "BOOLValue");
        v15 = -[BYExpressSetupDataProvider chronicle](v115, "chronicle");
        v16 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v17 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyDiagnosticsController setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:](BuddyDiagnosticsController, "setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:", v14 & 1, 1, v15, v16, v17);

      }
      else
      {
        v18 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v19 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyDiagnosticsController clearDeviceAnalyticsSettingWithSettingsManager:buddyPreferences:](BuddyDiagnosticsController, "clearDeviceAnalyticsSettingWithSettingsManager:buddyPreferences:", v18, v19);

      }
      break;
    case 3uLL:
      if (v113)
      {
        v20 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v21 = objc_msgSend(v20, "appAnalyticsOptIn");
        v22 = objc_msgSend(v21, "BOOLValue");
        v23 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v24 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyAppActivityController setAppActivityEnabled:presented:settingsManager:buddyPreferences:](BuddyAppActivityController, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", v22 & 1, 1, v23, v24);

      }
      else
      {
        v25 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v26 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyAppActivityController clearAppActivitySettingWithSettingsManager:buddyPreferences:](BuddyAppActivityController, "clearAppActivitySettingWithSettingsManager:buddyPreferences:", v25, v26);

      }
      break;
    case 4uLL:
      if (v113)
      {
        v27 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v28 = objc_msgSend(v27, "deviceAnalyticsOptIn");
        v29 = objc_msgSend(v28, "BOOLValue");

        v106 = v29 & 1;
        v30 = v29 & 1;
        v31 = -[BYExpressSetupDataProvider chronicle](v115, "chronicle");
        v32 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v33 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyDiagnosticsController setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:](BuddyDiagnosticsController, "setDeviceAnalyticsSubmissionEnabled:presented:chronicle:settingsManager:buddyPreferences:", v30 & 1, 1, v31, v32, v33);

        v34 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v35 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyAppActivityController setAppActivityEnabled:presented:settingsManager:buddyPreferences:](BuddyAppActivityController, "setAppActivityEnabled:presented:settingsManager:buddyPreferences:", v106 & 1, 1, v34, v35);
      }
      else
      {
        v36 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v37 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyDiagnosticsController clearDeviceAnalyticsSettingWithSettingsManager:buddyPreferences:](BuddyDiagnosticsController, "clearDeviceAnalyticsSettingWithSettingsManager:buddyPreferences:", v36, v37);

        v34 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v35 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyAppActivityController clearAppActivitySettingWithSettingsManager:buddyPreferences:](BuddyAppActivityController, "clearAppActivitySettingWithSettingsManager:buddyPreferences:", v34, v35);
      }

      break;
    case 5uLL:
      v105 = 0;
      v103 = 0;
      v101 = 0;
      v38 = 0;
      if (v113)
      {
        v104 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v103 = 1;
        v102 = objc_msgSend(v104, "siriOptIn");
        v101 = 1;
        self = (BYExpressSetupDataProvider *)objc_msgSend(v102, "BOOLValue");
        v38 = (char)self;
      }
      if ((v101 & 1) != 0)

      if ((v103 & 1) != 0)
      v105 = v38 & 1;
      oslog = (os_log_t)(id)_BYLoggingFacility(self);
      v99 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100046FA0(buf, v105 & 1);
        _os_log_impl((void *)&_mh_execute_header, oslog, v99, "Setting Siri enabled to %d", buf, 8u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v39 = v105;
      v40 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
      +[AssistantOptInController setAssistantEnabled:settingsManager:](AssistantOptInController, "setAssistantEnabled:settingsManager:", v39 & 1, v40);

      v98 = 0;
      v96 = 0;
      v94 = 0;
      v42 = 0;
      if ((v105 & 1) != 0)
      {
        v97 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v96 = 1;
        v95 = objc_msgSend(v97, "siriVoiceTriggerEnabled");
        v94 = 1;
        v41 = objc_msgSend(v95, "BOOLValue");
        v42 = (char)v41;
      }
      if ((v94 & 1) != 0)

      if ((v96 & 1) != 0)
      v98 = v42 & 1;
      v93 = (os_log_t)(id)_BYLoggingFacility(v41);
      v92 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        sub_100046FA0(v118, v98 & 1);
        _os_log_impl((void *)&_mh_execute_header, v93, v92, "Setting Siri voice trigger enabled to %d", v118, 8u);
      }
      objc_storeStrong((id *)&v93, 0);
      if ((v98 & 1) != 0)
      {
        v43 = objc_msgSend(sub_100130530(), "sharedPreferences");
        v91 = objc_msgSend(v43, "languageCode");

        v90 = (os_log_t)(id)_BYLoggingFacility(v44);
        v89 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          sub_100038C28((uint64_t)v117, (uint64_t)v91);
          _os_log_impl((void *)&_mh_execute_header, v90, v89, "Will enable Voice Trigger upon sync for language: %@", v117, 0xCu);
        }
        objc_storeStrong((id *)&v90, 0);
        v45 = objc_msgSend(sub_100132C40(), "sharedInstance");
        objc_msgSend(v45, "enableVoiceTriggerUponVoiceProfileSyncForLanguage:", v91);

        objc_storeStrong(&v91, 0);
      }
      v46 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
      -[BFFSettingsManager setAssistantVoiceTriggerEnabled:](v46, "setAssistantVoiceTriggerEnabled:", v98 & 1);

      v47 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
      v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v113);
      -[BYPreferencesController setObject:forKey:](v47, "setObject:forKey:", v48, BYBuddyAssistantPresentedKey);

      if (-[BYExpressSetupDataProvider _supportsAlwaysOnHeySiri](v115, "_supportsAlwaysOnHeySiri"))
      {
        v49 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        v50 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v113);
        -[BYPreferencesController setObject:forKey:](v49, "setObject:forKey:", v50, BYBuddyAssistantPHSOfferedKey);

      }
      break;
    case 6uLL:
      v51 = objc_alloc_init((Class)sub_100132D2C());
      v88 = v51;
      v87 = 0;
      v85 = 0;
      v83 = 0;
      v52 = 0;
      if (v113)
      {
        v86 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v85 = 1;
        v51 = objc_msgSend(v86, "siriDataSharingOptIn");
        v84 = v51;
        v83 = 1;
        v52 = v51 != 0;
      }
      if ((v83 & 1) != 0)

      if ((v85 & 1) != 0)
      if (v52)
      {
        v53 = -[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v54 = objc_msgSend(v53, "siriDataSharingOptIn");
        v55 = objc_msgSend(v54, "BOOLValue");

        if ((v55 & 1) != 0)
          v87 = 1;
        else
          v87 = 2;
      }
      v82 = (os_log_t)(id)_BYLoggingFacility(v51);
      v81 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        sub_100132E18((uint64_t)v116, v87);
        _os_log_impl((void *)&_mh_execute_header, v82, v81, "Setting Siri data sharing opt-in to %{public}ld", v116, 0xCu);
      }
      objc_storeStrong((id *)&v82, 0);
      v56 = +[BYExpressSetupDataProvider stringForDataSourceType:](BYExpressSetupDataProvider, "stringForDataSourceType:", -[BYExpressSetupDataProvider dataSourceType](v115, "dataSourceType"));
      v80 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("express setup (%@)"), v56);

      objc_msgSend(v88, "setSiriDataSharingOptInStatus:propagateToHomeAccessories:source:reason:completion:", v87, 0, 1, v80, &stru_1002833D0);
      objc_storeStrong(&v80, 0);
      objc_storeStrong(&v88, 0);
      break;
    case 7uLL:
      if (v113)
      {
        v57 = (BYPreferencesController *)-[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v58 = -[BYPreferencesController screenTimeEnabled](v57, "screenTimeEnabled");
        v59 = objc_msgSend(v58, "BOOLValue");
        v60 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyScreenTimeController setScreenTimeEnabled:presented:buddyPreferences:](BuddyScreenTimeController, "setScreenTimeEnabled:presented:buddyPreferences:", v59 & 1, 1, v60);

      }
      else
      {
        v57 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyScreenTimeController clearScreenTimeSetting:](BuddyScreenTimeController, "clearScreenTimeSetting:", v57);
      }
      goto LABEL_61;
    case 8uLL:
      if (v113)
      {
        v57 = (BYPreferencesController *)-[BYExpressSetupDataProvider dataSource](v115, "dataSource");
        v61 = -[BYPreferencesController softwareUpdateAutoUpdateEnabled](v57, "softwareUpdateAutoUpdateEnabled");
        v62 = objc_msgSend(v61, "BOOLValue");
        v63 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyAutoUpdateController setAutoDownloadWithUpdateEnabled:presented:buddyPreferences:](BuddyAutoUpdateController, "setAutoDownloadWithUpdateEnabled:presented:buddyPreferences:", v62 & 1, 1, v63);

      }
      else
      {
        v57 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyAutoUpdateController clearAutoDownloadWithUpdateSetting:](BuddyAutoUpdateController, "clearAutoDownloadWithUpdateSetting:", v57);
      }
LABEL_61:

      break;
    case 9uLL:
      if (v113)
      {
        v64 = -[BYExpressSetupDataProvider userInterfaceStyleModeValue](v115, "userInterfaceStyleModeValue");
        v65 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyUserInterfaceStyleSelector setUserInterfaceStyleModeValue:presented:buddyPreferences:](BuddyUserInterfaceStyleSelector, "setUserInterfaceStyleModeValue:presented:buddyPreferences:", v64, 1, v65);

      }
      else
      {
        v66 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
        +[BuddyUserInterfaceStyleSelector clearUserInterfaceStyleMode:](BuddyUserInterfaceStyleSelector, "clearUserInterfaceStyleMode:", v66);

      }
      break;
    case 0xAuLL:
      if (v113)
      {
        v67 = -[BYExpressSetupDataProvider pairedWatches](v115, "pairedWatches");
        v79 = +[NRMigrator migrationDataPreRestoreForConsentedDevices:](NRMigrator, "migrationDataPreRestoreForConsentedDevices:", v67);

        v68 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v69 = -[BYExpressSetupDataProvider buddyPreferencesExcludedFromBackup](v115, "buddyPreferencesExcludedFromBackup");
        +[BuddyWatchMigrationController setWatchDataForMigration:presented:settingsManager:buddyPreferencesExcludedFromBackup:](BuddyWatchMigrationController, "setWatchDataForMigration:presented:settingsManager:buddyPreferencesExcludedFromBackup:", v79, 1, v68, v69);

        objc_storeStrong(&v79, 0);
      }
      else
      {
        v70 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v71 = -[BYExpressSetupDataProvider buddyPreferencesExcludedFromBackup](v115, "buddyPreferencesExcludedFromBackup");
        +[BuddyWatchMigrationController clearWatchDataForMigrationWithSettingsManager:buddyPreferencesExcludedFromBackup:](BuddyWatchMigrationController, "clearWatchDataForMigrationWithSettingsManager:buddyPreferencesExcludedFromBackup:", v70, v71);

      }
      break;
    case 0xBuLL:
      if (v113)
      {
        v72 = -[BYExpressSetupDataProvider walletProvisioningContext](v115, "walletProvisioningContext");
        v73 = -[BYExpressSetupDataProvider miscState](v115, "miscState");
        -[BuddyMiscState setWalletProvisioningContext:](v73, "setWalletProvisioningContext:", v72);

      }
      else
      {
        v72 = -[BYExpressSetupDataProvider miscState](v115, "miscState");
        -[PKPaymentSetupAssistantProvisioningContext setWalletProvisioningContext:](v72, "setWalletProvisioningContext:", 0);
      }

      break;
    case 0xCuLL:
      if (v113)
      {
        v74 = -[BYExpressSetupDataProvider actionButtonData](v115, "actionButtonData");
        +[BYActionButtonStore setCurrentData:](BYActionButtonStore, "setCurrentData:", v74);

        v75 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        v76 = -[BYExpressSetupDataProvider actionButtonData](v115, "actionButtonData");
        -[BFFSettingsManager stashActionButtonData:](v75, "stashActionButtonData:", v76);

      }
      else
      {
        +[BYActionButtonStore setCurrentData:](BYActionButtonStore, "setCurrentData:", 0);
        v75 = -[BYExpressSetupDataProvider settingsManager](v115, "settingsManager");
        -[BFFSettingsManager stashActionButtonData:](v75, "stashActionButtonData:", 0);
      }

      v77 = -[BYExpressSetupDataProvider buddyPreferences](v115, "buddyPreferences");
      v78 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v113);
      -[BYPreferencesController setObject:forKey:](v77, "setObject:forKey:", v78, CFSTR("ButtonConfigurationPresented"));

      break;
    default:
      return;
  }
}

- (BOOL)_isControllerSkippedForFeature:(unint64_t)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  switch(a3)
  {
    case 1uLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyLocationServicesController), a3, a2);
      break;
    case 2uLL:
    case 4uLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyDiagnosticsController), a3, a2);
      break;
    case 3uLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyAppActivityController), a3, a2);
      break;
    case 5uLL:
    case 6uLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(AssistantOptInController), a3, a2);
      break;
    case 7uLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyScreenTimeController), a3, a2);
      break;
    case 8uLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyAutoUpdateController), a3, a2);
      break;
    case 9uLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyUserInterfaceStyleSelector), a3, a2);
      break;
    case 0xAuLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyWatchMigrationController), a3, a2);
      break;
    case 0xBuLL:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", objc_opt_class(BuddyPaymentController), a3, a2);
      break;
    case 0xCuLL:
      v7 = objc_opt_class(_TtC5Setup28BuddyButtonConfigurationFlow);
      goto LABEL_12;
    default:
LABEL_12:
      v3 = -[BYExpressSetupDataProvider _cloudConfigManager](self, "_cloudConfigManager", v7, a3, a2);
      break;
  }
  v4 = v3;
  v5 = objc_msgSend(v4, "cloudConfigWantsToSkipControllerClass:", v8);

  return v5 & 1;
}

- (BOOL)_isRestrictedForFeature:(unint64_t)a3
{
  BYCapabilities *v3;
  BYCapabilities *v4;
  BYCapabilities *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  BYCapabilities *v8;
  BYCapabilities *v9;
  char v11;
  BYCapabilities *v12;
  char v14;

  switch(a3)
  {
    case 1uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      v14 = 0;
      break;
    case 2uLL:
      v3 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
      v14 = -[BYCapabilities isDeviceAnalyticsRestricted](v3, "isDeviceAnalyticsRestricted") & 1;

      break;
    case 3uLL:
      v4 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
      v14 = -[BYCapabilities isAppAnalyticsRestricted](v4, "isAppAnalyticsRestricted") & 1;

      break;
    case 4uLL:
      v5 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
      v6 = -[BYCapabilities isDeviceAnalyticsRestricted](v5, "isDeviceAnalyticsRestricted");
      v11 = 0;
      v7 = 1;
      if ((v6 & 1) == 0)
      {
        v12 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
        v11 = 1;
        v7 = -[BYCapabilities isAppAnalyticsRestricted](v12, "isAppAnalyticsRestricted");
      }
      v14 = v7 & 1;
      if ((v11 & 1) != 0)

      break;
    case 5uLL:
    case 6uLL:
      v8 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
      v14 = -[BYCapabilities isSiriRestricted](v8, "isSiriRestricted") & 1;

      break;
    case 7uLL:
      v9 = -[BYExpressSetupDataProvider capabilities](self, "capabilities");
      v14 = -[BYCapabilities isScreenTimeRestricted](v9, "isScreenTimeRestricted") & 1;

      break;
    default:
      return v14 & 1;
  }
  return v14 & 1;
}

- (id)_cloudConfigManager
{
  return +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager", a2, self);
}

- (BOOL)_countrySupportsFastDeviceAnalyticsOptIn
{
  id location;
  id v4[3];
  BOOL v5;

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[BYExpressSetupDataProvider _countryCode](self, "_countryCode");
  location = &off_100290BA8;
  v5 = (objc_msgSend(location, "containsObject:", v4[0]) & 1) == 0;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
  return v5;
}

- (id)_countryCode
{
  NSLocale *v2;
  NSString *v3;

  v2 = +[NSLocale currentLocale](NSLocale, "currentLocale", a2, self);
  v3 = -[NSLocale countryCode](v2, "countryCode");

  return v3;
}

- (BOOL)_siriWantsToRun
{
  return BYAssistantScreenShouldBeShownInSetupAssistant(self, a2) & 1;
}

- (BOOL)_supportsAlwaysOnHeySiri
{
  return MGGetBoolAnswer(CFSTR("U+73bmG4kBGj6kpreQXUTQ")) & 1;
}

- (BOOL)_hasiCloudSiriTrainingDataForLanguage:(id)a3 withMetadata:(id)a4
{
  id v5;
  unsigned __int8 v6;
  id v7;
  char v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = objc_msgSend(sub_100132C40(), "sharedInstance");
  v6 = objc_msgSend(v5, "hasVoiceProfileIniCloudForLanguageCode:withBackupMetaBlob:", location[0], v10);

  v9 = v6 & 1;
  if ((v6 & 1) == 0)
  {
    v7 = objc_msgSend(sub_100132C40(), "sharedInstance");
    v9 = objc_msgSend(v7, "hasVoiceProfileIniCloudForLanguageCode:", location[0]) & 1;

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

+ (BOOL)_shouldAddFeatureDeviceAndAppAnalyticsForDataSource:(id)a3
{
  id v3;
  unsigned __int8 v4;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  id location[3];
  char v13;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "deviceAnalyticsOptIn");
  v10 = 0;
  v8 = 0;
  v6 = 0;
  v4 = 0;
  if (v3)
  {
    v11 = objc_msgSend(location[0], "appAnalyticsOptIn");
    v10 = 1;
    v4 = 0;
    if (v11)
    {
      v9 = objc_msgSend(location[0], "deviceAnalyticsOptIn");
      v8 = 1;
      v7 = objc_msgSend(location[0], "appAnalyticsOptIn");
      v6 = 1;
      v4 = objc_msgSend(v9, "isEqualToNumber:");
    }
  }
  v13 = v4 & 1;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  if ((v10 & 1) != 0)

  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (BYExpressSetupCloudSource)cloudDataSource
{
  return self->_cloudDataSource;
}

- (void)setCloudDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_cloudDataSource, a3);
}

- (BYExpressSetupProximityDataSource)proximitySetupDataSource
{
  return self->_proximitySetupDataSource;
}

- (void)setProximitySetupDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupDataSource, a3);
}

- (BYExpressSetupBackupSource)backupDataSource
{
  return self->_backupDataSource;
}

- (void)setBackupDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_backupDataSource, a3);
}

- (BYExpressSetupDefaultSource)defaultSource
{
  return self->_defaultSource;
}

- (void)setDefaultSource:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSource, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (void)setWalletProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_walletProvisioningContext, a3);
}

- (BOOL)willRestoreOrMigrate
{
  return self->_willRestoreOrMigrate;
}

- (void)setWillRestoreOrMigrate:(BOOL)a3
{
  self->_willRestoreOrMigrate = a3;
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
{
  objc_storeStrong((id *)&self->_chronicle, a3);
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_displayZoomExecutor, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProvider, a3);
}

- (BOOL)hasVoiceProfileIniCloud
{
  return self->_hasVoiceProfileIniCloud;
}

- (void)setHasVoiceProfileIniCloud:(BOOL)a3
{
  self->_hasVoiceProfileIniCloud = a3;
}

- (OS_dispatch_queue)voiceProfileQueue
{
  return self->_voiceProfileQueue;
}

- (void)setVoiceProfileQueue:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfileQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileQueue, 0);
  objc_storeStrong((id *)&self->_deviceProvider, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_displayZoomExecutor, 0);
  objc_storeStrong((id *)&self->_chronicle, 0);
  objc_storeStrong((id *)&self->_walletProvisioningContext, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_defaultSource, 0);
  objc_storeStrong((id *)&self->_backupDataSource, 0);
  objc_storeStrong((id *)&self->_proximitySetupDataSource, 0);
  objc_storeStrong((id *)&self->_cloudDataSource, 0);
  objc_storeStrong((id *)&self->_appliedFeatures, 0);
  objc_storeStrong((id *)&self->_listedFeatures, 0);
}

@end
