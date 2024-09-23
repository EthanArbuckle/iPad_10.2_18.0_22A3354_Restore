@implementation MRTouchIDComponentHandler

- (id)_init
{
  MRTouchIDComponentHandler *v2;
  MRTouchIDComponentHandler *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRTouchIDComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v8, sel_initWithComponentName_, CFSTR("TouchID"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("TouchID"));
    v4 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 12);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("TOUCHID_FOLLOWUP_TITLE"));
    if (-[MRBaseComponentHandler deviceClass](v3, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setSupportsRepair:](v3, "setSupportsRepair:", 1);
      -[MRBaseComponentHandler setFinishRepairTitle:](v3, "setFinishRepairTitle:", CFSTR("FINISH_TOUCHID_REPAIR_TITLE"));
      -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_TOUCHID_REPAIR_DESC_IPAD"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("TOUCHID_FOLLOWUP_INFO_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("TOUCHID_POPUP_INFO_IPAD"));
      -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 1);
      v5 = (void *)objc_opt_new();
      v6 = objc_msgSend(v5, "isSupportedIPad");

      if ((v6 & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("TOUCHID_FOLLOWUP_INFO"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("TOUCHID_POPUP_INFO"));
    }
    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 0);
    -[MRBaseComponentHandler setDisplayNotification:](v3, "setDisplayNotification:", 0);
    -[MRBaseComponentHandler setDisplayModalPopup:](v3, "setDisplayModalPopup:", 0);
    -[MRBaseComponentHandler setDisplayFollowup:](v3, "setDisplayFollowup:", 0);
LABEL_7:
    -[MRBaseComponentHandler setComponentForceKey:](v3, "setComponentForceKey:", CFSTR("ForceTouchIDStatus"));
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC81B00;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B49940 != -1)
    dispatch_once(&qword_255B49940, block);
  return (id)qword_255B49938;
}

@end
