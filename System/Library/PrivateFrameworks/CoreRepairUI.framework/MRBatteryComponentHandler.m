@implementation MRBatteryComponentHandler

- (MRBatteryComponentHandler)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedSingleton);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  MRBatteryComponentHandler *v2;
  MRBatteryComponentHandler *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint8_t v24[16];
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MRBatteryComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Battery"));
    -[MRBaseComponentHandler setComponentFollowupClientID:](v3, "setComponentFollowupClientID:", CFSTR("com.apple.mobilerepair.BatteryRepair"));
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v3, "setIsSUCaseForComponent:", objc_msgSend(v4, "BOOLForKey:", CFSTR("SUcaseForBattery")));

    -[MRBaseComponentHandler setSupportsRepair:](v3, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_BATTERY_NOTIF_TEXT"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("IMPORTANT_BATTERY_MESSAGE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_BATTERY_MESSAGE"));
    -[MRBaseComponentHandler setComponentSUCaseKey:](v3, "setComponentSUCaseKey:", CFSTR("SUcaseForBattery"));
    v5 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setNotifyServer:](v3, "setNotifyServer:", objc_msgSend(v5, "deviceSupportsRepairBootIntent") ^ 1);

    -[MRBaseComponentHandler setFinishRepairTitle:](v3, "setFinishRepairTitle:", CFSTR("FINISH_BATTERY_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_BATTERY_REPAIR_DESC"));
    -[MRBaseComponentHandler componentFollowupClientID](v3, "componentFollowupClientID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("FINISH_REPAIR"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setFinishRepairKey:](v3, "setFinishRepairKey:", v7);

    -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v3, "isSUCaseForComponent") ^ 1);
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/Battery"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v3, "setLinkedSensitiveURL:", v10);

    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v3, "setComponentUnLockCheckCountKey:", CFSTR("unlockCheckCountForBattery"));
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v3, "setComponentRetriggerCountKey:", CFSTR("retriggerCheckCountForBattery"));
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v3, "setComponentLastCheckTimeKey:", CFSTR("lastCheckTimeForBattery"));
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v3, "setComponentHasDisplayedFollowUpKey:", CFSTR("hasDisplayedFollowupForBattery"));
    -[MRBaseComponentHandler setComponentHasNotifiedServerKey:](v3, "setComponentHasNotifiedServerKey:", CFSTR("hasNotifiedServerForBattery"));
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v3, "setComponentUnlockCheckerActivityName:", CFSTR("com.apple.mobilerepair.batteryunlockchecker"));
    -[MRBaseComponentHandler setComponentNtwkActivityName:](v3, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.batterynotifyserver"));
    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 0);
    -[MRBaseComponentHandler setComponentDataCollectionPresentedKey:](v3, "setComponentDataCollectionPresentedKey:", CFSTR("dataCollectionNoticePresentedForPartsAndService"));
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v3, "setComponentFirstUIDisplayedTimeKey:", CFSTR("firstUIDisplayedTimeForBattery"));
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v3, "setLastKnownComponentIdentifierKey:", CFSTR("lastKnownIDForBattery"));
    v11 = (void *)MEMORY[0x24BE27E68];
    -[MRBaseComponentHandler componentName](v3, "componentName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "copySealingManifestDataInstanceForComponent:", v12);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v3, "setLastKnownComponentIdentifierValue:", v13);

    v14 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v14);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("overrideDisableUIForBattery"));

    -[MRBaseComponentHandler componentFollowupClientID](v3, "componentFollowupClientID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Preferences/"), "stringByAppendingString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(".plist"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setStateFilePath:](v3, "setStateFilePath:", v19);

    -[MRBaseComponentHandler setComponentForceKey:](v3, "setComponentForceKey:", CFSTR("ForceBatteryStatus"));
    if (MGGetProductType() == 2159747553)
    {
      +[MRBaseComponentHandler getHwRevision](MRBatteryComponentHandler, "getHwRevision");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "containsString:", CFSTR("EVT"));

      if (((v21 ^ 1 | v16) & 1) == 0)
      {
        sub_22AC82A9C(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_22AC64000, v22, OS_LOG_TYPE_DEFAULT, "Disabling UI for D79 EVT", v24, 2u);
        }

        -[MRBaseComponentHandler setDisableUIForComponent:](v3, "setDisableUIForComponent:", 1);
      }
    }
  }
  return v3;
}

+ (void)handleSUCase
{
  id v3;

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("bcrt")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("vcrt")))
  {
    v3 = (id)objc_opt_new();
    objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForBattery"), CFSTR("LastBatteryAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.BatteryRepair"), CFSTR("Battery"), CFSTR("SUcaseForBattery"), CFSTR("17A800"), v3);

  }
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC73E14;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B49898 != -1)
    dispatch_once(&qword_255B49898, block);
  return (id)qword_255B49890;
}

@end
