@implementation MFOSXServerSMTPAccount

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)accountForRenewingCredentials
{
  return -[MFAccount accountForRenewingCredentials](self->_mailAccount, "accountForRenewingCredentials");
}

- (NSDictionary)parentAccountMailProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[MFAccount persistentAccount](self->_mailAccount, "persistentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (BOOL)shouldUseAuthentication
{
  void *v2;
  void *v3;

  -[MFOSXServerSMTPAccount parentAccountMailProperties](self, "parentAccountMailProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OutgoingMailServerAuthentication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAuthNone")) ^ 1;
  return (char)v2;
}

- (BOOL)usesSSL
{
  void *v2;
  void *v3;
  char v4;

  -[MFOSXServerSMTPAccount parentAccountMailProperties](self, "parentAccountMailProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFF8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)hostname
{
  void *v2;
  void *v3;

  -[MFOSXServerSMTPAccount parentAccountMailProperties](self, "parentAccountMailProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)portNumber
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[MFOSXServerSMTPAccount parentAccountMailProperties](self, "parentAccountMailProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (id)username
{
  return -[MFAccount username](self->_mailAccount, "username");
}

- (id)password
{
  return -[MFAccount password](self->_mailAccount, "password");
}

- (id)preferredAuthScheme
{
  return -[MFAccount preferredAuthScheme](self->_mailAccount, "preferredAuthScheme");
}

- (MFOSXServerIMAPAccount)mailAccountIfAvailable
{
  return self->_mailAccount;
}

- (void)setMailAccount:(id)a3
{
  objc_storeStrong((id *)&self->_mailAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAccount, 0);
}

@end
