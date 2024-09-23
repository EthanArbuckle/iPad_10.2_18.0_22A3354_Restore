@implementation MRBasebandComponentHandler

- (MRBasebandComponentHandler)init
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
  MRBasebandComponentHandler *v2;
  MRBasebandComponentHandler *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRBasebandComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v9, sel_initWithComponentName_, CFSTR("Baseband"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("Baseband"));
    v4 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 5);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("CELLULAR_FOLLOWUP_TITLE"));
    v5 = -[MRBaseComponentHandler deviceClass](v3, "deviceClass");
    if (v5 == 3)
      v6 = CFSTR("BASEBAND_POPUP_INFO_IPAD");
    else
      v6 = CFSTR("BASEBAND_POPUP_INFO");
    if (v5 == 3)
      v7 = CFSTR("BASEBAND_FOLLOWUP_INFO_IPAD");
    else
      v7 = CFSTR("BASEBAND_FOLLOWUP_INFO");
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", v6);
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", v7);
    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 0);
    -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", 0);
    -[MRBaseComponentHandler setDisplayFollowup:](v3, "setDisplayFollowup:", 0);
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC74E20;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B498C8 != -1)
    dispatch_once(&qword_255B498C8, block);
  return (id)qword_255B498C0;
}

+ (void)handleSUCase
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForSHCBaseband"), CFSTR("LastBasebandAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.BasebandRepair"), CFSTR("Baseband"), CFSTR("SUcaseForBaseband"), CFSTR("19F1"), v3);

}

@end
