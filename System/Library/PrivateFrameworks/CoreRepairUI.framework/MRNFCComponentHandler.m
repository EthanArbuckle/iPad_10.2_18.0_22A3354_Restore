@implementation MRNFCComponentHandler

- (MRNFCComponentHandler)init
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
  MRNFCComponentHandler *v2;
  MRNFCComponentHandler *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRNFCComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v8, sel_initWithComponentName_, CFSTR("NFC"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("NFC"));
    v4 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 6);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("NFC_FOLLOWUP_TITLE"));
    if (-[MRBaseComponentHandler deviceClass](v3, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("NFC_FOLLOWUP_INFO_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("NFC_POPUP_INFO_IPAD"));
      v5 = (void *)objc_opt_new();
      v6 = objc_msgSend(v5, "isSupportedIPad");

      if ((v6 & 1) == 0)
      {
        -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 0);
        -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
        -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", 0);
        -[MRBaseComponentHandler setDisplayFollowup:](v3, "setDisplayFollowup:", 0);
      }
    }
    else
    {
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("NFC_FOLLOWUP_INFO"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("NFC_POPUP_INFO"));
    }
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC740F4;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B498A8 != -1)
    dispatch_once(&qword_255B498A8, block);
  return (id)qword_255B498A0;
}

+ (void)handleSUCase
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForSHCNFC"), CFSTR("LastNFCAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.NFCRepair"), CFSTR("NFC"), CFSTR("SUcaseForNFC"), CFSTR("19F1"), v3);

}

@end
