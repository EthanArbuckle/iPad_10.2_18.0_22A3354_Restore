@implementation BFFAppleAccountInfo

+ (id)_accountInfos
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEC08;
  location = 0;
  objc_storeStrong(&location, &stru_1002841C8);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEC00;
}

+ (id)primaryAccountInfo
{
  id v2;
  id v3;
  id v4;
  id location[2];
  id v7;

  v7 = a1;
  location[1] = (id)a2;
  v2 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  location[0] = objc_msgSend(v3, "identifier");

  v4 = objc_msgSend(v7, "infoForAccountIdentifier:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)infoForAccountIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id location[2];
  id v12;

  v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  v3 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
  v9 = objc_msgSend(v3, "accountWithIdentifier:", location[0]);

  if (v9)
  {
    v8 = objc_msgSend(v12, "_accountInfos");
    v4 = objc_msgSend(v8, "objectForKeyedSubscript:", location[0]);
    v5 = v10;
    v10 = v4;

    if (!v10)
    {
      v10 = objc_alloc_init(BFFAppleAccountInfo);

      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, location[0]);
    }
    objc_storeStrong(&v8, 0);
  }
  v6 = v10;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)updateWithAuthenticationResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location[2];
  BFFAppleAccountInfo *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationUsernameKey);
  -[BFFAppleAccountInfo setUsername:](v10, "setUsername:", v3);

  v4 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationPasswordKey);
  -[BFFAppleAccountInfo setPassword:](v10, "setPassword:", v4);

  v5 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationRawPasswordKey);
  -[BFFAppleAccountInfo setRawPassword:](v10, "setRawPassword:", v5);

  v6 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationDSIDKey);
  v7 = objc_msgSend(v6, "stringValue");
  -[BFFAppleAccountInfo setDsid:](v10, "setDsid:", v7);

  v8 = objc_msgSend(location[0], "objectForKeyedSubscript:", AKAuthenticationAlternateDSIDKey);
  -[BFFAppleAccountInfo setAltDSID:](v10, "setAltDSID:", v8);

  objc_storeStrong(location, 0);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
