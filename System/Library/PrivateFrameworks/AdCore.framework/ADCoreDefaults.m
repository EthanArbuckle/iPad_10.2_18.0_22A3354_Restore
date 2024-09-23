@implementation ADCoreDefaults

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ADCoreDefaults _setDefaultValue:forKey:](self, "_setDefaultValue:forKey:", v8, v7);

}

- (void)_setDefaultValue:(id)a3 forKey:(id)a4
{
  __CFString *v5;
  id v6;
  CFStringRef *v7;
  CFStringRef *v8;

  v5 = (__CFString *)a4;
  v6 = a3;
  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v7 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v5, v6, v7[2]);

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v8 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  CFPreferencesAppSynchronize(v8[2]);

}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ADCoreDefaults _defaultValueForKey:valueClass:](self, "_defaultValueForKey:valueClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ADCoreDefaults _defaultValueForKey:valueClass:](self, "_defaultValueForKey:valueClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultValueForKey:(id)a3 valueClass:(Class)a4
{
  __CFString *v4;
  CFStringRef *v5;
  void *v6;
  id *v7;

  v4 = (__CFString *)a3;
  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v5 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)CFPreferencesCopyAppValue(v4, v5[2]);

  if (!v6)
  {
    +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7[1], "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }

  return v6;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ADCoreDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __32__ADCoreDefaults_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___ADCoreDefaults;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v1;

}

- (ADCoreDefaults)init
{
  ADCoreDefaults *v2;
  uint64_t v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  id *v7;
  id v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id *v20;
  int out_token;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ADCoreDefaults;
  v2 = -[ADCoreDefaults init](&v22, sel_init);
  if (v2)
  {
    v3 = CPCopySharedResourcesPreferencesDomainForDomain();
    v2->_defaultsBundleID = (__CFString *)v3;
    if (!v3)
      abort();
    out_token = 0;
    v4 = dispatch_queue_create("com.apple.adPlatforms.AdCoreNotificationQueue", 0);
    v5 = (void *)_AdCoreNotificationQueue;
    _AdCoreNotificationQueue = (uint64_t)v4;

    v6 = _AdCoreNotificationQueue;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __22__ADCoreDefaults_init__block_invoke;
    v19 = &unk_1E82B25C0;
    v7 = v2;
    v20 = v7;
    notify_register_dispatch("com.apple.iad.defaultsDidChange", &out_token, v6, &v16);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = v7[1];
    v7[1] = v8;

    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &unk_1E82BE950, CFSTR("ServerRetryBackoffGain"), v16, v17, v18, v19);
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &unk_1E82BEDD0, CFSTR("LocationGridSpacing"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("https://iadsdk.apple.com/adserver"), CFSTR("AdServerURL"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("https://cf.iadsdk.apple.com/adserver"), CFSTR("ConfigurationAdServerURL"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("https://ut.iadsdk.apple.com/adserver"), CFSTR("TargetingAdServerURL"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &unk_1E82BE968, CFSTR("adprivacydSegmentInterval"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &unk_1E82BE980, CFSTR("adprivacydMaxSegmentSendInterval"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("StocksEnabled"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("https://partiality.itunes.apple.com/WebObjects/MZPartiality.woa/wa/IAD/segment"), CFSTR("partiality-segment"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("https://partiality.itunes.apple.com/WebObjects/MZPartiality.woa/wa/IAD/optIn"), CFSTR("partiality-opt-in"));
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("https://partiality.itunes.apple.com/WebObjects/MZPartiality.woa/wa/IAD/optOut"), CFSTR("partiality-opt-out"));
    v10 = MGGetBoolAnswer();
    v11 = v7[1];
    if (v10)
    {
      v12 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("EnableRequestedTemplate"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("http://vp25q03ad-app037.iad.apple.com:7888"), CFSTR("contentProxyServerURL"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &stru_1E82B34E8, CFSTR("ToroAlgoID"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("none"), CFSTR("ToroRequestedText"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("regular"), CFSTR("ToroRequestedIcon"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("regular"), CFSTR("ToroTemplateType"));
      v13 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ToroTestClient"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", v12, CFSTR("ForceNonAdLocale"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", v12, CFSTR("ForceSegmentDataRetrieval"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", v12, CFSTR("adprivacydSimulateCrashOnLateXPC"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &unk_1E82BE998, CFSTR("adprivacydLateXPCIntervalSeconds"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", v12, CFSTR("iAdAttributionOverridesEnabled"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", v12, CFSTR("iAdAttributionSendTrue"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", v13, CFSTR("iAdAttributionSendClickTime"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &stru_1E82B34E8, CFSTR("AttributionClickTimeOverride"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", v13, CFSTR("iAdAttributionSendMetadata"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &stru_1E82B34E8, CFSTR("AttributionClickMetadataOverride"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &stru_1E82B34E8, CFSTR("DeviceKnowledgeScheduleOverride"));
      v14 = CFSTR("adForceConsumerStatus");
    }
    else
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("https://iadsdk.apple.com/adserver"), CFSTR("AdServerURL"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("https://cf.iadsdk.apple.com/adserver"), CFSTR("ConfigurationAdServerURL"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("http://vp25q03ad-app037.iad.apple.com:7888"), CFSTR("contentProxyServerURL"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", &unk_1E82BEDE0, CFSTR("AppDeveloperAdFillRate"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("none"), CFSTR("ToroRequestedText"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("regular"), CFSTR("ToroRequestedIcon"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("regular"), CFSTR("ToroTemplateType"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("adprivacydSegmentIntervalOverride"));
      objc_msgSend(v7[1], "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("adprivacydMaxSegmentSendIntervalOverride"));
      v14 = CFSTR("iAdAttributionOverridesEnabled");
    }
    objc_msgSend(v7[1], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v14);

  }
  return v2;
}

uint64_t __22__ADCoreDefaults_init__block_invoke(uint64_t a1)
{
  return CFPreferencesAppSynchronize((CFStringRef)objc_msgSend(*(id *)(a1 + 32), "defaultsBundleID"));
}

+ (void)addFactoryDefaults:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4[1], "addEntriesFromDictionary:", v3);

}

+ (id)factoryDefaults
{
  id *v2;
  void *v3;

  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2[1], "copy");

  return v3;
}

- (BOOL)defaultIsSetForKey:(id)a3
{
  __CFString *v3;
  CFStringRef *v4;
  void *v5;
  id *v6;

  v3 = (__CFString *)a3;
  +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
  v4 = (CFStringRef *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CFPreferencesCopyAppValue(v3, v4[2]);

  if (!v5)
  {
    +[ADCoreDefaults sharedInstance](ADCoreDefaults, "sharedInstance");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6[1], "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5 != 0;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[ADCoreDefaults _defaultValueForKey:valueClass:](self, "_defaultValueForKey:valueClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ADCoreDefaults _setDefaultValue:forKey:](self, "_setDefaultValue:forKey:", v8, v7);

}

- (double)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[ADCoreDefaults _defaultValueForKey:valueClass:](self, "_defaultValueForKey:valueClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ADCoreDefaults _setDefaultValue:forKey:](self, "_setDefaultValue:forKey:", v8, v7);

}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ADCoreDefaults _defaultValueForKey:valueClass:](self, "_defaultValueForKey:valueClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableDictionary)factoryDefaults
{
  return self->_factoryDefaults;
}

- (void)setFactoryDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_factoryDefaults, a3);
}

- (__CFString)defaultsBundleID
{
  return self->_defaultsBundleID;
}

- (void)setDefaultsBundleID:(__CFString *)a3
{
  self->_defaultsBundleID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoryDefaults, 0);
}

@end
