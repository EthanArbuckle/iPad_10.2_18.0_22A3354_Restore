@implementation NSNull(CAMLWriter)

- (const)CAMLType
{
  return CFSTR("null");
}

@end
