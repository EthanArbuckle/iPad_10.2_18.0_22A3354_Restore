@implementation MFMutableMessageHeadersFactory

- (id)mutableMessageHeaders
{
  return objc_alloc_init(MFMutableMessageHeaders);
}

@end
