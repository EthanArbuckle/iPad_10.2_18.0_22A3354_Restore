@implementation NSDictionary(CRAccNavController)

- (id)keyAfter:()CRAccNavController
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "indexOfObject:", v4);
    if (v7 + 1 >= (unint64_t)objc_msgSend(v6, "count"))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7 + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)firstKey
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingSelector:", sel_compare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
