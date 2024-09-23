@implementation GEOConfigStorageCFProfile

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  GEOConfig_stripEntitlement(a3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = (const __CFString *)GEODefaultsDomain();
  if (CFPreferencesAppValueIsForced(v7, v8))
  {
    v9 = (const __CFString *)_GEOFullDefaultsDomain();
    v10 = (void *)CFPreferencesCopyAppValue(v7, v9);
    v11 = v10;
    if (a6)
      *a6 = 1;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void ___GEOConfigStorageCFProfile_block_invoke()
{
  GEOConfigStorageCFProfile *v0;
  void *v1;

  v0 = objc_alloc_init(GEOConfigStorageCFProfile);
  v1 = (void *)qword_1ECDBC658;
  qword_1ECDBC658 = (uint64_t)v0;

}

@end
