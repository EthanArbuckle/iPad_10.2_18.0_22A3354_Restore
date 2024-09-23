@implementation HPSHeadphoneManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (id)sharedInstance__sharedInstance;
}

void __37__HPSHeadphoneManager_sharedInstance__block_invoke()
{
  HPSHeadphoneManager *v0;
  void *v1;

  v0 = objc_alloc_init(HPSHeadphoneManager);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (HPSHeadphoneManager)init
{
  HPSHeadphoneManager *v2;
  void *v3;
  uint64_t v4;
  NSHashTable *weakHashTbl;
  uint64_t v6;
  NSUserDefaults *defaults;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HPSHeadphoneManager;
  v2 = -[HPSHeadphoneManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D289E0], "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTopLevelUIHandler:", v2);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    weakHashTbl = v2->_weakHashTbl;
    v2->_weakHashTbl = (NSHashTable *)v4;

    v2->_ffValue = _os_feature_enabled_impl();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.settings.headphone.HeadphoneManager.Mock"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v6;

  }
  return v2;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HPSHeadphoneManager weakHashTbl](self, "weakHashTbl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)isFeatureEnabled
{
  return self->_ffValue;
}

- (BOOL)allowReplayAccessory
{
  void *v3;
  BOOL v4;

  if (!os_variant_has_internal_ui())
    return 0;
  -[NSUserDefaults valueForKey:](self->_defaults, "valueForKey:", CFSTR("root"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)updateHPSDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HPSHeadphoneManager allDevicesEverConnected](HPSHeadphoneManager, "allDevicesEverConnected");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasBackend") & 1) == 0)
  {

    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Connected Headphones: updateHPSDevice device not conncted", (uint8_t *)&v12, 2u);
    }

    v7 = 0;
  }
  objc_msgSend(v3, "setHeadphoneDevice:", v7);
  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[HPSHeadphoneManager allDevicesEverConnected](HPSHeadphoneManager, "allDevicesEverConnected");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "headphoneDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "Connected Headphones: updateHPSDevice %@ %@ %@", (uint8_t *)&v12, 0x20u);

  }
}

- (id)weakHashTblCopy
{
  return (id)-[NSHashTable copy](self->_weakHashTbl, "copy");
}

- (NSHashTable)weakHashTbl
{
  return self->_weakHashTbl;
}

- (void)setWeakHashTbl:(id)a3
{
  objc_storeStrong((id *)&self->_weakHashTbl, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_weakHashTbl, 0);
}

+ (NSDictionary)allDevicesEverConnected
{
  void *v2;

  if (qword_1F02DD820 != -1)
    swift_once();
  swift_beginAccess();
  sub_1DB3BBF68();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DB3BC2EC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

+ (void)setAllDevicesEverConnected:(id)a3
{
  uint64_t v3;

  sub_1DB3BBF68();
  v3 = sub_1DB3BC2F8();
  if (qword_1F02DD820 != -1)
    swift_once();
  swift_beginAccess();
  qword_1F02DB0D8 = v3;
  swift_bridgeObjectRelease();
}

- (void)addTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  HPSHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  HPSHeadphoneManager.addTopLevelEntry(hpDevice:)(v4);

}

- (void)updateTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  HPSHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  HPSHeadphoneManager.updateTopLevelEntry(hpDevice:)(v4);

}

- (void)removeTopLevelEntryWithHpDevice:(id)a3
{
  id v4;
  HPSHeadphoneManager *v5;

  v4 = a3;
  v5 = self;
  HPSHeadphoneManager.removeTopLevelEntry(hpDevice:)(v4);

}

@end
