@implementation CRSessionSilentModeStatus

- (unint64_t)getCarPlaySilentModePreference
{
  void *v2;
  unint64_t v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("CRCarPlaySilentModePref"), CFSTR("com.apple.CarPlayApp"));
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (void)setCarPlaySilentModePreference:(unint64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[CRSessionSilentModeStatus getCarPlaySilentModePreference](self, "getCarPlaySilentModePreference") != a3)
  {
    CarSilentModeLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("Unmuted");
      if (a3 == 1)
        v5 = CFSTR("Muted");
      if (!a3)
        v5 = CFSTR("Mirror iPhone");
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A83A2000, v4, OS_LOG_TYPE_DEFAULT, "CarPlay Silent Mode Preference changed: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("CRCarPlaySilentModePref"), v6, CFSTR("com.apple.CarPlayApp"));

  }
}

- (BOOL)isDeviceSilentModeOn
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getSilentMode");

  return v3;
}

- (void)setDeviceSilentMode:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D48560];
  v7 = a4;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSilentMode:untilTime:reason:clientType:", v4, 0, v7, 8);

  v9 = -[CRSessionSilentModeStatus isDeviceSilentModeOn](self, "isDeviceSilentModeOn");
  CarSilentModeLogging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("Unmuted");
    if (v4)
      v12 = CFSTR("Muted");
    else
      v12 = CFSTR("Unmuted");
    if (v9)
      v11 = CFSTR("Muted");
    v14 = 138543874;
    v15 = v12;
    v16 = 2114;
    v17 = v11;
    if (v9 != v4)
      v13 = CFSTR("NO");
    else
      v13 = CFSTR("YES");
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_1A83A2000, v10, OS_LOG_TYPE_DEFAULT, "Should have %{public}@ device. Device is %{public}@. Success: %{public}@", (uint8_t *)&v14, 0x20u);
  }

}

@end
