@implementation HUComfortSoundsSettings

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (void)setComfortSoundsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("comfortSoundsEnabled"));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_105);
  return (id)sharedInstance_Settings;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return CFSTR("com.apple.ComfortSounds");
}

- (id)keysToSync
{
  return 0;
}

- (BOOL)comfortSoundsEnabled
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("comfortSoundsEnabled"), 0);
}

void __41__HUComfortSoundsSettings_sharedInstance__block_invoke()
{
  HUComfortSoundsSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HUComfortSoundsSettings);
  v1 = (void *)sharedInstance_Settings;
  sharedInstance_Settings = (uint64_t)v0;

}

- (void)reset
{
  -[HCSettings resetValueForSelector:](self, "resetValueForSelector:", sel_comfortSoundsEnabled);
  -[HCSettings resetValueForSelector:](self, "resetValueForSelector:", sel_relativeVolume);
  -[HCSettings resetValueForSelector:](self, "resetValueForSelector:", sel_mediaVolume);
  -[HCSettings resetValueForSelector:](self, "resetValueForSelector:", sel_selectedComfortSound);
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  if (preferenceKeyForSelector__onceToken != -1)
    dispatch_once(&preferenceKeyForSelector__onceToken, &__block_literal_global_115);
  v5 = (void *)preferenceKeyForSelector__SelectorMap;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUComfortSoundsSettings;
    -[HCSettings preferenceKeyForSelector:](&v11, sel_preferenceKeyForSelector_, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

void __52__HUComfortSoundsSettings_preferenceKeyForSelector___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  NSStringFromSelector(sel_selectedComfortSound);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("ComfortSoundsSelectedSound"), v3, 0);
  v2 = (void *)preferenceKeyForSelector__SelectorMap;
  preferenceKeyForSelector__SelectorMap = v1;

}

- (void)logMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsSettings logMessage:]", 267, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (BOOL)mixesWithMedia
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("mixesWithMedia"), 1);
}

- (void)setMixesWithMedia:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("mixesWithMedia"));

}

- (BOOL)stopsOnLock
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("stopsOnLock"), 0);
}

- (void)setStopsOnLock:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("stopsOnLock"));

}

- (double)relativeVolume
{
  double result;

  -[HCSettings cgfloatValueForPreferenceKey:withDefaultValue:](self, "cgfloatValueForPreferenceKey:withDefaultValue:", CFSTR("relativeVolume"), 0.6);
  return result;
}

- (void)setRelativeVolume:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("relativeVolume"));

}

- (double)mediaVolume
{
  double result;

  -[HCSettings cgfloatValueForPreferenceKey:withDefaultValue:](self, "cgfloatValueForPreferenceKey:withDefaultValue:", CFSTR("mediaVolume"), 0.2);
  return result;
}

- (void)setMediaVolume:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("mediaVolume"));

}

- (double)lastEnablementTimestamp
{
  double result;

  -[HCSettings cgfloatValueForPreferenceKey:withDefaultValue:](self, "cgfloatValueForPreferenceKey:withDefaultValue:", CFSTR("lastEnablementTimestamp"), 0.0);
  return result;
}

- (void)setLastEnablementTimestamp:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("lastEnablementTimestamp"));

}

- (BOOL)forceMixingBehavior
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("forceMixingBehavior"), 0);
}

- (void)setForceMixingBehavior:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("forceMixingBehavior"));

}

- (HUComfortSound)selectedComfortSound
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("ComfortSoundsSelectedSound"), objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v2, v8);
  v4 = v8[0];
  if (v4
    || (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0CB2CD0]),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v5))
  {
    +[HUComfortSound defaultComfortSoundForGroup:](HUComfortSound, "defaultComfortSoundForGroup:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (HUComfortSound *)v5;
}

- (void)setSelectedComfortSound:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v5, "encodeObject:forKey:", v4, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v5, "finishEncoding");
    objc_msgSend(v5, "encodedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[HUComfortSoundsSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v6, CFSTR("ComfortSoundsSelectedSound"));

}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _Unwind_Exception *ADAFMetadataKeyHAEDataForGauge_cold_1;
  objc_super v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("comfortSoundsEnabled")))
  {
    if (setValue_forPreferenceKey__sOnce != -1)
      dispatch_once(&setValue_forPreferenceKey__sOnce, &__block_literal_global_150);
    if (setValue_forPreferenceKey__HasFunction)
    {
      AXLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_INFO, "Updating accessibility enabled for BG Sounds", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      v14 = buf;
      v15 = 0x2020000000;
      v9 = get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr;
      v16 = get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr;
      if (!get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr)
      {
        v10 = (void *)libAccessibilityLibrary();
        v9 = dlsym(v10, "_AXSUpdateAccessibilityEnabled");
        *((_QWORD *)v14 + 3) = v9;
        get_AXSUpdateAccessibilityEnabledSymbolLoc_ptr = v9;
      }
      _Block_object_dispose(buf, 8);
      if (!v9)
      {
        ADAFMetadataKeyHAEDataForGauge_cold_1 = (_Unwind_Exception *)getADAFMetadataKeyHAEDataForGauge_cold_1();
        _Block_object_dispose(buf, 8);
        _Unwind_Resume(ADAFMetadataKeyHAEDataForGauge_cold_1);
      }
      ((void (*)(void))v9)();
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)HUComfortSoundsSettings;
  -[HCSettings setValue:forPreferenceKey:](&v12, sel_setValue_forPreferenceKey_, v6, v7);

}

uint64_t __53__HUComfortSoundsSettings_setValue_forPreferenceKey___block_invoke()
{
  uint64_t result;
  void *v1;
  BOOL v2;

  result = libAccessibilityLibrary();
  if (result)
  {
    v1 = (void *)libAccessibilityLibrary();
    result = (uint64_t)dlsym(v1, "_AXSUpdateAccessibilityEnabled");
    v2 = result != 0;
  }
  else
  {
    v2 = 0;
  }
  setValue_forPreferenceKey__HasFunction = v2;
  return result;
}

- (BOOL)comfortSoundsAvailable
{
  return _os_feature_enabled_impl();
}

@end
