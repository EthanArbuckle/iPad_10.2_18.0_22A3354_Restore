@implementation MFAOLSMTPAccount

- (id)displayHostname
{
  return MFLookupLocalizedString(CFSTR("AOL_DELIVERY_HOSTNAME"), CFSTR("AOL SMTP Server"), CFSTR("Delayed"));
}

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
  return +[AOLAccount deliveryAccountUsesSSL](AOLAccount, "deliveryAccountUsesSSL");
}

- (id)hostname
{
  return +[AOLAccount deliveryAccountHostname](AOLAccount, "deliveryAccountHostname");
}

- (unsigned)portNumber
{
  return +[AOLAccount deliveryAccountPortNumber](AOLAccount, "deliveryAccountPortNumber");
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
  return -[YahooAccount preferredAuthScheme](self->_account, "preferredAuthScheme");
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (AOLAccount)mailAccountIfAvailable
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
