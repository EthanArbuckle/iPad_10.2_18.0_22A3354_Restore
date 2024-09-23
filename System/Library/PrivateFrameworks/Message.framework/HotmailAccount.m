@implementation HotmailAccount

- (HotmailAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  HotmailAccount *v4;
  HotmailAccount *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HotmailAccount;
  v4 = -[IMAPAccount initWithLibrary:persistentAccount:](&v7, sel_initWithLibrary_persistentAccount_, a3, a4);
  if (v4)
  {
    if (RegisterHotmailAuthSchemes_onceToken != -1)
      dispatch_once(&RegisterHotmailAuthSchemes_onceToken, &__block_literal_global_6);
    v5 = v4;
  }

  return v4;
}

+ (id)authSchemesForAccountClass
{
  objc_super v4;

  if (RegisterHotmailAuthSchemes_onceToken != -1)
    dispatch_once(&RegisterHotmailAuthSchemes_onceToken, &__block_literal_global_6);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___HotmailAccount;
  objc_msgSendSuper2(&v4, sel_authSchemesForAccountClass);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F0B8];
}

+ (id)emailAddressHostPart
{
  return CFSTR("office365.com");
}

+ (id)displayedAccountTypeString
{
  return CFSTR("Outlook");
}

+ (BOOL)usesSSL
{
  void *v2;
  char v3;

  objc_msgSend(a1, "predefinedValueForKey:", CFSTR("SSLEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (id)hostname
{
  return (id)objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("Hostname"));
}

- (id)hostname
{
  return (id)objc_msgSend((id)objc_opt_class(), "hostname");
}

- (unsigned)portNumber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HotmailAccount;
  return -[MFAccount defaultSecurePortNumber](&v3, sel_defaultSecurePortNumber);
}

+ (BOOL)isPredefinedAccountType
{
  return 1;
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E0D46C28];
}

- (BOOL)shouldDisplayHostnameInErrorMessages
{
  return 0;
}

- (id)preferredAuthScheme
{
  return (id)objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", CFSTR("XOAUTH2"));
}

- (unint64_t)credentialAccessibility
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[MFAccount oauth2Token](self, "oauth2Token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)HotmailAccount;
  return -[MFAccount credentialAccessibility](&v6, sel_credentialAccessibility);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@outlook.com"), v4);
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

- (id)emailAddressStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[MFAccount username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddressWithUsername:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (id)iconString
{
  return CFSTR("outlookAccountIcon");
}

- (id)saveSentFolder
{
  void *v3;
  void *v4;

  -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IMAPAccount nameForMailboxUid:](self, "nameForMailboxUid:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 1;
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

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  MFHotmailSMTPAccount *v4;

  if (a3)
  {
    v4 = objc_alloc_init(MFHotmailSMTPAccount);
    -[MFHotmailSMTPAccount setMailAccount:](v4, "setMailAccount:", self);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)usernameIsEmailAddress
{
  return 1;
}

- (id)displayUsername
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[MFAccount username](self, "username");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rangeOfString:", CFSTR("@"));
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "emailAddressHostPart");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("@%@"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

@end
