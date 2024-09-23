@implementation NSDateComponents(HKDayIndex)

+ (id)hk_componentsWithDayIndex:()HKDayIndex calendar:
{
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a4;
  objc_msgSend(v7, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateComponents+HKDayIndex.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[calendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  HKCalendarComponentsFromDayIndex(a3, &v13);
  v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v10, "setCalendar:", v7);

  objc_msgSend(v10, "setDay:", v15);
  objc_msgSend(v10, "setMonth:", v14);
  objc_msgSend(v10, "setYear:", v13);
  return v10;
}

- (uint64_t)hk_dayIndex
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_msgSend(a1, "year");
  v3 = objc_msgSend(a1, "month");
  v4 = objc_msgSend(a1, "day");
  v5 = (v3 - 14) / 12;
  v6 = v5 + v2;
  v7 = 1461 * (v5 + v2);
  v8 = v7 + 7012800;
  v9 = v7 + 7012803;
  if (v8 >= 0)
    v9 = v8;
  v10 = (unsigned __int128)((367 * (v3 - 12 * v5) - 734) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
  return v4 + (v9 >> 2) + (v10 >> 1) + ((unint64_t)v10 >> 63) - 3 * ((v6 + 4900) / 100) / 4 - 2432076;
}

- (id)hk_dayIndexDateDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "month"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "day"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "year"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@-%@"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
