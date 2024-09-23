@implementation SLYahooWebAuthController

- (id)_webClient
{
  return objc_alloc_init(SLYahooWebClient);
}

- (id)_extentionIdentifier
{
  return CFSTR("com.apple.social.SLYahooAuth.SLYahooAuthService");
}

@end
