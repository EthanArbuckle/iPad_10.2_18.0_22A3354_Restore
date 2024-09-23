@implementation EDAMAuthenticationParameters

+ (id)structName
{
  return CFSTR("AuthenticationParameters");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[10];

  v15[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_350;
  if (!structFields_structFields_350)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 11, 1, CFSTR("usernameOrEmail"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("password"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("ssoLoginToken"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("consumerKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("consumerSecret"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("deviceIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 11, 1, CFSTR("deviceDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[6] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("supportsTwoFactor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[7] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 2, 1, CFSTR("supportsBusinessOnlyAccounts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[8] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 9);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_350;
    structFields_structFields_350 = v12;

    v2 = (void *)structFields_structFields_350;
  }
  return v2;
}

- (NSString)usernameOrEmail
{
  return self->_usernameOrEmail;
}

- (void)setUsernameOrEmail:(id)a3
{
  objc_storeStrong((id *)&self->_usernameOrEmail, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSString)ssoLoginToken
{
  return self->_ssoLoginToken;
}

- (void)setSsoLoginToken:(id)a3
{
  objc_storeStrong((id *)&self->_ssoLoginToken, a3);
}

- (NSString)consumerKey
{
  return self->_consumerKey;
}

- (void)setConsumerKey:(id)a3
{
  objc_storeStrong((id *)&self->_consumerKey, a3);
}

- (NSString)consumerSecret
{
  return self->_consumerSecret;
}

- (void)setConsumerSecret:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSecret, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (NSString)deviceDescription
{
  return self->_deviceDescription;
}

- (void)setDeviceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDescription, a3);
}

- (NSNumber)supportsTwoFactor
{
  return self->_supportsTwoFactor;
}

- (void)setSupportsTwoFactor:(id)a3
{
  objc_storeStrong((id *)&self->_supportsTwoFactor, a3);
}

- (NSNumber)supportsBusinessOnlyAccounts
{
  return self->_supportsBusinessOnlyAccounts;
}

- (void)setSupportsBusinessOnlyAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_supportsBusinessOnlyAccounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportsBusinessOnlyAccounts, 0);
  objc_storeStrong((id *)&self->_supportsTwoFactor, 0);
  objc_storeStrong((id *)&self->_deviceDescription, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_consumerSecret, 0);
  objc_storeStrong((id *)&self->_consumerKey, 0);
  objc_storeStrong((id *)&self->_ssoLoginToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_usernameOrEmail, 0);
}

@end
