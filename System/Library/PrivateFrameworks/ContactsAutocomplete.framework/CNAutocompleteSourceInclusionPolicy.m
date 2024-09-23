@implementation CNAutocompleteSourceInclusionPolicy

+ (id)defaultPolicyWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D139A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessGranted");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(a1, "policyWithFetchRequest:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "policyWithUserDefaults:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "policyWithCurrentProcessEntitlements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = v9;
    v14[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "policyWithPolicies:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "policyForNoContactsAccess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (CNAutocompleteSourceInclusionPolicy)policyWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _CNAutocompleteMutableSourceInclusionPolicy *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v12;
  __int16 v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D139A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessGranted");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(_CNAutocompleteMutableSourceInclusionPolicy);
    if ((objc_msgSend(v4, "isZeroKeywordSearch") & 1) == 0)
    {
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeContacts:](v7, "setIncludeContacts:", objc_msgSend(v4, "includeContacts"));
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeRecents:](v7, "setIncludeRecents:", objc_msgSend(v4, "includeRecents"));
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeStewie:](v7, "setIncludeStewie:", objc_msgSend(v4, "includeStewie"));
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeSuggestions:](v7, "setIncludeSuggestions:", objc_msgSend(v4, "includeSuggestions"));
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeLocalExtensions:](v7, "setIncludeLocalExtensions:", objc_msgSend(v4, "includeLocalExtensions"));
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeDirectoryServers:](v7, "setIncludeDirectoryServers:", objc_msgSend(v4, "includeDirectoryServers"));
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeCalendarServers:](v7, "setIncludeCalendarServers:", objc_msgSend(v4, "includeCalendarServers"));
LABEL_12:
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludePredictions:](v7, "setIncludePredictions:", objc_msgSend(v4, "includePredictions", v12));
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeSupplementalResults:](v7, "setIncludeSupplementalResults:", 1);
      goto LABEL_13;
    }
    if (objc_msgSend(v4, "searchType") == 4)
    {
      -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeRecents:](v7, "setIncludeRecents:", objc_msgSend(v4, "includeRecents"));
      CNALoggingContextDebug();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v9 = "Will only search Duet, Recents (because search type photos) and Supplemental because search string has a 0 length";
        v10 = (uint8_t *)&v13;
LABEL_10:
        _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      CNALoggingContextDebug();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        v9 = "Will only search Duet and Supplemental because search string has a 0 length";
        v10 = (uint8_t *)&v12;
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
  objc_msgSend(a1, "policyForNoContactsAccess");
  v7 = (_CNAutocompleteMutableSourceInclusionPolicy *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return (CNAutocompleteSourceInclusionPolicy *)v7;
}

+ (id)policyForNoContactsAccess
{
  return objc_alloc_init(_CNAutocompleteNoSourceInclusionPolicy);
}

+ (CNAutocompleteSourceInclusionPolicy)policyWithUserDefaults:(id)a3
{
  id v3;
  _CNAutocompleteUserDefaultsSourceInclusionPolicy *v4;

  v3 = a3;
  v4 = -[_CNAutocompleteUserDefaultsSourceInclusionPolicy initWithUserDefaults:]([_CNAutocompleteUserDefaultsSourceInclusionPolicy alloc], "initWithUserDefaults:", v3);

  return (CNAutocompleteSourceInclusionPolicy *)v4;
}

+ (CNAutocompleteSourceInclusionPolicy)policyWithCurrentProcessEntitlements
{
  return (CNAutocompleteSourceInclusionPolicy *)objc_alloc_init(_CNAutocompleteEntitlementSourceInclusionPolicy);
}

+ (CNAutocompleteSourceInclusionPolicy)policyWithPolicies:(id)a3
{
  id v3;
  _CNAutocompleteAggregateSourceInclusionPolicy *v4;

  v3 = a3;
  v4 = -[_CNAutocompleteAggregateSourceInclusionPolicy initWithPolicies:]([_CNAutocompleteAggregateSourceInclusionPolicy alloc], "initWithPolicies:", v3);

  return (CNAutocompleteSourceInclusionPolicy *)v4;
}

+ (CNAutocompleteSourceInclusionPolicy)policyWithValue:(BOOL)a3
{
  _BOOL8 v3;
  _CNAutocompleteMutableSourceInclusionPolicy *v4;

  v3 = a3;
  v4 = objc_alloc_init(_CNAutocompleteMutableSourceInclusionPolicy);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeContacts:](v4, "setIncludeContacts:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeRecents:](v4, "setIncludeRecents:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeStewie:](v4, "setIncludeStewie:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeSuggestions:](v4, "setIncludeSuggestions:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeLocalExtensions:](v4, "setIncludeLocalExtensions:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeDirectoryServers:](v4, "setIncludeDirectoryServers:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeCalendarServers:](v4, "setIncludeCalendarServers:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludeSupplementalResults:](v4, "setIncludeSupplementalResults:", v3);
  -[_CNAutocompleteMutableSourceInclusionPolicy setIncludePredictions:](v4, "setIncludePredictions:", v3);
  return (CNAutocompleteSourceInclusionPolicy *)v4;
}

@end
