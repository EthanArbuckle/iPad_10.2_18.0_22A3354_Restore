@implementation ACAccount(SyncPrivate)

- (uint64_t)isMobileMeAccount
{
  void *v2;
  uint64_t result;
  void *v4;

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "accountType"), "identifier");
  result = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB4090]);
  if ((_DWORD)result)
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "parentAccount"), "accountType"), "identifier");
    return objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3FD8]);
  }
  return result;
}

- (uint64_t)syncIdentityString
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "accountType"), "identifier");
  v3 = (const __CFString *)objc_msgSend(a1, "username");
  if (!v3)
    v3 = (const __CFString *)objc_msgSend(a1, "accountPropertyForKey:", CFSTR("Username"));
  return _identityStringWithInfo(v2, v3, (const __CFString *)objc_msgSend(a1, "accountPropertyForKey:", CFSTR("Hostname")));
}

- (uint64_t)_usernameFromProperties:()SyncPrivate
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("Username"));
  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "accountType"), "identifier");
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3FD8]))
    return _bestiCloudUsernameFromEmails(v5, (void *)objc_msgSend(a3, "objectForKey:", CFSTR("EmailAddresses")));
  else
    return (uint64_t)v5;
}

- (uint64_t)applySyncProperties:()SyncPrivate
{
  _QWORD v6[6];

  if (applySyncProperties__onceToken != -1)
    dispatch_once(&applySyncProperties__onceToken, &__block_literal_global_10);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__ACAccount_SyncPrivate__applySyncProperties___block_invoke_2;
  v6[3] = &unk_24F645DE0;
  v6[4] = a1;
  v6[5] = a3;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
}

- (void)setPasswordFromSync:()SyncPrivate
{
  id v5;

  if (objc_msgSend(a3, "length"))
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB4388]), "initWithPassword:", a3);
    objc_msgSend(a1, "setCredential:", v5);
    objc_msgSend(a1, "setCredentialType:", objc_msgSend((id)objc_msgSend(a1, "credential"), "credentialType"));
    objc_msgSend(a1, "setAuthenticated:", 1);

  }
}

@end
