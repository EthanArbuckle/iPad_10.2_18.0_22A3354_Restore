@implementation PBAPasscodeVerificationViewController

- (id)makeAuthenticationRequestWithPasscode:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)SBFAuthenticationRequest), "initForPasscode:source:skipSEKeepUserDataOperation:verifyOnly:handler:", v3, 0, 0, 1, 0);

  return v4;
}

@end
