@implementation CHUISPreferences

+ (CHUISPreferences)sharedInstance
{
  if (sharedInstance___once_0 != -1)
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_1);
  return (CHUISPreferences *)(id)sharedInstance___instance;
}

void __34__CHUISPreferences_sharedInstance__block_invoke()
{
  CHUISPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(CHUISPreferences);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (CHUISPreferences)init
{
  CHUISPreferences *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHUISPreferences;
  v2 = -[CHUISPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.chronod"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v2->_enableMemoryStressTestingWithGaspar = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", CFSTR("EnableMemoryStressTestingWithGaspar"));
    v2->_debugViewLabels = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", CFSTR("EnableDebugLabels"));
    v2->_debugSnapshotViewColoring = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", CFSTR("debugSnapshotViewClient"));
    v2->_debugPrefersStaticSnapshots = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", CFSTR("debugPreferStaticClientSnapshots"));
    v2->_widgetRenderer = (NSString *)-[NSUserDefaults stringForKey:](v2->_defaults, "stringForKey:", CFSTR("widgetRenderer"));
    -[NSUserDefaults registerDefaults:](v2->_defaults, "registerDefaults:", &unk_1E6B92810);
    v2->_userWantsWidgetDataWhenPasscodeLocked = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", CFSTR("showComplicationDataWhenPasscodeLocked"));
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_defaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("showComplicationDataWhenPasscodeLocked"), 1, CFSTR("_userWantsWidgetDataWhenPasscodeLocked"));
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == CFSTR("_userWantsWidgetDataWhenPasscodeLocked")
    && (objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB0]),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "intValue"),
        v14,
        v15 == 1))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_userWantsWidgetDataWhenPasscodeLocked = objc_msgSend(v16, "BOOLValue");

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CHUISPreferences;
    -[CHUISPreferences observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v13, a6);
  }

}

- (BOOL)enableMemoryStressTestingWithGaspar
{
  return self->_enableMemoryStressTestingWithGaspar;
}

- (BOOL)debugViewLabels
{
  return self->_debugViewLabels;
}

- (BOOL)debugSnapshotViewColoring
{
  return self->_debugSnapshotViewColoring;
}

- (BOOL)debugPrefersStaticSnapshots
{
  return self->_debugPrefersStaticSnapshots;
}

- (NSString)widgetRenderer
{
  return self->_widgetRenderer;
}

- (BOOL)userWantsWidgetDataWhenPasscodeLocked
{
  return self->_userWantsWidgetDataWhenPasscodeLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
