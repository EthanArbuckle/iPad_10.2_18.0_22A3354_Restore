@implementation CNPropertyGroupDateItem

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_30047);
}

void __37__CNPropertyGroupDateItem_initialize__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)fullFormatter;
  fullFormatter = (uint64_t)v0;

  objc_msgSend((id)fullFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)fullFormatter, "setDateStyle:", 3);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)fullFormatter, "setTimeZone:", v2);

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v4 = (void *)yearlessFormatter;
  yearlessFormatter = (uint64_t)v3;

  objc_msgSend((id)yearlessFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)yearlessFormatter, "setDateStyle:", 3);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)yearlessFormatter, "setTimeZone:", v5);

}

+ (id)calendarForLabel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
}

+ (id)emptyValueForLabel:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "calendarForLabel:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCalendar:", v7);
  return v6;
}

+ (id)initialValueForLabel:(id)a3 group:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIDate dateByNormalizingToGMT:](CNUIDate, "dateByNormalizingToGMT:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIDate yearlessGregorianComponentsFromGMTDate:](CNUIDate, "yearlessGregorianComponentsFromGMTDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isEmptyDateComponents:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "month") == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v3, "day") == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (id)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isSuggested")
    && (objc_msgSend(v9, "property"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C96690]),
        v11,
        (v12 & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___CNPropertyGroupDateItem;
    objc_msgSendSuper2(&v15, sel_propertyGroupItemWithLabeledValue_group_contact_, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)localeAndCalendarPairFromDateComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C996C8];
    v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D13A00], "isGregorianDerivedCalendar:", v10))
      {
        v11 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v8);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v11;

    }
    else
    {
      objc_msgSend(v3, "calendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)MEMORY[0x1E0D3EFB0];
    objc_msgSend(v5, "calendarIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localeForCalendarID:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v14;
  }
  objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v4, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)dateDisplayStringFromComponents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  id v11;

  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isEmptyDateComponents:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "localeAndCalendarPairFromDateComponents:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "second");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIDate dateFromComponents:destinationCalendar:](CNUIDate, "dateFromComponents:destinationCalendar:", v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", v3))
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMMMd"), 0, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = &yearlessFormatter;
      objc_msgSend((id)yearlessFormatter, "setDateFormat:", v9);

    }
    else
    {
      v10 = &fullFormatter;
    }
    v11 = (id)*v10;
    objc_msgSend(v11, "setLocale:", v6);
    objc_msgSend(v11, "setCalendar:", v7);
    objc_msgSend(v11, "stringFromDate:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isEmpty
{
  void *v2;
  void *v3;
  char v4;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend((id)objc_opt_class(), "isEmptyDateComponents:", v3);
  return v4;
}

- (BOOL)isValidValue:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 && objc_msgSend(v4, "month") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "day") != 0x7FFFFFFFFFFFFFFFLL;
  return v5;
}

- (id)normalizedValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIDate dateFromComponents:destinationCalendar:](CNUIDate, "dateFromComponents:destinationCalendar:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIDate dateByNormalizingToGMT:](CNUIDate, "dateByNormalizingToGMT:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultActionURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setMonth:", objc_msgSend(v5, "month"));
  objc_msgSend(v7, "setLeapMonth:", objc_msgSend(v5, "isLeapMonth"));
  objc_msgSend(v7, "setDay:", objc_msgSend(v5, "day"));
  objc_msgSend(v7, "setHour:", 12);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextDateAfterDate:matchingHour:minute:second:options:", v3, 0, 0, 0, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nextDateAfterDate:matchingComponents:options:", v9, v7, 256);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E98];
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("calshow:%d"), (int)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "day");
  if (v9 == objc_msgSend(v8, "day") && (v10 = objc_msgSend(v6, "month"), v10 == objc_msgSend(v8, "month")))
  {
    -[CNPropertyGroupItem contact](self, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 != v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)bestValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", v6))
    objc_msgSend(v6, "setYear:", 0x7FFFFFFFFFFFFFFFLL);
  if (+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", v8))
    objc_msgSend(v8, "setYear:", 0x7FFFFFFFFFFFFFFFLL);
  if (objc_msgSend(v8, "year") == 0x7FFFFFFFFFFFFFFFLL
    || (v9 = objc_msgSend(v6, "year"), v10 = v8, v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (id)displayStringForValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "dateDisplayStringFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)placeholderString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D139F8]);
  v4 = (void *)objc_opt_class();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeAndCalendarPairFromDateComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setLocale:", v8);
  objc_msgSend(v3, "dateFormatPlaceholderString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)valueForDisplayString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;

  v4 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyGroupDateItem displayStringForValue:](self, "displayStringForValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  if (v8)
  {
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D139F8]);
    objc_msgSend((id)objc_opt_class(), "localeAndCalendarPairFromDateComponents:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "first");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setLocale:", v12);
    v24 = 0;
    v25 = 0;
    v13 = objc_msgSend(v9, "getObjectValue:forString:errorDescription:", &v25, v4, &v24);
    v14 = v25;
    v15 = v24;
    if (v13)
    {
      objc_msgSend(v6, "calendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "calendarIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C996C8]);

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0D13A00], "gregorianDateComponentsFromDateComponents:", v14);
        v19 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v19;
      }
      v10 = v14;
      v14 = v10;
    }
    else
    {
      v20 = (void *)objc_opt_class();
      -[CNPropertyGroupItem labeledValue](self, "labeledValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "label");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "emptyValueForLabel:", v22);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

@end
