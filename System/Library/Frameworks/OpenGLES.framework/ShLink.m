@implementation ShLink

void __ShLink_block_invoke()
{
  if (!linkerCache)
    linkerCache = (uint64_t)glpCacheOpen();
}

@end
