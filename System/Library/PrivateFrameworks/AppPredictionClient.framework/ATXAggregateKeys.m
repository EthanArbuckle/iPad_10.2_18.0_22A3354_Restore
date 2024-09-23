@implementation ATXAggregateKeys

+ (id)abGroupNilString
{
  return CFSTR("unknown");
}

+ (id)featureIdentifier
{
  return CFSTR("DEC");
}

+ (id)keyWithSubkey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.duet.expertcenter"), a3);
}

@end
