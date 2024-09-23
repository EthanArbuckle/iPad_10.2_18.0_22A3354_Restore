@implementation PerformBlockWithThemeRefCache

id __PerformBlockWithThemeRefCache_block_invoke()
{
  id result;

  result = objc_alloc_init((Class)NSMutableDictionary);
  PerformBlockWithThemeRefCache___themeRefsByUniqueKey = (uint64_t)result;
  return result;
}

@end
