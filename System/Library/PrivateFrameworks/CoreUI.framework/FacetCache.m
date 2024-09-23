@implementation FacetCache

id __FacetCache_block_invoke()
{
  id result;

  result = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 20);
  FacetCache_facetCache = (uint64_t)result;
  return result;
}

@end
