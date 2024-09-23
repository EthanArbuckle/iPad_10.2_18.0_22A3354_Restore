@implementation NSDateComponents(ContactsFoundation)

- (BOOL)_cn_isEmpty
{
  return objc_msgSend(a1, "year") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "month") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a1, "day") == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "era"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, __CNDateComponentEra);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "year"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, __CNDateComponentYear);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "month"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, __CNDateComponentMonth);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "day"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, __CNDateComponentDay);

  objc_msgSend(a1, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, __CNDateComponentCalendarIdentifier);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isLeapMonth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, __CNIsLeapMonthKey);

  return v2;
}

+ (id)_cn_dateComponentsFromDictionary:()ContactsFoundation
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "objectForKeyedSubscript:", __CNDateComponentCalendarIdentifier);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = v5;
    }
    else
    {
      objc_msgSend(v5, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v5 = 0;
        goto LABEL_7;
      }
      v7 = (void *)v9;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", __CNDateComponentEra);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEra:", objc_msgSend(v10, "integerValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", __CNDateComponentYear);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setYear:", objc_msgSend(v11, "integerValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", __CNDateComponentMonth);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMonth:", objc_msgSend(v12, "integerValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", __CNDateComponentDay);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDay:", objc_msgSend(v13, "integerValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", __CNIsLeapMonthKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeapMonth:", objc_msgSend(v14, "BOOLValue"));
    v5 = v4;

LABEL_7:
  }

  return v5;
}

@end
