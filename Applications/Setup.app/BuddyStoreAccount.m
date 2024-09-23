@implementation BuddyStoreAccount

- (BuddyStoreAccount)initWithUsername:(id)a3 dsid:(id)a4 altDSID:(id)a5
{
  id v7;
  BuddyStoreAccount *v8;
  BuddyStoreAccount *v9;
  objc_super v11;
  id v12;
  id v13;
  id location[2];
  id v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v7 = v15;
  v15 = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyStoreAccount;
  v8 = -[BuddyStoreAccount init](&v11, "init");
  v15 = v8;
  objc_storeStrong(&v15, v8);
  if (v8)
  {
    objc_msgSend(v15, "setUsername:", location[0]);
    objc_msgSend(v15, "setDsid:", v13);
    objc_msgSend(v15, "setAltDSID:", v12);
  }
  v9 = (BuddyStoreAccount *)v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (id)description
{
  uint64_t v2;
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v2 = objc_opt_class(self);
  v3 = -[BuddyStoreAccount username](self, "username");
  v4 = -[BuddyStoreAccount dsid](self, "dsid");
  v5 = -[BuddyStoreAccount altDSID](self, "altDSID");
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> Username: %@, DSID: %@, altDSID: %@"), v2, self, v3, v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  id location[2];
  BuddyStoreAccount *v7;
  char v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v7 == location[0])
  {
    v8 = 1;
  }
  else
  {
    v3 = location[0];
    v4 = objc_opt_class(BuddyStoreAccount);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v8 = -[BuddyStoreAccount isEqualToRestoreStoreAccount:](v7, "isEqualToRestoreStoreAccount:", location[0]);
    else
      v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (BOOL)isEqualToRestoreStoreAccount:(id)a3
{
  NSString *v3;
  BOOL v4;
  NSString *v5;
  id v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;
  id v10;
  char v12;
  id v13;
  char v14;
  id v15;
  id location[2];
  BuddyStoreAccount *v17;
  char v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyStoreAccount dsid](v17, "dsid");
  v14 = 0;
  v4 = 0;
  if (v3)
  {
    v15 = objc_msgSend(location[0], "dsid");
    v14 = 1;
    v4 = v15 != 0;
  }
  if ((v14 & 1) != 0)

  if (v4)
  {
    v5 = -[BuddyStoreAccount dsid](v17, "dsid");
    v6 = objc_msgSend(location[0], "dsid");
    v18 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = -[BuddyStoreAccount altDSID](v17, "altDSID");
    v12 = 0;
    v8 = 0;
    if (v7)
    {
      v13 = objc_msgSend(location[0], "altDSID");
      v12 = 1;
      v8 = v13 != 0;
    }
    if ((v12 & 1) != 0)

    if (v8)
    {
      v9 = -[BuddyStoreAccount altDSID](v17, "altDSID");
      v10 = objc_msgSend(location[0], "altDSID");
    }
    else
    {
      v9 = -[BuddyStoreAccount username](v17, "username");
      v10 = objc_msgSend(location[0], "username");
    }
    v18 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

  }
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (unint64_t)hash
{
  NSString *v2;
  NSUInteger v3;
  NSString *v4;
  unint64_t v5;
  NSString *v6;
  unint64_t v7;

  v2 = -[BuddyStoreAccount username](self, "username", a2);
  v3 = -[NSString hash](v2, "hash");
  v4 = -[BuddyStoreAccount dsid](self, "dsid");
  v5 = v3 ^ -[NSString hash](v4, "hash");
  v6 = -[BuddyStoreAccount altDSID](self, "altDSID");
  v7 = v5 ^ -[NSString hash](v6, "hash");

  return v7;
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
