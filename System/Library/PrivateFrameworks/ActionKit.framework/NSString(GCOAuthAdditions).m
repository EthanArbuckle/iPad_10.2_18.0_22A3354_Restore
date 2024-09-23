@implementation NSString(GCOAuthAdditions)

- (CFStringRef)pcen
{
  return objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, CFSTR("!*'();:@&=+$,/?%#[]"),
                                           0x8000100u));
}

@end
