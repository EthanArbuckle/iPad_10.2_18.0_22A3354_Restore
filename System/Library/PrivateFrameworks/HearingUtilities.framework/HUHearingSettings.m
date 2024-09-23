@implementation HUHearingSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_22);
  return (id)sharedInstance_Settings_4;
}

void __35__HUHearingSettings_sharedInstance__block_invoke()
{
  HUHearingSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HUHearingSettings);
  v1 = (void *)sharedInstance_Settings_4;
  sharedInstance_Settings_4 = (uint64_t)v0;

}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return CFSTR("com.apple.Hearing");
}

- (BOOL)shouldStoreLocally
{
  return 1;
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
  HearingInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUHearingSettings logMessage:]", 36, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F980];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F980], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (NSArray)hearingControlCenterOrder
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1EA8FFF08, &unk_1EA8FFF20, &unk_1EA8FFF38, &unk_1EA8FFF50, &unk_1EA8FFF68, &unk_1EA8FFF80, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("hearingControlCenterOrder"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setHearingControlCenterOrder:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("hearingControlCenterOrder"));
}

@end
