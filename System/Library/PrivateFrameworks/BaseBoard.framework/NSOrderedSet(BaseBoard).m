@implementation NSOrderedSet(BaseBoard)

- (BOOL)bs_containsObjectPassingTest:()BaseBoard
{
  void *v3;
  _BOOL8 v4;

  BSCollectionFind(a1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)bs_reduce:()BaseBoard block:
{
  BSCollectionReduce(a1, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bs_set
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)bs_array
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)bs_orderedSet
{
  return (id)objc_msgSend(a1, "copy");
}

- (id)bs_filter:()BaseBoard
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  BSCollectionFilter(v5, a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bs_map:()BaseBoard
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  BSCollectionMap(v5, a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bs_compactMap:()BaseBoard
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  BSCollectionCompactMap(v5, a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bs_firstObjectPassingTest:()BaseBoard
{
  BSCollectionFind(a1, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bs_dictionaryByPartitioning:()BaseBoard
{
  id v4;
  objc_class *v5;
  void *v6;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  BSCollectionPartition(v5, a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
