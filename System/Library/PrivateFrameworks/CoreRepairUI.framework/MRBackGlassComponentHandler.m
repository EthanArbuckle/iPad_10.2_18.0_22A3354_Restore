@implementation MRBackGlassComponentHandler

- (id)_init
{
  MRBackGlassComponentHandler *v2;
  MRBackGlassComponentHandler *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRBackGlassComponentHandler;
  v2 = -[MRSystemHealthComponentHandler initWithComponentName:](&v6, sel_initWithComponentName_, CFSTR("BackGlass"));
  v3 = v2;
  if (v2)
  {
    -[MRBaseComponentHandler setComponentName:](v2, "setComponentName:", CFSTR("BackGlass"));
    v4 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v3, "setComponentAuthHandler:", v4);

    -[MRBaseComponentHandler setComponentId:](v3, "setComponentId:", 13);
    -[MRBaseComponentHandler setSupportsRepair:](v3, "setSupportsRepair:", 1);
    -[MRBaseComponentHandler setFinishRepairTitle:](v3, "setFinishRepairTitle:", CFSTR("FINISH_BG_REPAIR_TITLE"));
    -[MRBaseComponentHandler setFinishRepairMessage:](v3, "setFinishRepairMessage:", CFSTR("FINISH_BG_REPAIR_DESC"));
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v3, "setPopUpNotificationTitle:", CFSTR("BG_FOLLOWUP_TITLE"));
    -[MRBaseComponentHandler setFollowUpInfoMessage:](v3, "setFollowUpInfoMessage:", CFSTR("BG_FOLLOWUP_INFO"));
    -[MRBaseComponentHandler setPopUpNotificationMessage:](v3, "setPopUpNotificationMessage:", CFSTR("BG_POPUP_INFO"));
    -[MRBaseComponentHandler setComponentForceKey:](v3, "setComponentForceKey:", CFSTR("ForceBackGlassStatus"));
    -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v3, "setUnlockCheckActivityRequired:", 1);
  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC81888;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B49930 != -1)
    dispatch_once(&qword_255B49930, block);
  return (id)qword_255B49928;
}

@end
