@implementation NSCalendar(CKUtilities)

- (uint64_t)__ck_unitOfDisambiguityFromDate:()CKUtilities toDate:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v24 = v6;
  objc_msgSend(a1, "components:fromDate:", 30, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "components:fromDate:", 30, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "copy");
  v11 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "setDay:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(v11, "setDay:", 0x7FFFFFFFFFFFFFFFLL);
  objc_msgSend(a1, "dateFromComponents:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFromComponents:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 4;
  objc_msgSend(a1, "components:fromDate:toDate:options:", 4, v12, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "year") <= 0)
  {
    v23 = v11;
    v22 = v10;
    v16 = v7;
    objc_msgSend(a1, "dateFromComponents:", v8);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateFromComponents:", v9);
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "components:fromDate:toDate:options:", 8208, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "weekOfYear") <= 0)
    {
      if (objc_msgSend(v20, "day") <= 0)
      {
        if (objc_msgSend(v24, "isEqualToDate:", v16))
          v14 = 0;
        else
          v14 = 128;
      }
      else
      {
        v14 = 16;
      }
    }
    else
    {
      v14 = 8;
    }

    v7 = v16;
    v10 = v22;
    v11 = v23;
  }

  return v14;
}

+ (id)__ck_currentCalendar
{
  if (__ck_currentCalendar_once != -1)
    dispatch_once(&__ck_currentCalendar_once, &__block_literal_global_577);
  if (sTestCalendar)
    return (id)sTestCalendar;
  else
    return (id)__ck_currentCalendar_sCalendar;
}

+ (void)__ck_setTestCalendar:()CKUtilities
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)sTestCalendar != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&sTestCalendar, a3);
    v4 = v5;
  }

}

@end
