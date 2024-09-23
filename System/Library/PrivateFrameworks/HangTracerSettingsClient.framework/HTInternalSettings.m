@implementation HTInternalSettings

- (BOOL)isHUDEnabled
{
  const __CFString *v2;
  int AppBooleanValue;
  BOOL v4;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat[2];

  v2 = (const __CFString *)*MEMORY[0x24BE3F310];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x24BE3F310], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x24BE3F380], v2, 0);
  if (AppBooleanValue)
  {
    if (CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x24BE3F390], v2, &keyExistsAndHasValidFormat[1]))
      v4 = 1;
    else
      v4 = keyExistsAndHasValidFormat[1] == 0;
    if (v4)
    {
      if (CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x24BE3F3F8], v2, keyExistsAndHasValidFormat))
        v5 = 1;
      else
        v5 = keyExistsAndHasValidFormat[0] == 0;
      LOBYTE(AppBooleanValue) = v5;
    }
    else
    {
      LOBYTE(AppBooleanValue) = 0;
    }
  }
  return AppBooleanValue;
}

- (void)setHUDEnabled:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;

  v3 = a3;
  if (-[HTInternalSettings isHUDEnabled](self, "isHUDEnabled") != a3)
  {
    v5 = (const __CFString *)*MEMORY[0x24BE3F380];
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (const __CFString *)*MEMORY[0x24BE3F310];
      CFPreferencesSetAppValue(v5, v6, (CFStringRef)*MEMORY[0x24BE3F310]);

      CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x24BE3F390], 0, v7);
      v5 = (const __CFString *)*MEMORY[0x24BE3F3F8];
    }
    else
    {
      v7 = (const __CFString *)*MEMORY[0x24BE3F310];
    }
    CFPreferencesSetAppValue(v5, 0, v7);
    -[HTInternalSettings applySettings](self, "applySettings");
  }
}

- (int64_t)hudThreshold
{
  const __CFString *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (const __CFString *)*MEMORY[0x24BE3F310];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x24BE3F310], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x24BE3F388], v2);
  v4 = v3;
  if (v3)
    v5 = (int)objc_msgSend(v3, "intValue");
  else
    v5 = 500;

  return v5;
}

- (void)setHUDThreshold:(int64_t)a3
{
  const __CFString *v4;
  void *v5;

  v4 = (const __CFString *)*MEMORY[0x24BE3F388];
  if (a3 == 500)
  {
    CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x24BE3F388], 0, (CFStringRef)*MEMORY[0x24BE3F310]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(v4, v5, (CFStringRef)*MEMORY[0x24BE3F310]);

  }
  -[HTInternalSettings applySettings](self, "applySettings");
}

- (void)applySettings
{
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x24BE3F310], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post((const char *)*MEMORY[0x24BE3F318]);
}

@end
