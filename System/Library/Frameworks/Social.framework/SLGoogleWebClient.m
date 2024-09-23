@implementation SLGoogleWebClient

- (SLGoogleWebClient)initWithClientID:(id)a3
{
  id v5;
  SLGoogleWebClient *v6;
  SLGoogleWebClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLGoogleWebClient;
  v6 = -[SLGoogleWebClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientID, a3);

  return v7;
}

- (SLGoogleWebClient)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLGoogleWebClient;
  return -[SLGoogleWebClient init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientID
{
  if (self->_clientID)
    return self->_clientID;
  else
    return (NSString *)CFSTR("450232826690-0rm6bs9d2fps9tifvk2oodh3tasd7vl7.apps.googleusercontent.com");
}

- (NSString)clientSecret
{
  return 0;
}

- (NSString)clientRedirect
{
  return (NSString *)CFSTR("urn:ietf:wg:oauth:2.0:oob");
}

- (NSString)tokenURL
{
  return (NSString *)CFSTR("https://www.googleapis.com/oauth2/v4/token");
}

- (NSString)authRequestURL
{
  return (NSString *)CFSTR("https://accounts.google.com/o/oauth2/v2/auth");
}

- (NSString)userInfoURL
{
  return (NSString *)CFSTR("https://people.googleapis.com/v1/people/me?personFields=emailAddresses,names");
}

- (NSString)fallbackUserInfoURL
{
  return (NSString *)CFSTR("https://www.googleapis.com/plus/v1/people/me");
}

- (NSArray)defaultScope
{
  return (NSArray *)&unk_1E75ADF90;
}

- (id)loginScopes
{
  return &unk_1E75ADFA8;
}

- (NSArray)youTubeScope
{
  return (NSArray *)&unk_1E75ADFC0;
}

- (NSArray)emailScope
{
  return (NSArray *)&unk_1E75ADFD8;
}

+ (id)dataclassesForScopes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", CFSTR("https://mail.google.com/")))
  {
    v5 = *MEMORY[0x1E0C8EED8];
    v9[0] = *MEMORY[0x1E0C8EEB0];
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  }
  if (objc_msgSend(v3, "containsObject:", CFSTR("https://www.googleapis.com/auth/calendar")))
    objc_msgSend(v4, "addObject:", *MEMORY[0x1E0C8EE58]);
  if (objc_msgSend(v3, "containsObject:", CFSTR("https://www.googleapis.com/auth/carddav")))
    objc_msgSend(v4, "addObject:", *MEMORY[0x1E0C8EE68]);
  objc_msgSend(v4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)source
{
  return 0;
}

- (NSString)clientRedirectForAppOpenURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (Class)tokenResponseClass
{
  return (Class)objc_opt_class();
}

- (Class)tokenRequestClass
{
  return (Class)objc_opt_class();
}

- (Class)webAuthRequestClass
{
  return (Class)objc_opt_class();
}

- (Class)webUserInfoResponseClass
{
  return (Class)objc_opt_class();
}

- (Class)fallbackWebUserInfoResponseClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
