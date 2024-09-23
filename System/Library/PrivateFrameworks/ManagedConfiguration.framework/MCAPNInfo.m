@implementation MCAPNInfo

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_apnName)
    objc_msgSend(v3, "appendFormat:", CFSTR("APN Name      : %@\n"), self->_apnName);
  if (self->_username)
    objc_msgSend(v4, "appendFormat:", CFSTR("Username      : %@\n"), self->_username);
  if (self->_password)
    objc_msgSend(v4, "appendFormat:", CFSTR("Password      : (set)\n"));
  if (self->_proxy)
    objc_msgSend(v4, "appendFormat:", CFSTR("Proxy         : %@\n"), self->_proxy);
  if (self->_proxyPort)
    objc_msgSend(v4, "appendFormat:", CFSTR("Proxy Port    : %@\n"), self->_proxyPort);
  return v4;
}

- (id)strippedDefaultsRepresentation
{
  NSString *apnName;
  void *v4;
  void *v5;
  NSString *username;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  apnName = self->_apnName;
  if (!apnName)
    return 0;
  v9 = CFSTR("apn");
  v10[0] = apnName;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  username = self->_username;
  if (username)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", username, CFSTR("username"));
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (id)defaultsRepresentation
{
  void *v3;
  void *v4;
  NSString *apnName;
  NSString *username;
  NSString *password;
  id v8;
  void *v9;
  void *v10;
  NSNumber *proxyPort;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  apnName = self->_apnName;
  if (apnName)
    objc_msgSend(v3, "setObject:forKey:", apnName, CFSTR("apn"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("username"));
  password = self->_password;
  if (password)
    objc_msgSend(v4, "setObject:forKey:", password, CFSTR("password"));
  if (self->_proxy)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0CE8EB0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x1E0CE8EC8]);

    objc_msgSend(v8, "setObject:forKey:", self->_proxy, *MEMORY[0x1E0CE8EC0]);
    objc_msgSend(v8, "setObject:forKey:", self->_proxy, *MEMORY[0x1E0CE8ED8]);
    proxyPort = self->_proxyPort;
    if (proxyPort)
    {
      objc_msgSend(v8, "setObject:forKey:", proxyPort, *MEMORY[0x1E0CE8EB8]);
      objc_msgSend(v8, "setObject:forKey:", self->_proxyPort, *MEMORY[0x1E0CE8ED0]);
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("ProxyConfiguration"));

  }
  return v4;
}

- (NSString)apnName
{
  return self->_apnName;
}

- (void)setApnName:(id)a3
{
  objc_storeStrong((id *)&self->_apnName, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSString)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (NSNumber)proxyPort
{
  return self->_proxyPort;
}

- (void)setProxyPort:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyPort, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_apnName, 0);
}

@end
