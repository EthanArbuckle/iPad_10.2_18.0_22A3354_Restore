@implementation SLWebAuthIdentity

- (SLWebAuthIdentity)initWithUsername:(id)a3 token:(id)a4 displayName:(id)a5 refreshToken:(id)a6 youTubeUsername:(id)a7 idToken:(id)a8
{
  return -[SLWebAuthIdentity initWithUsername:token:displayName:refreshToken:youTubeUsername:idToken:grantedDataclasses:](self, "initWithUsername:token:displayName:refreshToken:youTubeUsername:idToken:grantedDataclasses:", a3, a4, a5, a6, a7, a8, 0);
}

- (SLWebAuthIdentity)initWithUsername:(id)a3 token:(id)a4 displayName:(id)a5 refreshToken:(id)a6 youTubeUsername:(id)a7 idToken:(id)a8 grantedDataclasses:(id)a9
{
  id v16;
  id v17;
  SLWebAuthIdentity *v18;
  SLWebAuthIdentity *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SLWebAuthIdentity;
  v18 = -[SLWebAuthIdentity init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_username, a3);
    objc_storeStrong((id *)&v19->_displayName, a5);
    objc_storeStrong((id *)&v19->_token, a4);
    objc_storeStrong((id *)&v19->_refreshToken, a6);
    objc_storeStrong((id *)&v19->_youTubeUsername, a7);
    objc_storeStrong((id *)&v19->_idToken, a8);
    objc_storeStrong((id *)&v19->_grantedDataclasses, a9);
  }

  return v19;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)idToken
{
  return self->_idToken;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)youTubeUsername
{
  return self->_youTubeUsername;
}

- (NSArray)grantedDataclasses
{
  return self->_grantedDataclasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong((id *)&self->_youTubeUsername, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
