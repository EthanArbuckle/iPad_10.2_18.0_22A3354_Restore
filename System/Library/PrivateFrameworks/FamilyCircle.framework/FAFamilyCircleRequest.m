@implementation FAFamilyCircleRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_passwordOrToken, 0);
  objc_storeStrong((id *)&self->_usernameOrDSID, 0);
}

- (FAFamilyCircleRequest)init
{
  void *v3;
  FAFamilyCircleRequest *v4;

  +[_FAFamilyCircleRequestConnectionProvider sharedInstance](_FAFamilyCircleRequestConnectionProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FAFamilyCircleRequest initWithConnectionProvider:](self, "initWithConnectionProvider:", v3);

  return v4;
}

- (FAFamilyCircleRequest)initWithConnectionProvider:(id)a3
{
  id v5;
  FAFamilyCircleRequest *v6;
  FAFamilyCircleRequest *v7;
  FAFamilyCircleRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FAFamilyCircleRequest;
  v6 = -[FAFamilyCircleRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionProvider, a3);
    v8 = v7;
  }

  return v7;
}

- (id)serviceRemoteObjectWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FAFamilyCircleRequest serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)serviceConnection
{
  void *v2;
  void *v3;

  -[FAFamilyCircleRequest connectionProvider](self, "connectionProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FAFamilyCircleRequestConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (id)requestOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFamilyCircleRequest usernameOrDSID](self, "usernameOrDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Username"));

  -[FAFamilyCircleRequest passwordOrToken](self, "passwordOrToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Password"));

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ClientProcess"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (NSString)usernameOrDSID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)passwordOrToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)synchronousRemoteObjectWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FAFamilyCircleRequest serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setUsernameOrDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setPasswordOrToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setConnectionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_connectionProvider, a3);
}

@end
