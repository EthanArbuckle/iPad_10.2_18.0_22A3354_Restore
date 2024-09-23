@implementation GEOConfigStorageCFPrefsReadWrite

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  id value;

  v6 = a6;
  value = a3;
  v8 = (__CFString *)a4;
  if (!-[__CFString length](v8, "length")
    || -[__CFString length](v8, "length") == 1
    && -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("/")))
  {
    _GEOResetAllDefaults(v6);
  }
  else
  {
    v9 = (const __CFString *)_GEOFullDefaultsDomain();
    CFPreferencesSetAppValue(v8, value, v9);
    v10 = (const __CFString *)_GEOFullDefaultsDomain();
    CFPreferencesSynchronize(v10, (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  }

}

@end
