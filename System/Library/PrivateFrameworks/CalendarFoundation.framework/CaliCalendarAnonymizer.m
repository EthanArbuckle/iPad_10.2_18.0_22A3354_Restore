@implementation CaliCalendarAnonymizer

+ (id)sharedAnonymizedStrings
{
  if (sharedAnonymizedStrings_once != -1)
    dispatch_once(&sharedAnonymizedStrings_once, &__block_literal_global_4);
  return (id)gSharedAnonymizedStrings;
}

void __49__CaliCalendarAnonymizer_sharedAnonymizedStrings__block_invoke()
{
  id v0;
  void *v1;

  srandom(0xF466u);
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)gSharedAnonymizedStrings;
  gSharedAnonymizedStrings = (uint64_t)v0;

}

+ (id)sharedAnonymizedStringsCount
{
  if (sharedAnonymizedStringsCount_once != -1)
    dispatch_once(&sharedAnonymizedStringsCount_once, &__block_literal_global_1);
  return (id)gSharedAnonymizedStringsCount;
}

void __54__CaliCalendarAnonymizer_sharedAnonymizedStringsCount__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v1 = (void *)gSharedAnonymizedStringsCount;
  gSharedAnonymizedStringsCount = (uint64_t)v0;

}

+ (id)sharedAnonymizedDomainName
{
  if (sharedAnonymizedDomainName_once != -1)
    dispatch_once(&sharedAnonymizedDomainName_once, &__block_literal_global_3_0);
  return (id)sharedAnonymizedDomainName_domain;
}

void __52__CaliCalendarAnonymizer_sharedAnonymizedDomainName__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  CalPreferences *v3;

  v3 = -[CalPreferences initWithDomain:]([CalPreferences alloc], "initWithDomain:", 0);
  -[CalPreferences getValueForPreference:expectedClass:](v3, "getValueForPreference:expectedClass:", CFSTR("CalAnonymizerDomain"), objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedAnonymizedDomainName_domain;
  sharedAnonymizedDomainName_domain = v0;

  if (!objc_msgSend((id)sharedAnonymizedDomainName_domain, "length"))
  {
    v2 = (void *)sharedAnonymizedDomainName_domain;
    sharedAnonymizedDomainName_domain = (uint64_t)CFSTR("apple.com");

  }
}

+ (id)anonymizedString:(id)a3 withAnonymizer:(id)a4
{
  id v5;
  id v6;
  void (**v7)(void *, id);
  void (**v8)(void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(void *, id))MEMORY[0x19400A168]();
  v8 = v7;
  if (v6)
  {
    if (v5)
      goto LABEL_3;
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }

  v8 = (void (**)(void *, id))&__block_literal_global_10_0;
  if (!v5)
    goto LABEL_8;
LABEL_3:
  +[CaliCalendarAnonymizer sharedAnonymizedStrings](CaliCalendarAnonymizer, "sharedAnonymizedStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CaliCalendarAnonymizer sharedAnonymizedStringsCount](CaliCalendarAnonymizer, "sharedAnonymizedStringsCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_sync_enter(v11);
  objc_msgSend(v11, "objectForKeyedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 && v8)
  {
    v8[2](v8, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v5);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v5);
  objc_sync_exit(v11);

LABEL_9:
  return v14;
}

+ (id)anonymizedString:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_10_0);
}

+ (id)anonymizedSummary:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_14);
}

+ (id)anonymizedDescription:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_17_0);
}

+ (id)anonymizedUID:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_20_0);
}

+ (id)anonymizedURNUID:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_23);
}

+ (id)anonymizedEmailCommonName:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_26);
}

+ (id)anonymizedEmail:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_29);
}

+ (id)anonymizedLocation:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_33);
}

+ (id)anonymizedPhoneNumber:(id)a3
{
  return +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", a3, &__block_literal_global_36);
}

+ (id)anonymizedWebURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", v5, &__block_literal_global_40);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)anonymizedAddressURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v3 = a3;
    if (objc_msgSend(v3, "cal_hasSchemeTel"))
      v4 = &__block_literal_global_36;
    else
      v4 = &__block_literal_global_23;
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[CaliCalendarAnonymizer anonymizedString:withAnonymizer:](CaliCalendarAnonymizer, "anonymizedString:withAnonymizer:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (void)dump
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[CaliCalendarAnonymizer sharedAnonymizedStrings](CaliCalendarAnonymizer, "sharedAnonymizedStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CaliCalendarAnonymizer sharedAnonymizedStringsCount](CaliCalendarAnonymizer, "sharedAnonymizedStringsCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  objc_sync_enter(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "countForObject:", v9);
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%lu %@ \t %@"), v10, v11, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_sync_exit(v5);
}

@end
