@implementation NSDateInterval(MOExtensions)

- (id)unionWithDateInterval:()MOExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(a1, "intersectsDateInterval:", v4))
  {
    objc_msgSend(a1, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "earlierDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "laterDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isBeforeDate:", v10))
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v10);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
