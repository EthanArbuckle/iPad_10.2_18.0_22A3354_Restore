@implementation QueryCriteriaResultsCache

- (QueryCriteriaResultsCache)init
{
  QueryCriteriaResultsCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QueryCriteriaResultsCache;
  v2 = -[QueryCriteriaResultsCache init](&v4, sel_init);
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    -[QueryCriteriaResultsCache setEvictsObjectsWhenApplicationEntersBackground:](v2, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
  return v2;
}

@end
