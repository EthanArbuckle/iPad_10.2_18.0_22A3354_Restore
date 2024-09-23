@implementation FMFAppAccountInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FMFAppAccountInfo dsid](self, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAppAccountInfo username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAppAccountInfo appAuthToken](self, "appAuthToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("(not-nil)");
  else
    v7 = CFSTR("(nil)");
  v8 = -[FMFAppAccountInfo appAuthTokenStatus](self, "appAuthTokenStatus");
  -[FMFAppAccountInfo appServerHost](self, "appServerHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAppAccountInfo legacyDsid](self, "legacyDsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAppAccountInfo legacyUsername](self, "legacyUsername");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FMFAppAccountInfo(0x%lx) %@,%@,%@,%ld,%@,%@,%@"), self, v4, v5, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)appServerHost
{
  return self->_appServerHost;
}

- (void)setAppServerHost:(id)a3
{
  objc_storeStrong((id *)&self->_appServerHost, a3);
}

- (NSString)appAuthToken
{
  return self->_appAuthToken;
}

- (void)setAppAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_appAuthToken, a3);
}

- (int64_t)appAuthTokenStatus
{
  return self->_appAuthTokenStatus;
}

- (void)setAppAuthTokenStatus:(int64_t)a3
{
  self->_appAuthTokenStatus = a3;
}

- (NSString)legacyDsid
{
  return self->_legacyDsid;
}

- (void)setLegacyDsid:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDsid, a3);
}

- (NSString)legacyUsername
{
  return self->_legacyUsername;
}

- (void)setLegacyUsername:(id)a3
{
  objc_storeStrong((id *)&self->_legacyUsername, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyUsername, 0);
  objc_storeStrong((id *)&self->_legacyDsid, 0);
  objc_storeStrong((id *)&self->_appAuthToken, 0);
  objc_storeStrong((id *)&self->_appServerHost, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
