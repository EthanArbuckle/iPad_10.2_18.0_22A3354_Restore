@implementation BuddyRestoreState

- (BuddyRestoreState)initWithProductBuild:(id)a3 backupUDID:(id)a4 backupUUID:(id)a5 snapshotID:(unint64_t)a6 snapshotDate:(id)a7 useLatestSnapshot:(BOOL)a8 allowCellularNetwork:(BOOL)a9 persistDate:(id)a10
{
  id v15;
  BuddyRestoreState *v16;
  objc_super v18;
  int v19;
  id v20;
  BOOL v21;
  BOOL v22;
  id v23;
  unint64_t v24;
  id v25;
  id obj;
  id location[2];
  id v28;
  BuddyRestoreState *v29;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = a6;
  v23 = 0;
  objc_storeStrong(&v23, a7);
  v22 = a8;
  v21 = a9;
  v20 = 0;
  objc_storeStrong(&v20, a10);
  if (location[0] && obj)
  {
    v15 = v28;
    v28 = 0;
    v18.receiver = v15;
    v18.super_class = (Class)BuddyRestoreState;
    v16 = -[BuddyRestoreState init](&v18, "init");
    v28 = v16;
    objc_storeStrong(&v28, v16);
    if (v16)
    {
      objc_storeStrong((id *)v28 + 2, location[0]);
      objc_storeStrong((id *)v28 + 3, obj);
      objc_storeStrong((id *)v28 + 4, v25);
      *((_QWORD *)v28 + 5) = v24;
      objc_storeStrong((id *)v28 + 6, v23);
      *((_BYTE *)v28 + 8) = v22;
      *((_BYTE *)v28 + 9) = v21;
      objc_storeStrong((id *)v28 + 7, v20);
    }
    v29 = (BuddyRestoreState *)v28;
    v19 = 1;
  }
  else
  {
    v29 = 0;
    v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v28, 0);
  return v29;
}

- (BuddyRestoreState)initWithProductBuild:(id)a3 backup:(id)a4 snapshot:(id)a5 useLatestSnapshot:(BOOL)a6 allowCellularNetwork:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BuddyRestoreState *v17;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  id v22;
  id v23;
  id location[2];
  id v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = a6;
  v20 = a7;
  v11 = v25;
  v12 = location[0];
  v13 = objc_msgSend(v23, "backupUDID");
  v14 = objc_msgSend(v23, "backupUUID");
  v15 = objc_msgSend(v22, "snapshotID");
  v16 = objc_msgSend(v22, "date");
  v25 = 0;
  LOBYTE(v19) = v20;
  v25 = objc_msgSend(v11, "initWithProductBuild:backupUDID:backupUUID:snapshotID:snapshotDate:useLatestSnapshot:allowCellularNetwork:persistDate:", v12, v13, v14, v15, v16, v21, v19, 0);
  v17 = (BuddyRestoreState *)v25;

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v25, 0);
  return v17;
}

+ (id)loadFromPreferences:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t isKindOfClass;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  id v13;
  os_log_t v15;
  uint8_t buf[15];
  char v17;
  os_log_t oslog;
  id v19;
  id v20;
  id location[2];
  id v22;
  uint8_t v23[24];

  v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = objc_msgSend(location[0], "objectForKey:includeCache:", CFSTR("showiCloudRestoreOnLaunch"), 0);
  v19 = 0;
  v3 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v20, v3) & 1) != 0)
  {
    v4 = objc_msgSend((id)objc_opt_class(v22), "_loadClassicState:", v20);
    v5 = v19;
    v19 = v4;

  }
  else
  {
    v7 = objc_opt_class(NSDictionary);
    isKindOfClass = objc_opt_isKindOfClass(v20, v7);
    if ((isKindOfClass & 1) != 0)
    {
      v8 = objc_msgSend((id)objc_opt_class(v22), "_loadModernState:", v20);
      v9 = v19;
      v19 = v8;

    }
  }
  if (!v19)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(isKindOfClass);
    v17 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v10 = oslog;
      v11 = v17;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "Missing or corrupt data when restoring backup restore state!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v15 = (os_log_t)(id)_BYLoggingFacility(v12);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sub_100039500((uint64_t)v23, (uint64_t)v20);
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Raw data: %{public}@", v23, 0xCu);
    }
    objc_storeStrong((id *)&v15, 0);
  }
  v13 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v13;
}

+ (BOOL)hasStateFromPreferences:(id)a3
{
  id v3;
  BOOL v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "objectForKey:", CFSTR("showiCloudRestoreOnLaunch"));
  v4 = v3 != 0;

  objc_storeStrong(location, 0);
  return v4;
}

- (void)persistUsingPreferences:(id)a3
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSNumber *v6;
  NSDate *v7;
  NSNumber *v8;
  NSNumber *v9;
  NSDate *v10;
  id v11;
  id location[2];
  BuddyRestoreState *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = -[BuddyRestoreState productBuild](v13, "productBuild");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, CFSTR("productBuild"));

  v4 = -[BuddyRestoreState backupUDID](v13, "backupUDID");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("backupUDID"));

  v5 = -[BuddyRestoreState backupUUID](v13, "backupUUID");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("backupUUID"));

  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BuddyRestoreState snapshotID](v13, "snapshotID"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("snapshotID"));

  v7 = -[BuddyRestoreState snapshotDate](v13, "snapshotDate");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("snapshotDate"));

  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddyRestoreState useLatestSnapshot](v13, "useLatestSnapshot"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("useLatestSnapshot"));

  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BuddyRestoreState allowCellularNetwork](v13, "allowCellularNetwork"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("allowCellularNetwork"));

  v10 = +[NSDate date](NSDate, "date");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("persistDate"));

  objc_msgSend(location[0], "setObject:forKey:persistImmediately:", v11, CFSTR("showiCloudRestoreOnLaunch"), 1);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

+ (void)removeFromPreferences:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "removeObjectForKey:onlyFromMemory:", CFSTR("showiCloudRestoreOnLaunch"), 0);
  objc_storeStrong(location, 0);
}

- (id)description
{
  uint64_t v2;
  NSString *v3;
  NSString *v4;
  NSString *v5;
  unint64_t v6;
  NSDate *v7;
  NSString *v8;

  v2 = objc_opt_class(self);
  v3 = -[BuddyRestoreState productBuild](self, "productBuild");
  v4 = -[BuddyRestoreState backupUDID](self, "backupUDID");
  v5 = -[BuddyRestoreState backupUUID](self, "backupUUID");
  v6 = -[BuddyRestoreState snapshotID](self, "snapshotID");
  v7 = -[BuddyRestoreState snapshotDate](self, "snapshotDate");
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ : %p> Build: %@ Backup UDID: %@ Backup UUID: %@ Snapshot ID: %lu Snapshot Date: %@"), v2, self, v3, v4, v5, v6, v7);

  return v8;
}

+ (id)_loadClassicState:(id)a3
{
  id v3;
  char isKindOfClass;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  uint64_t v26;
  char v27;
  id v28;
  char v29;
  id v30;
  os_log_t oslog;
  char v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  BOOL v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int v43;
  id location[2];
  id v45;
  id v46;
  uint8_t buf[24];

  v45 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((unint64_t)objc_msgSend(location[0], "count") >= 3)
  {
    v42 = 0;
    v41 = 0;
    v40 = 0;
    v39 = 0;
    v38 = 1;
    v3 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 0);
    v36 = 0;
    isKindOfClass = 0;
    if (v3)
    {
      v37 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 0);
      v36 = 1;
      v5 = objc_opt_class(NSString);
      isKindOfClass = objc_opt_isKindOfClass(v37, v5);
    }
    if ((v36 & 1) != 0)

    if ((isKindOfClass & 1) != 0)
    {
      v6 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 0);
      v7 = v42;
      v42 = v6;

    }
    v8 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 1);
    v34 = 0;
    v9 = 0;
    if (v8)
    {
      v35 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 1);
      v34 = 1;
      v10 = objc_opt_class(NSString);
      v9 = objc_opt_isKindOfClass(v35, v10);
    }
    if ((v34 & 1) != 0)

    if ((v9 & 1) != 0)
    {
      v11 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 1);
      v12 = v41;
      v41 = v11;

    }
    v13 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 2);
    v32 = 0;
    v14 = 0;
    if (v13)
    {
      v33 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 2);
      v32 = 1;
      v15 = objc_opt_class(NSNumber);
      v14 = objc_opt_isKindOfClass(v33, v15);
    }
    if ((v32 & 1) != 0)

    if ((v14 & 1) != 0)
    {
      v17 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 2);
      v39 = objc_msgSend(v17, "unsignedIntegerValue");

    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v16);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 2);
        sub_100038C28((uint64_t)buf, (uint64_t)v18);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Invalid type for snapshot ID when restoring backup restore state: %@", buf, 0xCu);

      }
      objc_storeStrong((id *)&oslog, 0);
      v38 = 0;
    }
    v29 = 0;
    v27 = 0;
    v19 = 0;
    if ((unint64_t)objc_msgSend(location[0], "count") >= 4)
    {
      v30 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 3);
      v29 = 1;
      v19 = 0;
      if (v30)
      {
        v28 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 3);
        v27 = 1;
        v20 = objc_opt_class(NSString);
        v19 = objc_opt_isKindOfClass(v28, v20);
      }
    }
    if ((v27 & 1) != 0)

    if ((v29 & 1) != 0)
    if ((v19 & 1) != 0)
    {
      v21 = objc_msgSend(location[0], "objectAtIndexedSubscript:", 3);
      v22 = v40;
      v40 = v21;

    }
    v23 = 0;
    if (v42)
      v23 = v41 != 0;
    v38 = v38 && v23;
    if (v38)
    {
      v24 = objc_alloc((Class)objc_opt_class(v45));
      LOBYTE(v26) = 0;
      v46 = objc_msgSend(v24, "initWithProductBuild:backupUDID:backupUUID:snapshotID:snapshotDate:useLatestSnapshot:allowCellularNetwork:persistDate:", v42, v41, v40, v39, 0, 0, v26, 0);
    }
    else
    {
      v46 = 0;
    }
    v43 = 1;
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
  }
  else
  {
    v46 = 0;
    v43 = 1;
  }
  objc_storeStrong(location, 0);
  return v46;
}

+ (id)_loadModernState:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  id v10;
  char v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  id v19;

  v19 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("productBuild"));
  v16 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("backupUDID"));
  v15 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("backupUUID"));
  v3 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("snapshotID"));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  v14 = v4;
  v13 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("snapshotDate"));
  v5 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("useLatestSnapshot"));
  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");

  v12 = (char)v4;
  v6 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("allowCellularNetwork"));
  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");

  v11 = (char)v4;
  v10 = objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("persistDate"));
  LOBYTE(v9) = v4 & 1;
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(v19)), "initWithProductBuild:backupUDID:backupUUID:snapshotID:snapshotDate:useLatestSnapshot:allowCellularNetwork:persistDate:", v17, v16, v15, v14, v13, v12 & 1, v9, v10);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (void)setProductBuild:(id)a3
{
  objc_storeStrong((id *)&self->_productBuild, a3);
}

- (NSString)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
  objc_storeStrong((id *)&self->_backupUDID, a3);
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (void)setBackupUUID:(id)a3
{
  objc_storeStrong((id *)&self->_backupUUID, a3);
}

- (unint64_t)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(unint64_t)a3
{
  self->_snapshotID = a3;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (void)setSnapshotDate:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotDate, a3);
}

- (BOOL)useLatestSnapshot
{
  return self->_useLatestSnapshot;
}

- (BOOL)allowCellularNetwork
{
  return self->_allowCellularNetwork;
}

- (void)setAllowCellularNetwork:(BOOL)a3
{
  self->_allowCellularNetwork = a3;
}

- (NSDate)persistDate
{
  return self->_persistDate;
}

- (void)setPersistDate:(id)a3
{
  objc_storeStrong((id *)&self->_persistDate, a3);
}

- (BOOL)useLatestBackup
{
  return self->_useLatestBackup;
}

- (void)setUseLatestBackup:(BOOL)a3
{
  self->_useLatestBackup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistDate, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
  objc_storeStrong((id *)&self->_backupUDID, 0);
  objc_storeStrong((id *)&self->_productBuild, 0);
}

@end
