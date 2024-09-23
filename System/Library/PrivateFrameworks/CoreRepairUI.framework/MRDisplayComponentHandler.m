@implementation MRDisplayComponentHandler

- (MRDisplayComponentHandler)init
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
  MRDisplayComponentHandler *v2;
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
  void *v17;
  char v18;
  objc_super v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MRDisplayComponentHandler;
  v2 = -[MRBaseComponentHandler init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setIsSUCaseForComponent:](v2, "setIsSUCaseForComponent:", objc_msgSend(v3, "BOOLForKey:", CFSTR("SUcaseForDisplay")));

    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("TouchController"));
    -[MRBaseComponentHandler setSupportsRepair:](v2, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v2, "setPopUpNotificationTitle:", CFSTR("IMPORTANT_DISPLAY_MESSAGE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_MESSAGE"));
    -[MRBaseComponentHandler setComponentSUCaseKey:](v2, "setComponentSUCaseKey:", CFSTR("SUcaseForDisplay"));
    -[MRBaseComponentHandler setDisplayNotification:](v2, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v2, "setDisplayModalPopup:", -[MRBaseComponentHandler isSUCaseForComponent](v2, "isSUCaseForComponent") ^ 1);
    v4 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=General&path=About/MAIN_PARTS_AND_SERVICE/TouchController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setLinkedSensitiveURL:](v2, "setLinkedSensitiveURL:", v6);

    -[MRBaseComponentHandler setComponentFollowupClientID:](v2, "setComponentFollowupClientID:", CFSTR("com.apple.mobilerepair.DisplayRepair"));
    -[MRBaseComponentHandler setFinishRepairTitle:](v2, "setFinishRepairTitle:", CFSTR("FINISH_DISPLAY_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_DISPLAY_REPAIR_DESC"));
    -[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("FINISH_REPAIR"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setFinishRepairKey:](v2, "setFinishRepairKey:", v8);

    -[MRBaseComponentHandler setComponentUnLockCheckCountKey:](v2, "setComponentUnLockCheckCountKey:", CFSTR("unlockCheckCountForDisplay"));
    -[MRBaseComponentHandler setComponentRetriggerCountKey:](v2, "setComponentRetriggerCountKey:", CFSTR("retriggerCheckCountForDisplay"));
    -[MRBaseComponentHandler setComponentLastCheckTimeKey:](v2, "setComponentLastCheckTimeKey:", CFSTR("lastCheckTimeForDisplay"));
    -[MRBaseComponentHandler setComponentHasDisplayedFollowUpKey:](v2, "setComponentHasDisplayedFollowUpKey:", CFSTR("hasDisplayedFollowupForDisplay"));
    -[MRBaseComponentHandler setComponentUnlockCheckerActivityName:](v2, "setComponentUnlockCheckerActivityName:", CFSTR("com.apple.mobilerepair.displayunlockchecker"));
    -[MRBaseComponentHandler setComponentNtwkActivityName:](v2, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.displaynotifyServer"));
    -[MRBaseComponentHandler setComponentId:](v2, "setComponentId:", 1);
    -[MRBaseComponentHandler setComponentHasNotifiedServerKey:](v2, "setComponentHasNotifiedServerKey:", CFSTR("hasNotifiedServerForDisplay"));
    v9 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setNotifyServer:](v2, "setNotifyServer:", objc_msgSend(v9, "deviceSupportsRepairBootIntent") ^ 1);

    -[MRBaseComponentHandler setComponentNtwkActivityName:](v2, "setComponentNtwkActivityName:", CFSTR("com.apple.mobilerepair.displaynotifyServer"));
    -[MRBaseComponentHandler setComponentDataCollectionPresentedKey:](v2, "setComponentDataCollectionPresentedKey:", CFSTR("dataCollectionNoticePresentedForPartsAndService"));
    -[MRBaseComponentHandler setComponentFirstUIDisplayedTimeKey:](v2, "setComponentFirstUIDisplayedTimeKey:", CFSTR("firstUIDisplayedTimeForDisplay"));
    -[MRBaseComponentHandler setLastKnownComponentIdentifierKey:](v2, "setLastKnownComponentIdentifierKey:", CFSTR("lastKnownIDForDisplay"));
    v10 = (void *)MEMORY[0x24BE27E68];
    -[MRBaseComponentHandler componentName](v2, "componentName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "copySealingManifestDataInstanceForComponent:", v11);
    -[MRBaseComponentHandler setLastKnownComponentIdentifierValue:](v2, "setLastKnownComponentIdentifierValue:", v12);

    v13 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v2, "setComponentAuthHandler:", v13);

    -[MRBaseComponentHandler componentFollowupClientID](v2, "componentFollowupClientID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Preferences/"), "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR(".plist"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRBaseComponentHandler setStateFilePath:](v2, "setStateFilePath:", v16);

    -[MRBaseComponentHandler setComponentForceKey:](v2, "setComponentForceKey:", CFSTR("ForceDisplayStatus"));
    v20.receiver = v2;
    v20.super_class = (Class)MRDisplayComponentHandler;
    if (-[MRBaseComponentHandler deviceClass](&v20, sel_deviceClass) == 3)
    {
      -[MRBaseComponentHandler setFinishRepairMessage:](v2, "setFinishRepairMessage:", CFSTR("FINISH_DISPLAY_REPAIR_DESC_IPAD"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v2, "setFollowUpInfoMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_MESSAGE_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v2, "setPopUpNotificationMessage:", CFSTR("UNABLE_TO_VERIFY_DISPLAY_NOTIF_TEXT_IPAD"));
      v17 = (void *)objc_opt_new();
      v18 = objc_msgSend(v17, "isSupportedIPad");

      if ((v18 & 1) == 0)
      {
        -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v2, "setUnlockCheckActivityRequired:", 0);
        -[MRBaseComponentHandler setDisplayNotification:](v2, "setDisplayNotification:", 0);
        -[MRBaseComponentHandler setDisplayModalPopup:](v2, "setDisplayModalPopup:", 0);
        -[MRBaseComponentHandler setDisplayFollowup:](v2, "setDisplayFollowup:", 0);
      }
    }
  }
  return v2;
}

+ (void)handleSUCase
{
  id v3;

  if (objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("tcrt")))
  {
    v3 = (id)objc_opt_new();
    objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForDisplay"), CFSTR("LastDisplayAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.DisplayRepair"), CFSTR("TouchController"), CFSTR("SUcaseForDisplay"), CFSTR("17A800"), v3);

  }
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC7DB0C;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B49910 != -1)
    dispatch_once(&qword_255B49910, block);
  return (id)qword_255B49908;
}

@end
