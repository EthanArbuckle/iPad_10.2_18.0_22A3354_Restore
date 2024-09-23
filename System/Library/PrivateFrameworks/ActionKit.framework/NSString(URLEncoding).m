@implementation NSString(URLEncoding)

- (CFStringRef)en_stringByUrlEncoding
{
  return objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, CFSTR("!*'\"();:@&=+$,/?%#[]% "),
                                           0x8000100u));
}

- (CFStringRef)en_stringByUrlDecoding
{
  return (id)CFURLCreateStringByReplacingPercentEscapesUsingEncoding((CFAllocatorRef)*MEMORY[0x24BDBD240], origString, &stru_24F8BBA48, 0x8000100u);
}

@end
