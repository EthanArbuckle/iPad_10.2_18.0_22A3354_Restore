@implementation NSError(CXChannelError)

+ (uint64_t)cx_channelErrorWithCode:()CXChannelError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CallKit.error.channel"), a3, 0);
}

@end
