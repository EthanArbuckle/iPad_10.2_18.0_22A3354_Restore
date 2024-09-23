@implementation NSHTTPCookie2

- (NSHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSHTTPCookie2 *v12;
  NSHTTPCookie2 *v13;
  uint64_t v14;
  void *domain;
  uint64_t v16;
  NSString *v17;
  NSString *path;
  NSString *partition;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NSHTTPCookie2;
  v12 = -[NSHTTPCookie2 init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    if (objc_msgSend(v11, "hasPrefix:", CFSTR(".")))
    {
      objc_msgSend(v11, "lowercaseString");
      v14 = objc_claimAutoreleasedReturnValue();
      domain = v13->_domain;
      v13->_domain = (NSString *)v14;
    }
    else
    {
      objc_msgSend(CFSTR("."), "stringByAppendingString:", v11);
      domain = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(domain, "lowercaseString");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v13->_domain;
      v13->_domain = (NSString *)v16;

    }
    path = v13->_path;
    v13->_path = (NSString *)CFSTR("/");

    partition = v13->_partition;
    v13->_partition = (NSString *)CFSTR("none");

    *(_DWORD *)&v13->_secure = 0x1000000;
    v13->_sameSite = 0;
    v13->_source = 0;
  }

  return v13;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)self->_sCreationDate);
}

- (NSDate)expirationDate
{
  if (self->_session)
    return (NSDate *)0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)self->_sExpirationDate);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSHTTPCookie2 name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2 value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2 domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2 partition](self, "partition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2 path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2 expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NSHTTPCookie2 = <\n Name=%@\n Value=%@\n Domain=%@\n Partition=%@\n Path=%@\n Expiry=%@\n Secure=%d\n HttpOnly=%d\n HostOnly=%d\n sameSite=%ld\n>"), v11, v4, v5, v6, v7, v8, -[NSHTTPCookie2 secure](self, "secure"), -[NSHTTPCookie2 httpOnly](self, "httpOnly"), -[NSHTTPCookie2 hostOnly](self, "hostOnly"), -[NSHTTPCookie2 sameSite](self, "sameSite"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSMutableHTTPCookie2 *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableHTTPCookie2 *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = [NSMutableHTTPCookie2 alloc];
  -[NSHTTPCookie2 name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2 value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPCookie2 domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableHTTPCookie2 initWithName:value:domain:](v4, "initWithName:value:domain:", v5, v6, v7);

  -[NSHTTPCookie2 partition](self, "partition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableHTTPCookie2 setPartition:](v8, "setPartition:", v9);

  -[NSHTTPCookie2 value](self, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableHTTPCookie2 setValue:](v8, "setValue:", v10);

  -[NSHTTPCookie2 path](self, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableHTTPCookie2 setPath:](v8, "setPath:", v11);

  -[NSMutableHTTPCookie2 setSecure:](v8, "setSecure:", -[NSHTTPCookie2 secure](self, "secure"));
  -[NSMutableHTTPCookie2 setSameSite:](v8, "setSameSite:", -[NSHTTPCookie2 sameSite](self, "sameSite"));
  -[NSHTTPCookie2 expirationDate](self, "expirationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableHTTPCookie2 setExpirationDate:](v8, "setExpirationDate:", v12);

  -[NSMutableHTTPCookie2 setHostOnly:](v8, "setHostOnly:", -[NSHTTPCookie2 hostOnly](self, "hostOnly"));
  -[NSMutableHTTPCookie2 setHttpOnly:](v8, "setHttpOnly:", -[NSHTTPCookie2 httpOnly](self, "httpOnly"));
  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)sesion
{
  return self->_sesion;
}

- (BOOL)secure
{
  return self->_secure;
}

- (BOOL)httpOnly
{
  return self->_httpOnly;
}

- (BOOL)hostOnly
{
  return self->_hostOnly;
}

- (NSString)partition
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (int64_t)sameSite
{
  return self->_sameSite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->creationDate, 0);
  objc_storeStrong((id *)&self->_etldPlusOne, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
