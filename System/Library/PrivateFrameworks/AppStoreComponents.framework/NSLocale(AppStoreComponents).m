@implementation NSLocale(AppStoreComponents)

+ (id)asc_storefrontLocale
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint8_t v5[16];

  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "storefrontLocaleID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "No storefront locale specified, falling back to device locale", v5, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;

  return v3;
}

- (BOOL)asc_prefersRightToLeftLayout
{
  void *v2;
  char v3;
  void *v5;
  void *v6;
  uint64_t v7;

  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceRightToLeftLayout");

  if ((v3 & 1) != 0)
    return 1;
  v5 = (void *)MEMORY[0x1E0DC33B8];
  objc_msgSend(a1, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "defaultWritingDirectionForLanguage:", v6);

  return v7 == 1;
}

@end
