@implementation TMSDKUserAgent

+ (id)userAgentHeaderString
{
  return (id)objc_msgSend(CFSTR("TMTumblrSDK"), "stringByAppendingPathComponent:", CFSTR("2.0.2"));
}

@end
