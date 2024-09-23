@implementation User

- (User)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  User *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DSID")));
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("username")));
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("password")));
  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("biometricsToken")));
  v15 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    v16 = v14;
  else
    v16 = 0;

  v17 = 0;
  if (v7 && v10)
  {
    self = -[User initWithDSID:username:password:biometricsToken:](self, "initWithDSID:username:password:biometricsToken:", v7, v10, v13, v16);
    v17 = self;
  }

  return v17;
}

- (User)initWithDSID:(id)a3 username:(id)a4 password:(id)a5 biometricsToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  User *v15;
  User *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)User;
  v15 = -[User init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DSID, a3);
    objc_storeStrong((id *)&v16->_username, a4);
    objc_storeStrong((id *)&v16->_password, a5);
    objc_storeStrong((id *)&v16->_biometricsToken, a6);
  }

  return v16;
}

- (id)compile
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[User biometricsToken](self, "biometricsToken"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v4, CFSTR("biometricsToken"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[User DSID](self, "DSID"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v5, CFSTR("DSID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[User password](self, "password"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v6, CFSTR("password"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[User username](self, "username"));
  objc_msgSend(v3, "ap_setNullableObject:forKey:", v7, CFSTR("username"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[User compile](self, "compile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[User ap_generateDescriptionWithSubObjects:](self, "ap_generateDescriptionWithSubObjects:", v3));

  return v4;
}

- (NSString)biometricsToken
{
  return self->_biometricsToken;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)username
{
  return self->_username;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_biometricsToken, 0);
}

@end
