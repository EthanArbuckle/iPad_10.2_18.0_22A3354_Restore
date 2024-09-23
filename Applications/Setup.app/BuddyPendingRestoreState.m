@implementation BuddyPendingRestoreState

- (BuddyPendingRestoreState)initWithExistingSettings:(id)a3 setupMethod:(id)a4
{
  id v5;
  BuddyPendingRestoreState *v6;
  BuddyPendingRestoreState *v7;
  objc_super v9;
  id obj;
  id location[2];
  id v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v12;
  v12 = 0;
  v9.receiver = v5;
  v9.super_class = (Class)BuddyPendingRestoreState;
  v6 = -[BuddyPendingRestoreState init](&v9, "init");
  v12 = v6;
  objc_storeStrong(&v12, v6);
  if (v6)
  {
    objc_storeStrong((id *)v12 + 5, location[0]);
    objc_storeStrong((id *)v12 + 6, obj);
  }
  v7 = (BuddyPendingRestoreState *)v12;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v7;
}

- (void)setBackupItem:(id)a3 updateBackupMetadata:(BOOL)a4 prefetchAccounts:(BOOL)a5
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  os_log_t v19;
  void **block;
  int v21;
  int v22;
  void (*v23)(id *);
  void *v24;
  id v25;
  id v26;
  int v27;
  os_log_type_t v28;
  os_log_t oslog;
  BOOL v30;
  BOOL v31;
  id location[2];
  id v33;
  uint8_t v34[32];
  uint8_t buf[24];

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = a4;
  v30 = a5;
  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(location[0], "snapshot");
    v9 = objc_msgSend(v8, "systemVersion");
    sub_100039500((uint64_t)buf, (uint64_t)v9);
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "Set pending backup item from OS: %{public}@", buf, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(v33, "setBackupItem:", location[0]);
  v10 = objc_msgSend(v33, "setupMethod");
  objc_msgSend(v10, "setDataTransferMethod:", 1);

  v11 = objc_msgSend(location[0], "snapshot");
  v12 = objc_msgSend(v11, "date");
  objc_msgSend(v33, "setSnapshotDate:", v12);

  objc_msgSend(v33, "setUseLatestSnapshot:", 0);
  objc_msgSend(v33, "setForceSoftwareUpdateRestore:", 0);
  if (location[0])
  {
    if (v30)
    {
      v13 = objc_msgSend(v33, "backupItem");
      objc_msgSend(v13, "prefetchAccounts");

    }
    if (v31)
    {
      v14 = objc_msgSend(location[0], "backupUDID");
      v15 = 0;
      if (v14)
        v15 = objc_msgSend(location[0], "snapshotID") != 0;

      if (v15)
      {
        v17 = dispatch_get_global_queue(25, 0);
        block = _NSConcreteStackBlock;
        v21 = -1073741824;
        v22 = 0;
        v23 = sub_100153B9C;
        v24 = &unk_100280D00;
        v25 = v33;
        v26 = location[0];
        dispatch_async(v17, &block);

        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v25, 0);
      }
      else
      {
        v19 = (os_log_t)(id)_BYLoggingFacility(v16);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          v18 = objc_msgSend(location[0], "backupUDID");
          sub_100050750((uint64_t)v34, (uint64_t)v18, (uint64_t)objc_msgSend(location[0], "snapshotID"));
          _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Unable to fetch backup metadata for backup UDID %@ and snapshot ID %ld", v34, 0x16u);

        }
        objc_storeStrong((id *)&v19, 0);
      }
    }
    v27 = 0;
  }
  else
  {
    v27 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)clearBackupItem
{
  NSObject *v2;
  os_log_type_t v3;
  BuddySetupMethod *v4;
  id v5;
  BuddySetupMethod *v6;
  _WORD v7[3];
  os_log_type_t v8;
  os_log_t oslog[2];
  BuddyPendingRestoreState *v10;

  v10 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    v3 = v8;
    sub_100038C3C(v7);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Clearing pending backup item...", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  -[BuddyPendingRestoreState setBackupItem:](v10, "setBackupItem:", 0);
  -[BuddyPendingRestoreState setSnapshotDate:](v10, "setSnapshotDate:", 0);
  -[BuddyPendingRestoreState setUseLatestSnapshot:](v10, "setUseLatestSnapshot:", 0);
  -[BuddyPendingRestoreState setForceSoftwareUpdateRestore:](v10, "setForceSoftwareUpdateRestore:", 0);
  -[BuddyPendingRestoreState setAllowCellularNetwork:](v10, "setAllowCellularNetwork:", 0);
  v4 = -[BuddyPendingRestoreState setupMethod](v10, "setupMethod");
  v5 = -[BuddySetupMethod dataTransferMethod](v4, "dataTransferMethod");

  if (v5 == (id)1)
  {
    v6 = -[BuddyPendingRestoreState setupMethod](v10, "setupMethod");
    -[BuddySetupMethod setDataTransferMethod:](v6, "setDataTransferMethod:", 0);

  }
}

- (void)setAttemptedBackupItem:(id)a3
{
  id location[2];
  BuddyPendingRestoreState *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_attemptedBackupItem, location[0]);
  objc_storeStrong(location, 0);
}

- (RestorableBackupItem)attemptedBackupItem
{
  return self->_attemptedBackupItem;
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
  objc_storeStrong((id *)&self->_backupItem, a3);
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

- (void)setUseLatestSnapshot:(BOOL)a3
{
  self->_useLatestSnapshot = a3;
}

- (BOOL)forceSoftwareUpdateRestore
{
  return self->_forceSoftwareUpdateRestore;
}

- (void)setForceSoftwareUpdateRestore:(BOOL)a3
{
  self->_forceSoftwareUpdateRestore = a3;
}

- (BOOL)allowCellularNetwork
{
  return self->_allowCellularNetwork;
}

- (void)setAllowCellularNetwork:(BOOL)a3
{
  self->_allowCellularNetwork = a3;
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_existingSettings, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_existingSettings, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_backupItem, 0);
  objc_storeStrong((id *)&self->_attemptedBackupItem, 0);
}

@end
