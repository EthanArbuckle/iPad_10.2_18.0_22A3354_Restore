@implementation HKSample(Fitness)

- (uint64_t)fi_isAfterDate:()Fitness
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hk_isAfterOrEqualToDate:", v4);

  return v6;
}

- (uint64_t)fi_isBeforeDate:()Fitness
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hk_isBeforeOrEqualToDate:", v4);

  return v6;
}

- (uint64_t)fi_spansDate:()Fitness useStrictDateLimits:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  objc_msgSend(a1, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!a4)
  {
    if (objc_msgSend(v7, "hk_isBeforeOrEqualToDate:", v6))
    {
      objc_msgSend(a1, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hk_isAfterOrEqualToDate:", v6);
      goto LABEL_6;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v7, "hk_isBeforeDate:", v6))
    goto LABEL_7;
  objc_msgSend(a1, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hk_isAfterDate:", v6);
LABEL_6:
  v11 = v10;

LABEL_8:
  return v11;
}

- (uint64_t)fi_overlapsStartDate:()Fitness endDate:
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  int v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hk_isBeforeOrEqualToDate:", v7);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(a1, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hk_isAfterOrEqualToDate:", v6);

    v10 = v12 ^ 1u;
  }

  return v10;
}

@end
