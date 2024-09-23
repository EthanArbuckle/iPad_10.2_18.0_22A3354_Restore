@implementation NSURL(AuthenticationServicesCoreExtras)

- (BOOL)as_isPasskeyURL
{
  return +[_ASCABLEQRCodeUtilities isPasskeyURL:](_TtC26AuthenticationServicesCore23_ASCABLEQRCodeUtilities, "isPasskeyURL:", a1);
}

- (BOOL)as_isPasskeyRegistrationURL
{
  return +[_ASCABLEQRCodeUtilities isPasskeyRegistrationURL:](_TtC26AuthenticationServicesCore23_ASCABLEQRCodeUtilities, "isPasskeyRegistrationURL:", a1);
}

- (int64_t)as_passkeyURLType
{
  return +[_ASCABLEQRCodeUtilities passkeyURLTypeFromURL:](_TtC26AuthenticationServicesCore23_ASCABLEQRCodeUtilities, "passkeyURLTypeFromURL:", a1);
}

@end
