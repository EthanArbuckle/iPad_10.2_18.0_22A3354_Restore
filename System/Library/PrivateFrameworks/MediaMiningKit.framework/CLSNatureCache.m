@implementation CLSNatureCache

+ (id)defaultCacheName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("CLSBusinessCategoryCache"), CFSTR("Nature"));
}

@end
