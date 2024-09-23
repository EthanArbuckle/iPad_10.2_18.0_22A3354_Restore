@implementation CLFPhoneFaceTimeSettings_GeneratedCode

+ (CLFPhoneFaceTimeSettings)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  return (CLFPhoneFaceTimeSettings *)(id)sharedInstance_SharedSettings_0;
}

- (CLFPhoneFaceTimeSettings_GeneratedCode)init
{
  CLFPhoneFaceTimeSettings_GeneratedCode *v2;
  CLFPhoneFaceTimeSettings_GeneratedCode *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLFPhoneFaceTimeSettings_GeneratedCode;
  v2 = -[CLFBaseCommunicationLimitSettings_GeneratedCode init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_inCallKeypadEnabled);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("InCallKeypadEnabled"), v5);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_muteEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("MuteEnabled"), v7);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_recentsEnabled);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("RecentsEnabled"), v9);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_speakerOptionEnabled);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("SpeakerOptionEnabled"), v11);

  }
  return v3;
}

+ (id)domainName
{
  return CFSTR("com.apple.ClarityUI.PhoneFaceTime");
}

+ (id)allPreferenceSelectorsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CLFPhoneFaceTimeSettings_GeneratedCode;
  objc_msgSendSuper2(&v10, sel_allPreferenceSelectorsAsStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_inCallKeypadEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  NSStringFromSelector(sel_muteEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  NSStringFromSelector(sel_recentsEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  NSStringFromSelector(sel_speakerOptionEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)inCallKeypadEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("InCallKeypadEnabled"), 0);
}

- (void)setInCallKeypadEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("InCallKeypadEnabled"));

}

- (BOOL)muteEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("MuteEnabled"), 0);
}

- (void)setMuteEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("MuteEnabled"));

}

- (BOOL)recentsEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("RecentsEnabled"), 0);
}

- (void)setRecentsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("RecentsEnabled"));

}

- (BOOL)speakerOptionEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("SpeakerOptionEnabled"), 0);
}

- (void)setSpeakerOptionEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SpeakerOptionEnabled"));

}

@end
