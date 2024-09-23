@implementation BuddyTransferDataFlow

- (BuddyTransferDataFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddyTransferDataFlow *v10;
  objc_super v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  id v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v9 = v17;
  v17 = 0;
  v12.receiver = v9;
  v12.super_class = (Class)BuddyTransferDataFlow;
  v17 = -[BuddyTransferDataFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v12, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v15, v14, v13);
  v10 = (BuddyTransferDataFlow *)v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (id)classList
{
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  _WORD v6[7];
  char v7;
  os_log_t oslog;
  objc_super v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyTransferDataFlow;
  location[0] = -[BuddyTransferDataFlow classList](&v9, "classList");
  if (!objc_msgSend(location[0], "count"))
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(0);
    v7 = 17;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      v2 = oslog;
      v3 = v7;
      sub_100038C3C(v6);
      _os_log_fault_impl((void *)&_mh_execute_header, v2, v3, "BuddyTransferDataFlow failed to set initial classList", (uint8_t *)v6, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)firstItem
{
  ProximitySetupController *v2;
  id v3;
  _BYTE *v4;
  id v5;
  unint64_t v6;
  double v7;
  NSBundle *v8;
  NSString *v9;
  NSString *v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  int v24;
  objc_super v25;
  id v26[2];
  BuddyTransferDataFlow *v27;
  id v28;

  v27 = self;
  v26[1] = (id)a2;
  v25.receiver = self;
  v25.super_class = (Class)BuddyTransferDataFlow;
  v26[0] = -[BuddyTransferDataFlow firstItem](&v25, "firstItem");
  if ((objc_msgSend(v26[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyTransferDataProtocol) & 1) != 0)
  {
    v23 = v26[0];
    v2 = -[BuddyTransferDataFlow proximitySetupController](v27, "proximitySetupController");
    v22 = -[ProximitySetupController information](v2, "information");

    v3 = objc_msgSend(v22, "storageCapacity");
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
    v5 = objc_msgSend(v22, "storageAvailable");
    v6 = v4 - (_BYTE *)objc_msgSend(v5, "unsignedLongLongValue");

    v21 = v6;
    v20 = 0x4181111111111111;
    v19 = (double)v6 / 35791394.1;
    if (floor(v19 / 300.0) <= 1.0)
      v7 = 1.0;
    else
      v7 = floor(v19 / 300.0);
    v19 = v7 * 5.0;
    v18 = 10.0;
    if (v7 * 5.0 >= 60.0 - 10.0)
    {
      if (floor(v19 / 15.0) <= 4.0)
        v11 = 4.0;
      else
        v11 = floor(v19 / 15.0);
      v19 = v11 * 15.0;
      location[0] = objc_alloc_init((Class)NSDateComponentsFormatter);
      objc_msgSend(location[0], "setUnitsStyle:", 1);
      objc_msgSend(location[0], "setMaximumUnitCount:", 2);
      objc_msgSend(location[0], "setAllowedUnits:", 96);
      objc_msgSend(location[0], "setIncludesApproximationPhrase:", 1);
      v12 = objc_msgSend(location[0], "stringFromTimeInterval:", v19 * 60.0);
      objc_msgSend(v23, "setEstimatedMigrationDuration:", v12);

      objc_storeStrong(location, 0);
    }
    else
    {
      v17 = 0.0;
      if (v19 > 20.0)
        v17 = v18;
      else
        v17 = 5.0;
      *(double *)&location[1] = v19 + v17;
      v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("TRANSFER_TIME_ESTIMATE_RANGE"), &stru_100284738, CFSTR("Localizable"));
      v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, *(_QWORD *)&v19, v19 + v17);
      objc_msgSend(v23, "setEstimatedMigrationDuration:", v10);

    }
    v13 = objc_msgSend(v22, "hasMegaBackup");
    objc_msgSend(v23, "setHasMegaBackup:", v13 != 0);

    v14 = objc_msgSend(v22, "deviceClass");
    objc_msgSend(v23, "setSourceDeviceClass:", v14);

    v28 = v26[0];
    v24 = 1;
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    v28 = v26[0];
    v24 = 1;
  }
  objc_storeStrong(v26, 0);
  return v28;
}

+ (id)allowedFlowItems
{
  _QWORD v3[2];

  v3[0] = objc_opt_class(BuddyTransferDataController);
  v3[1] = objc_opt_class(BuddyTransferOptionsController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  char v4;
  ProximitySetupController *v5;
  SASProximityInformation *v6;
  ProximitySetupController *v7;
  NSString *v8;
  ProximitySetupController *v9;
  NSString *v10;
  char v11;
  BuddyMiscState *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  ProximitySetupController *v16;
  SASProximityInformation *v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  ProximitySetupController *v21;
  SASProximityInformation *v22;
  unsigned __int8 v23;
  ProximitySetupController *v24;
  SASProximityInformation *v25;
  id v26;
  NSArray *v27;
  ProximitySetupController *v28;
  id v29;
  BOOL v30;
  BYSoftwareUpdateCache *v31;
  void **v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, void *, void *, void *);
  void *v36;
  id v37;
  BuddyTransferDataFlow *v38;
  id v39;
  BOOL v40;
  char v41;
  id v42;
  BOOL v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  BOOL v49;
  int v50;
  void **block;
  int v52;
  int v53;
  void (*v54)(uint64_t);
  void *v55;
  BuddyTransferDataFlow *v56;
  BOOL v57;
  uint8_t buf[7];
  os_log_type_t v59;
  id v60;
  id v61;
  BOOL v62;
  id location[2];
  BuddyTransferDataFlow *v64;
  uint64_t v65;
  uint64_t v66;

  v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
  v4 = !-[ProximitySetupController hasConnection](v3, "hasConnection");

  v62 = (v4 & 1) == 0;
  if (+[BuddyMigrationCapability currentDeviceShouldOfferMigration](BuddyMigrationCapability, "currentDeviceShouldOfferMigration"))
  {
    v5 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
    v6 = -[ProximitySetupController information](v5, "information");
    v7 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
    v8 = -[ProximitySetupController productVersion](v7, "productVersion");
    v9 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
    v10 = -[ProximitySetupController deviceClass](v9, "deviceClass");
    v11 = !+[BuddyMigrationCapability sourceDeviceSupportsMigration:productVersion:deviceClass:softwareUpdateRequired:reason:](BuddyMigrationCapability, "sourceDeviceSupportsMigration:productVersion:deviceClass:softwareUpdateRequired:reason:", v6, v8, v10, 0, 0);

    if ((v11 & 1) != 0)
      v62 = 0;
  }
  else
  {
    v62 = 0;
  }
  v12 = -[BuddyTransferDataFlow miscState](v64, "miscState");
  v61 = -[BuddyMiscState migrationManager](v12, "migrationManager");

  if (!v62)
    objc_msgSend(v61, "cancelWithCause:", 5);
  v13 = objc_msgSend(v61, "hasVersionIncompatibility");
  if ((v13 & 1) != 0)
  {
    v60 = (id)_BYLoggingFacility(v13);
    v59 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v60;
      v15 = v59;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Source/target product versions are incompatible; migration requires update",
        buf,
        2u);
    }
    objc_storeStrong(&v60, 0);
    objc_msgSend(v61, "setRequiresUpdateToMigrate:", 1);
    objc_msgSend(v61, "setWillMigrate:", 1);
  }
  v16 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
  v17 = -[ProximitySetupController information](v16, "information");
  v18 = -[SASProximityInformation appleID](v17, "appleID");
  v19 = v18 != 0;

  v57 = v19;
  if (!v62 && !v57)
  {
    v20 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v52 = -1073741824;
    v53 = 0;
    v54 = sub_1001007E0;
    v55 = &unk_100280730;
    v56 = v64;
    dispatch_async(v20, &block);

    objc_storeStrong((id *)&v56, 0);
  }
  if ((objc_msgSend(v61, "userChoseMigration") & 1) != 0)
    v62 = 0;
  if (v62)
  {
    v49 = 0;
    v21 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
    v22 = -[ProximitySetupController information](v21, "information");
    v23 = -[SASProximityInformation isBackupEnabled](v22, "isBackupEnabled");

    if ((v23 & 1) != 0)
    {
      v24 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
      v25 = -[ProximitySetupController information](v24, "information");
      v48 = -[SASProximityInformation dateOfLastBackup](v25, "dateOfLastBackup");

      v47 = +[NSCalendar currentCalendar](NSCalendar, "currentCalendar");
      v46 = objc_alloc_init((Class)NSDateComponents);
      v45 = +[NSDate date](NSDate, "date");
      objc_msgSend(v46, "setMonth:", -1);
      v26 = objc_msgSend(v47, "dateByAddingComponents:toDate:options:", v46, v45, 0);
      v49 = objc_msgSend(v48, "compare:", v26) == (id)1;

      objc_storeStrong(&v45, 0);
      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v47, 0);
      objc_storeStrong(&v48, 0);
    }
    if (v49)
    {
      v66 = objc_opt_class(BuddyTransferOptionsController);
      v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1);
    }
    else
    {
      v65 = objc_opt_class(BuddyTransferDataController);
      v27 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1);
    }
    -[BuddyTransferDataFlow setClassList:](v64, "setClassList:", v27);

    if ((objc_msgSend(v61, "requiresUpdateToMigrate") & 1) != 0)
    {
      v28 = -[BuddyTransferDataFlow proximitySetupController](v64, "proximitySetupController");
      v44 = -[ProximitySetupController backupMetadata](v28, "backupMetadata");

      v43 = 0;
      v29 = objc_msgSend(v44, "seedEnrollmentProgram");
      v41 = 0;
      v30 = 0;
      if (v29)
      {
        v42 = objc_msgSend(v44, "seedEnrollmentAssetAudience");
        v41 = 1;
        v30 = v42 != 0;
      }
      if ((v41 & 1) != 0)

      v43 = v30;
      v31 = -[BuddyTransferDataFlow softwareUpdateCache](v64, "softwareUpdateCache");
      v32 = _NSConcreteStackBlock;
      v33 = -1073741824;
      v34 = 0;
      v35 = sub_10010082C;
      v36 = &unk_100282F10;
      v40 = v30;
      v37 = v61;
      v38 = v64;
      v39 = location[0];
      -[BYSoftwareUpdateCache scanUsingCache:withCompletion:](v31, "scanUsingCache:withCompletion:", 1, &v32);

      objc_storeStrong(&v39, 0);
      objc_storeStrong((id *)&v38, 0);
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v44, 0);
    }
    else if (location[0])
    {
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    }
    v50 = 0;
  }
  else
  {
    (*((void (**)(id, BOOL))location[0] + 2))(location[0], v62);
    v50 = 1;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupDeviceToDeviceMigration;
}

+ (void)skippedByCloudConfigWithEnvironment:(id)a3
{
  id v3;
  id v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "miscState");
  v4 = objc_msgSend(v3, "migrationManager");
  objc_msgSend(v4, "cancelWithCause:", 7);

  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateCache, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
}

@end
