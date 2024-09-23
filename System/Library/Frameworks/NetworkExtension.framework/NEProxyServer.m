@implementation NEProxyServer

- (NEProxyServer)initWithAddress:(NSString *)address port:(NSInteger)port
{
  return -[NEProxyServer initWithType:address:port:](self, "initWithType:address:port:", 1, address, port);
}

- (NEProxyServer)initWithType:(int64_t)a3 address:(id)a4 port:(int64_t)a5
{
  id v8;
  NEProxyServer *v9;
  NEProxyServer *v10;
  uint64_t v11;
  NSString *address;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NEProxyServer;
  v9 = -[NEProxyServer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v11 = objc_msgSend(v8, "copy");
    address = v10->_address;
    v10->_address = (NSString *)v11;

    v10->_port = a5;
  }

  return v10;
}

- (NEProxyServer)initWithCoder:(id)a3
{
  id v4;
  NEProxyServer *v5;
  uint64_t v6;
  NSString *address;
  uint64_t v8;
  NSString *username;
  uint64_t v10;
  NSString *password;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEProxyServer;
  v5 = -[NEProxyServer init](&v13, sel_init);
  if (v5)
  {
    v5->_type = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Address"));
    v6 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v6;

    v5->_port = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Port"));
    v5->_authenticationRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AuthenticationRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Username"));
    v8 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Password"));
    v10 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProxyServer type](self, "type"), CFSTR("Type"));
  -[NEProxyServer address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Address"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProxyServer port](self, "port"), CFSTR("Port"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxyServer authenticationRequired](self, "authenticationRequired"), CFSTR("AuthenticationRequired"));
  -[NEProxyServer username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Username"));

  -[NEProxyServer password](self, "password");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Password"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEProxyServer *v4;
  int64_t v5;
  void *v6;
  NEProxyServer *v7;
  void *v8;
  void *v9;

  v4 = +[NEProxyServer allocWithZone:](NEProxyServer, "allocWithZone:", a3);
  v5 = -[NEProxyServer type](self, "type");
  -[NEProxyServer address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NEProxyServer initWithType:address:port:](v4, "initWithType:address:port:", v5, v6, -[NEProxyServer port](self, "port"));

  -[NEProxyServer setAuthenticationRequired:](v7, "setAuthenticationRequired:", -[NEProxyServer authenticationRequired](self, "authenticationRequired"));
  -[NEProxyServer username](self, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxyServer setUsername:](v7, "setUsername:", v8);

  -[NEProxyServer password](self, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProxyServer setPassword:](v7, "setPassword:", v9);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NEProxyServer address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing proxy server address"), v4);

  return v5 != 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = -[NEProxyServer type](self, "type") - 2;
  if (v8 > 4)
    v9 = CFSTR("http");
  else
    v9 = off_1E3CC38E8[v8];
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("type"), v5, a4);
  -[NEProxyServer address](self, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a4 | 1;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("address"), v5, a4 | 1);

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", (int)-[NEProxyServer port](self, "port"), CFSTR("port"), v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxyServer authenticationRequired](self, "authenticationRequired"), CFSTR("authenticationRequired"), v5, a4);
  -[NEProxyServer username](self, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("username"), v5, v11);

  -[NEProxyServer password](self, "password");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("password"), v5, v11);

  return v7;
}

- (id)copyPassword
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[NEProxyServer copyProtectionSpace](self);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB39B0], "sharedCredentialStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultCredentialForProtectionSpace:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "password");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSInteger)port
{
  return self->_port;
}

- (BOOL)authenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setAuthenticationRequired:(BOOL)authenticationRequired
{
  self->_authenticationRequired = authenticationRequired;
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUsername:(NSString *)username
{
  objc_setProperty_atomic_copy(self, a2, username, 32);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPassword:(NSString *)password
{
  objc_setProperty_atomic_copy(self, a2, password, 40);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (void)copyProtectionSpace
{
  void *v1;
  unint64_t v2;
  id v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;

  v1 = a1;
  if (a1)
  {
    v2 = objc_msgSend(a1, "type") - 1;
    if (v2 <= 4 && ((0x17u >> v2) & 1) != 0)
    {
      v3 = **((id **)&unk_1E3CC3910 + v2);
      if (v3)
      {
        objc_msgSend(v1, "address");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "length");

        if (v6)
        {
          v7 = objc_alloc(MEMORY[0x1E0CB39C8]);
          objc_msgSend(v1, "address");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v1, "port");
          v1 = (void *)objc_msgSend(v7, "initWithProxyHost:port:type:realm:authenticationMethod:", v8, v9, v3, 0, *MEMORY[0x1E0CB32B0]);

          goto LABEL_6;
        }
      }
    }
    else
    {
      v3 = 0;
    }
    v1 = 0;
LABEL_6:

  }
  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)syncWithKeychain
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a1)
  {
    v11 = -[NEProxyServer copyProtectionSpace](a1);
    if (!v11)
      goto LABEL_13;
    if (objc_msgSend(a1, "authenticationRequired"))
    {
      objc_msgSend(a1, "password");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "length"))
      {
        objc_msgSend(a1, "username");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v3, "length");

        if (v4)
        {
          v5 = objc_alloc(MEMORY[0x1E0CB39A8]);
          objc_msgSend(a1, "username");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "password");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)objc_msgSend(v5, "initWithUser:password:persistence:", v6, v7, 2);

          if (v8)
          {
            objc_msgSend(MEMORY[0x1E0CB39B0], "sharedCredentialStorage");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setDefaultCredential:forProtectionSpace:", v8, v11);
LABEL_12:

          }
LABEL_13:
          objc_msgSend(a1, "setPassword:", 0);

          return;
        }
      }
      else
      {

      }
    }
    if ((objc_msgSend(a1, "authenticationRequired") & 1) != 0)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB39B0], "sharedCredentialStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultCredentialForProtectionSpace:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB39B0], "sharedCredentialStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeCredential:forProtectionSpace:", v8, v11);
    goto LABEL_12;
  }
}

- (BOOL)needToUpdateKeychain
{
  _BOOL8 v1;
  void *v2;
  void *v3;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    objc_msgSend(a1, "password");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend((id)v1, "password");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = objc_msgSend(v3, "length") != 0;

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void)removeFromKeychain
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v1 = -[NEProxyServer copyProtectionSpace](a1);
    if (v1)
    {
      v5 = v1;
      objc_msgSend(MEMORY[0x1E0CB39B0], "sharedCredentialStorage");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "defaultCredentialForProtectionSpace:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CB39B0], "sharedCredentialStorage");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeCredential:forProtectionSpace:", v3, v5);

      }
      v1 = v5;
    }

  }
}

@end
