@implementation BMDeviceMetadataUtils

+ (int64_t)platform
{
  void *v2;
  int64_t v3;
  uint64_t v5;

  v5 = 0;
  v2 = 0;
  if (!sysctlbyname_get_data_np())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    free(0);
  }
  if ((objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("iPhone"), v5) & 1) != 0)
    v3 = 2;
  else
    v3 = objc_msgSend(v2, "localizedCaseInsensitiveContainsString:", CFSTR("iPad"));

  return v3;
}

+ (id)osBuildVersion
{
  void *v3;

  if (sysctlbyname_get_data_np())
    return CFSTR("?");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  free(0);
  return v3;
}

+ (id)osBuildSupplementalVersion
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  void *Value;
  __CFString *v5;

  v2 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v2)
  {
    v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0C9AB90]);
    if (Value)
      v5 = Value;
    else
      v5 = CFSTR("?");
    CFRelease(v3);
  }
  else
  {
    v5 = CFSTR("?");
  }
  return v5;
}

+ (BOOL)currentlyInGameMode
{
  uint64_t v3;
  int out_token;

  out_token = -1;
  v3 = 0;
  notify_register_check("com.apple.system.console_mode_changed", &out_token);
  notify_get_state(out_token, &v3);
  if (out_token != -1)
    notify_cancel(out_token);
  return v3 != 0;
}

@end
