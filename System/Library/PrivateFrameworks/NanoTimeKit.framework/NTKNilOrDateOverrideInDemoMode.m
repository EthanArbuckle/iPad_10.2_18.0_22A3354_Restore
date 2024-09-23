@implementation NTKNilOrDateOverrideInDemoMode

void __NTKNilOrDateOverrideInDemoMode_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)CFPreferencesCopyAppValue(CFSTR("NTKFacePreferencesTimeOverride"), CFSTR("com.apple.NanoTimeKit.face"));
  if (v4)
  {
    v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v0, "setDateFormat:", CFSTR("HH:mm:ss zzz"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setLocale:", v1);

    objc_msgSend(v0, "dateFromString:", v4);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)NTKNilOrDateOverrideInDemoMode___date;
    NTKNilOrDateOverrideInDemoMode___date = v2;

  }
}

@end
