@implementation OSLogPersistence(FBKHelper)

- (uint64_t)fba_hasValidStartAndEndDates
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "startDate");
  result = objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v3 = (void *)result;
    objc_msgSend(a1, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "startDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "compare:", v6);

      return v7 == -1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
