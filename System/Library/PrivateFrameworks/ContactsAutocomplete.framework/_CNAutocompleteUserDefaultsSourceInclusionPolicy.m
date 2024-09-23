@implementation _CNAutocompleteUserDefaultsSourceInclusionPolicy

- (_CNAutocompleteUserDefaultsSourceInclusionPolicy)initWithUserDefaults:(id)a3
{
  id v5;
  _CNAutocompleteUserDefaultsSourceInclusionPolicy *v6;
  _CNAutocompleteUserDefaultsSourceInclusionPolicy *v7;
  _CNAutocompleteUserDefaultsSourceInclusionPolicy *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAutocompleteUserDefaultsSourceInclusionPolicy;
  v6 = -[_CNAutocompleteUserDefaultsSourceInclusionPolicy init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)includeContacts
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNLocalContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNLocalContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include local contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includeRecents
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNRecentContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNRecentContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include recent contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includeStewie
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNStewieInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNStewieInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include stewie contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includeSuggestions
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNSuggestedContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNSuggestedContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include suggested contacts: %@ is NO or not set", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includeLocalExtensions
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNLocalExtensionContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNLocalExtensionContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include local extensions: %@ is NO or not set", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includePredictions
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNDuetContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNDuetContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include predicted contacts: %@ is NO or not set", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includeDirectoryServers
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNServerContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNServerContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include directory server contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includeCalendarServers
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNCalendarServerContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNCalendarServerContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include calendar server contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (BOOL)includeSupplementalResults
{
  void *v2;
  int v3;
  NSObject *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[_CNAutocompleteUserDefaultsSourceInclusionPolicy userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userHasOptedOutOfPreference:", CFSTR("CNSupplementalContactsInAutocomplete"));

  if (v3)
  {
    CNALoggingContextDebug();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("CNSupplementalContactsInAutocomplete");
      _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Will not include supplemental contacts: %@ is NO", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 ^ 1;
}

- (CNUserDefaults)userDefaults
{
  return (CNUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
