@implementation ACHSortedEarnedInstances

uint64_t __ACHSortedEarnedInstances_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "earnedDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ACHCompareYearMonthDayDateComponents(v6, v7);

  if (!v8)
  {
    v9 = objc_msgSend(v4, "key");
    v10 = objc_msgSend(v5, "key");
    if (v9 >= v10)
      v11 = 0;
    else
      v11 = -1;
    if (v9 > v10)
      v8 = 1;
    else
      v8 = v11;
  }

  return v8;
}

@end
