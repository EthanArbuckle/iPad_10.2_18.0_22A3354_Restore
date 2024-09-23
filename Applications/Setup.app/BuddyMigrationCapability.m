@implementation BuddyMigrationCapability

+ (BOOL)currentDeviceShouldOfferMigration
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _WORD v21[3];
  os_log_type_t v22;
  os_log_t v23;
  uint8_t v24[7];
  os_log_type_t v25;
  os_log_t v26;
  uint8_t v27[7];
  os_log_type_t v28;
  os_log_t oslog;
  uint8_t buf[15];
  os_log_type_t v31;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  if ((BYSetupAssistantHasCompletedInitialRun(a1, a2) & 1) != 0)
    return 0;
  v2 = +[BuddyMigrationCapability _currentHardwareSupportsMigration](BuddyMigrationCapability, "_currentHardwareSupportsMigration");
  if (v2)
  {
    v5 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
    v6 = objc_msgSend(v5, "activationRecordIndicatesCloudConfigurationIsAvailable");

    if ((v6 & 1) != 0)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v7);
      v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = oslog;
        v9 = v28;
        sub_100038C3C(v27);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Current device is enrolled in DEP; not offering migration",
          v27,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      return 0;
    }
    else
    {
      v10 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
      v11 = objc_msgSend(v10, "cloudConfigWantsToSkipControllerClass:", objc_opt_class(BuddyProximitySetupController));

      if ((v11 & 1) != 0)
      {
        v26 = (os_log_t)(id)_BYLoggingFacility(v12);
        v25 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v26;
          v14 = v25;
          sub_100038C3C(v24);
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "Current device skips Quick Start via cloud configuration; not offering migration",
            v24,
            2u);
        }
        objc_storeStrong((id *)&v26, 0);
        return 0;
      }
      else
      {
        v15 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager");
        v16 = objc_msgSend(v15, "cloudConfigWantsToSkipControllerClass:", objc_opt_class(BuddyTransferDataFlow));

        if ((v16 & 1) != 0)
        {
          v23 = (os_log_t)(id)_BYLoggingFacility(v17);
          v22 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v18 = v23;
            v19 = v22;
            sub_100038C3C(v21);
            _os_log_impl((void *)&_mh_execute_header, v18, v19, "Current device skips migration via cloud configuration; not offering migration",
              (uint8_t *)v21,
              2u);
          }
          objc_storeStrong((id *)&v23, 0);
          return 0;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  else
  {
    location[0] = (id)_BYLoggingFacility(v2);
    v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = location[0];
      v4 = v31;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Current hardware does not support migration; not offering migration",
        buf,
        2u);
    }
    objc_storeStrong(location, 0);
    return 0;
  }
}

+ (BOOL)sourceDeviceSupportsMigration:(id)a3 productVersion:(id)a4 deviceClass:(id)a5 softwareUpdateRequired:(BOOL *)a6 reason:(id *)a7
{
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  __CFString *v15;
  id v16;
  NSNumber *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  __CFString *v22;
  _BOOL8 v23;
  NSObject *v24;
  os_log_type_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  __CFString *v29;
  id v30;
  char v31;
  NSObject *v32;
  os_log_type_t v33;
  __CFString *v34;
  _WORD v36[3];
  os_log_type_t v37;
  os_log_t v38;
  char v39;
  id v40;
  char v41;
  id v42;
  uint8_t v43[7];
  os_log_type_t v44;
  os_log_t v45;
  uint8_t v46[15];
  os_log_type_t v47;
  os_log_t v48;
  id v49;
  uint8_t v50[15];
  os_log_type_t v51;
  os_log_t oslog;
  int v53;
  uint8_t buf[7];
  os_log_type_t v55;
  id v56;
  id *v57;
  BOOL *v58;
  id v59;
  id v60;
  id location[2];
  id v62;
  char v63;

  v62 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v60 = 0;
  objc_storeStrong(&v60, a4);
  v59 = 0;
  objc_storeStrong(&v59, a5);
  v58 = a6;
  v57 = a7;
  v11 = objc_msgSend(location[0], "supportsDeviceToDeviceMigration");
  LOBYTE(a6) = objc_msgSend(v11, "BOOLValue") ^ 1;

  if ((a6 & 1) != 0)
  {
    v56 = (id)_BYLoggingFacility(v12);
    v55 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v56;
      v14 = v55;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Source device does not support migration; not offering migration",
        buf,
        2u);
    }
    objc_storeStrong(&v56, 0);
    if (v57)
    {
      v15 = objc_retainAutorelease(CFSTR("not supported"));
      *v57 = v15;
    }
    v63 = 0;
    v53 = 1;
  }
  else
  {
    v16 = objc_msgSend(location[0], "deviceToDeviceMigrationVersion");
    v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", SASProximityDeviceToDeviceCurrentVersion);
    v18 = objc_msgSend(v16, "isEqualToNumber:", v17) ^ 1;

    if ((v18 & 1) != 0)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v19);
      v51 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = oslog;
        v21 = v51;
        sub_100038C3C(v50);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Source device does not support migration version; not offering migration",
          v50,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (v57)
      {
        v22 = objc_retainAutorelease(CFSTR("incompatible migration version"));
        *v57 = v22;
      }
      v63 = 0;
      v53 = 1;
    }
    else
    {
      v49 = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
      v23 = +[BuddyMigrationCapability isMigrationSupportedFromDeviceClass:toDeviceClass:reason:](BuddyMigrationCapability, "isMigrationSupportedFromDeviceClass:toDeviceClass:reason:", v59, v49, v57);
      if (v23)
      {
        v26 = objc_msgSend(location[0], "isRestoring");
        if ((v26 & 1) != 0)
        {
          v45 = (os_log_t)(id)_BYLoggingFacility(v26);
          v44 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v27 = v45;
            v28 = v44;
            sub_100038C3C(v43);
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "Source device is restoring; not offering migration",
              v43,
              2u);
          }
          objc_storeStrong((id *)&v45, 0);
          if (v57)
          {
            v29 = objc_retainAutorelease(CFSTR("source restoring"));
            *v57 = v29;
          }
          v63 = 0;
          v53 = 1;
        }
        else
        {
          v42 = +[SASSystemInformation productVersion](SASSystemInformation, "productVersion");
          v30 = objc_msgSend(v62, "supportsMigrationFromProductVersion:toProductVersion:", v60, v42);
          v41 = (v30 ^ 1) & 1;
          v39 = 0;
          v31 = 0;
          if (v41)
          {
            v40 = objc_msgSend(location[0], "preventSoftwareUpdateDeviceMigration");
            v39 = 1;
            v30 = objc_msgSend(v40, "BOOLValue");
            v31 = (char)v30;
          }
          if ((v39 & 1) != 0)

          if ((v31 & 1) != 0)
          {
            v38 = (os_log_t)(id)_BYLoggingFacility(v30);
            v37 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v38;
              v33 = v37;
              sub_100038C3C(v36);
              _os_log_impl((void *)&_mh_execute_header, v32, v33, "Source device prevents software update migration and a software update is required; not offering migration",
                (uint8_t *)v36,
                2u);
            }
            objc_storeStrong((id *)&v38, 0);
            if (v57)
            {
              v34 = objc_retainAutorelease(CFSTR("software update required, but prevented"));
              *v57 = v34;
            }
            v63 = 0;
            v53 = 1;
          }
          else
          {
            if (v58)
              *v58 = v41 & 1;
            v63 = 1;
            v53 = 1;
          }
          objc_storeStrong(&v42, 0);
        }
      }
      else
      {
        v48 = (os_log_t)(id)_BYLoggingFacility(v23);
        v47 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v48;
          v25 = v47;
          sub_100038C3C(v46);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Source device hardware does not support migration to current device hardware; not offering migration",
            v46,
            2u);
        }
        objc_storeStrong((id *)&v48, 0);
        v63 = 0;
        v53 = 1;
      }
      objc_storeStrong(&v49, 0);
    }
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
  return v63 & 1;
}

+ (BOOL)isMigrationSupportedFromDeviceClass:(id)a3 toDeviceClass:(id)a4 reason:(id *)a5
{
  id v8;
  id *v9;
  id v10;
  id location[3];
  char v12;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = a5;
  v8 = +[BuddyMigrationCapability _allowedDeviceClasses](BuddyMigrationCapability, "_allowedDeviceClasses");
  if ((objc_msgSend(v8, "containsObject:", location[0]) & 1) != 0
    && (objc_msgSend(v8, "containsObject:", v10) & 1) != 0)
  {
    if ((objc_msgSend(location[0], "isEqualToString:", v10) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      if (v9)
        *v9 = objc_retainAutorelease(CFSTR("different device class"));
      v12 = 0;
    }
  }
  else
  {
    if (v9)
      *v9 = objc_retainAutorelease(CFSTR("disallowed device class"));
    v12 = 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

+ (BOOL)_currentHardwareSupportsMigration
{
  id v2;
  unsigned __int8 v3;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  v2 = +[BuddyMigrationCapability _allowedDeviceClasses](BuddyMigrationCapability, "_allowedDeviceClasses");
  v3 = objc_msgSend(v2, "containsObject:", location[0]);

  objc_storeStrong(location, 0);
  return v3 & 1;
}

+ (id)_allowedDeviceClasses
{
  return &off_100290B90;
}

+ (BOOL)supportsMigrationFromProductVersion:(id)a3 toProductVersion:(id)a4
{
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  LOBYTE(a4) = objc_msgSend(v8, "_compareProductVersion:toProductVersion:", location[0], v6) != (id)1;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return a4 & 1;
}

+ (int64_t)_compareProductVersion:(id)a3 toProductVersion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  signed int v11;
  signed int v12;
  int i;
  id v14;
  id v15;
  int v16;
  id v17;
  id location[3];
  int64_t v19;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  if ((objc_msgSend(location[0], "isEqualToString:", v17) & 1) != 0)
  {
    v19 = 0;
    v16 = 1;
  }
  else
  {
    v15 = objc_msgSend(location[0], "componentsSeparatedByString:", CFSTR("."));
    v14 = objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("."));
    for (i = 0; ; ++i)
    {
      v5 = (unint64_t)objc_msgSend(v15, "count") >= 2 ? (id)2 : objc_msgSend(v15, "count");
      v6 = (unint64_t)objc_msgSend(v14, "count") >= 2 ? (id)2 : objc_msgSend(v14, "count");
      if (v5 <= v6)
        v7 = (unint64_t)objc_msgSend(v14, "count") >= 2 ? (id)2 : objc_msgSend(v14, "count");
      else
        v7 = (unint64_t)objc_msgSend(v15, "count") >= 2 ? (id)2 : objc_msgSend(v15, "count");
      if (i >= (unint64_t)v7)
        break;
      v12 = 0;
      v11 = 0;
      if (i < (unint64_t)objc_msgSend(v15, "count"))
      {
        v8 = objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v12 = objc_msgSend(v8, "intValue");

      }
      if (i < (unint64_t)objc_msgSend(v14, "count"))
      {
        v9 = objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v11 = objc_msgSend(v9, "intValue");

      }
      if (v12 > v11)
      {
        v19 = 1;
        v16 = 1;
        goto LABEL_28;
      }
      if (v12 < v11)
      {
        v19 = -1;
        v16 = 1;
        goto LABEL_28;
      }
    }
    v19 = 0;
    v16 = 1;
LABEL_28:
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v19;
}

@end
