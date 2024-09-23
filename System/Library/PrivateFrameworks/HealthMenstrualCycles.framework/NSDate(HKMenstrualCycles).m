@implementation NSDate(HKMenstrualCycles)

- (id)hkmc_durationStringToEndDate:()HKMenstrualCycles calendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, a1, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 24, a1, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 12, a1, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v8, "day") == 0x7FFFFFFFFFFFFFFFLL || (v12 = objc_msgSend(v8, "day"), v13 = v8, v12 >= 61))
  {
    if (objc_msgSend(v10, "year") == 0x7FFFFFFFFFFFFFFFLL || (v14 = objc_msgSend(v10, "year"), v13 = v9, v14 >= 1))
      v13 = v10;
  }
  v15 = v13;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("en"));

  if (v18)
  {
    if (objc_msgSend(v15, "year") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v15, "year") >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "hkmc_stringForYears:", objc_msgSend(v15, "year"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v19);

    }
    if (objc_msgSend(v15, "month") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v15, "month") >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "hkmc_stringForMonths:", objc_msgSend(v15, "month"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v20);

    }
    if (objc_msgSend(v15, "day") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v15, "day") >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "hkmc_stringForDays:", objc_msgSend(v15, "day"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v21);

    }
    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v11);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14F8], "localizedStringFromDateComponents:unitsStyle:", v15, 3);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;

  return v23;
}

@end
