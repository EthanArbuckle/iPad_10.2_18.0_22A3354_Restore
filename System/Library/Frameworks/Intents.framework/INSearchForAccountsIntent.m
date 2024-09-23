@implementation INSearchForAccountsIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 9;
}

- (id)_categoryVerb
{
  return CFSTR("Search");
}

- (INSearchForAccountsIntent)initWithAccountNickname:(INSpeakableString *)accountNickname accountType:(INAccountType)accountType organizationName:(INSpeakableString *)organizationName requestedBalanceType:(INBalanceType)requestedBalanceType
{
  INSpeakableString *v10;
  INSpeakableString *v11;
  INSearchForAccountsIntent *v12;
  INSearchForAccountsIntent *v13;
  objc_super v15;

  v10 = accountNickname;
  v11 = organizationName;
  v15.receiver = self;
  v15.super_class = (Class)INSearchForAccountsIntent;
  v12 = -[INIntent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[INSearchForAccountsIntent setAccountNickname:](v12, "setAccountNickname:", v10);
    -[INSearchForAccountsIntent setAccountType:](v13, "setAccountType:", accountType);
    -[INSearchForAccountsIntent setOrganizationName:](v13, "setOrganizationName:", v11);
    -[INSearchForAccountsIntent setRequestedBalanceType:](v13, "setRequestedBalanceType:", requestedBalanceType);
  }

  return v13;
}

- (INSpeakableString)accountNickname
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountNickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setAccountNickname:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccountNickname:", v5);
}

- (INAccountType)accountType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INAccountType v7;
  INAccountType v8;

  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAccountType");
  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accountType") - 1;
  if (v6 <= 6)
    v7 = v6 + 1;
  else
    v7 = INAccountTypeUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INAccountTypeUnknown;

  return v8;
}

- (void)setAccountType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 6)
    objc_msgSend(v4, "setHasAccountType:", 0);
  else
    objc_msgSend(v4, "setAccountType:");

}

- (INSpeakableString)organizationName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "organizationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setOrganizationName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setOrganizationName:", v5);
}

- (INBalanceType)requestedBalanceType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INBalanceType v7;
  INBalanceType v8;

  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRequestedBalanceType");
  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestedBalanceType") - 1;
  if (v6 <= 2)
    v7 = v6 + 1;
  else
    v7 = INBalanceTypeUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INBalanceTypeUnknown;

  return v8;
}

- (void)setRequestedBalanceType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasRequestedBalanceType:", 0);
  else
    objc_msgSend(v4, "setRequestedBalanceType:");

}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INAccountType v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  INBalanceType v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("accountNickname");
  -[INSearchForAccountsIntent accountNickname](self, "accountNickname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v4;
  v15[1] = CFSTR("accountType");
  v5 = -[INSearchForAccountsIntent accountType](self, "accountType");
  if ((unint64_t)(v5 - 1) > 6)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E228D078[v5 - 1];
  v7 = v6;
  v16[1] = v7;
  v15[2] = CFSTR("organizationName");
  -[INSearchForAccountsIntent organizationName](self, "organizationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v9;
  v15[3] = CFSTR("requestedBalanceType");
  v10 = -[INSearchForAccountsIntent requestedBalanceType](self, "requestedBalanceType");
  if ((unint64_t)(v10 - 1) > 2)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E228BA50[v10 - 1];
  v12 = v11;
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (!v3)

  return v13;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSearchForAccountsIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Payments");
}

- (id)verb
{
  return CFSTR("SearchForAccounts");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
