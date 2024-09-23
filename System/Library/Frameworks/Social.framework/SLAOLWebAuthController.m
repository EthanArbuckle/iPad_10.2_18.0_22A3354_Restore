@implementation SLAOLWebAuthController

- (id)_webClient
{
  return objc_alloc_init(SLAOLWebClient);
}

- (id)_extentionIdentifier
{
  return CFSTR("com.apple.social.SLYahooAuth.SLYahooAuthService");
}

@end
