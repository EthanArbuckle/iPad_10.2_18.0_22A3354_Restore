@implementation ASAuthorizationPasswordProvider

- (ASAuthorizationPasswordRequest)createRequest
{
  ASAuthorizationPasswordProvider *v2;
  ASAuthorizationPasswordRequest *v3;

  v2 = objc_alloc_init(ASAuthorizationPasswordProvider);
  v3 = -[ASAuthorizationRequest initWithProvider:]([ASAuthorizationPasswordRequest alloc], "initWithProvider:", v2);

  return v3;
}

@end
