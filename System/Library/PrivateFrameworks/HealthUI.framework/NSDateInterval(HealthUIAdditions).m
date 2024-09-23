@implementation NSDateInterval(HealthUIAdditions)

+ (id)hk_dateIntervalWithValueRange:()HealthUIAdditions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v3, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

    goto LABEL_5;
  }
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
LABEL_5:

  return v5;
}

@end
