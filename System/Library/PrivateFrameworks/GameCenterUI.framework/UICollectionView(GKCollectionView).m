@implementation UICollectionView(GKCollectionView)

- (id)_gkReuseIdentifierForClass:()GKCollectionView
{
  void *v3;
  void *v4;

  NSStringFromClass(aClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_gkAuto_"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)_gkPerformWithoutViewReuse:()GKCollectionView
{
  uint64_t result;

  ++sWithoutReuseCount;
  result = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
  --sWithoutReuseCount;
  return result;
}

- (void)_gkRegisterCellClass:()GKCollectionView
{
  id v5;

  objc_msgSend(a1, "_gkReuseIdentifierForClass:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:", a3, v5);

}

- (void)_gkRegisterNib:()GKCollectionView forCellClass:
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_gkReuseIdentifierForClass:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerNib:forCellWithReuseIdentifier:", v6, v7);

}

- (id)_gkDequeueCellForClass:()GKCollectionView forIndexPath:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "_gkReuseIdentifierForClass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_gkRegisterClass:()GKCollectionView forSupplementaryViewOfKind:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "_gkReuseIdentifierForClass:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", a3, v6, v7);

}

- (id)_gkDequeueSupplementaryViewForClass:()GKCollectionView ofKind:forIndexPath:
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a4;
  v9 = sWithoutReuseCount;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(a1, "collectionViewLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutAttributesForItemAtIndexPath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [a3 alloc];
    objc_msgSend(v12, "frame");
    v14 = (void *)objc_msgSend(v13, "initWithFrame:");
    objc_msgSend(v14, "applyLayoutAttributes:", v12);
  }
  else
  {
    objc_msgSend(a1, "_gkReuseIdentifierForClass:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v12, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

@end
