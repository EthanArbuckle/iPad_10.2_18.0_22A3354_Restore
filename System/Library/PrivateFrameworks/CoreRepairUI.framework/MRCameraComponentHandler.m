@implementation MRCameraComponentHandler

- (MRCameraComponentHandler)init
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
  MRCameraComponentHandler *v2;
  void *v3;
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
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MRCameraComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", objc_msgSend(v3, "BOOLForKey:", CFSTR("SUcaseForCamera")));

    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Camera"));
    -[MRBaseComponentHandler setSupportsRepair:](v2, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_NOTIF_TEXT"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v2, "setPopUpNotificationTitle:", CFSTR("IMPORTANT_CAMERA_MESSAGE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_MESSAGE"));
    -[MRBaseComponentHandler setComponentSUCaseKey:](v2, "setComponentSUCaseKey:", CFSTR("SUcaseForCamera"));
    -[MRBaseComponentHandler setDisplayNotification:](v2, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v2, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v2, "isSUCaseForComponent") ^ 1);
    v4 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/Camera"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v2, "setLinkedSensitiveURL:", v6);

    -[MRBaseComponentHandler setComponentFollowupClientID:](v2, "setComponentFollowupClientID:", CFSTR("com.apple.mobilerepair.CameraRepair"));
    -[MRBaseComponentHandler setFinishRepairTitle:](v2, "setFinishRepairTitle:", CFSTR("FINISH_CAMERA_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_CAMERA_REPAIR_DESC"));
    -[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("FINISH_REPAIR"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setFinishRepairKey:](v2, "setFinishRepairKey:", v8);

    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v2, "setComponentUnLockCheckCountKey:", CFSTR("unlockCheckCountForCamera"));
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v2, "setComponentRetriggerCountKey:", CFSTR("retriggerCheckCountForCamera"));
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v2, "setComponentLastCheckTimeKey:", CFSTR("lastCheckTimeForCamera"));
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v2, "setComponentHasDisplayedFollowUpKey:", CFSTR("hasDisplayedFollowupForCamera"));
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v2, "setComponentUnlockCheckerActivityName:", CFSTR("com.apple.mobilerepair.cameraunlockchecker"));
    -[MRBaseComponentHandler setComponentId:](v2, "setComponentId:", 2);
    -[MRBaseComponentHandler setComponentNtwkActivityName:](v2, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.cameranotifyServer"));
    -[MRBaseComponentHandler setComponentHasNotifiedServerKey:](v2, "setComponentHasNotifiedServerKey:", CFSTR("hasNotifiedServerForCamera"));
    -[MRBaseComponentHandler setNotifyServer:](v2, "setNotifyServer:", 0);
    -[MRBaseComponentHandler setComponentDataCollectionPresentedKey:](v2, "setComponentDataCollectionPresentedKey:", CFSTR("dataCollectionNoticePresentedForPartsAndService"));
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v2, "setComponentFirstUIDisplayedTimeKey:", CFSTR("firstUIDisplayedTimeForCamera"));
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v2, "setLastKnownComponentIdentifierKey:", CFSTR("lastKnownIDForCamera"));
    v9 = (void *)MEMORY[0x24BE27E68];
    -[MRBaseComponentHandler componentName](v2, "componentName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "copySealingManifestDataInstanceForComponent:", v10);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v2, "setLastKnownComponentIdentifierValue:", v11);

    v12 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v2, "setComponentAuthHandler:", v12);

    -[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Preferences/"), "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(".plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setStateFilePath:](v2, "setStateFilePath:", v15);

    -[MRBaseComponentHandler setComponentForceKey:](v2, "setComponentForceKey:", CFSTR("ForceCameraStatus"));
    if (-[MRBaseComponentHandler deviceClass](v2, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_CAMERA_REPAIR_DESC_IPAD"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_MESSAGE_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_CAMERA_NOTIF_TEXT_IPAD"));
      v16 = (void *)objc_opt_new();
      -[MRBaseComponentHandler setComponentAuthHandler:](v2, "setComponentAuthHandler:", v16);

    }
  }
  return v2;
}

+ (void)handleSUCase
{
  void *v3;
  id v4;

  v3 = (void *)MGCopyAnswer();
  objc_msgSend(v3, "intValue");

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("CmCl")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRPropertySupported:", CFSTR("RCSn")))
  {
    v4 = (id)objc_opt_new();
    objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForCamera"), CFSTR("LastCameraAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.CameraRepair"), CFSTR("Camera"), CFSTR("SUcaseForCamera"), CFSTR("18D1"), v4);

  }
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC82A28;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B49970 != -1)
    dispatch_once(&qword_255B49970, block);
  return (id)qword_255B49968;
}

@end
