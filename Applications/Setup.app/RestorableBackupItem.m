@implementation RestorableBackupItem

+ (RestorableBackupItem)restorableBackupItemWithBackup:(id)a3 snapshot:(id)a4
{
  RestorableBackupItem *v5;
  id v7;
  id v8;
  id location[2];
  id v10;

  v10 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = objc_alloc_init((Class)objc_opt_class(v10));
  objc_msgSend(v7, "setBackup:", location[0]);
  objc_msgSend(v7, "setSnapshot:", v8);
  v5 = (RestorableBackupItem *)v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v5;
}

+ (RestorableBackupItem)restorableBackupItemWithPendingBackupUDID:(id)a3 backupUUID:(id)a4 snapshotID:(unint64_t)a5
{
  RestorableBackupItem *v7;
  id v9[2];
  id v10;
  id location[2];
  id v12;

  v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = (id)a5;
  v9[0] = objc_alloc_init((Class)objc_opt_class(v12));
  objc_msgSend(v9[0], "setPendingBackupUDID:", location[0]);
  objc_msgSend(v9[0], "setPendingBackupUUID:", v10);
  objc_msgSend(v9[0], "setPendingSnapshotID:", a5);
  v7 = (RestorableBackupItem *)v9[0];
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (RestorableBackupItem)init
{
  dispatch_queue_t v2;
  void *v3;
  RestorableBackupItem *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)RestorableBackupItem;
  location = -[RestorableBackupItem init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = dispatch_queue_create("Backup Item Accounts Queue", 0);
    v3 = (void *)*((_QWORD *)location + 6);
    *((_QWORD *)location + 6) = v2;

  }
  v4 = (RestorableBackupItem *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  NSString *v5;
  id v6;
  char v7;
  NSString *v8;
  id v9;
  char v10;
  id v11;
  MBSnapshot *v12;
  id v13;
  char v14;
  char v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  MBSnapshot *v23;
  char v24;
  id v25;
  char v26;
  id v27;
  id v28;
  int v29;
  id location[2];
  RestorableBackupItem *v31;
  BOOL v32;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = objc_opt_class(v31);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v28 = location[0];
    v5 = -[RestorableBackupItem backupUDID](v31, "backupUDID");
    v6 = objc_msgSend(v28, "backupUDID");
    v7 = !-[NSString isEqualToString:](v5, "isEqualToString:", v6);

    if ((v7 & 1) != 0)
    {
      v32 = 0;
      v29 = 1;
    }
    else
    {
      v8 = -[RestorableBackupItem backupUUID](v31, "backupUUID");
      v9 = objc_msgSend(v28, "backupUUID");
      v10 = !-[NSString isEqualToString:](v8, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v32 = 0;
        v29 = 1;
      }
      else
      {
        v11 = -[RestorableBackupItem snapshotID](v31, "snapshotID");
        if (v11 == objc_msgSend(v28, "snapshotID"))
        {
          v12 = -[RestorableBackupItem snapshot](v31, "snapshot");
          v13 = -[MBSnapshot snapshotUUID](v12, "snapshotUUID");
          v26 = 0;
          v24 = 0;
          v22 = 0;
          v20 = 0;
          v18 = 0;
          v16 = 0;
          v14 = 0;
          if (v13)
          {
            v27 = objc_msgSend(v28, "snapshot");
            v26 = 1;
            v25 = objc_msgSend(v27, "snapshotUUID");
            v24 = 1;
            v14 = 0;
            if (v25)
            {
              v23 = -[RestorableBackupItem snapshot](v31, "snapshot");
              v22 = 1;
              v21 = -[MBSnapshot snapshotUUID](v23, "snapshotUUID");
              v20 = 1;
              v19 = objc_msgSend(v28, "snapshot");
              v18 = 1;
              v17 = objc_msgSend(v19, "snapshotUUID");
              v16 = 1;
              v14 = objc_msgSend(v21, "isEqualToString:") ^ 1;
            }
          }
          if ((v16 & 1) != 0)

          if ((v18 & 1) != 0)
          if ((v20 & 1) != 0)

          if ((v22 & 1) != 0)
          if ((v24 & 1) != 0)

          if ((v26 & 1) != 0)
          v32 = (v14 & 1) == 0;
          v29 = 1;
        }
        else
        {
          v32 = 0;
          v29 = 1;
        }
      }
    }
    objc_storeStrong(&v28, 0);
  }
  else
  {
    v32 = 0;
    v29 = 1;
  }
  objc_storeStrong(location, 0);
  return v32;
}

- (id)description
{
  uint64_t v2;
  NSString *v3;
  NSString *v4;
  MBSnapshot *v5;
  NSNumber *v6;
  MBBackup *v7;
  NSString *v8;

  v2 = objc_opt_class(self);
  v3 = -[RestorableBackupItem backupUDID](self, "backupUDID");
  v4 = -[RestorableBackupItem backupUUID](self, "backupUUID");
  v5 = -[RestorableBackupItem snapshot](self, "snapshot");
  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[RestorableBackupItem snapshotID](self, "snapshotID"));
  v7 = -[RestorableBackupItem backup](self, "backup");
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p backup with UDID %@, UUID %@, snapshot %@ with ID %@ for backup %@>"), v2, self, v3, v4, v5, v6, v7);

  return v8;
}

- (BOOL)isThisDevice
{
  NSString *v2;
  unsigned __int8 v3;
  id v5[2];
  RestorableBackupItem *v6;
  id v7;

  v6 = self;
  v5[1] = (id)a2;
  v7 = (id)MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
  v5[0] = v7;
  v2 = -[RestorableBackupItem backupUDID](v6, "backupUDID");
  v3 = -[NSString isEqualToString:](v2, "isEqualToString:", v5[0]);

  objc_storeStrong(v5, 0);
  return v3 & 1;
}

- (BOOL)isCompatible
{
  MBSnapshot *v2;
  unsigned __int8 v3;

  v2 = -[RestorableBackupItem snapshot](self, "snapshot", a2, self);
  v3 = -[MBSnapshot isCompatible](v2, "isCompatible");

  return v3 & 1;
}

- (NSString)backupUDID
{
  MBBackup *v2;
  id v3;
  MBBackup *v4;
  NSString *v7;

  v2 = -[RestorableBackupItem backup](self, "backup");
  v3 = -[MBBackup backupUDID](v2, "backupUDID");

  if (v3)
  {
    v4 = -[RestorableBackupItem backup](self, "backup");
    v7 = (NSString *)-[MBBackup backupUDID](v4, "backupUDID");

  }
  else
  {
    v7 = -[RestorableBackupItem pendingBackupUDID](self, "pendingBackupUDID");
  }
  return v7;
}

- (NSString)backupUUID
{
  MBBackup *v2;
  id v3;
  MBBackup *v4;
  NSString *v7;

  v2 = -[RestorableBackupItem backup](self, "backup");
  v3 = -[MBBackup backupUUID](v2, "backupUUID");

  if (v3)
  {
    v4 = -[RestorableBackupItem backup](self, "backup");
    v7 = (NSString *)-[MBBackup backupUUID](v4, "backupUUID");

  }
  else
  {
    v7 = -[RestorableBackupItem pendingBackupUUID](self, "pendingBackupUUID");
  }
  return v7;
}

- (unint64_t)snapshotID
{
  MBSnapshot *v2;
  MBSnapshot *v3;
  id v6;

  v2 = -[RestorableBackupItem snapshot](self, "snapshot");

  if (!v2)
    return -[RestorableBackupItem pendingSnapshotID](self, "pendingSnapshotID");
  v3 = -[RestorableBackupItem snapshot](self, "snapshot");
  v6 = -[MBSnapshot snapshotID](v3, "snapshotID");

  return (unint64_t)v6;
}

- (BOOL)isCompatibleWithUpdateToSystemVersion:(id)a3
{
  MBSnapshot *v3;
  MBSnapshot *v4;
  id v5;
  MBSnapshot *v6;
  id v7;
  id v8;
  unsigned __int8 v9;
  id v11;
  id location[2];
  RestorableBackupItem *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[RestorableBackupItem snapshot](v13, "snapshot");
  v11 = -[MBSnapshot systemVersion](v3, "systemVersion");

  v4 = -[RestorableBackupItem snapshot](v13, "snapshot");
  v5 = -[MBSnapshot requiredProductVersion](v4, "requiredProductVersion");

  if (v5)
  {
    v6 = -[RestorableBackupItem snapshot](v13, "snapshot");
    v7 = -[MBSnapshot requiredProductVersion](v6, "requiredProductVersion");
    v8 = v11;
    v11 = v7;

  }
  v9 = +[BuddyBackupUtilities canRestoreBackupMadeOnVersion:toSystemVersion:](BuddyBackupUtilities, "canRestoreBackupMadeOnVersion:toSystemVersion:", v11, location[0], v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (id)dateString
{
  return -[RestorableBackupItem dateStringWithStyle:](self, "dateStringWithStyle:", 1, a2, self);
}

- (id)dateStringWithStyle:(unint64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  MBSnapshot *v6;
  id v7;
  id v8;

  if (!qword_1002EE990 || (id)a3 != objc_msgSend((id)qword_1002EE990, "timeStyle"))
  {
    v3 = objc_alloc_init((Class)NSDateFormatter);
    v4 = (void *)qword_1002EE990;
    qword_1002EE990 = (uint64_t)v3;

    objc_msgSend((id)qword_1002EE990, "setDateStyle:", 3);
    objc_msgSend((id)qword_1002EE990, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend((id)qword_1002EE990, "setTimeStyle:", a3);
  }
  v5 = (void *)qword_1002EE990;
  v6 = -[RestorableBackupItem snapshot](self, "snapshot");
  v7 = -[MBSnapshot date](v6, "date");
  v8 = objc_msgSend(v5, "stringFromDate:", v7);

  return v8;
}

- (id)deviceInfoString
{
  MBBackup *v2;
  MBBackup *v3;
  NSBundle *v4;
  id v5;
  NSString *v6;
  NSString *v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  MBSnapshot *v11;
  id v12;
  NSString *v13;
  id location[2];
  RestorableBackupItem *v16;

  v16 = self;
  location[1] = (id)a2;
  v2 = -[RestorableBackupItem backup](self, "backup");
  location[0] = -[MBBackup marketingName](v2, "marketingName");

  if (!location[0])
  {
    v3 = -[RestorableBackupItem backup](v16, "backup");
    location[0] = -[MBBackup deviceClass](v3, "deviceClass");

  }
  if (-[RestorableBackupItem isThisDevice](v16, "isThisDevice"))
  {
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("THIS_DEVICE"));
    v6 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", v5, &stru_100284738, CFSTR("RestoreFromBackup"));
    v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, location[0]);
    v8 = location[0];
    location[0] = v7;

  }
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("JOIN_DEVICE_NAME_AND_INFO_%@_%@"), &stru_100284738, CFSTR("RestoreFromBackup"));
  v11 = -[RestorableBackupItem snapshot](v16, "snapshot");
  v12 = -[MBSnapshot deviceName](v11, "deviceName");
  v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12, location[0]);

  objc_storeStrong(location, 0);
  return v13;
}

- (void)prefetchAccounts
{
  -[RestorableBackupItem fetchAccounts:](self, "fetchAccounts:", 0, a2, self);
}

- (void)fetchAccounts:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  RestorableBackupItem *v10;
  id v11[3];
  int v12;
  void **block;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18[3];
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id location[2];
  RestorableBackupItem *v34;

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  v27 = &v26;
  v28 = 838860800;
  v29 = 48;
  v30 = sub_1000BEC20;
  v31 = sub_1000BEC50;
  v32 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 838860800;
  v22 = 48;
  v23 = sub_1000BEC20;
  v24 = sub_1000BEC50;
  v25 = 0;
  v3 = -[RestorableBackupItem accountsQueue](v34, "accountsQueue");
  block = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_1000BEC5C;
  v17 = &unk_1002820D8;
  v18[1] = &v19;
  v18[0] = v34;
  v18[2] = &v26;
  dispatch_sync(v3, &block);

  if (v20[5])
  {
    if (location[0])
      (*((void (**)(id, uint64_t, uint64_t, _QWORD))location[0] + 2))(location[0], v20[5], v27[5], 0);
    v12 = 1;
  }
  else
  {
    v4 = dispatch_get_global_queue(25, 0);
    v5 = _NSConcreteStackBlock;
    v6 = -1073741824;
    v7 = 0;
    v8 = sub_1000BECD8;
    v9 = &unk_1002823C8;
    v10 = v34;
    v11[1] = &v19;
    v11[2] = &v26;
    v11[0] = location[0];
    dispatch_async(v4, &v5);

    objc_storeStrong(v11, 0);
    objc_storeStrong((id *)&v10, 0);
    v12 = 0;
  }
  objc_storeStrong(v18, 0);
  _Block_object_dispose(&v19, 8);
  objc_storeStrong(&v25, 0);
  _Block_object_dispose(&v26, 8);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
}

- (id)hashString
{
  MBSnapshot *v2;
  MBBackup *v3;
  NSString *v4;
  id v6;
  id v7;
  id location[2];
  RestorableBackupItem *v9;

  v9 = self;
  location[1] = (id)a2;
  v2 = -[RestorableBackupItem snapshot](self, "snapshot");
  location[0] = -[MBSnapshot deviceName](v2, "deviceName");

  if (!location[0])
    objc_storeStrong(location, &stru_100284738);
  v3 = -[RestorableBackupItem backup](v9, "backup");
  v7 = -[MBBackup marketingName](v3, "marketingName");

  if (!v7)
    objc_storeStrong(&v7, &stru_100284738);
  v6 = -[RestorableBackupItem dateString](v9, "dateString");
  if (!v6)
    objc_storeStrong(&v6, &stru_100284738);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)(%@)(%@)"), location[0], v7, v6);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (MBBackup)backup
{
  return self->_backup;
}

- (void)setBackup:(id)a3
{
  objc_storeStrong((id *)&self->_backup, a3);
}

- (MBSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (NSString)pendingBackupUDID
{
  return self->_pendingBackupUDID;
}

- (void)setPendingBackupUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)pendingBackupUUID
{
  return self->_pendingBackupUUID;
}

- (void)setPendingBackupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)pendingSnapshotID
{
  return self->_pendingSnapshotID;
}

- (void)setPendingSnapshotID:(unint64_t)a3
{
  self->_pendingSnapshotID = a3;
}

- (OS_dispatch_queue)accountsQueue
{
  return self->_accountsQueue;
}

- (void)setAccountsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountsQueue, a3);
}

- (NSDictionary)appleIDMap
{
  return self->_appleIDMap;
}

- (void)setAppleIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDMap, a3);
}

- (NSString)activeAppleID
{
  return self->_activeAppleID;
}

- (void)setActiveAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_activeAppleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAppleID, 0);
  objc_storeStrong((id *)&self->_appleIDMap, 0);
  objc_storeStrong((id *)&self->_accountsQueue, 0);
  objc_storeStrong((id *)&self->_pendingBackupUUID, 0);
  objc_storeStrong((id *)&self->_pendingBackupUDID, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_backup, 0);
}

@end
