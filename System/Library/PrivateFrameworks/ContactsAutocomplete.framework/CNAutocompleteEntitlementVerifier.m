@implementation CNAutocompleteEntitlementVerifier

+ (BOOL)currentProcessHasSuggestionsEntitlement
{
  if ((objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.suggestions.contacts")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.suggestions"));
}

+ (BOOL)currentProcessHasRecentsEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.private.corerecents"));
}

+ (BOOL)currentProcessHasStewieEntitlement
{
  return 1;
}

+ (BOOL)currentProcessHasDuetEntitlement
{
  int v3;

  v3 = objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.coreduetd.allow"));
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.coreduetd.people"));
  return v3;
}

+ (BOOL)currentProcessHasContactsEntitlement
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D139A0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessGranted");

  return v3;
}

+ (BOOL)currentProcessHasCalendarEntitlement
{
  return -[objc_class authorizationStatusForEntityType:](getEKEventStoreClass(), "authorizationStatusForEntityType:", 0) == 3;
}

+ (BOOL)currentProcessHasNetworkClientEntitlement
{
  return objc_msgSend(a1, "currentProcessHasBooleanEntitlement:", CFSTR("com.apple.security.network.client"));
}

+ (BOOL)currentProcessHasBooleanEntitlement:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v10;

  v3 = (void *)MEMORY[0x1E0D13A38];
  v4 = a3;
  objc_msgSend(v3, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlementVerifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "currentProcessHasBooleanEntitlement:error:", v4, &v10);

  v8 = v10;
  if (v8)
    NSLog(CFSTR("Error checking entitlement: %@"), v8);

  return v7;
}

@end
