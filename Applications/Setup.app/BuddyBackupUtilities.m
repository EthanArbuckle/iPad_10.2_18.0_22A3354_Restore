@implementation BuddyBackupUtilities

+ (id)backupForUUID:(id)a3 withManager:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v10[2];
  id v11;
  id location[2];
  id v13;

  v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a5;
  v7 = objc_msgSend(v13, "getBackupListWithFiltering:manager:retries:error:", 0, v11, 3, a5);
  v8 = objc_msgSend(v13, "backupForUUID:backups:", location[0], v7, v7);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v8;
}

+ (id)backupForUUID:(id)a3 backups:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  unsigned __int8 v10;
  int v12;
  _QWORD __b[8];
  id v14;
  id v15;
  id location[3];
  id v17;
  _BYTE v18[128];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  memset(__b, 0, sizeof(__b));
  v5 = v15;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(v5);
        v14 = *(id *)(__b[1] + 8 * i);
        v9 = objc_msgSend(v14, "backupUUID");
        v10 = objc_msgSend(v9, "isEqualToString:", location[0]);

        if ((v10 & 1) != 0)
        {
          v17 = v14;
          v12 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
    }
    while (v6);
  }
  v12 = 0;
LABEL_11:

  if (!v12)
    v17 = 0;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17;
}

+ (id)latestCommittedSnapshotFromBackup:(id)a3 requireCompatible:(BOOL)a4
{
  id v5;
  NSSortDescriptor *v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t i;
  int v13;
  _QWORD __b[8];
  id v15;
  id v16;
  BOOL v17;
  id location[3];
  id v19;
  _BYTE v20[128];
  NSSortDescriptor *v21;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v5 = objc_msgSend(location[0], "snapshots");
  v6 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v21 = v6;
  v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1);
  v16 = objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);

  memset(__b, 0, sizeof(__b));
  v8 = v16;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v9; ++i)
      {
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v8);
        v15 = *(id *)(__b[1] + 8 * i);
        if (objc_msgSend(v15, "state") == 3
          && (!v17 || (objc_msgSend(v15, "isCompatible") & 1) != 0))
        {
          v19 = v15;
          v13 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
    }
    while (v9);
  }
  v13 = 0;
LABEL_13:

  if (!v13)
    v19 = 0;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19;
}

+ (id)getBackupListWithFiltering:(BOOL)a3 manager:(id)a4 retries:(unint64_t)a5 error:(id *)a6
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  int v14;
  char v15;
  NSString *v16;
  NSObject *v17;
  NSString *v18;
  BOOL v19;
  id v20;
  id v21;
  char v23;
  NSString *v24;
  char v25;
  id v26;
  os_log_t v27;
  char v28;
  id v29;
  char v30;
  id v31;
  os_log_type_t v32;
  os_log_t oslog;
  id obj;
  id v35;
  id v36;
  unint64_t v37;
  id *v38;
  unint64_t v39;
  id location;
  BOOL v41;
  SEL v42;
  id v43;
  uint8_t v44[16];
  uint8_t buf[24];

  v43 = a1;
  v42 = a2;
  v41 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v39 = a5;
  v38 = a6;
  v37 = 0;
  v36 = 0;
  v35 = 0;
  do
  {
    objc_storeStrong(&v35, 0);
    obj = v35;
    v8 = objc_msgSend(location, "getBackupListWithFiltering:error:", v41, &obj);
    objc_storeStrong(&v35, obj);
    v9 = v36;
    v36 = v8;

    if (v35)
    {
      if (++v37 > v39)
      {
        v27 = (os_log_t)(id)_BYLoggingFacility(v10);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v27;
          v25 = 0;
          v23 = 0;
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v18 = (NSString *)v35;
          }
          else if (v35)
          {
            v26 = objc_msgSend(v35, "domain");
            v25 = 1;
            v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v26, objc_msgSend(v35, "code"));
            v24 = v18;
            v23 = 1;
          }
          else
          {
            v18 = 0;
          }
          sub_100039500((uint64_t)v44, (uint64_t)v18);
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to get backup list, giving up: %{public}@", v44, 0xCu);
          if ((v23 & 1) != 0)

          if ((v25 & 1) != 0)
        }
        objc_storeStrong((id *)&v27, 0);
      }
      else
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v10);
        v32 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = oslog;
          v12 = v32;
          v13 = v37;
          v14 = v39;
          v15 = _BYIsInternalInstall();
          v30 = 0;
          v28 = 0;
          if ((v15 & 1) != 0)
          {
            v16 = (NSString *)v35;
          }
          else if (v35)
          {
            v31 = objc_msgSend(v35, "domain");
            v30 = 1;
            v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v31, objc_msgSend(v35, "code"));
            v29 = v16;
            v28 = 1;
          }
          else
          {
            v16 = 0;
          }
          sub_100114F70((uint64_t)buf, v13, v14, (uint64_t)v16);
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Retrying backup list fetch (%u/%u) due to getting backup list: %{public}@", buf, 0x18u);
          if ((v28 & 1) != 0)

          if ((v30 & 1) != 0)
        }
        objc_storeStrong((id *)&oslog, 0);
        sleep(4u);
      }
    }
    v19 = 0;
    if (v35)
      v19 = v37 <= v39;
  }
  while (v19);
  if (v35 && v38)
  {
    v20 = objc_retainAutorelease(v35);
    *v38 = v20;
  }
  v21 = v36;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&location, 0);
  return v21;
}

+ (id)suggestedBackupForProximity:(id)a3 deviceClass:(id)a4 withManager:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v15;
  id obj;
  id v17;
  id v18;
  int v19;
  id *v20;
  id v21;
  id v22;
  id location[3];
  RestorableBackupItem *v24;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = a6;
  if (location[0])
  {
    v18 = 0;
    v9 = objc_msgSend(location[0], "backupUUID");
    obj = 0;
    v10 = +[BuddyBackupUtilities backupForUUID:withManager:error:](BuddyBackupUtilities, "backupForUUID:withManager:error:", v9, v21, &obj);
    objc_storeStrong(&v18, obj);
    v17 = v10;

    if (v18)
    {
      if (v20)
      {
        v11 = objc_retainAutorelease(v18);
        *v20 = v11;
      }
      v24 = 0;
      v19 = 1;
    }
    else
    {
      v12 = objc_msgSend(v17, "deviceClass");
      v13 = objc_msgSend(v12, "isEqualToString:", v22) ^ 1;

      if ((v13 & 1) != 0)
      {
        v24 = 0;
        v19 = 1;
      }
      else
      {
        v15 = +[BuddyBackupUtilities latestCommittedSnapshotFromBackup:requireCompatible:](BuddyBackupUtilities, "latestCommittedSnapshotFromBackup:requireCompatible:", v17, 0);
        if (v15)
          v24 = +[RestorableBackupItem restorableBackupItemWithBackup:snapshot:](RestorableBackupItem, "restorableBackupItemWithBackup:snapshot:", v17, v15);
        else
          v24 = 0;
        v19 = 1;
        objc_storeStrong(&v15, 0);
      }
    }
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v24 = 0;
    v19 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v24;
}

+ (id)suggestedBackupForCurrentDeviceWithBackups:(id)a3
{
  uint64_t v3;
  id v4;
  id v6;
  id v7;
  id location[2];
  id v9;
  id v10;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = (id)MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
  v7 = v10;
  v3 = MGCopyAnswer(CFSTR("DeviceClass"), 0);
  v4 = objc_msgSend(v9, "_suggestedBackupForUDID:deviceClass:backups:", v7, v3, location[0], v3);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4;
}

+ (BOOL)canRestoreBackupMadeOnVersion:(id)a3 toSystemVersion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  signed int v10;
  signed int v11;
  int i;
  id v13;
  id v14;
  id v15;
  id location[3];
  char v17;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = objc_msgSend(location[0], "componentsSeparatedByString:", CFSTR("."));
  v13 = objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("."));
  if (objc_msgSend(v14, "count") && objc_msgSend(v13, "count"))
  {
    for (i = 0; ; ++i)
    {
      v5 = objc_msgSend(v14, "count");
      v6 = v5 <= objc_msgSend(v13, "count") ? objc_msgSend(v13, "count") : objc_msgSend(v14, "count");
      if (i >= (unint64_t)v6)
        break;
      v11 = 0;
      v10 = 0;
      if (i < (unint64_t)objc_msgSend(v14, "count"))
      {
        v7 = objc_msgSend(v14, "objectAtIndexedSubscript:", i);
        v11 = objc_msgSend(v7, "intValue");

      }
      if (i < (unint64_t)objc_msgSend(v13, "count"))
      {
        v8 = objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v10 = objc_msgSend(v8, "intValue");

      }
      if (v10 > v11)
      {
        v17 = 1;
        goto LABEL_19;
      }
      if (v11 > v10)
      {
        v17 = 0;
        goto LABEL_19;
      }
    }
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }
LABEL_19:
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17 & 1;
}

+ (id)_suggestedBackupForUDID:(id)a3 deviceClass:(id)a4 backups:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  BOOL v14;
  id v15;
  id v16;
  id v17;
  char v19;
  id v20;
  int v21;
  id v22;
  _QWORD __b[8];
  id obj;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location[3];
  RestorableBackupItem *v31;
  _BYTE v32[128];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = 0;
  v26 = 0;
  v25 = 0;
  memset(__b, 0, sizeof(__b));
  v7 = v28;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)__b[2];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(v7);
      obj = *(id *)(__b[1] + 8 * v10);
      v22 = +[BuddyBackupUtilities latestCommittedSnapshotFromBackup:requireCompatible:](BuddyBackupUtilities, "latestCommittedSnapshotFromBackup:requireCompatible:", obj, 0);
      v11 = objc_msgSend(obj, "backupUDID");
      v12 = objc_msgSend(v11, "isEqualToString:", location[0]);

      if ((v12 & 1) != 0)
      {
        objc_storeStrong(&v27, obj);
        objc_storeStrong(&v26, v22);
        v21 = 2;
      }
      else
      {
        v13 = objc_msgSend(obj, "deviceClass");
        v19 = 0;
        v14 = 0;
        if ((objc_msgSend(v13, "isEqualToString:", v29) & 1) != 0)
        {
          v14 = 1;
          if (v25)
          {
            v15 = v25;
            v20 = objc_msgSend(v22, "date");
            v19 = 1;
            v14 = objc_msgSend(v15, "compare:") == (id)-1;
          }
        }
        if ((v19 & 1) != 0)

        if (v14)
        {
          objc_storeStrong(&v27, obj);
          objc_storeStrong(&v26, v22);
          v16 = objc_msgSend(v22, "date");
          v17 = v25;
          v25 = v16;

        }
        v21 = 0;
      }
      objc_storeStrong(&v22, 0);
      if (v21)
        break;
      if (++v10 >= (unint64_t)v8)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", __b, v32, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  if (v27 && v26)
    v31 = +[RestorableBackupItem restorableBackupItemWithBackup:snapshot:](RestorableBackupItem, "restorableBackupItemWithBackup:snapshot:", v27, v26);
  else
    v31 = 0;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v31;
}

@end
