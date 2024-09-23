@implementation HKStatistics(HealthRecordsUI)

- (void)updateMinMaxWithChartableCodedQuantity:()HealthRecordsUI
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(a1, "minimumQuantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(a1, "minimumQuantity"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "quantity"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "compare:", v6),
        v6,
        v5,
        v7 != 1))
  {
    objc_msgSend(a1, "minimumQuantity");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "quantity");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  objc_msgSend(a1, "setMinimumQuantity:", v8);

  objc_msgSend(a1, "maximumQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (objc_msgSend(a1, "maximumQuantity"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "quantity"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v11, "compare:", v12),
        v12,
        v11,
        v13 == -1))
  {
    objc_msgSend(v16, "quantity");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "maximumQuantity");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;
  objc_msgSend(a1, "setMaximumQuantity:", v14);

}

@end
