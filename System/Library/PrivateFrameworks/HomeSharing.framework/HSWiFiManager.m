@implementation HSWiFiManager

- (HSWiFiManager)init
{
  HSWiFiManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  const __CFString *v5;
  const __SCPreferences *v6;
  const __SCPreferences *wifiPreferences;
  __CFRunLoop *Main;
  void *v9;
  HSWiFiManager *v10;
  SCPreferencesContext v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HSWiFiManager;
  v2 = -[HSWiFiManager init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.amp.HomeSharing.HSWiFiManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = -[HSWiFiManager _processIdentifier](v2, "_processIdentifier");
    v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, CFSTR("com.apple.wifi.plist"));
    v2->_wifiPreferences = v6;
    v12.version = 0;
    memset(&v12.retain, 0, 24);
    v12.info = v2;
    SCPreferencesSetCallback(v6, (SCPreferencesCallBack)_WiFiCallBack, &v12);
    wifiPreferences = v2->_wifiPreferences;
    Main = CFRunLoopGetMain();
    SCPreferencesScheduleWithRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x24BDBD598]);
    v2->_wiFiEnabled = -[HSWiFiManager _getWiFiEnabledFromPrefs](v2, "_getWiFiEnabledFromPrefs");
    v2->_wiFiAssociated = 1;
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v2);

    v10 = v2;
  }

  return v2;
}

- (void)dealloc
{
  __SCPreferences *wifiPreferences;
  __CFRunLoop *Main;
  objc_super v5;

  wifiPreferences = self->_wifiPreferences;
  Main = CFRunLoopGetMain();
  SCPreferencesUnscheduleFromRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x24BDBD598]);
  CFRelease(self->_wifiPreferences);
  v5.receiver = self;
  v5.super_class = (Class)HSWiFiManager;
  -[HSWiFiManager dealloc](&v5, sel_dealloc);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  -[HSWiFiManager _wifiCallBack:](self, "_wifiCallBack:", 1);
}

- (id)_processIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  const char *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = getprogname();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s (%d)"), v5, getpid());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_getWiFiEnabledFromPrefs
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__HSWiFiManager__getWiFiEnabledFromPrefs__block_invoke;
  v5[3] = &unk_24C364D38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_getWiFiAssociated
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiAssociated");

  return v3;
}

- (void)_wifiCallBack:(unsigned int)a3
{
  char v3;
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v3 = a3;
  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[HSWiFiManager _getWiFiEnabledFromPrefs](self, "_getWiFiEnabledFromPrefs");
  v6 = -[HSWiFiManager _getWiFiAssociated](self, "_getWiFiAssociated");
  if ((v3 & 1) != 0)
  {
    v7 = v6;
    if (v5 != -[HSWiFiManager isWiFiEnabled](self, "isWiFiEnabled")
      || v7 != -[HSWiFiManager isWiFiAssociated](self, "isWiFiAssociated"))
    {
      -[HSWiFiManager setWiFiEnabled:](self, "setWiFiEnabled:", v5);
      -[HSWiFiManager setWiFiAssociated:](self, "setWiFiAssociated:", v7);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HSWiFiManager isWiFiEnabled](self, "isWiFiEnabled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v8;
      v13[0] = CFSTR("HSWiFiManagerWiFiEnabledUserInfoKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HSWiFiManager isWiFiAssociated](self, "isWiFiAssociated"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v9;
      v13[1] = CFSTR("HSWiFiManagerWiFiAssociatedUserInfoKey");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("HSWiFiManagerWiFiDidChangeNotification"), self, v10);

    }
  }
}

- (BOOL)isWiFiEnabled
{
  return self->_wiFiEnabled;
}

- (void)setWiFiEnabled:(BOOL)a3
{
  self->_wiFiEnabled = a3;
}

- (BOOL)isWiFiAssociated
{
  return self->_wiFiAssociated;
}

- (void)setWiFiAssociated:(BOOL)a3
{
  self->_wiFiAssociated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __41__HSWiFiManager__getWiFiEnabledFromPrefs__block_invoke(uint64_t a1)
{
  const __CFBoolean *Value;
  const __CFBoolean *v3;
  CFTypeID v4;
  CFTypeID v5;

  Value = (const __CFBoolean *)SCPreferencesGetValue(*(SCPreferencesRef *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("AllowEnable"));
  if (Value)
  {
    v3 = Value;
    v4 = CFGetTypeID(Value);
    if (v4 == CFNumberGetTypeID() || (v5 = CFGetTypeID(v3), v5 == CFBooleanGetTypeID()))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFBooleanGetValue(v3) != 0;
  }
  SCPreferencesSynchronize(*(SCPreferencesRef *)(*(_QWORD *)(a1 + 32) + 8));
}

+ (id)sharedWiFiManager
{
  if (sharedWiFiManager_onceToken != -1)
    dispatch_once(&sharedWiFiManager_onceToken, &__block_literal_global_1080);
  return (id)sharedWiFiManager_sharedWiFiManager;
}

void __34__HSWiFiManager_sharedWiFiManager__block_invoke()
{
  HSWiFiManager *v0;
  void *v1;

  v0 = objc_alloc_init(HSWiFiManager);
  v1 = (void *)sharedWiFiManager_sharedWiFiManager;
  sharedWiFiManager_sharedWiFiManager = (uint64_t)v0;

}

@end
