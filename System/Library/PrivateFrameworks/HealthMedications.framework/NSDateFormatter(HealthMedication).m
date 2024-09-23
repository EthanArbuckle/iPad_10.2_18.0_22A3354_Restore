@implementation NSDateFormatter(HealthMedication)

- (id)hm_localizableTimeStringKeyWithPrefix:()HealthMedication date:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "dateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(a1, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invertedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", &stru_1E6CD6858);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v14, "numberFromString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_msgSend(v15, "integerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "component:fromDate:", 32, v7);

  }
  objc_msgSend(a1, "setDateFormat:", v8);
  if (v16 == 1)
  {
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("_SINGULAR"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v6;
  }
  v19 = v18;

  return v19;
}

+ (id)hm_localizableTimeStringKeyWithPrefix:()HealthMedication date:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3578];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "hm_localizableTimeStringKeyWithPrefix:date:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
