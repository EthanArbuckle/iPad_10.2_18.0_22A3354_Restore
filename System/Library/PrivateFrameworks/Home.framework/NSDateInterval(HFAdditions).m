@implementation NSDateInterval(HFAdditions)

- (uint64_t)hf_searchResultForDate:()HFAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "compare:", v7);

    if (v8 == 1)
      v9 = 2;
    else
      v9 = 1;
  }

  return v9;
}

@end
