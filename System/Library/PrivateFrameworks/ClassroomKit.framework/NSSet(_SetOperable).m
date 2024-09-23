@implementation NSSet(_SetOperable)

- (id)setBySubtractingSet:()_SetOperable
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v5, "minusSet:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v11);

    v8 = (id)v10;
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)setByIntersectingSet:()_SetOperable
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v5, "intersectSet:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intersectSet:", v11);

    v8 = (id)v10;
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

@end
