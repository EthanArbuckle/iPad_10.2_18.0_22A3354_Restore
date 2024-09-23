@implementation GEOConfigStorageCFPrefsReadOnly

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  id v17;

  v8 = a4;
  GEOConfig_stripEntitlement(a3);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v9, "length"))
  {
    v14 = (const __CFString *)_GEOFullDefaultsDomain();
    v15 = CFPreferencesCopyMultiple(0, v14, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
LABEL_11:
    v13 = v15;
    goto LABEL_12;
  }
  if (!objc_msgSend(v8, "length"))
  {
LABEL_10:
    v16 = (const __CFString *)_GEOFullDefaultsDomain();
    v15 = (void *)CFPreferencesCopyAppValue(v9, v16);
    goto LABEL_11;
  }
  v10 = (const __CFString *)_GEOFullDefaultsDomain();
  v11 = (void *)CFPreferencesCopyAppValue(CFSTR("CountryProviders"), v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_10;
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v13, "length"))
  {
    v17 = 0;
  }
  else
  {
    if (a6 && v13)
      *a6 = 2;
    v17 = v13;
  }

  return v17;
}

@end
