@implementation MFNewcastleSMTPAccount

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)accountForRenewingCredentials
{
  return -[MFAccount accountForRenewingCredentials](self->_castleAccount, "accountForRenewingCredentials");
}

- (id)mailAccountIfAvailable
{
  return self->_castleAccount;
}

- (id)displayHostname
{
  return MFLookupLocalizedString(CFSTR("CASTLE_SMTP_SERVER"), CFSTR("iCloud SMTP Server"), CFSTR("Delayed"));
}

- (BOOL)shouldUseAuthentication
{
  return 1;
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

- (CastleIMAPAccount)castleAccount
{
  return self->_castleAccount;
}

- (void)setCastleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_castleAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_castleAccount, 0);
}

@end
