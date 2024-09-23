@implementation MRFaceIDComponentHandler

- (id)_init
{
  MRFaceIDComponentHandler *v2;
  MRFaceIDComponentHandler *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRFaceIDComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v8, sel_initWithComponentName_, CFSTR("FaceID"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("FaceID"));
    v4 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 10);
    -[MRBaseComponentHandler setSupportsRepair:](v3, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setFinishRepairTitle:](v3, "setFinishRepairTitle:", CFSTR("FINISH_FACEID_REPAIR_TITLE"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("FACEID_FOLLOWUP_TITLE"));
    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 1);
    if (-[MRBaseComponentHandler deviceClass](v3, "deviceClass") == 3)
    {
      -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_FACEID_REPAIR_DESC_IPAD"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("FACEID_FOLLOWUP_INFO_IPAD"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("FACEID_POPUP_INFO_IPAD"));
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
      -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_FACEID_REPAIR_DESC"));
      -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("FACEID_FOLLOWUP_INFO"));
      -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("FACEID_POPUP_INFO"));
    }
    -[MRBaseComponentHandler setComponentForceKey:](v3, "setComponentForceKey:", CFSTR("ForceFaceIDStatus"));
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC81D88;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B49950 != -1)
    dispatch_once(&qword_255B49950, block);
  return (id)qword_255B49948;
}

+ (void)handleSUCase
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:", CFSTR("hasDisplayedFollowupForSHCFaceID"), CFSTR("LastFaceIDAuthCompleteBuildVersion"), CFSTR("com.apple.mobilerepair.FaceIDRepair"), CFSTR("FaceID"), CFSTR("SUcaseForFaceID"), CFSTR("19F1"), v3);

}

@end
