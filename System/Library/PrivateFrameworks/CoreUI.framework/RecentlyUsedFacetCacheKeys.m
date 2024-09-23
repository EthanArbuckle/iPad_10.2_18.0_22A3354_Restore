@implementation RecentlyUsedFacetCacheKeys

id __RecentlyUsedFacetCacheKeys_block_invoke()
{
  id result;

  result = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 20);
  RecentlyUsedFacetCacheKeys_facetCacheKeys = (uint64_t)result;
  return result;
}

@end
