@implementation YahooAccount

- (YahooAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  YahooAccount *v4;
  YahooAccount *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)YahooAccount;
  v4 = -[IMAPAccount initWithLibrary:persistentAccount:](&v7, sel_initWithLibrary_persistentAccount_, a3, a4);
  if (v4)
  {
    if (RegisterYahooAuthSchemes_onceToken[0] != -1)
      dispatch_once(RegisterYahooAuthSchemes_onceToken, &__block_literal_global_62);
    v5 = v4;
  }

  return v4;
}

+ (id)authSchemesForAccountClass
{
  objc_super v4;

  if (RegisterYahooAuthSchemes_onceToken[0] != -1)
    dispatch_once(RegisterYahooAuthSchemes_onceToken, &__block_literal_global_62);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___YahooAccount;
  objc_msgSendSuper2(&v4, sel_authSchemesForAccountClass);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E0C8F160];
}

+ (id)emailAddressHostPart
{
  return CFSTR("yahoo.com");
}

+ (id)displayedAccountTypeString
{
  return CFSTR("Yahoo!\u200E");
}

+ (BOOL)isSSLEditable
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("YahooAllowSSL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___YahooAccount;
    v5 = objc_msgSendSuper2(&v8, sel_isSSLEditable);
  }
  v6 = v5;

  return v6;
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

- (unsigned)portNumber
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("YahooIMAPPort"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedIntValue");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)YahooAccount;
    v5 = -[MFAccount portNumber](&v8, sel_portNumber);
  }
  v6 = v5;

  return v6;
}

+ (id)hostname
{
  return (id)objc_msgSend(a1, "standardAccountClass:valueForKey:", a1, CFSTR("Hostname"));
}

- (id)hostname
{
  return (id)objc_msgSend((id)objc_opt_class(), "hostname");
}

+ (BOOL)isPredefinedAccountType
{
  return 1;
}

- (id)statisticsKind
{
  return (id)*MEMORY[0x1E0D46C50];
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
  v6.super_class = (Class)YahooAccount;
  return -[MFAccount credentialAccessibility](&v6, sel_credentialAccessibility);
}

- (BOOL)supportsFastRemoteBodySearch
{
  return 1;
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  int64_t v3;
  void *v4;
  objc_super v6;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 5 && ((0x1Du >> v3) & 1) != 0)
  {
    v4 = (void *)*((_QWORD *)&off_1E4E8EFE0 + v3);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)YahooAccount;
    -[MailAccount _defaultSpecialMailboxNameForType:](&v6, sel__defaultSpecialMailboxNameForType_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@yahoo.com"), v4);
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

- (id)transferDisabledMailboxUids
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[MailAccount mailboxUidOfType:createIfNeeded:](self, "mailboxUidOfType:createIfNeeded:", 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)URLForMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "headersIfAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstHeaderForKey:", *MEMORY[0x1E0D45F30]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v3, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryMailboxUid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    v10 = CFSTR("Inbox");
    goto LABEL_6;
  }
  objc_msgSend(v3, "mailbox");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_6:
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("ymail://?fid=%@&mid=%@"), v14, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
LABEL_4:
  v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

+ (BOOL)getConfigurationFromServerForEmail:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("yahoo.co.jp"), 4) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v3, "rangeOfString:options:", CFSTR("ybb.ne.jp"), 4) != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)iconString
{
  return CFSTR("yahooAccountIcon");
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
  MFYahooSMTPAccount *v4;

  if (a3)
  {
    v4 = objc_alloc_init(MFYahooSMTPAccount);
    -[MFYahooSMTPAccount setMailAccount:](v4, "setMailAccount:", self);
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
