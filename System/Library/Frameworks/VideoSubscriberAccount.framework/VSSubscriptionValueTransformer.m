@implementation VSSubscriptionValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_userAccountWithLegacySubscriptionPrimitives:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_subscriptionIsCoreSpotlight:", v3))
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Subscription is legacy CoreSpotlight subscription, will update with JSON values.", v7, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_updateUserAccount:fromJSONWithSubscription:", v4, v3);
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  id v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The valueOrNil parameter must not be nil."));
    v4 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0C99778];
      if (!v3)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The valueOrNil parameter must not be nil."));
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", v7, CFSTR("Unexpectedly, VSForceUnwrapNullable(valueOrNil) was %@, instead of VSUserAccount."), v9);

    }
    if (!v3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The valueOrNil parameter must not be nil."));
    v10 = v4;
    objc_msgSend((id)objc_opt_class(), "_subscriptionForUserAccount:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_subscriptionIsCoreSpotlight:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "subscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {

    goto LABEL_5;
  }
  v5 = objc_msgSend(v3, "accessLevel");

  if (v5)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = 1;
LABEL_6:

  return v6;
}

+ (id)_legacySubscriptionInfoForUserAccount:(id)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;

  v3 = a3;
  if (objc_msgSend(v3, "accountType") == 1)
    v4 = CFSTR("Subscription");
  else
    v4 = CFSTR("Account");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("availabilityType"));
  objc_msgSend(v3, "billingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("billingIdentifier"));
  objc_msgSend(v3, "tierIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("tiers"));
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v9)
  {
    VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[VSSubscriptionValueTransformer _legacySubscriptionInfoForUserAccount:].cold.1((uint64_t)v9, v10);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);

  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] parameter must not be nil."));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);

  return v12;
}

+ (id)_userAccountWithLegacySubscriptionPrimitives:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  VSUserAccount *v9;
  void *v10;
  void *v11;
  void *v12;
  VSUserAccount *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "kind");

  if (objc_msgSend(v3, "accessLevel") == 2)
  {
    objc_msgSend(v3, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v8 = 1;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = [VSUserAccount alloc];
  objc_msgSend(v3, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  v13 = -[VSUserAccount initWithAccountType:updateURL:sourceType:sourceIdentifier:](v9, "initWithAccountType:updateURL:sourceType:sourceIdentifier:", v8, 0, v5 == 1, v12);

  -[VSUserAccount setSubscriptionBillingCycleEndDate:](v13, "setSubscriptionBillingCycleEndDate:", v7);
  objc_msgSend(v3, "billingIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[VSUserAccount setBillingIdentifier:](v13, "setBillingIdentifier:", v15);

  objc_msgSend(v3, "tierIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  -[VSUserAccount setTierIdentifiers:](v13, "setTierIdentifiers:", v17);

  objc_msgSend(v3, "modifierIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUserAccount setModifierIdentifier:](v13, "setModifierIdentifier:", v18);

  -[VSUserAccount setModifierType:](v13, "setModifierType:", CFSTR("app"));
  -[VSUserAccount setApi:](v13, "setApi:", CFSTR("subscription"));

  return v13;
}

+ (void)_updateUserAccount:(id)a3 fromJSONWithSubscription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "subscriptionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB36D8];
    if (!v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The data parameter must not be nil."));
    v23 = 0;
    objc_msgSend(v10, "JSONObjectWithData:options:error:", v9, 0, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;
    v22 = v12;
    if (v11)
    {
      v21 = v5;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("billingIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("tiers"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = (void *)objc_msgSend(v14, "copy");
      else
        v15 = 0;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("availabilityType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length") && !objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("Subscription")))
      {
        objc_msgSend(v21, "expirationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 1;
      }
      else
      {
        v16 = 0;
        v17 = 0;
      }

      v5 = v21;
    }
    else
    {
      v18 = (uint64_t)v12;
      VSErrorLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[VSSubscriptionValueTransformer _updateUserAccount:fromJSONWithSubscription:].cold.1(v18, v19);

      objc_msgSend(v5, "expirationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v13 = 0;
      v17 = 1;
    }

  }
  else
  {
    v16 = 0;
    v15 = 0;
    v13 = 0;
    v17 = 0;
  }
  objc_msgSend(v6, "setAccountType:", v17);
  objc_msgSend(v6, "setBillingIdentifier:", v13);
  objc_msgSend(v6, "setTierIdentifiers:", v15);
  objc_msgSend(v6, "setSubscriptionBillingCycleEndDate:", v16);
  objc_msgSend(v6, "setApi:", CFSTR("coreSpotlight"));

}

+ (id)_subscriptionForUserAccount:(id)a3
{
  id v3;
  void *v4;
  VSSubscription *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VSSubscriptionSource *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;

  v3 = a3;
  objc_msgSend(v3, "sourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(VSSubscription);
    if (objc_msgSend(v3, "accountType") == 1)
      v6 = 2;
    else
      v6 = 1;
    -[VSSubscription setAccessLevel:](v5, "setAccessLevel:", v6);
    objc_msgSend(v3, "tierIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[VSSubscription setTierIdentifiers:](v5, "setTierIdentifiers:", v8);

    objc_msgSend(v3, "billingIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[VSSubscription setBillingIdentifier:](v5, "setBillingIdentifier:", v10);

    objc_msgSend(v3, "modified");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[VSSubscription setModificationDate:](v5, "setModificationDate:", v12);

    objc_msgSend(v3, "created");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[VSSubscription setCreationDate:](v5, "setCreationDate:", v14);

    if (objc_msgSend(v3, "isSignedOut"))
      -[VSSubscription setAccessLevel:](v5, "setAccessLevel:", 1);
    objc_msgSend(v3, "subscriptionBillingCycleEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[VSSubscription setExpirationDate:](v5, "setExpirationDate:", v16);
    objc_msgSend((id)objc_opt_class(), "_legacySubscriptionInfoForUserAccount:", v3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      -[VSSubscription setSubscriptionInfo:](v5, "setSubscriptionInfo:", v17);
    v18 = objc_alloc_init(VSSubscriptionSource);
    v19 = (void *)objc_msgSend(v4, "copy");
    -[VSSubscriptionSource setIdentifier:](v18, "setIdentifier:", v19);

    v20 = objc_msgSend(v3, "sourceType");
    if (v20 >= 2)
    {
      VSErrorLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        +[VSSubscriptionValueTransformer _subscriptionForUserAccount:].cold.1(v21);

      v20 = 0;
    }
    -[VSSubscriptionSource setKind:](v18, "setKind:", v20);
    -[VSSubscription setSource:](v5, "setSource:", v18);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)_legacySubscriptionInfoForUserAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1D2419000, a2, OS_LOG_TYPE_FAULT, "Error serializing legacy subscription info JSON: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_updateUserAccount:(uint64_t)a1 fromJSONWithSubscription:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Error deserializing legacy subscription JSON: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_subscriptionForUserAccount:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D2419000, log, OS_LOG_TYPE_FAULT, "User Account of provider typed retrieved through legacy subscription pipeline", v1, 2u);
}

@end
