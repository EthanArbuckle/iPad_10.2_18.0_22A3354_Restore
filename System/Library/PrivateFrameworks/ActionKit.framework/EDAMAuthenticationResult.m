@implementation EDAMAuthenticationResult

+ (id)structName
{
  return CFSTR("AuthenticationResult");
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
  void *v15;
  _QWORD v16[11];

  v16[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_99;
  if (!structFields_structFields_99)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 0, CFSTR("currentTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 0, CFSTR("authenticationToken"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 0, CFSTR("expiration"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v4;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 4, 12, 1, CFSTR("user"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v5;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 5, 12, 1, CFSTR("publicUserInfo"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("noteStoreUrl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 11, 1, CFSTR("webApiUrlPrefix"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[6] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 1, CFSTR("secondFactorRequired"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[7] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 11, 1, CFSTR("secondFactorDeliveryHint"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[8] = v10;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 10, 12, 1, CFSTR("urls"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[9] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 10);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_99;
    structFields_structFields_99 = v12;

    v2 = (void *)structFields_structFields_99;
  }
  return v2;
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationToken, a3);
}

- (NSNumber)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_expiration, a3);
}

- (EDAMUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (EDAMPublicUserInfo)publicUserInfo
{
  return self->_publicUserInfo;
}

- (void)setPublicUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_publicUserInfo, a3);
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setNoteStoreUrl:(id)a3
{
  objc_storeStrong((id *)&self->_noteStoreUrl, a3);
}

- (NSString)webApiUrlPrefix
{
  return self->_webApiUrlPrefix;
}

- (void)setWebApiUrlPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_webApiUrlPrefix, a3);
}

- (NSNumber)secondFactorRequired
{
  return self->_secondFactorRequired;
}

- (void)setSecondFactorRequired:(id)a3
{
  objc_storeStrong((id *)&self->_secondFactorRequired, a3);
}

- (NSString)secondFactorDeliveryHint
{
  return self->_secondFactorDeliveryHint;
}

- (void)setSecondFactorDeliveryHint:(id)a3
{
  objc_storeStrong((id *)&self->_secondFactorDeliveryHint, a3);
}

- (EDAMUserUrls)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
  objc_storeStrong((id *)&self->_urls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_secondFactorDeliveryHint, 0);
  objc_storeStrong((id *)&self->_secondFactorRequired, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_publicUserInfo, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

@end
