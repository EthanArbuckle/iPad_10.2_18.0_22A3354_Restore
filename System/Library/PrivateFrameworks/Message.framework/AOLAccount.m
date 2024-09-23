@implementation AOLAccount

+ (id)displayedAccountTypeString
{
  return CFSTR("AOL");
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E0D46C10];
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F028];
}

- (id)iconString
{
  return CFSTR("aolAccountIcon");
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (id)URLForMessage:(id)a3
{
  return 0;
}

+ (id)emailAddressWithUsername:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", &stru_1E4F1C8F8) & 1) == 0)
  {
    if (objc_msgSend(v4, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@aol.com"), v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v5 = v6;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;
  objc_super v6;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 5 && ((0x1Du >> v3) & 1) != 0)
  {
    v4 = off_1E4E88A20[v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AOLAccount;
    -[YahooAccount _defaultSpecialMailboxNameForType:](&v6, sel__defaultSpecialMailboxNameForType_);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  MFAOLSMTPAccount *v4;

  if (a3)
  {
    v4 = objc_alloc_init(MFAOLSMTPAccount);
    -[MFAOLSMTPAccount setMailAccount:](v4, "setMailAccount:", self);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)deliveryAccountHostname
{
  return (id)objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("DeliveryHostname"));
}

+ (BOOL)deliveryAccountUsesSSL
{
  void *v2;
  char v3;

  objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("DeliverySSLEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (unsigned)deliveryAccountPortNumber
{
  void *v2;
  unsigned int v3;

  objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("DeliveryPortNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

@end
