@implementation SLAOLWebClient

- (SLAOLWebClient)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLAOLWebClient;
  return -[SLAOLWebClient init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientID
{
  return (NSString *)CFSTR("kmpMGPVGmSPvOqfD");
}

- (NSString)clientSecret
{
  int v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(CFSTR("dzxrqhuqe9kajx2jm9znic2876vk{bhl2sme6x5h"), "length");
  MEMORY[0x1E0C80A78]();
  v4 = (char *)v9 - v3;
  v5 = objc_msgSend(CFSTR("dzxrqhuqe9kajx2jm9znic2876vk{bhl2sme6x5h"), "UTF8String");
  if (v2 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = v2;
    do
    {
      v4[v6] = *(_BYTE *)(v5 + v6) - ((v6 + 1) & 1);
      ++v6;
    }
    while (v2 != v6);
  }
  v4[v7] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)clientRedirect
{
  return CFSTR("https://apple.com");
}

- (NSString)tokenURL
{
  return (NSString *)CFSTR("https://api.login.aol.com/oauth2/get_token");
}

- (NSString)authRequestURL
{
  return (NSString *)CFSTR("https://api.login.aol.com/oauth2/request_auth");
}

- (NSString)userInfoURL
{
  return (NSString *)CFSTR("https://api.login.aol.com/openid/v1/userinfo");
}

- (NSString)clientRedirect
{
  return (NSString *)CFSTR("https://apple.com");
}

- (NSString)source
{
  return (NSString *)CFSTR("iphone01");
}

- (NSString)fallbackUserInfoURL
{
  return 0;
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
  return 0;
}

- (NSString)clientRedirectForAppOpenURL
{
  return 0;
}

- (NSArray)defaultScope
{
  return 0;
}

- (NSArray)youTubeScope
{
  return 0;
}

- (NSArray)emailScope
{
  return 0;
}

@end
