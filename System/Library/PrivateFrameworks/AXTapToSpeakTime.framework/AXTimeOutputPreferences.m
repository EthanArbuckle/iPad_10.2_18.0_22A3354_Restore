@implementation AXTimeOutputPreferences

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_TimeOutputPreferences;
}

id __41__AXTimeOutputPreferences_sharedInstance__block_invoke()
{
  AXTimeOutputPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(AXTimeOutputPreferences);
  v1 = (void *)sharedInstance_TimeOutputPreferences;
  sharedInstance_TimeOutputPreferences = (uint64_t)v0;

  return (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
}

- (id)accessibilityDomainAccessor
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BE6B2C0]);
  return (id)objc_msgSend(v2, "initWithDomain:", *MEMORY[0x24BED26B8]);
}

- (id)_npsValueForPreferenceKey:(id)a3
{
  return -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:](self, "_npsValueForPreferenceKey:expectedClass:", a3, 0);
}

- (id)_npsValueForPreferenceKey:(id)a3 expectedClass:(Class)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;

  v6 = a3;
  if (v6)
  {
    -[AXTimeOutputPreferences accessibilityDomainAccessor](self, "accessibilityDomainAccessor");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (id)-[NSObject synchronize](v7, "synchronize");
    -[NSObject objectForKey:](v7, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (a4 && v9 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      AXLogTapticTime();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:].cold.2((uint64_t)v10, a4, v12);

      v11 = 0;
    }
    else
    {
      v11 = v10;
    }

  }
  else
  {
    AXLogTapticTime();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:].cold.1();
    v11 = 0;
  }

  return v11;
}

- (void)_setNPSValue:(id)a3 preferenceKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[AXTimeOutputPreferences accessibilityDomainAccessor](self, "accessibilityDomainAccessor");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      -[NSObject domain](v8, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        -[NSObject setObject:forKey:](v9, "setObject:forKey:", v6, v7);
        v12 = (id)-[NSObject synchronize](v9, "synchronize");
        v13 = objc_opt_new();
        -[NSObject domain](v9, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BDBCF20];
        v18[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setWithArray:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject synchronizeNanoDomain:keys:](v13, "synchronizeNanoDomain:keys:", v14, v17);

      }
      else
      {
        AXLogTapticTime();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[AXTimeOutputPreferences _setNPSValue:preferenceKey:].cold.3();
      }
    }
    else
    {
      AXLogTapticTime();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[AXTimeOutputPreferences _setNPSValue:preferenceKey:].cold.2();
    }

  }
  else
  {
    AXLogTapticTime();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:].cold.1();
  }

}

- (BOOL)_npsBoolValueForPreferenceKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;

  -[AXTimeOutputPreferences _npsValueForPreferenceKey:](self, "_npsValueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (int64_t)_npsIntegerValueForPreferenceKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;

  -[AXTimeOutputPreferences _npsValueForPreferenceKey:](self, "_npsValueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (BOOL)_voiceOverIsEnabled
{
  return -[AXTimeOutputPreferences _npsBoolValueForPreferenceKey:defaultValue:](self, "_npsBoolValueForPreferenceKey:defaultValue:", *MEMORY[0x24BED2978], 0);
}

- (BOOL)_voiceOverIsInTripleClick
{
  void *v2;
  BOOL v3;

  -[AXTimeOutputPreferences _npsValueForPreferenceKey:expectedClass:](self, "_npsValueForPreferenceKey:expectedClass:", CFSTR("TripleClickOptions"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = _AXSTripleClickContainsOption() != 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)tapToSpeakTimeEnabled
{
  AXTimeOutputPreferences *v2;
  void *v3;

  v2 = self;
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_tapToSpeakTimeEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[AXTimeOutputPreferences _npsBoolValueForPreferenceKey:defaultValue:](v2, "_npsBoolValueForPreferenceKey:defaultValue:", v3, *MEMORY[0x24BDFE340]);

  return (char)v2;
}

- (void)setTapToSpeakTimeEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_tapToSpeakTimeEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences _setNPSValue:preferenceKey:](self, "_setNPSValue:preferenceKey:", v5, v4);

}

- (int64_t)tapToSpeakTimeAvailability
{
  void *v3;
  int64_t v4;

  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_tapToSpeakTimeAvailability);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXTimeOutputPreferences _npsIntegerValueForPreferenceKey:defaultValue:](self, "_npsIntegerValueForPreferenceKey:defaultValue:", v3, *MEMORY[0x24BDFE338]);

  return v4;
}

- (void)setTapToSpeakTimeAvailability:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_tapToSpeakTimeAvailability);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences _setNPSValue:preferenceKey:](self, "_setNPSValue:preferenceKey:", v5, v4);

}

- (BOOL)voiceOverTapticTimeMode
{
  void *v3;
  void *v4;
  BOOL v5;

  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticTimeMode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[AXTimeOutputPreferences _voiceOverIsEnabled](self, "_voiceOverIsEnabled")
    || (-[AXTimeOutputPreferences _npsValueForPreferenceKey:](self, "_npsValueForPreferenceKey:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = *MEMORY[0x24BDFE358] != 0,
        v4,
        v4))
  {
    v5 = -[AXTimeOutputPreferences _npsBoolValueForPreferenceKey:defaultValue:](self, "_npsBoolValueForPreferenceKey:defaultValue:", v3, *MEMORY[0x24BDFE350]);
  }

  return v5;
}

- (void)setVoiceOverTapticTimeMode:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticTimeMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences _setNPSValue:preferenceKey:](self, "_setNPSValue:preferenceKey:", v5, v4);

}

- (int64_t)voiceOverTapticTimeEncoding
{
  void *v3;
  int64_t v4;

  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticTimeEncoding);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXTimeOutputPreferences _npsIntegerValueForPreferenceKey:defaultValue:](self, "_npsIntegerValueForPreferenceKey:defaultValue:", v3, *MEMORY[0x24BDFE378]);

  return v4;
}

- (void)setVoiceOverTapticTimeEncoding:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticTimeEncoding);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences _setNPSValue:preferenceKey:](self, "_setNPSValue:preferenceKey:", v5, v4);

}

- (BOOL)voiceOverTapticChimesEnabled
{
  AXTimeOutputPreferences *v2;
  void *v3;

  v2 = self;
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticChimesEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[AXTimeOutputPreferences _npsBoolValueForPreferenceKey:defaultValue:](v2, "_npsBoolValueForPreferenceKey:defaultValue:", v3, *MEMORY[0x24BDFE348]);

  return (char)v2;
}

- (void)setVoiceOverTapticChimesEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticChimesEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences _setNPSValue:preferenceKey:](self, "_setNPSValue:preferenceKey:", v5, v4);

}

- (int64_t)voiceOverTapticChimesFrequencyEncoding
{
  void *v3;
  int64_t v4;

  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticChimesFrequencyEncoding);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXTimeOutputPreferences _npsIntegerValueForPreferenceKey:defaultValue:](self, "_npsIntegerValueForPreferenceKey:defaultValue:", v3, *MEMORY[0x24BDFE360]);

  return v4;
}

- (void)setVoiceOverTapticChimesFrequencyEncoding:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticChimesFrequencyEncoding);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences _setNPSValue:preferenceKey:](self, "_setNPSValue:preferenceKey:", v5, v4);

}

- (int64_t)voiceOverTapticChimesSoundType
{
  void *v3;
  int64_t v4;

  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticChimesSoundType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXTimeOutputPreferences _npsIntegerValueForPreferenceKey:defaultValue:](self, "_npsIntegerValueForPreferenceKey:defaultValue:", v3, *MEMORY[0x24BDFE368]);

  return v4;
}

- (void)setVoiceOverTapticChimesSoundType:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", sel_voiceOverTapticChimesSoundType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences _setNPSValue:preferenceKey:](self, "_setNPSValue:preferenceKey:", v5, v4);

}

- (id)tapticChimesFrequencyOptions
{
  return &unk_24EF505F0;
}

- (id)tapticChimesSoundsOptions
{
  return &unk_24EF50608;
}

- (id)tapToSpeakAvailabilityOptions
{
  return &unk_24EF50620;
}

- (id)tapticTimeEncodingOptions
{
  return &unk_24EF50638;
}

- (id)localizedStringForKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = localizedStringForKey__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&localizedStringForKey__onceToken, &__block_literal_global_205);
  objc_msgSend((id)localizedStringForKey___Bundle, "localizedStringForKey:value:table:", v4, 0, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __49__AXTimeOutputPreferences_localizedStringForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)localizedStringForKey___Bundle;
  localizedStringForKey___Bundle = v0;

}

- (id)tapticChimesLocalizedTitle
{
  return -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAPTIC_CHIMES_TITLE"));
}

- (id)tapticChimesLocalizedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "voiceOverTapticChimesFrequencyEncoding");

  if ((unint64_t)(v4 - 1) <= 2)
  {
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", off_24EF4E740[v4 - 1]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)tapticChimesLocalizedCurrentFrequency
{
  void *v3;
  void *v4;

  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences localizedStringForTapticChimesFrequencyEncoding:](self, "localizedStringForTapticChimesFrequencyEncoding:", objc_msgSend(v3, "voiceOverTapticChimesFrequencyEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tapticChimesLocalizedCurrentSounds
{
  void *v3;
  void *v4;

  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences localizedStringForTapticChimesSoundType:](self, "localizedStringForTapticChimesSoundType:", objc_msgSend(v3, "voiceOverTapticChimesSoundType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tapticChimesScheduleLocalizedTitle
{
  return -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAPTIC_CHIMES_SCHEDULE_TITLE"));
}

- (id)tapticChimesSoundsLocalizedTitle
{
  return -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAPTIC_CHIMES_SOUNDS_TITLE"));
}

- (id)localizedStringForTapticChimesFrequencyEncoding:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) <= 2)
  {
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", off_24EF4E758[a3 - 1], v3, v4);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (id)localizedStringForTapticChimesSoundType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (a3 == 1)
  {
    v5 = CFSTR("TAPTIC_CHIMES_SOUND_BELLS_LABEL");
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v5 = CFSTR("TAPTIC_CHIMES_SOUND_BIRDS_LABEL");
LABEL_5:
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", v5, v3, v4);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (id)tapToSpeakTimeLocalizedTitle
{
  return -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAP_TO_SPEAK_TITLE"));
}

- (id)tapToSpeakTimeLocalizedDescription
{
  return -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAP_TO_SPEAK_DESCRIPTION"));
}

- (id)localizedStringForTapToSpeakTimeAvailability:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (a3 == 1)
  {
    v5 = CFSTR("TAP_TO_SPEAK_RESPECT_MUTE_LABEL");
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v5 = CFSTR("TAP_TO_SPEAK_ALWAYS_LABEL");
LABEL_5:
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", v5, v3, v4);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (id)tapticTimeLocalizedTitle
{
  return -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAPTIC_TIME_TITLE"));
}

- (id)tapticTimeLocalizedDescription
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tapticTimeIsAvailable");

  if ((v4 & 1) == 0)
  {
    v14 = CFSTR("TAPTIC_TIME_UNAVAILABLE_DESCRIPTION");
LABEL_12:
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    return v13;
  }
  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "voiceOverTapticTimeMode");

  if ((v6 & 1) == 0)
  {
    v14 = CFSTR("TAPTIC_TIME_DISABLED_DESCRIPTION");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tapToSpeakTimeEnabled");

  if (v9)
    v10 = CFSTR("TAPTIC_TIME_MUTE_DESCRIPTION");
  else
    v10 = CFSTR("TAPTIC_TIME_ALWAYS_DESCRIPTION");
  -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  if (-[AXTimeOutputPreferences _voiceOverIsEnabled](self, "_voiceOverIsEnabled")
    || -[AXTimeOutputPreferences _voiceOverIsInTripleClick](self, "_voiceOverIsInTripleClick"))
  {
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAPTIC_TIME_VOICEOVER_DESCRIPTION"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);

  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n\n"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)tapticTimeLocalizedCurrentMode
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "tapticTimeIsAvailable") & 1) == 0)
  {

    goto LABEL_5;
  }
  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "voiceOverTapticTimeMode");

  if ((v5 & 1) == 0)
  {
LABEL_5:
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", CFSTR("TAPTIC_TIME_DISABLED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTimeOutputPreferences localizedStringForTapticTimeEncoding:](self, "localizedStringForTapticTimeEncoding:", objc_msgSend(v6, "voiceOverTapticTimeEncoding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tapticTimeModeLocalizedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;

  +[AXTimeOutputPreferences sharedInstance](AXTimeOutputPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "voiceOverTapticTimeEncoding");

  if ((unint64_t)(v4 - 1) <= 2)
  {
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", off_24EF4E770[v4 - 1]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)localizedStringForTapticTimeEncoding:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) <= 2)
  {
    -[AXTimeOutputPreferences localizedStringForKey:](self, "localizedStringForKey:", off_24EF4E788[a3 - 1], v3, v4);
    a2 = (SEL)objc_claimAutoreleasedReturnValue();
  }
  return (id)(id)a2;
}

- (void)_npsValueForPreferenceKey:expectedClass:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22701A000, v0, v1, "unexpected nil preference key!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_npsValueForPreferenceKey:(NSObject *)a3 expectedClass:.cold.2(uint64_t a1, Class aClass, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(aClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_22701A000, a3, OS_LOG_TYPE_FAULT, "unexpected object type! is=%@, expected=%@", (uint8_t *)&v6, 0x16u);

}

- (void)_setNPSValue:preferenceKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22701A000, v0, v1, "unexpected nil domainAccessor!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setNPSValue:preferenceKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22701A000, v0, v1, "unexpected empty domain!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
