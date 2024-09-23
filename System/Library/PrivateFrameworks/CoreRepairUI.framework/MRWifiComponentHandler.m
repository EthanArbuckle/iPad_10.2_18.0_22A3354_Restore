@implementation MRWifiComponentHandler

- (MRWifiComponentHandler)init
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
  MRWifiComponentHandler *v3;
  MRWifiComponentHandler *v4;
  void *v5;
  int v6;
  BOOL v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  MRWifiComponentHandler *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  objc_super v16;
  objc_super v17;

  if (MGGetBoolAnswer())
  {
    v17.receiver = self;
    v17.super_class = (Class)MRWifiComponentHandler;
    v3 = -[MRSystemHealthComponentHandler initWithComponentName:](&v17, sel_initWithComponentName_, CFSTR("WLAN"));
    v4 = v3;
    if (!v3)
      return v4;
    -[MRBaseComponentHandler setComponentName:](v3, "setComponentName:", CFSTR("WLAN"));
    v5 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v4, "setComponentAuthHandler:", v5);

    -[MRBaseComponentHandler setComponentId:](v4, "setComponentId:", 4);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v4, "setPopUpNotificationTitle:", CFSTR("WLAN_FOLLOWUP_TITLE"));
    v6 = -[MRBaseComponentHandler deviceClass](v4, "deviceClass");
    v7 = v6 == 3;
    if (v6 == 3)
      v8 = CFSTR("WLAN_FOLLOWUP_INFO_IPAD");
    else
      v8 = CFSTR("WLAN_FOLLOWUP_INFO");
    v9 = CFSTR("WLAN_POPUP_INFO");
    v10 = CFSTR("WLAN_POPUP_INFO_IPAD");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)MRWifiComponentHandler;
    v11 = -[MRSystemHealthComponentHandler initWithComponentName:](&v16, sel_initWithComponentName_, CFSTR("Wifi"));
    v4 = v11;
    if (!v11)
      return v4;
    -[MRBaseComponentHandler setComponentName:](v11, "setComponentName:", CFSTR("Wifi"));
    v12 = (void *)objc_opt_new();
    -[MRBaseComponentHandler setComponentAuthHandler:](v4, "setComponentAuthHandler:", v12);

    -[MRBaseComponentHandler setComponentId:](v4, "setComponentId:", 4);
    -[MRBaseComponentHandler setPopUpNotificationTitle:](v4, "setPopUpNotificationTitle:", CFSTR("WIFI_FOLLOWUP_TITLE"));
    v13 = -[MRBaseComponentHandler deviceClass](v4, "deviceClass");
    v7 = v13 == 3;
    if (v13 == 3)
      v8 = CFSTR("WIFI_FOLLOWUP_INFO_IPAD");
    else
      v8 = CFSTR("WIFI_FOLLOWUP_INFO");
    v9 = CFSTR("WIFI_POPUP_INFO");
    v10 = CFSTR("WIFI_POPUP_INFO_IPAD");
  }
  if (v7)
    v14 = v10;
  else
    v14 = v9;
  -[MRBaseComponentHandler setFollowUpInfoMessage:](v4, "setFollowUpInfoMessage:", v8);
  -[MRBaseComponentHandler setPopUpNotificationMessage:](v4, "setPopUpNotificationMessage:", v14);
  -[MRBaseComponentHandler setUnlockCheckActivityRequired:](v4, "setUnlockCheckActivityRequired:", 0);
  -[MRBaseComponentHandler setDisplayNotification:](v4, "setDisplayNotification:", 0);
  -[MRBaseComponentHandler setDisplayModalPopup:](v4, "setDisplayModalPopup:", 0);
  -[MRBaseComponentHandler setDisplayFollowup:](v4, "setDisplayFollowup:", 0);
  return v4;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC74498;
  block[3] = &unk_24F4D4948;
  block[4] = a1;
  if (qword_255B498B8 != -1)
    dispatch_once(&qword_255B498B8, block);
  return (id)qword_255B498B0;
}

@end
