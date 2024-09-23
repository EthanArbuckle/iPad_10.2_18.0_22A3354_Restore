@implementation BuddyFundamentalFlow

- (BuddyFundamentalFlow)initWithFlowProvider:(id)a3 featureFlags:(id)a4
{
  id v5;
  BuddyFundamentalFlow *v6;
  objc_super v8;
  id obj;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v11;
  v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyFundamentalFlow;
  v11 = -[BuddyFundamentalFlow init](&v8, "init");
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, obj);
    objc_storeWeak((id *)v11 + 3, location[0]);
  }
  v6 = (BuddyFundamentalFlow *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (id)_flowMapByClass
{
  objc_class *v2;
  NSString *v3;
  objc_class *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  objc_class *v8;
  NSString *v9;
  objc_class *v10;
  NSString *v11;
  objc_class *v12;
  NSString *v13;
  objc_class *v14;
  NSString *v15;
  objc_class *v16;
  NSString *v17;
  NSDictionary *v18;
  BuddyFundamentalFlowProvider *v19;
  unsigned __int8 v20;
  BuddyFundamentalFlowProvider *v21;
  id v22;
  BOOL v23;
  BuddyFundamentalFlowProvider *v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  BuddyFundamentalFlow *v30;
  NSArray *v31;
  BuddyFundamentalFlow *v32;
  NSArray *v33;
  BuddyFundamentalFlow *v34;
  NSArray *v35;
  NSArray *v36;
  id v37;
  NSIndexSet *v38;
  BuddyFundamentalFlowProvider *v39;
  char v40;
  NSArray *v41;
  BuddyFundamentalFlow *v42;
  NSArray *v43;
  BuddyFundamentalFlowProvider *v44;
  id v45;
  unint64_t v46;
  BuddyFundamentalFlow *v47;
  NSArray *v48;
  id v49;
  id v51;
  id v52[3];
  id v53;
  id v54;
  id v55;
  uint8_t buf[15];
  os_log_type_t v57;
  os_log_t oslog;
  char v59;
  id v60;
  char v61;
  id v62;
  BOOL v63;
  BOOL v64;
  id v65;
  id obj;
  id location;
  BOOL v68;
  id v69;
  id v70[2];
  BuddyFundamentalFlow *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _QWORD v76[5];
  _QWORD v77[2];
  _QWORD v78[5];
  _QWORD v79[10];
  _QWORD v80[23];
  _QWORD v81[9];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[4];
  _QWORD v85[3];
  _QWORD v86[2];
  _QWORD v87[3];
  _QWORD v88[23];
  _QWORD v89[11];
  _QWORD v90[8];
  _QWORD v91[8];

  v71 = self;
  v70[1] = (id)a2;
  v2 = (objc_class *)objc_opt_class(BuddyRestoreFinishedController);
  v3 = NSStringFromClass(v2);
  v90[0] = v3;
  v91[0] = objc_opt_class(BuddyWiFiController);
  v4 = (objc_class *)objc_opt_class(BuddyUpdateFinishedController);
  v5 = NSStringFromClass(v4);
  v90[1] = v5;
  v91[1] = objc_opt_class(BuddyWiFiController);
  v6 = (objc_class *)objc_opt_class(BuddyUpdateFinishedFlow);
  v7 = NSStringFromClass(v6);
  v90[2] = v7;
  v91[2] = objc_opt_class(BuddyWiFiController);
  v8 = (objc_class *)objc_opt_class(BuddyAirplaneController);
  v9 = NSStringFromClass(v8);
  v90[3] = v9;
  v91[3] = objc_opt_class(BuddyWiFiController);
  v10 = (objc_class *)objc_opt_class(RestoreFromComputerController);
  v11 = NSStringFromClass(v10);
  v90[4] = v11;
  v91[4] = objc_opt_class(RetailDiagnosticsController);
  v12 = (objc_class *)objc_opt_class(_TtC5Setup28BuddyReadyForChildController);
  v13 = NSStringFromClass(v12);
  v90[5] = v13;
  v91[5] = objc_opt_class(BuddyLanguageLocaleFlow);
  v14 = (objc_class *)objc_opt_class(BuddyAppleIDHostController);
  v15 = NSStringFromClass(v14);
  v90[6] = v15;
  v91[6] = objc_opt_class(BuddyAssociationController);
  v16 = (objc_class *)objc_opt_class(BuddyAppleIDChoiceController);
  v17 = NSStringFromClass(v16);
  v90[7] = v17;
  v91[7] = objc_opt_class(BuddyAssociationController);
  v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, v90, 8);
  v70[0] = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v18);

  v89[0] = objc_opt_class(BuddyProximityExpressController);
  v89[1] = objc_opt_class(BuddyLanguageLocaleFlow);
  v89[2] = objc_opt_class(BuddyMultilingualTermOfAddressViewController);
  v89[3] = objc_opt_class(_TtC5Setup25BuddyAppearanceController);
  v89[4] = objc_opt_class(BuddyProximitySetupController);
  v89[5] = objc_opt_class(BuddyProximityPairingController);
  v89[6] = objc_opt_class(BuddyProximityIntentController);
  v89[7] = objc_opt_class(BuddyProximityPasscodeValidationController);
  v89[8] = objc_opt_class(BuddyProximityApplySettingsController);
  v89[9] = objc_opt_class(BuddyMultilingualFlow);
  v89[10] = objc_opt_class(BuddyChinaPhoneNumberPermissionController);
  v69 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 11);
  -[BuddyFundamentalFlow _addItems:toFlow:](v71, "_addItems:toFlow:", v69, v70[0]);
  v19 = -[BuddyFundamentalFlow flowProvider](v71, "flowProvider");
  v20 = -[BuddyFundamentalFlowProvider hasCloudConfiguration](v19, "hasCloudConfiguration");

  v68 = (v20 & 1) == 0;
  v88[0] = objc_opt_class(BuddyChinaPhoneNumberPermissionController);
  v88[1] = objc_opt_class(BuddyWiFiController);
  v88[2] = objc_opt_class(BuddyActivationFlow);
  v88[3] = objc_opt_class(BuddyProximityExistingAppleIDController);
  v88[4] = objc_opt_class(_TtC5Setup37BuddyPostActivationAppStateController);
  v88[5] = objc_opt_class(BuddySIMActivationController);
  v88[6] = objc_opt_class(BuddyManagedSIMController);
  v88[7] = objc_opt_class(BuddyDemoController);
  v88[8] = objc_opt_class(BuddyGreenController);
  v88[9] = objc_opt_class(BuddyCloudConfigurationRetrievalController);
  v88[10] = objc_opt_class(BuddyEnrollmentChannelDiscoveryController);
  v88[11] = objc_opt_class(RetailDiagnosticsController);
  v88[12] = objc_opt_class(BuddySIMController);
  v88[13] = objc_opt_class(BuddySIMTransferController);
  v88[14] = objc_opt_class(BuddyMandatoryUpdateController);
  v88[15] = objc_opt_class(BuddyPrivacyController);
  v88[16] = objc_opt_class(_TtC5Setup21BuddyIntentController);
  v88[17] = objc_opt_class(_TtC5Setup19BuddyChildSetupFlow);
  v88[18] = objc_opt_class(BuddyProximityCloudDependentFlow);
  v88[19] = objc_opt_class(BuddyProximityApplyPasscodeController);
  v88[20] = objc_opt_class(BuddyPasscodeFlow);
  v88[21] = objc_opt_class(BuddyTransferDataFlow);
  v88[22] = objc_opt_class(BuddyProximityCloudFlow);
  location = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 23);
  if ((v20 & 1) != 0)
  {
    obj = objc_msgSend(location, "mutableCopy");
    objc_msgSend(obj, "removeObject:", objc_opt_class(BuddyProximityApplyPasscodeController));
    objc_msgSend(obj, "removeObject:", objc_opt_class(BuddyPasscodeFlow));
    objc_storeStrong(&location, obj);
    objc_storeStrong(&obj, 0);
  }
  -[BuddyFundamentalFlow _addItems:toFlow:](v71, "_addItems:toFlow:", location, v70[0]);
  v87[0] = objc_opt_class(BuddyProximityAutomatedDeviceEnrollmentPairingController);
  v87[1] = objc_opt_class(BuddyProximityAutomatedDeviceEnrollmentInProgressController);
  v87[2] = objc_opt_class(BuddyProximityAutomatedDeviceEnrollmentCompletionController);
  v65 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 3);
  -[BuddyFundamentalFlow _addItems:toFlow:](v71, "_addItems:toFlow:", v65, v70[0]);
  v21 = -[BuddyFundamentalFlow flowProvider](v71, "flowProvider");
  v22 = -[BuddyFundamentalFlowProvider remoteManagementProvider](v21, "remoteManagementProvider");
  v23 = objc_msgSend(v22, "mdmEnrollmentChannel") == (id)2;

  v64 = v23;
  v63 = 0;
  v24 = -[BuddyFundamentalFlow flowProvider](v71, "flowProvider");
  v25 = -[BuddyFundamentalFlowProvider restoreProvider](v24, "restoreProvider");
  v61 = 0;
  v59 = 0;
  v26 = 1;
  if (objc_msgSend(v25, "intendedRestoreType") != (id)1)
  {
    v62 = -[BuddyFundamentalFlow flowProvider](v71, "flowProvider");
    v61 = 1;
    v60 = objc_msgSend(v62, "restoreProvider");
    v59 = 1;
    v26 = objc_msgSend(v60, "restoreType") == (id)1;
  }
  if ((v59 & 1) != 0)

  if ((v61 & 1) != 0)
  v63 = v26;
  if (v64)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v27);
    v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v28 = oslog;
      v29 = v57;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Postpone restore...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v30 = v71;
    v86[0] = objc_opt_class(BuddyProximityCloudFlow);
    v86[1] = objc_opt_class(BuddyCloudConfigController);
    v31 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 2);
    -[BuddyFundamentalFlow _addItems:toFlow:](v30, "_addItems:toFlow:", v31, v70[0]);

  }
  else
  {
    v85[0] = objc_opt_class(BuddyProximityCloudFlow);
    v85[1] = objc_opt_class(BuddyExpressRestoreController);
    v85[2] = objc_opt_class(DeviceRestoreChoiceController);
    v55 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 3);
    -[BuddyFundamentalFlow _addItems:toFlow:](v71, "_addItems:toFlow:", v55, v70[0]);
    v32 = v71;
    if (v63)
    {
      v84[0] = objc_opt_class(DeviceRestoreChoiceController);
      v84[1] = objc_opt_class(BuddyAppleIDRestoreFlow);
      v84[2] = objc_opt_class(RestoreFromBackupController);
      v84[3] = objc_opt_class(BuddyExpressWelcomeController);
      v33 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 4);
    }
    else
    {
      v83[0] = objc_opt_class(DeviceRestoreChoiceController);
      v83[1] = objc_opt_class(BuddyCloudConfigController);
      v33 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 2);
    }
    -[BuddyFundamentalFlow _addItems:toFlow:](v32, "_addItems:toFlow:", v33, v70[0]);

    objc_storeStrong(&v55, 0);
  }
  v34 = v71;
  v82[0] = objc_opt_class(BuddyMoveFromAndroidController);
  v82[1] = objc_opt_class(BuddyCloudConfigController);
  v35 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2);
  -[BuddyFundamentalFlow _addItems:toFlow:](v34, "_addItems:toFlow:", v35, v70[0]);

  v81[0] = objc_opt_class(BuddyCloudConfigController);
  v81[1] = objc_opt_class(BuddyCloudConfigInstallationController);
  v81[2] = objc_opt_class(BuddyConfiguringMultiUserController);
  v81[3] = objc_opt_class(BuddyProximityApplyPasscodeController);
  v81[4] = objc_opt_class(BuddyPasscodeFlow);
  v81[5] = objc_opt_class(BuddyAppleIDPasswordChangeController);
  v81[6] = objc_opt_class(BuddyEDUAccountConfigurationSyncController);
  v81[7] = objc_opt_class(BuddyAwaitUserConfigurationController);
  v81[8] = objc_opt_class(BuddyAppleIDFlow);
  v36 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 9);
  v54 = -[NSArray mutableCopy](v36, "mutableCopy");

  if (v64)
  {
    v53 = +[NSMutableArray array](NSMutableArray, "array");
    objc_msgSend(v53, "addObject:", objc_opt_class(DeviceRestoreChoiceController));
    if (v63)
    {
      objc_msgSend(v53, "addObject:", objc_opt_class(RestoreFromBackupController));
      objc_msgSend(v53, "addObject:", objc_opt_class(BuddyRestoreFlow));
    }
    v37 = objc_msgSend(v53, "count");
    v73 = 1;
    v72 = v37;
    v74 = 1;
    v75 = v37;
    v52[2] = v37;
    v52[1] = (id)1;
    v38 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 1, v37);
    objc_msgSend(v54, "insertObjects:atIndexes:", v53, v38);

    objc_storeStrong(&v53, 0);
  }
  if (v68)
  {
    objc_msgSend(v54, "removeObject:", objc_opt_class(BuddyProximityApplyPasscodeController));
    objc_msgSend(v54, "removeObject:", objc_opt_class(BuddyPasscodeFlow));
  }
  -[BuddyFundamentalFlow _addItems:toFlow:](v71, "_addItems:toFlow:", v54, v70[0]);
  v80[0] = objc_opt_class(BuddyAppleIDFlow);
  v80[1] = objc_opt_class(BuddyTermsConditionsFlow);
  v80[2] = objc_opt_class(BuddyAssociationController);
  v80[3] = objc_opt_class(BuddyExpressWelcomeController);
  v80[4] = objc_opt_class(BuddyAutoUpdateController);
  v80[5] = objc_opt_class(BuddyPhoneNumberPermissionController);
  v80[6] = objc_opt_class(BuddyLocationServicesController);
  v80[7] = objc_opt_class(_TtC5Setup37BuddyStolenDeviceProtectionController);
  v80[8] = objc_opt_class(BuddyCloudSIMController);
  v80[9] = objc_opt_class(BuddyPaymentController);
  v80[10] = objc_opt_class(BuddyWatchMigrationController);
  v80[11] = objc_opt_class(BuddyAppleIDiCloudDrivePage);
  v80[12] = objc_opt_class(BuddyiCloudQuotaController);
  v80[13] = objc_opt_class(BuddyScreenTimeController);
  v80[14] = objc_opt_class(BuddySeedDiagnosticsController);
  v80[15] = objc_opt_class(BuddyDiagnosticsController);
  v80[16] = objc_opt_class(BuddyAppActivityController);
  v80[17] = objc_opt_class(BuddyUserInterfaceStyleSelector);
  v80[18] = objc_opt_class(_TtC5Setup28BuddyButtonConfigurationFlow);
  v80[19] = objc_opt_class(_TtC5Setup27BuddyCameraButtonController);
  v80[20] = objc_opt_class(BuddyIntelligenceController);
  v80[21] = objc_opt_class(AssistantOptInController);
  v80[22] = objc_opt_class(BuddyBetaReEnrollmentController);
  v52[0] = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 23);
  -[BuddyFundamentalFlow _addItems:toFlow:](v71, "_addItems:toFlow:", v52[0], v70[0]);
  v39 = -[BuddyFundamentalFlow flowProvider](v71, "flowProvider");
  v40 = -[BuddyFundamentalFlowProvider willSetUpAsNew](v39, "willSetUpAsNew") ^ 1;

  if ((v40 & 1) != 0)
  {
    v79[0] = objc_opt_class(BuddyBetaReEnrollmentController);
    v79[1] = objc_opt_class(BuddyMessagesContactsController);
    v79[2] = objc_opt_class(BuddySettingsDataUsageController);
    v79[3] = objc_opt_class(BuddySafetyController);
    v79[4] = objc_opt_class(_TtC5Setup27BuddyMultitaskingController);
    v79[5] = objc_opt_class(_TtC5Setup26BuddyChildSafetyController);
    v79[6] = objc_opt_class(_TtC5Setup27BuddyLockdownModeController);
    v79[7] = objc_opt_class(BuddyMigrationFlow);
    v79[8] = objc_opt_class(BuddyRestoreFlow);
    v79[9] = objc_opt_class(BuddyFinishFlow);
    v41 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 10);
    v51 = -[NSArray mutableCopy](v41, "mutableCopy");

    if (v64)
      objc_msgSend(v51, "removeObject:", objc_opt_class(BuddyRestoreFlow));
    -[BuddyFundamentalFlow _addItems:toFlow:](v71, "_addItems:toFlow:", v51, v70[0]);
    objc_storeStrong(&v51, 0);
  }
  else
  {
    v42 = v71;
    v78[0] = objc_opt_class(BuddyBetaReEnrollmentController);
    v78[1] = objc_opt_class(BuddyMessagesContactsController);
    v78[2] = objc_opt_class(BuddySettingsDataUsageController);
    v78[3] = objc_opt_class(BuddySafetyController);
    v78[4] = objc_opt_class(_TtC5Setup27BuddyMultitaskingController);
    v43 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 5);
    -[BuddyFundamentalFlow _addItems:toFlow:](v42, "_addItems:toFlow:", v43, v70[0]);

    v44 = -[BuddyFundamentalFlow flowProvider](v71, "flowProvider");
    v45 = -[BuddyFundamentalFlowProvider flowItemDispositionProvider](v44, "flowItemDispositionProvider");
    v46 = (unint64_t)objc_msgSend(v45, "dispositions") & 8;

    v47 = v71;
    if (v46 == 8)
    {
      v77[0] = objc_opt_class(_TtC5Setup27BuddyMultitaskingController);
      v77[1] = objc_opt_class(_TtC5Setup28BuddyReadyForChildController);
      v48 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 2);
    }
    else
    {
      v76[0] = objc_opt_class(_TtC5Setup27BuddyMultitaskingController);
      v76[1] = objc_opt_class(_TtC5Setup26BuddyChildSafetyController);
      v76[2] = objc_opt_class(_TtC5Setup27BuddyLockdownModeController);
      v76[3] = objc_opt_class(BuddyManagedConfigurationMigrationController);
      v76[4] = objc_opt_class(BuddyFinishFlow);
      v48 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 5);
    }
    -[BuddyFundamentalFlow _addItems:toFlow:](v47, "_addItems:toFlow:", v48, v70[0]);

  }
  v49 = v70[0];
  objc_storeStrong(v52, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(v70, 0);
  return v49;
}

- (void)_addItems:(id)a3 toFlow:(id)a4
{
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  id v10;
  NSString *v11;
  NSString *v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *aClass;
  char *i;
  id v17;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  for (i = 0; i < (char *)objc_msgSend(location[0], "count") - 1; ++i)
  {
    aClass = (objc_class *)objc_msgSend(location[0], "objectAtIndexedSubscript:", i);
    v14 = (objc_class *)objc_msgSend(location[0], "objectAtIndexedSubscript:", i + 1);
    v5 = v17;
    v6 = NSStringFromClass(aClass);
    v13 = (objc_class *)objc_msgSend(v5, "objectForKeyedSubscript:", v6);

    if (v13)
    {
      if (v13 != v14)
      {
        v7 = NSStringFromClass(v14);
        v8 = NSStringFromClass(aClass);
        v9 = NSStringFromClass(v13);
        v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempted to add a proceeding flow item (%@) for a flow item (%@) which already has a proceeding flow item (%@)"), v7, v8, v9);

        objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Invalid Fundamental Flow Map"), v12, 0));
      }
    }
    v10 = v17;
    v11 = NSStringFromClass(aClass);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v11);

  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)prepareWithCompletion:(id)a3
{
  BuddyFundamentalFlowProvider *v3;
  id v4;
  id location[2];
  BuddyFundamentalFlow *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyFundamentalFlow flowProvider](v6, "flowProvider");
  v4 = -[BuddyFundamentalFlowProvider startupProvider](v3, "startupProvider");
  objc_msgSend(v4, "prepareWithCompletion:", location[0]);

  objc_storeStrong(location, 0);
}

- (Class)initialFlowItemClass
{
  BOOL v2;
  void (**v3)(id, objc_class *);
  char v5;
  id v6;
  objc_class *v7;

  v7 = -[BuddyFundamentalFlow _initialFlowItemClass](self, "_initialFlowItemClass");
  v5 = 0;
  v2 = 0;
  if (v7)
  {
    v6 = -[BuddyFundamentalFlow willSupplyInitialFlowItemClass](self, "willSupplyInitialFlowItemClass");
    v5 = 1;
    v2 = v6 != 0;
  }
  if ((v5 & 1) != 0)

  if (v2)
  {
    v3 = (void (**)(id, objc_class *))-[BuddyFundamentalFlow willSupplyInitialFlowItemClass](self, "willSupplyInitialFlowItemClass");
    v3[2](v3, v7);

  }
  return v7;
}

- (Class)_initialFlowItemClass
{
  BuddyFundamentalFlowProvider *v2;
  id v3;
  id v4;
  BuddyFundamentalFlowProvider *v5;
  id v6;
  unsigned __int8 v7;
  BuddyFundamentalFlowProvider *v8;
  id v9;
  unsigned __int8 v10;
  BuddyFundamentalFlowProvider *v11;
  id v12;
  unsigned __int8 v13;
  BuddyFeatureFlags *v14;
  unsigned __int8 v15;
  BuddyFundamentalFlowProvider *v16;
  id v17;
  unsigned __int8 v18;
  objc_class *v21;

  v2 = -[BuddyFundamentalFlow flowProvider](self, "flowProvider");
  v3 = -[BuddyFundamentalFlowProvider startupProvider](v2, "startupProvider");
  v4 = objc_msgSend(v3, "startupCause");

  switch((unint64_t)v4)
  {
    case 0uLL:
      v5 = -[BuddyFundamentalFlow flowProvider](self, "flowProvider");
      v6 = -[BuddyFundamentalFlowProvider startupProvider](v5, "startupProvider");
      v7 = objc_msgSend(v6, "shouldBeginRestore");

      if ((v7 & 1) != 0)
      {
        v21 = (objc_class *)(id)objc_opt_class(BuddySoftwareUpdateRestoreFlow);
      }
      else
      {
        v8 = -[BuddyFundamentalFlow flowProvider](self, "flowProvider");
        v9 = -[BuddyFundamentalFlowProvider startupProvider](v8, "startupProvider");
        v10 = objc_msgSend(v9, "shouldBeginMigration");

        if ((v10 & 1) != 0)
        {
          v21 = (objc_class *)(id)objc_opt_class(DeviceRestoreChoiceController);
        }
        else
        {
          v11 = -[BuddyFundamentalFlow flowProvider](self, "flowProvider");
          v12 = -[BuddyFundamentalFlowProvider startupProvider](v11, "startupProvider");
          v13 = objc_msgSend(v12, "isLanguageSet");

          if ((v13 & 1) != 0)
          {
            v21 = -[BuddyFundamentalFlow potentialNextFlowItemClassFollowingFlowItemClass:](self, "potentialNextFlowItemClassFollowingFlowItemClass:", objc_opt_class(BuddyLanguageLocaleFlow));
          }
          else
          {
            v14 = -[BuddyFundamentalFlow featureFlags](self, "featureFlags");
            v15 = -[BuddyFeatureFlags isLanguageAgnosticQuickStartEnabled](v14, "isLanguageAgnosticQuickStartEnabled");

            if ((v15 & 1) == 0)
              goto LABEL_17;
            v21 = (objc_class *)(id)objc_opt_class(BuddyProximityExpressController);
          }
        }
      }
      break;
    case 1uLL:
    case 2uLL:
    case 7uLL:
LABEL_17:
      v21 = (objc_class *)(id)objc_opt_class(BuddyLanguageLocaleFlow);
      break;
    case 3uLL:
      v16 = -[BuddyFundamentalFlow flowProvider](self, "flowProvider");
      v17 = -[BuddyFundamentalFlowProvider startupProvider](v16, "startupProvider");
      v18 = objc_msgSend(v17, "airplaneModeEnabled");

      if ((v18 & 1) != 0)
        v21 = (objc_class *)(id)objc_opt_class(BuddyAirplaneController);
      else
        v21 = (objc_class *)(id)objc_opt_class(BuddyUpdateFinishedController);
      break;
    case 4uLL:
      v21 = (objc_class *)(id)objc_opt_class(BuddyRestoreFinishedController);
      break;
    case 5uLL:
      v21 = (objc_class *)(id)objc_opt_class(BuddyUpdateFinishedFlow);
      break;
    case 6uLL:
      v21 = (objc_class *)(id)objc_opt_class(BuddySourceMigrationFlow);
      break;
    default:
      return v21;
  }
  return v21;
}

- (Class)debutFlowItemClass
{
  BuddyFundamentalFlowProvider *v2;
  id v3;
  unsigned __int8 v4;
  BuddyFundamentalFlowProvider *v5;
  id v6;
  char *v7;
  id v10;

  v2 = -[BuddyFundamentalFlow flowProvider](self, "flowProvider");
  v3 = -[BuddyFundamentalFlowProvider startupProvider](v2, "startupProvider");
  v4 = objc_msgSend(v3, "shouldBeginMigration");

  if ((v4 & 1) == 0)
  {
    v5 = -[BuddyFundamentalFlow flowProvider](self, "flowProvider");
    v6 = -[BuddyFundamentalFlowProvider startupProvider](v5, "startupProvider");
    v7 = (char *)objc_msgSend(v6, "startupCause");

    if ((unint64_t)v7 >= 2)
    {
      if (v7 == (char *)2)
      {
        v10 = (id)objc_opt_class(_TtC5Setup25BuddyAppearanceController);
        return (Class)v10;
      }
      if ((unint64_t)(v7 - 3) >= 5)
        return (Class)v10;
    }
    v10 = 0;
    return (Class)v10;
  }
  v10 = (id)objc_opt_class(BuddyUpgradeMigrationFlow);
  return (Class)v10;
}

- (void)configureFlowItem:(id)a3
{
  id v3;
  uint64_t v4;
  BuddyFundamentalFlowProvider *v5;
  id v6;
  BuddyFundamentalFlowProvider *v7;
  id v8;
  BuddyFundamentalFlowProvider *v9;
  id v10;
  unsigned __int8 v11;
  BOOL v12;
  char v13;
  id v14;
  char v15;
  BuddyFundamentalFlowProvider *v16;
  id v17;
  id location[2];
  BuddyFundamentalFlow *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = objc_opt_class(BuddyLanguageLocaleFlow);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v17 = location[0];
    v5 = -[BuddyFundamentalFlow flowProvider](v19, "flowProvider");
    v6 = -[BuddyFundamentalFlowProvider languageLocaleReceiver](v5, "languageLocaleReceiver");
    objc_msgSend(v17, "setReceiver:", v6);

    v7 = -[BuddyFundamentalFlow flowProvider](v19, "flowProvider");
    v8 = -[BuddyFundamentalFlowProvider startupProvider](v7, "startupProvider");
    objc_msgSend(v17, "setLanguageSet:", (unint64_t)objc_msgSend(v8, "isLanguageSet") & 1);

    v9 = -[BuddyFundamentalFlow flowProvider](v19, "flowProvider");
    v10 = -[BuddyFundamentalFlowProvider startupProvider](v9, "startupProvider");
    v11 = objc_msgSend(v10, "isLanguageSet");
    v15 = 0;
    v13 = 0;
    v12 = 0;
    if ((v11 & 1) != 0)
    {
      v16 = -[BuddyFundamentalFlow flowProvider](v19, "flowProvider");
      v15 = 1;
      v14 = -[BuddyFundamentalFlowProvider startupProvider](v16, "startupProvider");
      v13 = 1;
      v12 = objc_msgSend(v14, "startupCause") == (id)1;
    }
    objc_msgSend(v17, "setResumingFromLanguageReboot:", v12);
    if ((v13 & 1) != 0)

    if ((v15 & 1) != 0)
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(location, 0);
}

- (Class)potentialNextFlowItemClassFollowingFlowItemClass:(Class)a3
{
  id v3;
  NSString *v4;
  id v5;

  v3 = -[BuddyFundamentalFlow _flowMapByClass](self, "_flowMapByClass");
  v4 = NSStringFromClass(a3);
  v5 = objc_msgSend(v3, "objectForKey:", v4);

  return (Class)v5;
}

+ (id)allowedFlowItems
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EECE0;
  location = 0;
  objc_storeStrong(&location, &stru_100284638);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EECD8;
}

- (id)willSupplyInitialFlowItemClass
{
  return self->willSupplyInitialFlowItemClass;
}

- (void)setWillSupplyInitialFlowItemClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (BuddyFundamentalFlowProvider)flowProvider
{
  return (BuddyFundamentalFlowProvider *)objc_loadWeakRetained((id *)&self->_flowProvider);
}

- (void)setFlowProvider:(id)a3
{
  objc_storeWeak((id *)&self->_flowProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowProvider);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->willSupplyInitialFlowItemClass, 0);
}

@end
