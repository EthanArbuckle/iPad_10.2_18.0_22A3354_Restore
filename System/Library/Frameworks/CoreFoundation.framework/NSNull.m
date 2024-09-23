@implementation NSNull

+ (NSNull)null
{
  return (NSNull *)&__kCFNull;
}

- (id)description
{
  return CFSTR("<null>");
}

+ (NSNull)allocWithZone:(_NSZone *)a3
{
  return (NSNull *)&__kCFNull;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)retainCount
{
  return -1;
}

- (NSNull)initWithCoder:(id)a3
{
  return 0;
}

@end
