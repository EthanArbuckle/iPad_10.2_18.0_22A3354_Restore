@implementation _NSMoribundCache

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NSMoribundCache;
  -[NSCache dealloc](&v8, sel_dealloc);
  CFLog(3, (uint64_t)CFSTR("Deallocating immortal cache!"), v2, v3, v4, v5, v6, v7, (__int16)v8.receiver);
  __break(1u);
}

- (id)name
{
  NSMoribundCache_invalidAccess();
  return &stru_1E1337B18;
}

- (id)delegate
{
  NSMoribundCache_invalidAccess();
  return 0;
}

- (id)objectForKey:(id)a3
{
  NSMoribundCache_invalidAccess();
  return 0;
}

- (unint64_t)totalCostLimit
{
  NSMoribundCache_invalidAccess();
  return 0;
}

- (unint64_t)countLimit
{
  NSMoribundCache_invalidAccess();
  return 0;
}

- (BOOL)evictsObjectsWithDiscardedContent
{
  NSMoribundCache_invalidAccess();
  return 0;
}

@end
