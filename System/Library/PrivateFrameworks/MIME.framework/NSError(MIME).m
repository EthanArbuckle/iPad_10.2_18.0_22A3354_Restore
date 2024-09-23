@implementation NSError(MIME)

+ (id)mf_decodeFailedErrorWithUserInfo:()MIME
{
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("MFMIMEErrorDomain"), 2000000, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
