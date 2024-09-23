@implementation ShCompile

void __ShCompile_block_invoke()
{
  if (!compilerCache)
    compilerCache = (uint64_t)glpCacheOpen();
}

@end
