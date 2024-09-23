@implementation MFHotmailSMTPAccount

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
  return +[HotmailAccount deliveryAccountUsesSSL](HotmailAccount, "deliveryAccountUsesSSL");
}

- (id)hostname
{
  return +[HotmailAccount deliveryAccountHostname](HotmailAccount, "deliveryAccountHostname");
}

- (unsigned)portNumber
{
  return +[HotmailAccount deliveryAccountPortNumber](HotmailAccount, "deliveryAccountPortNumber");
}

- (id)username
{
  return -[MFAccount username](self->_account, "username");
}

- (id)password
{
  return -[MFAccount password](self->_account, "password");
}

- (id)oauth2Token
{
  return -[MFAccount oauth2Token](self->_account, "oauth2Token");
}

- (id)preferredAuthScheme
{
  return -[HotmailAccount preferredAuthScheme](self->_account, "preferredAuthScheme");
}

- (id)displayHostname
{
  return MFLookupLocalizedString(CFSTR("HOTMAIL_DELIVERY_HOSTNAME"), CFSTR("Outlook SMTP Server"), CFSTR("Delayed"));
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (HotmailAccount)mailAccountIfAvailable
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
