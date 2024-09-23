@implementation AALoginResponseiCloudTokens

- (AALoginResponseiCloudTokens)initWithTokens:(id)a3
{
  id v4;
  AALoginResponseiCloudTokens *v5;
  uint64_t v6;
  NSString *authToken;
  uint64_t v8;
  NSString *fmipAuthToken;
  uint64_t v10;
  NSString *fmipAppToken;
  uint64_t v12;
  NSString *fmipLostModeToken;
  uint64_t v14;
  NSString *fmipSiriToken;
  uint64_t v16;
  NSString *fmfToken;
  uint64_t v18;
  NSString *fmfAppToken;
  uint64_t v20;
  NSString *cloudKitToken;
  uint64_t v22;
  NSString *mdmServerToken;
  uint64_t v24;
  NSString *mapsToken;
  uint64_t v26;
  NSString *searchPartyToken;
  uint64_t v28;
  NSString *keyTransparencyToken;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AALoginResponseiCloudTokens;
  v5 = -[AALoginResponseiCloudTokens init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("mmeAuthToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("mmeFMIPToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    fmipAuthToken = v5->_fmipAuthToken;
    v5->_fmipAuthToken = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("mmeFMIPAppToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    fmipAppToken = v5->_fmipAppToken;
    v5->_fmipAppToken = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("lostModeExitAuthToken"));
    v12 = objc_claimAutoreleasedReturnValue();
    fmipLostModeToken = v5->_fmipLostModeToken;
    v5->_fmipLostModeToken = (NSString *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("mmeFMIPSiriToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    fmipSiriToken = v5->_fmipSiriToken;
    v5->_fmipSiriToken = (NSString *)v14;

    objc_msgSend(v4, "objectForKey:", CFSTR("mmeFMFToken"));
    v16 = objc_claimAutoreleasedReturnValue();
    fmfToken = v5->_fmfToken;
    v5->_fmfToken = (NSString *)v16;

    objc_msgSend(v4, "objectForKey:", CFSTR("mmeFMFAppToken"));
    v18 = objc_claimAutoreleasedReturnValue();
    fmfAppToken = v5->_fmfAppToken;
    v5->_fmfAppToken = (NSString *)v18;

    objc_msgSend(v4, "objectForKey:", CFSTR("cloudKitToken"));
    v20 = objc_claimAutoreleasedReturnValue();
    cloudKitToken = v5->_cloudKitToken;
    v5->_cloudKitToken = (NSString *)v20;

    objc_msgSend(v4, "objectForKey:", CFSTR("mdmServerToken"));
    v22 = objc_claimAutoreleasedReturnValue();
    mdmServerToken = v5->_mdmServerToken;
    v5->_mdmServerToken = (NSString *)v22;

    objc_msgSend(v4, "objectForKey:", CFSTR("mapsToken"));
    v24 = objc_claimAutoreleasedReturnValue();
    mapsToken = v5->_mapsToken;
    v5->_mapsToken = (NSString *)v24;

    objc_msgSend(v4, "objectForKey:", CFSTR("searchPartyToken"));
    v26 = objc_claimAutoreleasedReturnValue();
    searchPartyToken = v5->_searchPartyToken;
    v5->_searchPartyToken = (NSString *)v26;

    objc_msgSend(v4, "objectForKey:", CFSTR("keyTransparencyToken"));
    v28 = objc_claimAutoreleasedReturnValue();
    keyTransparencyToken = v5->_keyTransparencyToken;
    v5->_keyTransparencyToken = (NSString *)v28;

  }
  return v5;
}

- (NSString)authToken
{
  return self->_authToken;
}

- (NSString)fmipAuthToken
{
  return self->_fmipAuthToken;
}

- (NSString)fmipAppToken
{
  return self->_fmipAppToken;
}

- (NSString)fmipLostModeToken
{
  return self->_fmipLostModeToken;
}

- (NSString)fmipSiriToken
{
  return self->_fmipSiriToken;
}

- (NSString)fmfToken
{
  return self->_fmfToken;
}

- (NSString)fmfAppToken
{
  return self->_fmfAppToken;
}

- (NSString)cloudKitToken
{
  return self->_cloudKitToken;
}

- (NSString)mdmServerToken
{
  return self->_mdmServerToken;
}

- (NSString)mapsToken
{
  return self->_mapsToken;
}

- (NSString)searchPartyToken
{
  return self->_searchPartyToken;
}

- (NSString)keyTransparencyToken
{
  return self->_keyTransparencyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTransparencyToken, 0);
  objc_storeStrong((id *)&self->_searchPartyToken, 0);
  objc_storeStrong((id *)&self->_mapsToken, 0);
  objc_storeStrong((id *)&self->_mdmServerToken, 0);
  objc_storeStrong((id *)&self->_cloudKitToken, 0);
  objc_storeStrong((id *)&self->_fmfAppToken, 0);
  objc_storeStrong((id *)&self->_fmfToken, 0);
  objc_storeStrong((id *)&self->_fmipSiriToken, 0);
  objc_storeStrong((id *)&self->_fmipLostModeToken, 0);
  objc_storeStrong((id *)&self->_fmipAppToken, 0);
  objc_storeStrong((id *)&self->_fmipAuthToken, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
}

@end
