@implementation CLPlacemark(FuzzyMatch)

- (uint64_t)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(a1, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(a1, "location");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "location");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "atx_isFuzzyMatch:", v10);

      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
