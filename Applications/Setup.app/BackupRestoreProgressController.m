@implementation BackupRestoreProgressController

- (BackupRestoreProgressController)init
{
  NSBundle *v3;
  NSString *v4;
  BackupRestoreProgressController *v5;
  id v6;
  void *v7;
  NSNotificationCenter *v8;
  BackupRestoreProgressController *v9;
  objc_super v11;
  SEL v12;
  id location;

  v12 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("RESTORING_FROM_BACKUP"), &stru_100284738, CFSTR("RestoreFromBackup"));
  location = 0;
  v11.receiver = self;
  v11.super_class = (Class)BackupRestoreProgressController;
  v5 = -[BackupRestoreProgressController initWithTitle:detailText:icon:](&v11, "initWithTitle:detailText:icon:", v4, 0, 0);
  location = v5;
  objc_storeStrong(&location, v5);

  if (v5)
  {
    v6 = objc_alloc_init((Class)MBManager);
    v7 = (void *)*((_QWORD *)location + 13);
    *((_QWORD *)location + 13) = v6;

    objc_msgSend(*((id *)location + 13), "setDelegate:", location);
    *((_QWORD *)location + 15) = 0;
    *((_QWORD *)location + 16) = 0;
    v8 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v8, "addObserver:selector:name:object:", location, "willResignActive", UIApplicationWillResignActiveNotification, 0);

  }
  v9 = (BackupRestoreProgressController *)location;
  objc_storeStrong(&location, 0);
  return v9;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BackupRestoreProgressController *v5;

  v5 = self;
  v4 = a2;
  -[BackupRestoreProgressController releaseAssertions](self, "releaseAssertions");
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:](v2, "removeObserver:name:object:", v5, UIApplicationWillResignActiveNotification, 0);

  v3.receiver = v5;
  v3.super_class = (Class)BackupRestoreProgressController;
  -[BackupRestoreProgressController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  id v2;
  objc_super v3;
  SEL v4;
  BackupRestoreProgressController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BackupRestoreProgressController;
  -[BackupRestoreProgressController loadView](&v3, "loadView");
  -[BackupRestoreProgressController updateProgressText](v5, "updateProgressText");
  v2 = -[BackupRestoreProgressController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

}

- (void)willResignActive
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  id v5;
  id v6;
  _WORD v7[3];
  os_log_type_t v8;
  os_log_t oslog;
  BOOL v10;
  CFArrayRef theArray;
  SEL v12;
  BackupRestoreProgressController *v13;

  v13 = self;
  v12 = a2;
  if ((id)-[BackupRestoreProgressController restoreState](self, "restoreState") == (id)1)
  {
    theArray = (CFArrayRef)CTCopyCurrentCalls(kCFAllocatorDefault);
    if (theArray)
    {
      v10 = CFArrayGetCount(theArray) > 0;
      CFRelease(theArray);
      if (v10)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v2);
        v8 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v3 = oslog;
          v4 = v8;
          sub_100038C3C(v7);
          _os_log_impl((void *)&_mh_execute_header, v3, v4, "Canceling restore due to incoming call", (uint8_t *)v7, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        -[BackupRestoreProgressController setRestoreState:](v13, "setRestoreState:", 3);
        -[MBManager cancel](v13->_backupManager, "cancel");
        v5 = -[BackupRestoreProgressController navigationController](v13, "navigationController");
        v6 = objc_msgSend(v5, "popViewControllerAnimated:", 0);

      }
    }
  }
}

- (void)popBackFromProgress
{
  BFFBackupDeviceController *v2;
  id v3;
  BackupRestoreProgressController *v4;
  BFFFlowItemDelegate *v5;
  id v6;
  BFFFlowItemDelegate *v7;
  id v8;

  v2 = -[BackupRestoreProgressController backupDeviceController](self, "backupDeviceController", a2);
  -[BFFBackupDeviceController reset](v2, "reset");

  v3 = -[BackupRestoreProgressController navigationController](self, "navigationController");
  v4 = (BackupRestoreProgressController *)objc_msgSend(v3, "topViewController");

  if (v4 == self)
  {
    v5 = -[BackupRestoreProgressController delegate](self, "delegate");
    v6 = -[BFFFlowItemDelegate popToBuddyControllerWithClass:animated:](v5, "popToBuddyControllerWithClass:animated:", objc_opt_class(BuddyExpressRestoreController), 1);

    if (!v6)
    {
      v7 = -[BackupRestoreProgressController delegate](self, "delegate");
      v8 = -[BFFFlowItemDelegate popToBuddyControllerWithClass:animated:](v7, "popToBuddyControllerWithClass:animated:", objc_opt_class(RestoreFromBackupController), 1);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAlertController *v3;
  BackupRestoreProgressController *v4;
  UIAlertController *v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  BackupRestoreProgressController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BackupRestoreProgressController;
  -[BackupRestoreProgressController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v3 = -[BackupRestoreProgressController alert](v9, "alert");

  if (v3)
  {
    v4 = v9;
    v5 = -[BackupRestoreProgressController alert](v9, "alert");
    -[BackupRestoreProgressController presentViewController:animated:completion:](v4, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)renewCredentialsThenStartRestore:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  id v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(NSObject *, uint64_t, id);
  void *v16;
  BackupRestoreProgressController *v17;
  id v18;
  id v19;
  uint8_t buf[15];
  os_log_type_t v21;
  os_log_t oslog;
  id v23;
  id location[2];
  BackupRestoreProgressController *v25;
  uint64_t v26;
  void *v27;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v23 = objc_msgSend(v3, "aa_primaryAppleAccount");

  v4 = +[BFFAppleAccountInfo primaryAccountInfo](BFFAppleAccountInfo, "primaryAccountInfo");
  v5 = objc_msgSend(v4, "rawPassword");
  objc_msgSend(v23, "_aa_setRawPassword:", v5);

  v6 = +[BYSecurityInterface sharedInterface](BYSecurityInterface, "sharedInterface");
  LOBYTE(v4) = objc_msgSend(v6, "isICDPEnabledForPrimaryAccount");

  if ((v4 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = oslog;
      v9 = v21;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Renewing account credentials prior to restore...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v26 = kACRenewCredentialsShouldAvoidUIKey;
    v27 = &__kCFBooleanTrue;
    v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v10 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
    v11 = v23;
    v12 = _NSConcreteStackBlock;
    v13 = -1073741824;
    v14 = 0;
    v15 = sub_1000501AC;
    v16 = &unk_100280D28;
    v17 = v25;
    v18 = location[0];
    objc_msgSend(v10, "renewCredentialsForAccount:options:completion:", v11, v19, &v12);

    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    -[BackupRestoreProgressController startRestore:](v25, "startRestore:", location[0]);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)startRestore:(id)a3
{
  NSObject *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BackupRestoreProgressController *v9;
  id v10;
  id location[2];
  BackupRestoreProgressController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10005050C;
  v8 = &unk_100280D00;
  v9 = v12;
  v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_failedToStartRestoreForSnapshotID:(unint64_t)a3 error:(id)a4
{
  id v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSString *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t i;
  id v20;
  id v21;
  id v22;
  id v23;
  unsigned __int8 v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  RestorableBackupItem *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void **block;
  int v44;
  int v45;
  id (*v46)(id *);
  void *v47;
  id v48;
  id v49;
  void **v50;
  int v51;
  int v52;
  void (*v53)(NSObject *, void *);
  void *v54;
  id v55;
  os_log_type_t v56;
  os_log_t v57;
  os_log_type_t v58;
  os_log_t v59;
  uint8_t v60[15];
  os_log_type_t v61;
  os_log_t v62;
  int v63;
  _QWORD __b[8];
  id v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  os_log_type_t v71;
  os_log_t v72;
  id obj;
  id v74;
  id v75;
  os_log_type_t v76;
  os_log_t oslog;
  char v78;
  id location;
  unint64_t v80;
  SEL v81;
  id v82;
  uint8_t v83[32];
  uint8_t v84[32];
  uint8_t v85[128];
  uint8_t v86[16];
  uint8_t buf[32];

  v82 = self;
  v81 = a2;
  v80 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v78 = 0;
  v4 = objc_msgSend(location, "domain");
  v5 = 0;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("MBErrorDomain")) & 1) != 0)
    v5 = objc_msgSend(location, "code") == (id)204;

  if (v5)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v76 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v80;
      v8 = objc_msgSend(v82, "backupItem");
      v9 = objc_msgSend(v8, "backupUDID");
      sub_10005136C((uint64_t)buf, v7, (uint64_t)v9);
      _os_log_impl((void *)&_mh_execute_header, oslog, v76, "Unable to find the snapshot ID %ld in backup UDID %@; searching for one that is the same...",
        buf,
        0x16u);

    }
    objc_storeStrong((id *)&oslog, 0);
    v75 = 0;
    v10 = objc_msgSend(v82, "backupItem");
    v11 = objc_msgSend(v10, "backupUUID");
    v12 = *((_QWORD *)v82 + 13);
    obj = 0;
    v13 = +[BuddyBackupUtilities backupForUUID:withManager:error:](BuddyBackupUtilities, "backupForUUID:withManager:error:", v11, v12, &obj);
    objc_storeStrong(&v75, obj);
    v74 = v13;

    if (!v75 && v74)
    {
      v66 = 0;
      memset(__b, 0, sizeof(__b));
      v16 = objc_msgSend(v74, "snapshots");
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v85, 16);
      if (v17)
      {
        v18 = *(_QWORD *)__b[2];
        do
        {
          for (i = 0; i < (unint64_t)v17; ++i)
          {
            if (*(_QWORD *)__b[2] != v18)
              objc_enumerationMutation(v16);
            v65 = *(id *)(__b[1] + 8 * i);
            v20 = objc_msgSend(v65, "date");
            v21 = objc_msgSend(v82, "backupItem");
            v22 = objc_msgSend(v21, "snapshot");
            v23 = objc_msgSend(v22, "date");
            v24 = objc_msgSend(v20, "isEqualToDate:", v23);

            if ((v24 & 1) != 0)
            {
              objc_storeStrong(&v66, v65);
              v63 = 2;
              goto LABEL_29;
            }
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v85, 16);
        }
        while (v17);
      }
      v63 = 0;
LABEL_29:

      if (v66)
      {
        v59 = (os_log_t)(id)_BYLoggingFacility(v25);
        v58 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v28 = objc_msgSend(v66, "snapshotID");
          v29 = objc_msgSend(v82, "backupItem");
          v30 = objc_msgSend(v29, "backupUDID");
          sub_10005136C((uint64_t)v84, (uint64_t)v28, (uint64_t)v30);
          _os_log_impl((void *)&_mh_execute_header, v59, v58, "Found snapshot ID %ld in backup UDID %@ that was the same!", v84, 0x16u);

        }
        objc_storeStrong((id *)&v59, 0);
        v31 = objc_msgSend(v82, "backupItem");
        v32 = objc_msgSend(v31, "backup");
        v33 = +[RestorableBackupItem restorableBackupItemWithBackup:snapshot:](RestorableBackupItem, "restorableBackupItemWithBackup:snapshot:", v32, v66);
        objc_msgSend(v82, "setBackupItem:", v33);

        v57 = (os_log_t)(id)_BYLoggingFacility(v34);
        v56 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_msgSend(v82, "backupItem");
          v36 = objc_msgSend(v35, "backupUDID");
          sub_100050750((uint64_t)v83, (uint64_t)v36, (uint64_t)objc_msgSend(v66, "snapshotID"));
          _os_log_impl((void *)&_mh_execute_header, v57, v56, "Starting iCloud Restore for backup UDID %@ and snapshot %ld...", v83, 0x16u);

        }
        objc_storeStrong((id *)&v57, 0);
        v37 = objc_msgSend(v82, "backupManager");
        v38 = objc_msgSend(v82, "backupItem");
        v39 = objc_msgSend(v38, "backupUDID");
        v40 = objc_msgSend(v66, "snapshotID");
        v41 = objc_msgSend(v82, "_createRestoreOptions");
        v50 = _NSConcreteStackBlock;
        v51 = -1073741824;
        v52 = 0;
        v53 = sub_10005138C;
        v54 = &unk_100280B80;
        v55 = v82;
        objc_msgSend(v37, "startRestoreForBackupUDID:snapshotID:options:completion:", v39, v40, v41, &v50);

        v78 = 1;
        objc_storeStrong(&v55, 0);
      }
      else
      {
        v62 = (os_log_t)(id)_BYLoggingFacility(v25);
        v61 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v62;
          v27 = v61;
          sub_100038C3C(v60);
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to find a snapshot that was the same!", v60, 2u);
        }
        objc_storeStrong((id *)&v62, 0);
      }
      objc_storeStrong(&v66, 0);
    }
    else
    {
      v72 = (os_log_t)(id)_BYLoggingFacility(v14);
      v71 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v69 = 0;
        v67 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v15 = (NSString *)v75;
        }
        else if (v75)
        {
          v70 = objc_msgSend(v75, "domain");
          v69 = 1;
          v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v70, objc_msgSend(v75, "code"));
          v68 = v15;
          v67 = 1;
        }
        else
        {
          v15 = 0;
        }
        sub_100039500((uint64_t)v86, (uint64_t)v15);
        _os_log_impl((void *)&_mh_execute_header, v72, v71, "Failed to get the list of backups: %{public}@", v86, 0xCu);
        if ((v67 & 1) != 0)

        if ((v69 & 1) != 0)
      }
      objc_storeStrong((id *)&v72, 0);
    }
    objc_storeStrong(&v74, 0);
    objc_storeStrong(&v75, 0);
  }
  if ((v78 & 1) == 0)
  {
    v42 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v44 = -1073741824;
    v45 = 0;
    v46 = sub_1000515C4;
    v47 = &unk_100280D00;
    v48 = v82;
    v49 = location;
    dispatch_async((dispatch_queue_t)v42, &block);

    objc_storeStrong(&v49, 0);
    objc_storeStrong(&v48, 0);
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)hasAssertions
{
  RBSAssertion *v2;
  BOOL v3;

  v2 = -[BackupRestoreProgressController processAssertion](self, "processAssertion", a2);
  v3 = 0;
  if (v2)
    v3 = -[BackupRestoreProgressController deviceLockAssertion](self, "deviceLockAssertion") != 0;

  return v3;
}

- (BOOL)takeAssertions
{
  RBSAssertion *v2;
  id v3;
  RBSTarget *v4;
  RBSDomainAttribute *v5;
  NSArray *v6;
  id v7;
  RBSAssertion *v8;
  uint64_t v9;
  NSString *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  __MKBAssertion *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSString *v17;
  uint64_t v18;
  __MKBAssertion *v19;
  NSObject *v20;
  os_log_type_t v21;
  NSString *v22;
  char v24;
  NSString *v25;
  char v26;
  id v27;
  os_log_t v28;
  uint8_t v29[15];
  os_log_type_t v30;
  os_log_t v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  os_log_type_t v37;
  os_log_t oslog;
  uint8_t v39[7];
  os_log_type_t v40;
  id v41;
  id v42;
  NSString *v43;
  uint8_t v44[15];
  os_log_type_t v45;
  id v46;
  int v47;
  char v48;
  NSString *v49;
  char v50;
  id v51;
  os_log_type_t v52;
  id v53;
  id v54;
  id location[2];
  BackupRestoreProgressController *v56;
  char v57;
  uint8_t v58[16];
  const __CFString *v59;
  const __CFString *v60;
  uint8_t v61[16];
  uint8_t buf[16];
  RBSDomainAttribute *v63;

  v56 = self;
  location[1] = (id)a2;
  v2 = -[BackupRestoreProgressController processAssertion](self, "processAssertion");
  -[RBSAssertion invalidate](v2, "invalidate");

  v3 = objc_alloc((Class)RBSAssertion);
  v4 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", getpid());
  v5 = +[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.purplebuddy"), CFSTR("Update"));
  v63 = v5;
  v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1);
  v7 = objc_msgSend(v3, "initWithExplanation:target:attributes:", CFSTR("iCloud Restore"), v4, v6);
  -[BackupRestoreProgressController setProcessAssertion:](v56, "setProcessAssertion:", v7);

  location[0] = 0;
  v8 = -[BackupRestoreProgressController processAssertion](v56, "processAssertion");
  v54 = 0;
  LOBYTE(v7) = -[RBSAssertion acquireWithError:](v8, "acquireWithError:", &v54);
  objc_storeStrong(location, v54);

  if (((v7 ^ 1) & 1) != 0)
  {
    v53 = (id)_BYLoggingFacility(v9);
    v52 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
    {
      v50 = 0;
      v48 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v10 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v51 = objc_msgSend(location[0], "domain");
        v50 = 1;
        v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v51, objc_msgSend(location[0], "code"));
        v49 = v10;
        v48 = 1;
      }
      else
      {
        v10 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v10);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v53, v52, "Failed to take process assertion during migration: %{public}@", buf, 0xCu);
      if ((v48 & 1) != 0)

      if ((v50 & 1) != 0)
    }
    objc_storeStrong(&v53, 0);
    -[BackupRestoreProgressController releaseAssertions](v56, "releaseAssertions");
    v57 = 0;
    v47 = 1;
  }
  else
  {
    v46 = (id)_BYLoggingFacility(v9);
    v45 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v46;
      v12 = v45;
      sub_100038C3C(v44);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Process lock assertion successfully taken during restore", v44, 2u);
    }
    objc_storeStrong(&v46, 0);
    v43 = 0;
    if (-[BackupRestoreProgressController softwareUpdateDidOccur](v56, "softwareUpdateDidOccur"))
    {
      v42 = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
      objc_msgSend(v42, "cancelDataMigratorDeferredExit");
      v13 = MKBDeviceLockAssertionConsume(&__NSDictionary0__struct, &v43);
      -[BackupRestoreProgressController setDeviceLockAssertion:](v56, "setDeviceLockAssertion:", v13);
      v14 = -[BackupRestoreProgressController deviceLockAssertion](v56, "deviceLockAssertion");
      if (v14)
      {
        v41 = (id)_BYLoggingFacility(v14);
        v40 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v41;
          v16 = v40;
          sub_100038C3C(v39);
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Device lock assertion successfully consumed during restore", v39, 2u);
        }
        objc_storeStrong(&v41, 0);
      }
      else
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(0);
        v37 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          v35 = 0;
          v33 = 0;
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v17 = v43;
          }
          else if (v43)
          {
            v36 = -[NSString domain](v43, "domain");
            v35 = 1;
            v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v36, -[NSString code](v43, "code"));
            v34 = v17;
            v33 = 1;
          }
          else
          {
            v17 = 0;
          }
          sub_100039500((uint64_t)v61, (uint64_t)v17);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v37, "Failed to consume device lock assertion during restore - %{public}@", v61, 0xCu);
          if ((v33 & 1) != 0)

          if ((v35 & 1) != 0)
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v42, 0);
    }
    else
    {
      v59 = CFSTR("MKBAssertionKey");
      v60 = CFSTR("RestoreFromBackup");
      v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v18 = MKBDeviceLockAssertion(v32, &v43);
      -[BackupRestoreProgressController setDeviceLockAssertion:](v56, "setDeviceLockAssertion:", v18);
      v19 = -[BackupRestoreProgressController deviceLockAssertion](v56, "deviceLockAssertion");
      if (v19)
      {
        v31 = (os_log_t)(id)_BYLoggingFacility(v19);
        v30 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v31;
          v21 = v30;
          sub_100038C3C(v29);
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Device lock assertion successfully taken during restore", v29, 2u);
        }
        objc_storeStrong((id *)&v31, 0);
      }
      else
      {
        v28 = (os_log_t)(id)_BYLoggingFacility(0);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v26 = 0;
          v24 = 0;
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v22 = v43;
          }
          else if (v43)
          {
            v27 = -[NSString domain](v43, "domain");
            v26 = 1;
            v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v27, -[NSString code](v43, "code"));
            v25 = v22;
            v24 = 1;
          }
          else
          {
            v22 = 0;
          }
          sub_100039500((uint64_t)v58, (uint64_t)v22);
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to take device lock assertion during restore - %{public}@", v58, 0xCu);
          if ((v24 & 1) != 0)

          if ((v26 & 1) != 0)
        }
        objc_storeStrong((id *)&v28, 0);
      }
      objc_storeStrong(&v32, 0);
    }
    if (-[BackupRestoreProgressController deviceLockAssertion](v56, "deviceLockAssertion"))
    {
      v57 = 1;
    }
    else
    {
      -[BackupRestoreProgressController releaseAssertions](v56, "releaseAssertions");
      CFRelease(v43);
      v57 = 0;
    }
    v47 = 1;
  }
  objc_storeStrong(location, 0);
  return v57 & 1;
}

- (void)releaseAssertions
{
  RBSAssertion *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  RBSAssertion *v6;
  __MKBAssertion *v7;
  NSObject *v8;
  os_log_type_t v9;
  _WORD v10[3];
  os_log_type_t v11;
  os_log_t v12;
  uint8_t buf[7];
  os_log_type_t v14;
  os_log_t oslog[2];
  BackupRestoreProgressController *v16;

  v16 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BackupRestoreProgressController processAssertion](self, "processAssertion");

  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v3);
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog[0];
      v5 = v14;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Releasing process assertion", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v6 = -[BackupRestoreProgressController processAssertion](v16, "processAssertion");
    -[RBSAssertion invalidate](v6, "invalidate");

    -[BackupRestoreProgressController setProcessAssertion:](v16, "setProcessAssertion:", 0);
  }
  v7 = -[BackupRestoreProgressController deviceLockAssertion](v16, "deviceLockAssertion");
  if (v7)
  {
    v12 = (os_log_t)(id)_BYLoggingFacility(v7);
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v12;
      v9 = v11;
      sub_100038C3C(v10);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Releasing device lock assertion taken during restore", (uint8_t *)v10, 2u);
    }
    objc_storeStrong((id *)&v12, 0);
    CFRelease(-[BackupRestoreProgressController deviceLockAssertion](v16, "deviceLockAssertion"));
    -[BackupRestoreProgressController setDeviceLockAssertion:](v16, "setDeviceLockAssertion:", 0);
  }
}

- (void)setAlert:(id)a3
{
  id location[2];
  BackupRestoreProgressController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!v4->_alert)
    objc_storeStrong((id *)&v4->_alert, location[0]);
  objc_storeStrong(location, 0);
}

- (void)updateProgress
{
  double backupPercentComplete;
  double v3;
  double v4;

  if (self->_backupThenRestore)
  {
    backupPercentComplete = self->_backupPercentComplete;
    -[BackupRestoreProgressController restorePercentComplete](self, "restorePercentComplete");
    -[BackupRestoreProgressController setProgress:](self, "setProgress:", (backupPercentComplete + v3) / 2.0);
  }
  else
  {
    -[BackupRestoreProgressController restorePercentComplete](self, "restorePercentComplete");
    -[BackupRestoreProgressController setProgress:](self, "setProgress:", v4);
  }
}

- (void)updateProgressText
{
  NSBundle *v2;
  NSString *v3;
  NSBundle *v4;
  NSString *v5;
  BFFBackupDeviceController *v6;
  NSString *v7;
  NSString *v8;

  if (!-[BackupRestoreProgressController restoreState](self, "restoreState") && self->_backupThenRestore)
  {
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("WAITING_FOR_BACKUP"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v6 = -[BackupRestoreProgressController backupDeviceController](self, "backupDeviceController");
    v7 = -[BFFBackupDeviceController backingUpDeviceName](v6, "backingUpDeviceName");
    v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7);
    -[BackupRestoreProgressController setTitle:](self, "setTitle:", v8);

  }
  else
  {
    v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("RESTORING_FROM_BACKUP"), &stru_100284738, CFSTR("RestoreFromBackup"));
    -[BackupRestoreProgressController setTitle:](self, "setTitle:", v3);

  }
}

- (id)latestSnapshotForSourceDevice:(id *)a3
{
  BFFBackupDeviceController *v4;
  NSString *v5;
  BFFBackupDeviceController *v6;
  NSDate *v7;
  id v8;

  v4 = -[BackupRestoreProgressController backupDeviceController](self, "backupDeviceController");
  v5 = -[BFFBackupDeviceController backingUpDeviceUUID](v4, "backingUpDeviceUUID");
  v6 = -[BackupRestoreProgressController backupDeviceController](self, "backupDeviceController");
  v7 = -[BFFBackupDeviceController completionDate](v6, "completionDate");
  v8 = -[BackupRestoreProgressController latestSnapshotForBackupUUID:backupCompletedDate:lastSnapshotDate:error:](self, "latestSnapshotForBackupUUID:backupCompletedDate:lastSnapshotDate:error:", v5, v7, self->_lastSourceDeviceSnapshotDate, a3);

  return v8;
}

- (id)latestSnapshotForBackupUUID:(id)a3 lastSnapshotDate:(id)a4 error:(id *)a5
{
  id v7;
  id v9;
  id location[2];
  BackupRestoreProgressController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = -[BackupRestoreProgressController latestSnapshotForBackupUUID:backupCompletedDate:lastSnapshotDate:error:](v11, "latestSnapshotForBackupUUID:backupCompletedDate:lastSnapshotDate:error:", location[0], 0, v9, a5);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)latestSnapshotForBackupUUID:(id)a3 backupCompletedDate:(id)a4 lastSnapshotDate:(id)a5 error:(id *)a6
{
  MBManager *backupManager;
  id v10;
  uint64_t v11;
  NSString *v12;
  id v13;
  id v14;
  NSSortDescriptor *v15;
  NSArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t i;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  id v27;
  id v28;
  BOOL v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  id v36;
  id v37;
  NSObject *v38;
  NSError *v39;
  id v41;
  os_log_type_t v42;
  os_log_t v43;
  os_log_type_t v44;
  os_log_t v45;
  int v46;
  os_log_type_t v47;
  os_log_t v48;
  os_log_type_t v49;
  os_log_t v50;
  char v51;
  id v52;
  os_log_type_t v53;
  os_log_t v54;
  unint64_t v55;
  _QWORD __b[8];
  id v57;
  id v58;
  id v59;
  os_log_type_t v60;
  os_log_t v61;
  char v62;
  id v63;
  char v64;
  id v65;
  os_log_type_t v66;
  os_log_t oslog;
  id obj;
  id v69;
  id v70;
  id *v71;
  id v72;
  id v73;
  id location[2];
  BackupRestoreProgressController *v75;
  id v76;
  uint8_t v77[16];
  uint8_t v78[16];
  uint8_t v79[48];
  uint8_t v80[32];
  uint8_t v81[40];
  _BYTE v82[128];
  NSSortDescriptor *v83;
  uint8_t v84[32];
  uint8_t buf[24];

  v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v73 = 0;
  objc_storeStrong(&v73, a4);
  v72 = 0;
  objc_storeStrong(&v72, a5);
  v71 = a6;
  v70 = 0;
  backupManager = v75->_backupManager;
  obj = 0;
  v10 = +[BuddyBackupUtilities backupForUUID:withManager:error:](BuddyBackupUtilities, "backupForUUID:withManager:error:", location[0], backupManager, &obj);
  objc_storeStrong(&v70, obj);
  v69 = v10;
  if (v70 || !v69)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v11);
    v66 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v64 = 0;
      v62 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v12 = (NSString *)v70;
      }
      else if (v70)
      {
        v65 = objc_msgSend(v70, "domain");
        v64 = 1;
        v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v65, objc_msgSend(v70, "code"));
        v63 = v12;
        v62 = 1;
      }
      else
      {
        v12 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, oslog, v66, "Failed to get the list of backups: %{public}@", buf, 0xCu);
      if ((v62 & 1) != 0)

      if ((v64 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v71)
    {
      v13 = objc_retainAutorelease(v70);
      *v71 = v13;
    }
LABEL_61:
    v76 = 0;
    v46 = 1;
    goto LABEL_62;
  }
  v61 = (os_log_t)(id)_BYLoggingFacility(v11);
  v60 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003EB04((uint64_t)v84, (uint64_t)v73, (uint64_t)v72);
    _os_log_impl((void *)&_mh_execute_header, v61, v60, "Looking for a snapshot that is same or newer than %@ or newer than %@", v84, 0x16u);
  }
  objc_storeStrong((id *)&v61, 0);
  v59 = 0;
  v14 = objc_msgSend(v69, "snapshots");
  v15 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v83 = v15;
  v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v83, 1);
  v58 = objc_msgSend(v14, "sortedArrayUsingDescriptors:", v16);

  if (objc_msgSend(v58, "count"))
  {
    memset(__b, 0, sizeof(__b));
    v17 = v58;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v82, 16);
    if (v18)
    {
      v19 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v18; ++i)
        {
          if (*(_QWORD *)__b[2] != v19)
            objc_enumerationMutation(v17);
          v57 = *(id *)(__b[1] + 8 * i);
          v21 = objc_msgSend(v57, "state");
          if ((_DWORD)v21 == 3 && (v21 = objc_msgSend(v57, "isCompatible"), (v21 & 1) != 0))
          {
            v55 = 0;
            v22 = objc_msgSend(v57, "date");
            v23 = objc_msgSend(v22, "compare:", v73);

            v55 = (unint64_t)v23;
            if (v73 && v55 <= 1)
            {
              v54 = (os_log_t)(id)_BYLoggingFacility(v24);
              v53 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v25 = v54;
                v26 = v53;
                v27 = objc_msgSend(v57, "snapshotID");
                v28 = objc_msgSend(v57, "date");
                sub_100052E50((uint64_t)v81, (uint64_t)v27, (uint64_t)v28, (uint64_t)v73);
                _os_log_impl((void *)&_mh_execute_header, v25, v26, "Choosing snapshot ID %ld (%@) as it is the same or newer than the backup the source device just made (%@)", v81, 0x20u);

              }
              objc_storeStrong((id *)&v54, 0);
              objc_storeStrong(&v59, v57);
            }
            else
            {
              v51 = 0;
              v29 = 0;
              if (v72)
              {
                v52 = objc_msgSend(v57, "date");
                v51 = 1;
                v24 = objc_msgSend(v52, "compare:", v72);
                v29 = v24 == (id)1;
              }
              if ((v51 & 1) != 0)

              if (v29)
              {
                v50 = (os_log_t)(id)_BYLoggingFacility(v24);
                v49 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = v50;
                  v31 = v49;
                  v32 = objc_msgSend(v57, "snapshotID");
                  v33 = objc_msgSend(v57, "date");
                  sub_100052E50((uint64_t)v80, (uint64_t)v32, (uint64_t)v33, (uint64_t)v72);
                  _os_log_impl((void *)&_mh_execute_header, v30, v31, "Choosing snapshot ID %ld (%@) as it is newer than the reported newest backup (%@)", v80, 0x20u);

                }
                objc_storeStrong((id *)&v50, 0);
                objc_storeStrong(&v59, v57);
              }
              else
              {
                v48 = (os_log_t)(id)_BYLoggingFacility(v24);
                v47 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = v48;
                  v35 = v47;
                  v36 = objc_msgSend(v57, "snapshotID");
                  v37 = objc_msgSend(v57, "date");
                  sub_100052E78((uint64_t)v79, (uint64_t)v36, (uint64_t)v37, (uint64_t)v72, (uint64_t)v73);
                  _os_log_impl((void *)&_mh_execute_header, v34, v35, "Not picking snapshot ID %ld (%@) as it is older than both the existing backup (%@) and the new backup (%@)", v79, 0x2Au);

                }
                objc_storeStrong((id *)&v48, 0);
              }
            }
            if (v59)
            {
              v46 = 2;
              goto LABEL_51;
            }
          }
          else
          {
            v45 = (os_log_t)(id)_BYLoggingFacility(v21);
            v44 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              v38 = v45;
              sub_1000342B4((uint64_t)v78, (uint64_t)objc_msgSend(v57, "snapshotID"));
              _os_log_impl((void *)&_mh_execute_header, v38, v44, "Skipping snapshot ID %ld as it's not committed and/or not compatible", v78, 0xCu);
            }
            objc_storeStrong((id *)&v45, 0);
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v82, 16);
      }
      while (v18);
    }
    v46 = 0;
LABEL_51:

  }
  else
  {
    v43 = (os_log_t)(id)_BYLoggingFacility(0);
    v42 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      sub_100038C28((uint64_t)v77, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, v43, v42, "No snapshots found for device backup UUID %@", v77, 0xCu);
    }
    objc_storeStrong((id *)&v43, 0);
  }
  if (v59)
  {
    v41 = +[RestorableBackupItem restorableBackupItemWithBackup:snapshot:](RestorableBackupItem, "restorableBackupItemWithBackup:snapshot:", v69, v59);
    v76 = v41;
    v46 = 1;
    objc_storeStrong(&v41, 0);
  }
  else
  {
    if (v71)
    {
      v39 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BackupRestoreProgressErrorDomain"), -1, 0);
      *v71 = v39;
    }
    v46 = 0;
  }
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  if (!v46)
    goto LABEL_61;
LABEL_62:
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(location, 0);
  return v76;
}

- (void)reattemptBackup
{
  NSObject *v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8;
  id v9;
  id location;
  void **block;
  int v12;
  int v13;
  void (*v14);
  void *v15;
  id v16[2];
  BackupRestoreProgressController *v17;

  v17 = self;
  v16[1] = (id)a2;
  if (-[BackupRestoreProgressController takeAssertions](self, "takeAssertions"))
  {
    v17->_backupThenRestore = 1;
    v17->_backupPercentComplete = 0.0;
    -[BackupRestoreProgressController updateProgress](v17, "updateProgress");
    -[BackupRestoreProgressController updateProgressText](v17, "updateProgressText");
    -[BackupRestoreProgressController setTimeRemainingEstimate:](v17, "setTimeRemainingEstimate:", 1.79769313e308);
    v2 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v12 = -1073741824;
    v13 = 0;
    v14 = sub_10005309C;
    v15 = &unk_100280730;
    v16[0] = v17;
    dispatch_async(v2, &block);

    objc_storeStrong(v16, 0);
  }
  else
  {
    objc_initWeak(&location, v17);
    v3 = _NSConcreteStackBlock;
    v4 = -1073741824;
    v5 = 0;
    v6 = sub_100053258;
    v7 = &unk_1002806B8;
    objc_copyWeak(&v8, &location);
    v9 = +[BuddyRestoreHelpers alertForBackupError:forBackup:okButtonAction:](BuddyRestoreHelpers, "alertForBackupError:forBackup:okButtonAction:", 0, 1, &v3);
    -[BackupRestoreProgressController _presentAlert:](v17, "_presentAlert:", v9);
    objc_storeStrong(&v9, 0);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)handleBackupFailed:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  BackupRestoreProgressController *v10;
  id location[2];
  BackupRestoreProgressController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BackupRestoreProgressController releaseAssertions](v12, "releaseAssertions");
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100053390;
  v8 = &unk_100280D00;
  v9 = location[0];
  v10 = v12;
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_traceAnalyticsForGuideUserToBackup:(id)a3 foundBackup:(BOOL)a4 polledForBackup:(BOOL)a5
{
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  NSDictionary *v10;
  id v11;
  NSString *v12;
  BYAnalyticsManager *v13;
  id v14;
  BOOL v15;
  BOOL v16;
  id location[2];
  BackupRestoreProgressController *v18;
  _QWORD v19[3];
  _QWORD v20[3];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = a5;
  v19[0] = CFSTR("success");
  v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", location[0] == 0);
  v20[0] = v7;
  v19[1] = CFSTR("foundBackup");
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a4);
  v20[1] = v8;
  v19[2] = CFSTR("polledForBackup");
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15);
  v20[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v14 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10);

  if (location[0])
  {
    v11 = objc_msgSend(location[0], "domain");
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%ld)"), v11, objc_msgSend(location[0], "code"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("error"));

  }
  v13 = -[BackupRestoreProgressController analyticsManager](v18, "analyticsManager");
  -[BYAnalyticsManager addEvent:withPayload:persist:](v13, "addEvent:withPayload:persist:", CFSTR("com.apple.setupassistant.ios.guideUserToBackup"), v14, 1);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)_presentAlert:(id)a3
{
  NSThread *v3;
  NSThread *v4;
  void *v5;
  void **block;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  void **v12;
  int v13;
  int v14;
  id (*v15)(uint64_t);
  void *v16;
  BackupRestoreProgressController *v17;
  id v18;
  id v19;
  id location[2];
  BackupRestoreProgressController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = _NSConcreteStackBlock;
  v13 = -1073741824;
  v14 = 0;
  v15 = sub_100054694;
  v16 = &unk_100280D00;
  v17 = v21;
  v18 = location[0];
  v19 = objc_retainBlock(&v12);
  v3 = +[NSThread currentThread](NSThread, "currentThread");
  v4 = +[NSThread mainThread](NSThread, "mainThread");

  if (v3 == v4)
  {
    (*((void (**)(void))v19 + 2))();
  }
  else
  {
    v5 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_100054814;
    v10 = &unk_100280780;
    v11 = v19;
    dispatch_async((dispatch_queue_t)v5, &block);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)_attemptRestore
{
  _BOOL8 v2;
  NSObject *v3;
  os_log_type_t v4;
  NSBundle *v5;
  NSString *v6;
  id v7;
  NSBundle *v8;
  NSString *v9;
  UIAlertAction *v10;
  id v11;
  NSBundle *v12;
  NSString *v13;
  UIAlertAction *v14;
  BFFBackupDeviceController *v15;
  BFFBackupDeviceController *v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  RestorableBackupItem *v19;
  MBSnapshot *v20;
  NSDate *v21;
  NSDate *lastSourceDeviceSnapshotDate;
  BYPasscodeCacheManager *v23;
  NSObject *v24;
  void **block;
  int v26;
  int v27;
  void (*v28)(uint64_t);
  void *v29;
  BackupRestoreProgressController *v30;
  id v31;
  id v32;
  char v33;
  id v34;
  void **v35;
  int v36;
  int v37;
  void (*v38)(id *, void *);
  void *v39;
  id v40;
  void **v41;
  int v42;
  int v43;
  void (*v44)(id *, void *);
  void *v45;
  id v46;
  id v47;
  id from;
  uint8_t buf[7];
  os_log_type_t v50;
  id location[2];
  BackupRestoreProgressController *v52;

  v52 = self;
  location[1] = (id)a2;
  v2 = -[BackupRestoreProgressController hasAssertions](self, "hasAssertions");
  if (v2)
  {
    v15 = -[BackupRestoreProgressController backupDeviceController](v52, "backupDeviceController");
    -[BFFBackupDeviceController setDelegate:](v15, "setDelegate:", v52);

    v16 = -[BackupRestoreProgressController backupDeviceController](v52, "backupDeviceController");
    v17 = -[BFFBackupDeviceController isBackingUp](v16, "isBackingUp");
    v33 = 0;
    v18 = 1;
    if ((v17 & 1) == 0)
    {
      v34 = -[BackupRestoreProgressController backupDeviceController](v52, "backupDeviceController");
      v33 = 1;
      v18 = objc_msgSend(v34, "backupStateUnknown");
    }
    v52->_backupThenRestore = v18 & 1;
    if ((v33 & 1) != 0)

    if (v52->_backupThenRestore)
    {
      v19 = -[BackupRestoreProgressController backupItem](v52, "backupItem");
      v20 = -[RestorableBackupItem snapshot](v19, "snapshot");
      v21 = (NSDate *)-[MBSnapshot date](v20, "date");
      lastSourceDeviceSnapshotDate = v52->_lastSourceDeviceSnapshotDate;
      v52->_lastSourceDeviceSnapshotDate = v21;

    }
    v23 = -[BackupRestoreProgressController passcodeCacheManager](v52, "passcodeCacheManager");
    -[BYPasscodeCacheManager persistPasscodeStash](v23, "persistPasscodeStash");

    objc_initWeak(&v32, v52);
    v24 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v26 = -1073741824;
    v27 = 0;
    v28 = sub_100054EC4;
    v29 = &unk_100280D78;
    v30 = v52;
    objc_copyWeak(&v31, &v32);
    dispatch_async(v24, &block);

    objc_destroyWeak(&v31);
    objc_storeStrong((id *)&v30, 0);
    objc_destroyWeak(&v32);
  }
  else
  {
    location[0] = (id)_BYLoggingFacility(v2);
    v50 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = location[0];
      v4 = v50;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "attempted restore without assertions bailing early...", buf, 2u);
    }
    objc_storeStrong(location, 0);
    objc_initWeak(&from, v52);
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("BACKUP_FAILED_ALERT_TITLE"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v47 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, &stru_100284738, 1);

    v7 = v47;
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("CHOOSE_A_DIFFERENT_BACKUP"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v41 = _NSConcreteStackBlock;
    v42 = -1073741824;
    v43 = 0;
    v44 = sub_100054DF4;
    v45 = &unk_100280DF0;
    objc_copyWeak(&v46, &from);
    v10 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 0, &v41);
    objc_msgSend(v7, "addAction:", v10);

    v11 = v47;
    v12 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v13 = -[NSBundle localizedStringForKey:value:table:](v12, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN_ALERT"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v35 = _NSConcreteStackBlock;
    v36 = -1073741824;
    v37 = 0;
    v38 = sub_100054E58;
    v39 = &unk_100280DF0;
    objc_copyWeak(&v40, &from);
    v14 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, &v35);
    objc_msgSend(v11, "addAction:", v14);

    -[BackupRestoreProgressController _presentAlert:](v52, "_presentAlert:", v47);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&v46);
    objc_storeStrong(&v47, 0);
    objc_destroyWeak(&from);
  }
}

- (void)restoreFailedWithError:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id v10;
  id from;
  id location[2];
  BackupRestoreProgressController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BackupRestoreProgressController setRestoreState:](v13, "setRestoreState:", 2);
  objc_initWeak(&from, v13);
  v3 = location[0];
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100055EEC;
  v8 = &unk_1002806B8;
  objc_copyWeak(&v9, &from);
  v10 = +[BuddyRestoreHelpers alertForBackupError:okButtonAction:](BuddyRestoreHelpers, "alertForBackupError:okButtonAction:", v3, &v4);
  -[BackupRestoreProgressController _presentAlert:](v13, "_presentAlert:", v10);
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)waitForBackupToComplete
{
  BFFBackupDeviceController *v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  char v12;
  NSString *v13;
  NSObject *v14;
  id v15;
  os_log_t v17;
  char v18;
  id v19;
  char v20;
  id v21;
  os_log_type_t v22;
  os_log_t v23;
  id obj;
  double i;
  os_log_type_t v26;
  os_log_t oslog;
  double v28;
  double v29;
  double v30;
  id location;
  id v32[2];
  BackupRestoreProgressController *v33;
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[24];

  v33 = self;
  v32[1] = (id)a2;
  v32[0] = 0;
  location = 0;
  v2 = -[BackupRestoreProgressController backupDeviceController](self, "backupDeviceController");
  -[BFFBackupDeviceController timeRemaining](v2, "timeRemaining");
  v4 = v3;

  v30 = v4;
  v29 = 0.0;
  if (v4 * 60.0 * 1.2 >= 900.0)
    v6 = 900.0;
  else
    v6 = v30 * 60.0 * 1.2;
  v29 = v6;
  v28 = 10.0;
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)buf, *(uint64_t *)&v29);
    _os_log_impl((void *)&_mh_execute_header, oslog, v26, "Polling backup to determine when the source devices finishes backing up for %f seconds...", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  for (i = 0.0; i < v29; i = i + v28)
  {
    obj = location;
    v7 = -[BackupRestoreProgressController latestSnapshotForSourceDevice:](v33, "latestSnapshotForSourceDevice:", &obj, i);
    objc_storeStrong(&location, obj);
    v8 = v32[0];
    v32[0] = v7;

    if (v32[0])
      break;
    if (location)
    {
      v23 = (os_log_t)(id)_BYLoggingFacility(v9);
      v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v23;
        v11 = v22;
        v12 = _BYIsInternalInstall();
        v20 = 0;
        v18 = 0;
        if ((v12 & 1) != 0)
        {
          v13 = (NSString *)location;
        }
        else if (location)
        {
          v21 = objc_msgSend(location, "domain");
          v20 = 1;
          v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v21, objc_msgSend(location, "code"));
          v19 = v13;
          v18 = 1;
        }
        else
        {
          v13 = 0;
        }
        sub_100039500((uint64_t)v35, (uint64_t)v13);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to determine latest backup: %{public}@", v35, 0xCu);
        if ((v18 & 1) != 0)

        if ((v20 & 1) != 0)
      }
      objc_storeStrong((id *)&v23, 0);
    }
    v17 = (os_log_t)(id)_BYLoggingFacility(v9);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v17;
      sub_1000342B4((uint64_t)v34, *(uint64_t *)&v28);
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No latest backup found; sleeping for %f seconds...",
        v34,
        0xCu);
    }
    objc_storeStrong((id *)&v17, 0);
    sleep(v28);
  }
  v15 = v32[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v32, 0);
  return v15;
}

- (id)_createRestoreOptions
{
  BuddyPendingRestoreState *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  id location[2];
  BackupRestoreProgressController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)MBStartRestoreOptions);
  v2 = -[BackupRestoreProgressController pendingRestoreState](v8, "pendingRestoreState");
  v3 = -[BuddyPendingRestoreState allowCellularNetwork](v2, "allowCellularNetwork");

  if ((v3 & 1) != 0)
  {
    v4 = +[MBCellularAccess inexpensiveCellularAccess](MBCellularAccess, "inexpensiveCellularAccess");
    objc_msgSend(location[0], "setCellularAccess:", v4);

  }
  v5 = location[0];
  objc_storeStrong(location, 0);
  return v5;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)controllerWasPopped
{
  if ((id)-[BackupRestoreProgressController restoreState](self, "restoreState", a2) == (id)1)
  {
    -[BackupRestoreProgressController setRestoreState:](self, "setRestoreState:", 3);
    -[MBManager cancel](self->_backupManager, "cancel");
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id location[2];
  BackupRestoreProgressController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BackupRestoreProgressController takeAssertions](v4, "takeAssertions");
  -[BackupRestoreProgressController _attemptRestore](v4, "_attemptRestore");
  if (location[0])
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  objc_storeStrong(location, 0);
}

- (void)backupDeviceController:(id)a3 backupCompletedWithError:(id)a4
{
  __CFString *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  NSString *v13;
  ProximitySetupController *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  char v27;
  NSString *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  void *v32;
  void **v33;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  BackupRestoreProgressController *v38;
  id v39;
  uint8_t v40[7];
  os_log_type_t v41;
  os_log_t v42;
  char v43;
  id v44;
  char v45;
  id v46;
  os_log_type_t v47;
  os_log_t v48;
  id obj;
  int v50;
  id v51;
  id v52;
  uint8_t v53[7];
  os_log_type_t v54;
  os_log_t v55;
  uint8_t v56[15];
  os_log_type_t v57;
  os_log_t oslog;
  void **block;
  int v60;
  int v61;
  id (*v62)(uint64_t);
  void *v63;
  BackupRestoreProgressController *v64;
  char v65;
  NSString *v66;
  char v67;
  id v68;
  os_log_type_t v69;
  id v70;
  uint8_t v71[15];
  char v72;
  id v73;
  id v74;
  uint8_t buf[7];
  os_log_type_t v76;
  id v77;
  id v78;
  id location[2];
  BackupRestoreProgressController *v80;
  uint8_t v81[16];
  uint8_t v82[24];

  v80 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v78 = 0;
  objc_storeStrong(&v78, a4);
  if (v78)
  {
    v5 = (__CFString *)objc_msgSend(v78, "domain");
    v6 = 0;
    if (v5 == CFSTR("BFFBackupDeviceErrorDomain"))
      v6 = objc_msgSend(v78, "code") == (id)-1;

    if (v6)
    {
      v77 = (id)_BYLoggingFacility(v7);
      v76 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v77;
        v9 = v76;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Source device disconnected while waiting for backup to complete", buf, 2u);
      }
      objc_storeStrong(&v77, 0);
      v74 = -[BackupRestoreProgressController waitForBackupToComplete](v80, "waitForBackupToComplete");
      v10 = -[BackupRestoreProgressController _traceAnalyticsForGuideUserToBackup:foundBackup:polledForBackup:](v80, "_traceAnalyticsForGuideUserToBackup:foundBackup:polledForBackup:", 0, v74 != 0, 1);
      if (v74)
      {
        -[BackupRestoreProgressController renewCredentialsThenStartRestore:](v80, "renewCredentialsThenStartRestore:", v74);
      }
      else
      {
        v73 = (id)_BYLoggingFacility(v10);
        v72 = 16;
        if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
        {
          v11 = v73;
          v12 = v72;
          sub_100038C3C(v71);
          _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "No latest backup found; giving up!", v71, 2u);
        }
        objc_storeStrong(&v73, 0);
        -[BackupRestoreProgressController handleBackupFailed:](v80, "handleBackupFailed:", v78);
      }
      objc_storeStrong(&v74, 0);
    }
    else
    {
      v70 = (id)_BYLoggingFacility(v7);
      v69 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
      {
        v67 = 0;
        v65 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v13 = (NSString *)v78;
        }
        else if (v78)
        {
          v68 = objc_msgSend(v78, "domain");
          v67 = 1;
          v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v68, objc_msgSend(v78, "code"));
          v66 = v13;
          v65 = 1;
        }
        else
        {
          v13 = 0;
        }
        sub_100039500((uint64_t)v82, (uint64_t)v13);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v70, v69, "Backup failed with error: %{public}@", v82, 0xCu);
        if ((v65 & 1) != 0)

        if ((v67 & 1) != 0)
      }
      objc_storeStrong(&v70, 0);
      -[BackupRestoreProgressController _traceAnalyticsForGuideUserToBackup:foundBackup:polledForBackup:](v80, "_traceAnalyticsForGuideUserToBackup:foundBackup:polledForBackup:", v78, 0, 0);
      -[BackupRestoreProgressController handleBackupFailed:](v80, "handleBackupFailed:", v78);
    }
  }
  else
  {
    v14 = -[BackupRestoreProgressController proximitySetupController](v80, "proximitySetupController");
    -[ProximitySetupController setupFinished](v14, "setupFinished");

    v80->_backupPercentComplete = 1.0;
    v15 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v60 = -1073741824;
    v61 = 0;
    v62 = sub_100056CF8;
    v63 = &unk_100280730;
    v64 = v80;
    dispatch_async((dispatch_queue_t)v15, &block);

    oslog = (os_log_t)(id)_BYLoggingFacility(v16);
    v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = oslog;
      v18 = v57;
      sub_100038C3C(v56);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Waiting 30 seconds for iCloud servers to ingest the new backup...", v56, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v19 = sleep(0x1Eu);
    v55 = (os_log_t)(id)_BYLoggingFacility(v19);
    v54 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v55;
      v21 = v54;
      sub_100038C3C(v53);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Searching for latest snapshot for source device...", v53, 2u);
    }
    objc_storeStrong((id *)&v55, 0);
    v52 = 0;
    v51 = 0;
    v50 = 0;
    do
    {
      obj = v52;
      v22 = -[BackupRestoreProgressController latestSnapshotForSourceDevice:](v80, "latestSnapshotForSourceDevice:", &obj);
      objc_storeStrong(&v52, obj);
      v23 = v51;
      v51 = v22;

      if (v51)
        break;
      v48 = (os_log_t)(id)_BYLoggingFacility(v24);
      v47 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v48;
        v26 = v47;
        v27 = _BYIsInternalInstall();
        v45 = 0;
        v43 = 0;
        if ((v27 & 1) != 0)
        {
          v28 = (NSString *)v52;
        }
        else if (v52)
        {
          v46 = objc_msgSend(v52, "domain");
          v45 = 1;
          v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v46, objc_msgSend(v52, "code"));
          v44 = v28;
          v43 = 1;
        }
        else
        {
          v28 = 0;
        }
        sub_100039500((uint64_t)v81, (uint64_t)v28);
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Unable to retrieve latest backup: %{public}@", v81, 0xCu);
        if ((v43 & 1) != 0)

        if ((v45 & 1) != 0)
      }
      objc_storeStrong((id *)&v48, 0);
      v42 = (os_log_t)(id)_BYLoggingFacility(v29);
      v41 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v42;
        v31 = v41;
        sub_100038C3C(v40);
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Attempting to retry to get latest backup due to error...", v40, 2u);
      }
      objc_storeStrong((id *)&v42, 0);
      ++v50;
      sleep(5u);
    }
    while (v50 < 3);
    -[BackupRestoreProgressController _traceAnalyticsForGuideUserToBackup:foundBackup:polledForBackup:](v80, "_traceAnalyticsForGuideUserToBackup:foundBackup:polledForBackup:", 0, v51 != 0, 0);
    if (v51)
    {
      -[BackupRestoreProgressController renewCredentialsThenStartRestore:](v80, "renewCredentialsThenStartRestore:", v51);
    }
    else
    {
      v32 = &_dispatch_main_q;
      v33 = _NSConcreteStackBlock;
      v34 = -1073741824;
      v35 = 0;
      v36 = sub_100056D20;
      v37 = &unk_100280D00;
      v38 = v80;
      v39 = v52;
      dispatch_async((dispatch_queue_t)v32, &v33);

      objc_storeStrong(&v39, 0);
      objc_storeStrong((id *)&v38, 0);
    }
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong((id *)&v64, 0);
  }
  objc_storeStrong(&v78, 0);
  objc_storeStrong(location, 0);
}

- (void)backupProgress:(double)a3 estimatedTimeRemaining:(unint64_t)a4
{
  void *v4;
  void **block;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10[3];
  void *v11;
  double v12;
  SEL v13;
  BackupRestoreProgressController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = (void *)a4;
  v4 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100056F34;
  v9 = &unk_100280E40;
  v10[1] = v11;
  v10[0] = v14;
  v10[2] = *(id *)&v12;
  dispatch_async((dispatch_queue_t)v4, &block);

  objc_storeStrong(v10, 0);
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  void *v7;
  void **v8;
  int v9;
  int v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13[2];
  float v14;
  void *v15;
  float v16;
  id location[2];
  BackupRestoreProgressController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = (void *)a5;
  v7 = &_dispatch_main_q;
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_100057098;
  v12 = &unk_100280E68;
  v13[1] = v15;
  v13[0] = v18;
  v14 = a4;
  dispatch_async((dispatch_queue_t)v7, &v8);

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
}

- (void)managerDidFinishRestore:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void **v14;
  int v15;
  int v16;
  void (*v17)(id *);
  void *v18;
  BackupRestoreProgressController *v19;
  id v20;
  uint8_t v21[15];
  char v22;
  os_log_t v23;
  int v24;
  uint8_t v25[7];
  os_log_type_t v26;
  os_log_t oslog;
  uint8_t buf[15];
  os_log_type_t v29;
  id v30;
  id location[2];
  BackupRestoreProgressController *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = (id)_BYLoggingFacility(v3);
  v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v30;
    v5 = v29;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Successfully finished restore", buf, 2u);
  }
  objc_storeStrong(&v30, 0);
  -[BackupRestoreProgressController setRestoreState:](v32, "setRestoreState:", 4);
  v6 = (void (**)(_QWORD))-[BackupRestoreProgressController prepareForCloudRestoreRebootBlock](v32, "prepareForCloudRestoreRebootBlock");
  v6[2](v6);

  oslog = (os_log_t)(id)_BYLoggingFacility(v7);
  v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = oslog;
    v9 = v26;
    sub_100038C3C(v25);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Promoting device lock assertion...", v25, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v10 = MKBDeviceLockAssertionPromote(-[BackupRestoreProgressController deviceLockAssertion](v32, "deviceLockAssertion"));
  v24 = v10;
  if ((_DWORD)v10)
  {
    v23 = (os_log_t)(id)_BYLoggingFacility(v10);
    v22 = 16;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v11 = v23;
      v12 = v22;
      sub_100038C3C(v21);
      _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "Failed to promote device lock assertion", v21, 2u);
    }
    objc_storeStrong((id *)&v23, 0);
  }
  v13 = &_dispatch_main_q;
  v14 = _NSConcreteStackBlock;
  v15 = -1073741824;
  v16 = 0;
  v17 = sub_100057388;
  v18 = &unk_100280D00;
  v19 = v32;
  v20 = location[0];
  dispatch_async((dispatch_queue_t)v13, &v14);

  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v5;
  NSString *v6;
  id v7;
  BOOL backupThenRestore;
  NSObject *v9;
  void **block;
  int v11;
  int v12;
  void (*v13)(id *);
  void *v14;
  BackupRestoreProgressController *v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  os_log_type_t v21;
  os_log_t oslog;
  id v23;
  id location[2];
  BackupRestoreProgressController *v25;
  uint8_t buf[24];

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v5 = -[BackupRestoreProgressController restoreState](v25, "restoreState");
  if (v5 != (id)3)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v19 = 0;
      v17 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v6 = (NSString *)v23;
      }
      else if (v23)
      {
        v20 = objc_msgSend(v23, "domain");
        v19 = 1;
        v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v20, objc_msgSend(v23, "code"));
        v18 = v6;
        v17 = 1;
      }
      else
      {
        v6 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v6);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v21, "Restore failed: %{public}@", buf, 0xCu);
      if ((v17 & 1) != 0)

      if ((v19 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    v7 = objc_msgSend(v23, "domain");
    backupThenRestore = 0;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MBErrorDomain")) & 1) != 0)
    {
      if (objc_msgSend(v23, "code") == (id)204 || (backupThenRestore = 0, objc_msgSend(v23, "code") == (id)205))
        backupThenRestore = v25->_backupThenRestore;
    }

    if (backupThenRestore)
    {
      v9 = dispatch_get_global_queue(0, 0);
      block = _NSConcreteStackBlock;
      v11 = -1073741824;
      v12 = 0;
      v13 = sub_100057A8C;
      v14 = &unk_100280D00;
      v15 = v25;
      v16 = v23;
      dispatch_async(v9, &block);

      objc_storeStrong(&v16, 0);
      objc_storeStrong((id *)&v15, 0);
    }
    else if (objc_msgSend(v23, "code") != (id)202)
    {
      -[BackupRestoreProgressController restoreFailedWithError:](v25, "restoreFailedWithError:", v23);
    }
  }
  -[BackupRestoreProgressController releaseAssertions](v25, "releaseAssertions");
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _WORD v8[3];
  char v9;
  os_log_t v10;
  uint8_t buf[15];
  char v12;
  os_log_t oslog;
  id location[2];
  BackupRestoreProgressController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BackupRestoreProgressController restoreState](v15, "restoreState");
  if (v3 == (id)1)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(1);
    v12 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v4 = oslog;
      v5 = v12;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "Lost connection to backup while restoring!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[BackupRestoreProgressController manager:didFailRestoreWithError:](v15, "manager:didFailRestoreWithError:", location[0], 0);
  }
  else
  {
    v10 = (os_log_t)(id)_BYLoggingFacility(v3);
    v9 = 16;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v6 = v10;
      v7 = v9;
      sub_100038C3C(v8);
      _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "Lost connection to backup!", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BFFBackupDeviceController)backupDeviceController
{
  return self->_backupDeviceController;
}

- (void)setBackupDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_backupDeviceController, a3);
}

- (id)prepareForCloudRestoreRebootBlock
{
  return self->_prepareForCloudRestoreRebootBlock;
}

- (void)setPrepareForCloudRestoreRebootBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (LockdownModeProvider)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, a3);
}

- (MBManager)backupManager
{
  return self->_backupManager;
}

- (void)setBackupManager:(id)a3
{
  objc_storeStrong((id *)&self->_backupManager, a3);
}

- (int64_t)restoreState
{
  return self->_restoreState;
}

- (void)setRestoreState:(int64_t)a3
{
  self->_restoreState = a3;
}

- (double)backupPercentComplete
{
  return self->_backupPercentComplete;
}

- (void)setBackupPercentComplete:(double)a3
{
  self->_backupPercentComplete = a3;
}

- (double)restorePercentComplete
{
  return self->_restorePercentComplete;
}

- (void)setRestorePercentComplete:(double)a3
{
  self->_restorePercentComplete = a3;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertion, a3);
}

- (__MKBAssertion)deviceLockAssertion
{
  return self->_deviceLockAssertion;
}

- (void)setDeviceLockAssertion:(__MKBAssertion *)a3
{
  self->_deviceLockAssertion = a3;
}

- (UIAlertController)alert
{
  return self->_alert;
}

- (BuddyDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
  objc_storeStrong((id *)&self->_lockdownModeProvider, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong(&self->_prepareForCloudRestoreRebootBlock, 0);
  objc_storeStrong((id *)&self->_backupDeviceController, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
  objc_storeStrong((id *)&self->_backupItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSourceDeviceSnapshotDate, 0);
}

@end
