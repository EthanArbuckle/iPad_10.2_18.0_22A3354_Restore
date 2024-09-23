@implementation NSError(AppleIDAuthentication)

+ (uint64_t)aida_errorWithCode:()AppleIDAuthentication
{
  return objc_msgSend(a1, "aida_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)aida_errorWithCode:()AppleIDAuthentication userInfo:
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AppleID.Error"), a3, a4);
}

@end
