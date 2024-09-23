@implementation BuddyRestoreUpdateController

- (BuddyRestoreUpdateController)init
{
  BuddyRestoreUpdateController *v2;
  BuddyRestoreUpdateController *v3;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyRestoreUpdateController;
  v2 = -[BuddySoftwareUpdateController init](&v5, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
    objc_msgSend(location, "setSoftwareUpdateDelegate:", location);
  v3 = (BuddyRestoreUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyRestoreUpdateController *v9;
  id location;
  objc_super v11;
  BOOL v12;
  SEL v13;
  BuddyRestoreUpdateController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyRestoreUpdateController;
  -[BuddySoftwareUpdateController viewDidAppear:](&v11, "viewDidAppear:", a3);
  if (!-[BuddyRestoreUpdateController ableToRestoreWithUpdate](v14, "ableToRestoreWithUpdate"))
  {
    v4 = _NSConcreteStackBlock;
    v5 = -1073741824;
    v6 = 0;
    v7 = sub_1000B71B4;
    v8 = &unk_100280730;
    v9 = v14;
    location = +[BuddyRestoreHelpers alertForBackupError:okButtonAction:](BuddyRestoreHelpers, "alertForBackupError:okButtonAction:", 0, &v4);
    v3 = -[BuddyRestoreUpdateController navigationController](v14, "navigationController");
    objc_msgSend(v3, "presentViewController:animated:completion:", location, 1, 0);

    objc_storeStrong(&location, 0);
    objc_storeStrong((id *)&v9, 0);
  }
}

- (void)_prepareForSoftwareUpdateToBuild:(id)a3 completion:(id)a4
{
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  BFFBackupDeviceController *v8;
  unsigned __int8 v9;
  BuddyRestoreState *v10;
  id v11;
  RestorableBackupItem *v12;
  MBBackup *v13;
  RestorableBackupItem *v14;
  MBSnapshot *v15;
  BuddyPendingRestoreState *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  id v21;
  BYPreferencesController *v22;
  BYPreferencesController *v23;
  BYChronicle *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t i;
  BFFSettingsManager *v30;
  id v31;
  id v32;
  BFFSettingsManager *v33;
  uint64_t v34;
  BYPreferencesController *v35;
  id v36;
  BOOL v37;
  UIAlertAction *v38;
  id v39;
  int v40;
  id v41;
  id v42;
  _QWORD __b[8];
  uint64_t v44;
  id v45;
  id v46;
  os_log_type_t v47;
  os_log_t oslog;
  uint8_t v49[15];
  os_log_type_t v50;
  id v51;
  id v52;
  char v53;
  BFFBackupDeviceController *v54;
  char v55;
  BFFBackupDeviceController *v56;
  char v57;
  os_log_type_t v58;
  id v59;
  id v60;
  id location[2];
  BuddyRestoreUpdateController *v62;
  uint8_t v63[128];
  uint8_t v64[16];
  uint8_t buf[24];

  v62 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v60 = 0;
  objc_storeStrong(&v60, a4);
  v59 = (id)_BYLoggingFacility(v5);
  v58 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v59, v58, "Preparing to install update to build %@...", buf, 0xCu);
  }
  objc_storeStrong(&v59, 0);
  v6 = -[BuddyRestoreUpdateController willPerformSoftwareUpdateBlock](v62, "willPerformSoftwareUpdateBlock");

  if (v6)
  {
    v7 = (void (**)(_QWORD))-[BuddyRestoreUpdateController willPerformSoftwareUpdateBlock](v62, "willPerformSoftwareUpdateBlock");
    v7[2](v7);

  }
  v57 = 0;
  v8 = -[BuddyRestoreUpdateController backupDeviceController](v62, "backupDeviceController");
  v55 = 0;
  v53 = 0;
  v9 = 1;
  if (!-[BFFBackupDeviceController isBackingUp](v8, "isBackingUp"))
  {
    v56 = -[BuddyRestoreUpdateController backupDeviceController](v62, "backupDeviceController");
    v55 = 1;
    v9 = 1;
    if (!-[BFFBackupDeviceController backupStateUnknown](v56, "backupStateUnknown"))
    {
      v54 = -[BuddyRestoreUpdateController backupDeviceController](v62, "backupDeviceController");
      v53 = 1;
      v9 = -[BFFBackupDeviceController backupFinished](v54, "backupFinished");
    }
  }
  if ((v53 & 1) != 0)

  if ((v55 & 1) != 0)
  v57 = v9 & 1;
  v10 = [BuddyRestoreState alloc];
  v11 = location[0];
  v12 = -[BuddyRestoreUpdateController backupItem](v62, "backupItem");
  v13 = -[RestorableBackupItem backup](v12, "backup");
  v14 = -[BuddyRestoreUpdateController backupItem](v62, "backupItem");
  v15 = -[RestorableBackupItem snapshot](v14, "snapshot");
  v16 = -[BuddyRestoreUpdateController pendingRestoreState](v62, "pendingRestoreState");
  v52 = -[BuddyRestoreState initWithProductBuild:backup:snapshot:useLatestSnapshot:allowCellularNetwork:](v10, "initWithProductBuild:backup:snapshot:useLatestSnapshot:allowCellularNetwork:", v11, v13, v15, v57 & 1, -[BuddyPendingRestoreState allowCellularNetwork](v16, "allowCellularNetwork"));

  v51 = (id)_BYLoggingFacility(v17);
  v50 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v51;
    v19 = v50;
    sub_100038C3C(v49);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Persisting restore state to disk...", v49, 2u);
  }
  objc_storeStrong(&v51, 0);
  oslog = (os_log_t)(id)_BYLoggingFacility(v20);
  v47 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)v64, (uint64_t)v52);
    _os_log_impl((void *)&_mh_execute_header, oslog, v47, "%@", v64, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v21 = v52;
  v22 = -[BuddyRestoreUpdateController buddyPreferences](v62, "buddyPreferences");
  objc_msgSend(v21, "persistUsingPreferences:", v22);

  v23 = -[BuddyRestoreUpdateController buddyPreferences](v62, "buddyPreferences");
  v24 = -[BuddyRestoreUpdateController chronicle](v62, "chronicle");
  v25 = -[BYChronicle dictionaryRepresentation](v24, "dictionaryRepresentation");
  -[BYPreferencesController setObject:forKey:](v23, "setObject:forKey:", v25, BYChronicleKey);

  +[BYPreferencesController persistEverything](BYPreferencesController, "persistEverything");
  v46 = -[BuddyRestoreUpdateController buddyPreferences](v62, "buddyPreferences");
  v45 = objc_msgSend(v46, "preferences");
  memset(__b, 0, sizeof(__b));
  v26 = objc_msgSend(v45, "allKeys");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v63, 16);
  if (v27)
  {
    v28 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v27; ++i)
      {
        if (*(_QWORD *)__b[2] != v28)
          objc_enumerationMutation(v26);
        v44 = *(_QWORD *)(__b[1] + 8 * i);
        v30 = -[BuddyRestoreUpdateController settingsManager](v62, "settingsManager");
        v31 = objc_msgSend(v45, "objectForKeyedSubscript:", v44);
        v32 = objc_msgSend(v46, "domain");
        -[BFFSettingsManager setObject:forDomain:key:](v30, "setObject:forDomain:key:", v31, v32, v44);

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", __b, v63, 16);
    }
    while (v27);
  }

  v33 = -[BuddyRestoreUpdateController settingsManager](v62, "settingsManager");
  -[BFFSettingsManager hideStashInSafeHavenAsProvisional:](v33, "hideStashInSafeHavenAsProvisional:", 1);

  if ((os_variant_has_internal_ui("com.apple.purplebuddy", v34) & 1) == 0)
    goto LABEL_30;
  v35 = -[BuddyRestoreUpdateController buddyPreferences](v62, "buddyPreferences");
  v42 = +[BuddyRestoreState loadFromPreferences:](BuddyRestoreState, "loadFromPreferences:", v35);

  v36 = objc_msgSend(v42, "backupUDID");
  v37 = 1;
  if (v36)
    v37 = objc_msgSend(v42, "snapshotID") == 0;

  if (v37)
  {
    v41 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Unable to Restore Post-Update"), CFSTR("File a Radar to Setup Assistant | iOS."), 1);
    v38 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    objc_msgSend(v41, "addAction:", v38);

    v39 = -[BuddyRestoreUpdateController navigationController](v62, "navigationController");
    objc_msgSend(v39, "presentViewController:animated:completion:", v41, 1, v60);

    v40 = 1;
    objc_storeStrong(&v41, 0);
  }
  else
  {
    v40 = 0;
  }
  objc_storeStrong(&v42, 0);
  if (!v40)
  {
LABEL_30:
    if (v60)
      (*((void (**)(void))v60 + 2))();
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyPendingRestoreState *v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  RestorableBackupItem *v8;
  char v9;
  RestorableBackupItem *v10;
  SUDescriptor *v11;
  id v12;
  unsigned __int8 v13;
  SUDescriptor *v14;
  id v15;
  unsigned __int8 v16;
  BuddyRestoreUpdateController *v17;
  void **v18;
  int v19;
  int v20;
  void (*v21)(NSObject *, void *);
  void *v22;
  BuddyRestoreUpdateController *v23;
  id v24;
  int v25;
  uint8_t buf[7];
  os_log_type_t v27;
  os_log_t oslog;
  char v29;
  id location[2];
  BuddyRestoreUpdateController *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyRestoreUpdateController pendingRestoreState](v31, "pendingRestoreState");
  v4 = -[BuddyPendingRestoreState forceSoftwareUpdateRestore](v3, "forceSoftwareUpdateRestore");

  v29 = v4 & 1;
  if ((v4 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v27;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Forcing software update for restore...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v8 = -[BuddyRestoreUpdateController backupItem](v31, "backupItem");
  v9 = 0;
  if (-[RestorableBackupItem isCompatible](v8, "isCompatible"))
    v9 = v29 ^ 1;

  if ((v9 & 1) != 0)
  {
    if (location[0])
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v25 = 1;
  }
  else
  {
    v10 = -[BuddyRestoreUpdateController backupItem](v31, "backupItem");
    v11 = -[BuddySoftwareUpdateController update](v31, "update");
    v12 = -[SUDescriptor productVersion](v11, "productVersion");
    v13 = -[RestorableBackupItem isCompatibleWithUpdateToSystemVersion:](v10, "isCompatibleWithUpdateToSystemVersion:", v12);
    -[BuddyRestoreUpdateController setAbleToRestoreWithUpdate:](v31, "setAbleToRestoreWithUpdate:", v13 & 1);

    if ((v29 & 1) != 0)
    {
      v14 = -[BuddySoftwareUpdateController update](v31, "update");
      -[BuddyRestoreUpdateController setAbleToRestoreWithUpdate:](v31, "setAbleToRestoreWithUpdate:", v14 != 0);

    }
    v15 = +[BYPreferencesController buddyPreferencesInternal](BYPreferencesController, "buddyPreferencesInternal");
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("FakeSoftwareUpdate"));

    if ((v16 & 1) != 0)
    {
      -[BuddyRestoreUpdateController _prepareForSoftwareUpdateToBuild:completion:](v31, "_prepareForSoftwareUpdateToBuild:completion:", CFSTR("1A1"), &stru_1002821D8);
      v25 = 1;
    }
    else if (-[BuddySoftwareUpdateController scannedForUpdate](v31, "scannedForUpdate")
           && -[BuddyRestoreUpdateController ableToRestoreWithUpdate](v31, "ableToRestoreWithUpdate"))
    {
      if (location[0])
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
      v25 = 1;
    }
    else
    {
      v17 = v31;
      v18 = _NSConcreteStackBlock;
      v19 = -1073741824;
      v20 = 0;
      v21 = sub_1000B7E5C;
      v22 = &unk_100282200;
      v23 = v31;
      v24 = location[0];
      -[BuddySoftwareUpdateController scanForUpdateCompletion:](v17, "scanForUpdateCompletion:", &v18);
      objc_storeStrong(&v24, 0);
      objc_storeStrong((id *)&v23, 0);
      v25 = 0;
    }
  }
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 prepareToInstallUpdate:(id)a4 completion:(id)a5
{
  BuddyRestoreUpdateController *v7;
  id v8;
  id v9;
  id v10;
  id location[2];
  BuddyRestoreUpdateController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v7 = v12;
  v8 = objc_msgSend(v10, "productBuildVersion");
  -[BuddyRestoreUpdateController _prepareForSoftwareUpdateToBuild:completion:](v7, "_prepareForSoftwareUpdateToBuild:completion:", v8, v9);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 didStartInstallForUpdate:(id)a4
{
  BYPreferencesController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BuddyRestoreUpdateController *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _WORD v13[3];
  char v14;
  os_log_t v15;
  uint8_t buf[7];
  os_log_type_t v17;
  os_log_t oslog;
  id v19;
  id location[2];
  BuddyRestoreUpdateController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v5 = -[BuddyRestoreUpdateController buddyPreferences](v21, "buddyPreferences");
  LOBYTE(a4) = !+[BuddyRestoreState hasStateFromPreferences:](BuddyRestoreState, "hasStateFromPreferences:", v5);

  if ((a4 & 1) != 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v17;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Software update for restore did begin!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v9 = v21;
    v10 = objc_msgSend(v19, "productBuildVersion");
    -[BuddyRestoreUpdateController _prepareForSoftwareUpdateToBuild:completion:](v9, "_prepareForSoftwareUpdateToBuild:completion:", v10, 0);

  }
  else
  {
    v15 = (os_log_t)(id)_BYLoggingFacility(v6);
    v14 = 16;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v11 = v15;
      v12 = v14;
      sub_100038C3C(v13);
      _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "Software update for restore did begin with restore state on disk!", (uint8_t *)v13, 2u);
    }
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 didFailToInstallUpdateWithError:(id)a4
{
  uint64_t v5;
  NSString *v6;
  BYPreferencesController *v7;
  char v8;
  NSString *v9;
  char v10;
  id v11;
  os_log_t oslog;
  id v13;
  id location[2];
  BuddyRestoreUpdateController *v15;
  uint8_t buf[24];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    v10 = 0;
    v8 = 0;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v6 = (NSString *)v13;
    }
    else if (v13)
    {
      v11 = objc_msgSend(v13, "domain");
      v10 = 1;
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v11, objc_msgSend(v13, "code"));
      v9 = v6;
      v8 = 1;
    }
    else
    {
      v6 = 0;
    }
    sub_100039500((uint64_t)buf, (uint64_t)v6);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Software update failed, cancelling iCloud Restore launch: %{public}@", buf, 0xCu);
    if ((v8 & 1) != 0)

    if ((v10 & 1) != 0)
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = -[BuddyRestoreUpdateController buddyPreferences](v15, "buddyPreferences");
  +[BuddyRestoreState removeFromPreferences:](BuddyRestoreState, "removeFromPreferences:", v7);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BYChronicle)chronicle
{
  return self->chronicle;
}

- (void)setChronicle:(id)a3
{
  objc_storeStrong((id *)&self->chronicle, a3);
}

- (BFFBackupDeviceController)backupDeviceController
{
  return self->backupDeviceController;
}

- (void)setBackupDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->backupDeviceController, a3);
}

- (BOOL)softwareUpdateDidOccur
{
  return self->softwareUpdateDidOccur;
}

- (void)setSoftwareUpdateDidOccur:(BOOL)a3
{
  self->softwareUpdateDidOccur = a3;
}

- (id)willPerformSoftwareUpdateBlock
{
  return self->willPerformSoftwareUpdateBlock;
}

- (void)setWillPerformSoftwareUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BFFSettingsManager)settingsManager
{
  return self->settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->settingsManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->buddyPreferences, a3);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->pendingRestoreState, a3);
}

- (RestorableBackupItem)backupItem
{
  return self->backupItem;
}

- (void)setBackupItem:(id)a3
{
  objc_storeStrong((id *)&self->backupItem, a3);
}

- (BOOL)ableToRestoreWithUpdate
{
  return self->_ableToRestoreWithUpdate;
}

- (void)setAbleToRestoreWithUpdate:(BOOL)a3
{
  self->_ableToRestoreWithUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->backupItem, 0);
  objc_storeStrong((id *)&self->pendingRestoreState, 0);
  objc_storeStrong((id *)&self->buddyPreferences, 0);
  objc_storeStrong((id *)&self->settingsManager, 0);
  objc_storeStrong(&self->willPerformSoftwareUpdateBlock, 0);
  objc_storeStrong((id *)&self->backupDeviceController, 0);
  objc_storeStrong((id *)&self->chronicle, 0);
}

@end
