@implementation MFGmailSMTPAccount

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)accountForRenewingCredentials
{
  return -[MFAccount accountForRenewingCredentials](self->_account, "accountForRenewingCredentials");
}

- (BOOL)shouldUseAuthentication
{
  return 1;
}

- (BOOL)usesSSL
{
  return +[GmailAccount deliveryAccountUsesSSL](GmailAccount, "deliveryAccountUsesSSL");
}

- (id)hostname
{
  return +[GmailAccount deliveryAccountHostname](GmailAccount, "deliveryAccountHostname");
}

- (unsigned)portNumber
{
  return +[GmailAccount deliveryAccountPortNumber](GmailAccount, "deliveryAccountPortNumber");
}

- (id)username
{
  return -[MFAccount username](self->_account, "username");
}

- (id)password
{
  return -[MFAccount password](self->_account, "password");
}

- (id)clientToken
{
  return -[GmailAccount clientToken](self->_account, "clientToken");
}

- (id)oauth2Token
{
  return -[MFAccount oauth2Token](self->_account, "oauth2Token");
}

- (id)preferredAuthScheme
{
  return -[GmailAccount preferredAuthScheme](self->_account, "preferredAuthScheme");
}

- (id)displayHostname
{
  return MFLookupLocalizedString(CFSTR("GMAIL_DELIVERY_HOSTNAME"), CFSTR("Gmail SMTP Server"), CFSTR("Delayed"));
}

- (id)_urlFromResponse:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  GmailAccount *account;
  void *v24;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "continuationResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  objc_msgSend(v6, "addObject:", v3);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v26 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v29;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v3, "failureReason", v26) == 7)
        {
          objc_msgSend(v12, "statusString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "rangeOfString:", CFSTR(">"));
          v15 = v14;
          if (v9)
          {
            if (v14 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v9, "appendString:", v13);
LABEL_15:

              continue;
            }
            objc_msgSend(v13, "substringToIndex:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "appendString:", v18);

            -[GmailAccount _URLFromUncleanString:](self->_account, "_URLFromUncleanString:", v9);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = objc_msgSend(v13, "rangeOfString:", CFSTR("<"));
            v17 = v16;
            if (v16 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v9 = 0;
              goto LABEL_15;
            }
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v20 = objc_alloc(MEMORY[0x1E0CB37A0]);
              objc_msgSend(v13, "substringFromIndex:", v17 + 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = (void *)objc_msgSend(v20, "initWithString:", v21);

              goto LABEL_15;
            }
            v22 = v15 - (v16 + 1);
            account = self->_account;
            objc_msgSend(v13, "substringWithRange:", v16 + 1, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[GmailAccount _URLFromUncleanString:](account, "_URLFromUncleanString:", v24);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (v19)
            goto LABEL_23;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v8)
        goto LABEL_22;
    }
  }
  v9 = 0;
LABEL_22:
  v19 = 0;
LABEL_23:

  return v19;
}

- (id)errorForResponse:(id)a3
{
  id v4;
  GmailAccount *account;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "failureReason") != 7
    || (account = self->_account,
        -[MFGmailSMTPAccount _urlFromResponse:](self, "_urlFromResponse:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[GmailAccount _webLoginErrorWithURL:](account, "_webLoginErrorWithURL:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v9.receiver = self;
    v9.super_class = (Class)MFGmailSMTPAccount;
    -[SMTPAccount errorForResponse:](&v9, sel_errorForResponse_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (GmailAccount)mailAccountIfAvailable
{
  return self->_account;
}

- (void)setMailAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
