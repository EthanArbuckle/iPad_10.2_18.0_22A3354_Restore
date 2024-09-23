@implementation CUIKSubscribedHolidayCalendar

- (CUIKSubscribedHolidayCalendar)initWithLocale:(id)a3 languageCode:(id)a4 URL:(id)a5
{
  id v9;
  id v10;
  id v11;
  CUIKSubscribedHolidayCalendar *v12;
  CUIKSubscribedHolidayCalendar *v13;
  uint64_t v14;
  NSString *countryCode;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CUIKSubscribedHolidayCalendar;
  v12 = -[CUIKSubscribedHolidayCalendar init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locale, a3);
    objc_storeStrong((id *)&v13->_languageCode, a4);
    objc_msgSend(v9, "countryCode");
    v14 = objc_claimAutoreleasedReturnValue();
    countryCode = v13->_countryCode;
    v13->_countryCode = (NSString *)v14;

    objc_storeStrong((id *)&v13->_URL, a5);
    v13->_localizedDescriptionCacheLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)localizedTitle
{
  return 0;
}

- (id)localizedDescription
{
  os_unfair_lock_s *p_localizedDescriptionCacheLock;
  NSString *cachedLocalizedDescription;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;

  p_localizedDescriptionCacheLock = &self->_localizedDescriptionCacheLock;
  os_unfair_lock_lock(&self->_localizedDescriptionCacheLock);
  cachedLocalizedDescription = self->_cachedLocalizedDescription;
  if (!cachedLocalizedDescription)
  {
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Holiday Calendar description format in user's language"), CFSTR("%1$@ (%2$@)"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKSubscribedHolidayCalendar countryCode](self, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "localizedStringForCountryCode:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CUIKSubscribedHolidayCalendar locale](self, "locale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "countryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForCountryCode:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CUIKSubscribedHolidayCalendar languageCode](self, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForLanguageCode:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v9, v13);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_cachedLocalizedDescription;
    self->_cachedLocalizedDescription = v14;

    cachedLocalizedDescription = self->_cachedLocalizedDescription;
  }
  v16 = cachedLocalizedDescription;
  os_unfair_lock_unlock(p_localizedDescriptionCacheLock);
  return v16;
}

- (id)descriptionInLocaleLanguage
{
  os_unfair_lock_s *p_localizedDescriptionCacheLock;
  NSString *cachedDescriptionInLocaleLanguage;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;

  p_localizedDescriptionCacheLock = &self->_localizedDescriptionCacheLock;
  os_unfair_lock_lock(&self->_localizedDescriptionCacheLock);
  cachedDescriptionInLocaleLanguage = self->_cachedDescriptionInLocaleLanguage;
  if (!cachedDescriptionInLocaleLanguage)
  {
    CUIKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Holiday Calendar description format in calendar's language"), CFSTR("%1$@ (%2$@)"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUIKSubscribedHolidayCalendar locale](self, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKSubscribedHolidayCalendar countryCode](self, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "localizedStringForCountryCode:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CUIKSubscribedHolidayCalendar locale](self, "locale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "countryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForCountryCode:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CUIKSubscribedHolidayCalendar locale](self, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKSubscribedHolidayCalendar languageCode](self, "languageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForLanguageCode:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v9, v14);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = self->_cachedDescriptionInLocaleLanguage;
    self->_cachedDescriptionInLocaleLanguage = v15;

    cachedDescriptionInLocaleLanguage = self->_cachedDescriptionInLocaleLanguage;
  }
  v17 = cachedDescriptionInLocaleLanguage;
  os_unfair_lock_unlock(p_localizedDescriptionCacheLock);
  return v17;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_cachedDescriptionInLocaleLanguage, 0);
  objc_storeStrong((id *)&self->_cachedLocalizedDescription, 0);
}

@end
