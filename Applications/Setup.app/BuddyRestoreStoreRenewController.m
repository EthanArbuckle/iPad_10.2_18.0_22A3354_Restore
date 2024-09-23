@implementation BuddyRestoreStoreRenewController

- (void)fetchAccounts:(id)a3
{
  RestorableBackupItem *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *, void *, void *);
  void *v8;
  id v9;
  int v10;
  id location[2];
  BuddyRestoreStoreRenewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = -[BuddyRestoreStoreRenewController backupItem](v12, "backupItem");
    v4 = _NSConcreteStackBlock;
    v5 = -1073741824;
    v6 = 0;
    v7 = sub_1000783EC;
    v8 = &unk_100281758;
    v9 = location[0];
    -[RestorableBackupItem fetchAccounts:](v3, "fetchAccounts:", &v4);

    objc_storeStrong(&v9, 0);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  objc_storeStrong(location, 0);
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
  objc_storeStrong((id *)&self->_backupItem, a3);
}

- (BOOL)softwareUpdateDidOccur
{
  return self->_softwareUpdateDidOccur;
}

- (void)setSoftwareUpdateDidOccur:(BOOL)a3
{
  self->_softwareUpdateDidOccur = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupItem, 0);
}

@end
