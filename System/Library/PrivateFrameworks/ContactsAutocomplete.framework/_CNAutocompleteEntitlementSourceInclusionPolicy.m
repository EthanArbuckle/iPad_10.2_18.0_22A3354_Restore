@implementation _CNAutocompleteEntitlementSourceInclusionPolicy

- (BOOL)includeContacts
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = +[CNAutocompleteEntitlementVerifier currentProcessHasContactsEntitlement](CNAutocompleteEntitlementVerifier, "currentProcessHasContactsEntitlement");
  if (!v2)
  {
    CNALoggingContextDebug();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Will not include local contacts: missing entitlement", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)includeRecents
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = +[CNAutocompleteEntitlementVerifier currentProcessHasRecentsEntitlement](CNAutocompleteEntitlementVerifier, "currentProcessHasRecentsEntitlement");
  if (!v2)
  {
    CNALoggingContextDebug();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Will not include recent contacts: missing entitlement", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)includeStewie
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = +[CNAutocompleteEntitlementVerifier currentProcessHasStewieEntitlement](CNAutocompleteEntitlementVerifier, "currentProcessHasStewieEntitlement");
  if (!v2)
  {
    CNALoggingContextDebug();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Will not include stewie contacts: missing entitlement", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)includeSuggestions
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = +[CNAutocompleteEntitlementVerifier currentProcessHasSuggestionsEntitlement](CNAutocompleteEntitlementVerifier, "currentProcessHasSuggestionsEntitlement");
  if (!v2)
  {
    CNALoggingContextDebug();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Will not include suggested contacts: missing entitlement", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)includeLocalExtensions
{
  return 1;
}

- (BOOL)includePredictions
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = +[CNAutocompleteEntitlementVerifier currentProcessHasDuetEntitlement](CNAutocompleteEntitlementVerifier, "currentProcessHasDuetEntitlement");
  if (!v2)
  {
    CNALoggingContextDebug();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Will not include predicted contacts: missing entitlement", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)includeDirectoryServers
{
  return 1;
}

- (BOOL)includeCalendarServers
{
  BOOL v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = +[CNAutocompleteEntitlementVerifier currentProcessHasCalendarEntitlement](CNAutocompleteEntitlementVerifier, "currentProcessHasCalendarEntitlement");
  if (!v2)
  {
    CNALoggingContextDebug();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Will not include calendar servers: missing calendar entitlement", v5, 2u);
    }

  }
  return v2;
}

- (BOOL)includeSupplementalResults
{
  return 1;
}

@end
