@implementation NSMutableArray(GEOComposedRouteStepInternal)

- (uint64_t)_transit_hasAnyFieldSet
{
  return 1;
}

- (void)_transit_mergeFrom:()GEOComposedRouteStepInternal
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "removeAllObjects");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "addObjectsFromArray:", v4);

}

@end
