@implementation CLFPhoneFaceTimeSettings

void __56__CLFPhoneFaceTimeSettings_GeneratedCode_sharedInstance__block_invoke()
{
  CLFPhoneFaceTimeSettings *v0;
  void *v1;

  v0 = objc_alloc_init(CLFPhoneFaceTimeSettings);
  v1 = (void *)sharedInstance_SharedSettings_0;
  sharedInstance_SharedSettings_0 = (uint64_t)v0;

}

- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit
{
  return 0;
}

- (BOOL)dialerKeypadEnabled
{
  void *v2;
  char v3;

  -[CLFBaseCommunicationLimitSettings outgoingCommunicationLimit](self, "outgoingCommunicationLimit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("everyone"));

  return v3;
}

- (BOOL)legacyDialerKeypadEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("DialerKeypadEnabled"), 0);
}

- (void)setLegacyDialerKeypadEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("DialerKeypadEnabled"));

}

- (id)legacyOutgoingCommunicationLimit
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = -[CLFPhoneFaceTimeSettings legacyDialerKeypadEnabled](self, "legacyDialerKeypadEnabled");
  v3 = CLFCommunicationLimitEveryone;
  if (!v2)
    v3 = CLFCommunicationLimitSelectedContacts;
  return *v3;
}

- (void)migrateCommunicationLimitsIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFPhoneFaceTimeSettings;
  -[CLFBaseCommunicationLimitSettings migrateCommunicationLimitsIfNecessary](&v3, sel_migrateCommunicationLimitsIfNecessary);
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, CFSTR("DialerKeypadEnabled"));
}

@end
