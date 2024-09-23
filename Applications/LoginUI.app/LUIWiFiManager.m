@implementation LUIWiFiManager

+ (id)sharedInstance
{
  if (qword_100088E48 != -1)
    dispatch_once(&qword_100088E48, &stru_100069C38);
  return (id)qword_100088E40;
}

- (LUIWiFiManager)init
{
  LUIWiFiManager *v2;
  uint64_t v3;
  uint64_t v4;
  CFRunLoopRef Main;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LUIWiFiManager;
  v2 = -[LUIWiFiManager init](&v7, "init");
  if (v2)
  {
    v3 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    v2->mWiFiManager = (__WiFiManagerClient *)v3;
    if (v3)
    {
      v4 = v3;
      Main = CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop(v4, Main, kCFRunLoopDefaultMode);
      WiFiManagerClientSetType(v2->mWiFiManager, 2);
      WiFiManagerClientRegisterServerRestartCallback(v2->mWiFiManager, sub_10002BDA0, v2);
    }
  }
  return v2;
}

- (void)dealloc
{
  __WiFiManagerClient *mWiFiManager;
  CFRunLoopRef Main;
  objc_super v5;

  mWiFiManager = self->mWiFiManager;
  if (mWiFiManager)
  {
    Main = CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop(mWiFiManager, Main, kCFRunLoopDefaultMode);
    CFRelease(self->mWiFiManager);
    self->mWiFiManager = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)LUIWiFiManager;
  -[LUIWiFiManager dealloc](&v5, "dealloc");
}

- (void)enableWiFi
{
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v3 = qword_100088F10;
  if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling WiFi", buf, 2u);
  }
  v4 = (void *)WiFiManagerClientCopyProperty(self->mWiFiManager, CFSTR("AllowEnable"));
  v5 = objc_msgSend(v4, "BOOLValue");
  if (v4)
    CFRelease(v4);
  if ((v5 & 1) == 0)
  {
    v6 = qword_100088F10;
    if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiFi is not enabled; overriding....", v18, 2u);
    }
    if (!WiFiManagerClientSetProperty(self->mWiFiManager, CFSTR("AllowEnable"), kCFBooleanTrue))
    {
      v7 = qword_100088F10;
      if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to re-enable WiFi", v17, 2u);
      }
    }
  }
  v8 = qword_100088F10;
  if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Powering on WiFi....", v16, 2u);
  }
  WiFiManagerClientSetPower(self->mWiFiManager, 1);
  v9 = kWiFiManagerDisableBlackListKey;
  v10 = (void *)WiFiManagerClientCopyProperty(self->mWiFiManager, kWiFiManagerDisableBlackListKey);
  if (v10
    && ((v11 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v10, v11) & 1) == 0)
     || (objc_msgSend(v10, "BOOLValue") & 1) != 0))
  {
    v12 = qword_100088F10;
    if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEBUG))
      sub_10003C848((uint64_t)v10, v12);
  }
  else
  {
    v13 = qword_100088F10;
    if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEBUG))
      sub_10003C808(v13);
    WiFiManagerClientSetProperty(self->mWiFiManager, v9, kCFBooleanTrue);
  }
  v14 = qword_100088F10;
  if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Enabling Auto-Join state", v15, 2u);
  }
  WiFiManagerClientEnableUserAutoJoin(self->mWiFiManager);

}

- (void)showWiFiPicker
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LUIPopUpController sharedInstance](LUIPopUpController, "sharedInstance"));
  objc_msgSend(v2, "showPopUp:forUser:completionHandler:", 0, 0, 0);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  objc_msgSend(*a5, "frame", a3);
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

@end
