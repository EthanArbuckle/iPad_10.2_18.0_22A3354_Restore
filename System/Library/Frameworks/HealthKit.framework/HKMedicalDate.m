@implementation HKMedicalDate

+ (id)medicalDateFromComponents:(id)a3 originalTimeZoneString:(id)a4 form:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(v10, "isValidDate") & 1) != 0)
  {
    objc_msgSend(a1, "referenceCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateFromComponents:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[HKMedicalDate _initWithForm:underlyingDate:originalTimeZoneString:]([HKMedicalDate alloc], "_initWithForm:underlyingDate:originalTimeZoneString:", a5, v13, v11);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = objc_opt_class();
    +[HKMedicalDate _descriptionForForm:](HKMedicalDate, "_descriptionForForm:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_assignError:code:format:", a6, 3, CFSTR("%@: Invalid date components for form: %@"), v16, v13);
    v14 = 0;
  }

  return v14;
}

+ (id)referenceCalendar
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
}

+ (id)referenceCalendarWithLocalTimezone
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;

  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(a1, "referenceCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCalendar:", v8);

  objc_msgSend(v7, "setYear:", a3);
  objc_msgSend(a1, "medicalDateFromComponents:originalTimeZoneString:form:error:", v7, 0, 3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKMedicalDate *)v9;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;

  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(a1, "referenceCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCalendar:", v10);

  objc_msgSend(v9, "setYear:", a3);
  objc_msgSend(v9, "setMonth:", a4);
  objc_msgSend(a1, "medicalDateFromComponents:originalTimeZoneString:form:error:", v9, 0, 2, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKMedicalDate *)v11;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 error:(id *)a6
{
  id v11;
  void *v12;
  void *v13;

  v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(a1, "referenceCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCalendar:", v12);

  objc_msgSend(v11, "setYear:", a3);
  objc_msgSend(v11, "setMonth:", a4);
  objc_msgSend(v11, "setDay:", a5);
  objc_msgSend(a1, "medicalDateFromComponents:originalTimeZoneString:form:error:", v11, 0, 1, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKMedicalDate *)v13;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 originalTimeZoneString:(id)a9 error:(id *)a10
{
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v17 = (objc_class *)MEMORY[0x1E0C99D78];
  v18 = a9;
  v19 = objc_alloc_init(v17);
  objc_msgSend(a1, "referenceCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCalendar:", v20);

  objc_msgSend(v19, "setYear:", a3);
  objc_msgSend(v19, "setMonth:", a4);
  objc_msgSend(v19, "setDay:", a5);
  objc_msgSend(v19, "setHour:", a6);
  objc_msgSend(v19, "setMinute:", a7);
  objc_msgSend(v19, "setSecond:", a8);
  objc_msgSend(a1, "medicalDateFromComponents:originalTimeZoneString:form:error:", v19, v18, 0, a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKMedicalDate *)v21;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 nanosecond:(int64_t)a9 originalTimeZoneString:(id)a10 error:(id *)a11
{
  objc_class *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v17 = (objc_class *)MEMORY[0x1E0C99D78];
  v18 = a10;
  v19 = objc_alloc_init(v17);
  objc_msgSend(a1, "referenceCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCalendar:", v20);

  objc_msgSend(v19, "setYear:", a3);
  objc_msgSend(v19, "setMonth:", a4);
  objc_msgSend(v19, "setDay:", a5);
  objc_msgSend(v19, "setHour:", a6);
  objc_msgSend(v19, "setMinute:", a7);
  objc_msgSend(v19, "setSecond:", a8);
  objc_msgSend(v19, "setNanosecond:", a9);
  objc_msgSend(a1, "medicalDateFromComponents:originalTimeZoneString:form:error:", v19, v18, 0, a11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKMedicalDate *)v21;
}

+ (id)medicalDateFromDate:(id)a3 originalTimeZone:(id)a4
{
  void *v5;
  id v6;
  double v7;
  void *v8;
  HKMedicalDate *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:", trunc(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [HKMedicalDate alloc];
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HKMedicalDate _initWithForm:underlyingDate:originalTimeZoneString:](v9, "_initWithForm:underlyingDate:originalTimeZoneString:", 0, v8, v10);
  return v11;
}

- (id)adjustedDateForCalendar:(id)a3
{
  NSDate *underlyingDate;
  id v5;
  void *v6;

  underlyingDate = self->_underlyingDate;
  v5 = a3;
  +[HKMedicalDate _adjustDate:calendar:form:](HKMedicalDate, "_adjustDate:calendar:form:", underlyingDate, v5, -[HKMedicalDate form](self, "form"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isCompatibleWithMedicalDateForm:(int64_t)a3
{
  return -[HKMedicalDate form](self, "form") <= a3;
}

- (NSDate)dateForUTC
{
  return self->_underlyingDate;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  +[HKMedicalDate _descriptionForForm:](HKMedicalDate, "_descriptionForForm:", -[HKMedicalDate form](self, "form"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalDate underlyingDate](self, "underlyingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalDate originalTimeZoneString](self, "originalTimeZoneString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: form: %@, underlyingDate: %@, originalTimeZoneString: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_medicalDateWithForm:(int64_t)a3 underlyingDate:(id)a4 originalTimeZoneString:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = -[HKMedicalDate _initWithForm:underlyingDate:originalTimeZoneString:]([HKMedicalDate alloc], "_initWithForm:underlyingDate:originalTimeZoneString:", a3, v8, v7);

  return v9;
}

+ (id)_adjustDate:(id)a3 calendar:(id)a4 form:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "referenceCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    v11 = v8;
  }
  else
  {
    objc_msgSend(v10, "components:fromDate:", +[HKMedicalDate _calendarUnitForForm:](HKMedicalDate, "_calendarUnitForForm:", a5), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_initWithForm:(int64_t)a3 underlyingDate:(id)a4 originalTimeZoneString:(id)a5
{
  id v9;
  id v10;
  HKMedicalDate *v11;
  HKMedicalDate *v12;
  uint64_t v13;
  NSDate *underlyingDate;
  uint64_t v15;
  NSString *originalTimeZoneString;
  void *v18;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicalDate.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("underlyingDate"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HKMedicalDate;
  v11 = -[HKMedicalDate init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_form = a3;
    v13 = objc_msgSend(v9, "copy");
    underlyingDate = v12->_underlyingDate;
    v12->_underlyingDate = (NSDate *)v13;

    v15 = objc_msgSend(v10, "copy");
    originalTimeZoneString = v12->_originalTimeZoneString;
    v12->_originalTimeZoneString = (NSString *)v15;

  }
  return v12;
}

+ (BOOL)_validForm:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

+ (unint64_t)_calendarUnitForForm:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 6;
  else
    return qword_19A44C048[a3];
}

+ (id)_descriptionForForm:(int64_t)a3
{
  if ((unint64_t)a3 < 4)
    return off_1E37F1DA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid HKMedicalDateForm: %ld"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalDate)initWithCoder:(id)a3
{
  id v4;
  HKMedicalDate *v5;
  uint64_t v6;
  NSDate *underlyingDate;
  uint64_t v8;
  NSString *originalTimeZoneString;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalDate;
  v5 = -[HKMedicalDate init](&v11, sel_init);
  if (v5)
  {
    v5->_form = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("form"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlyingDate = v5->_underlyingDate;
    v5->_underlyingDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalTimezoneString"));
    v8 = objc_claimAutoreleasedReturnValue();
    originalTimeZoneString = v5->_originalTimeZoneString;
    v5->_originalTimeZoneString = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKMedicalDate form](self, "form"), CFSTR("form"));
  -[HKMedicalDate underlyingDate](self, "underlyingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("underlyingDate"));

  -[HKMedicalDate originalTimeZoneString](self, "originalTimeZoneString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("originalTimezoneString"));

}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[HKMedicalDate form](self, "form");
  -[HKMedicalDate underlyingDate](self, "underlyingDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[HKMedicalDate originalTimeZoneString](self, "originalTimeZoneString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (HKMedicalDate *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HKMedicalDate form](self, "form");
      if (v6 != -[HKMedicalDate form](v5, "form"))
        goto LABEL_16;
      -[HKMedicalDate underlyingDate](self, "underlyingDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalDate underlyingDate](v5, "underlyingDate");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[HKMedicalDate underlyingDate](v5, "underlyingDate");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_15;
        v11 = (void *)v10;
        -[HKMedicalDate underlyingDate](self, "underlyingDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalDate underlyingDate](v5, "underlyingDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToDate:", v13);

        if (!v14)
          goto LABEL_16;
      }
      -[HKMedicalDate originalTimeZoneString](self, "originalTimeZoneString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalDate originalTimeZoneString](v5, "originalTimeZoneString");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v16)
      {

LABEL_20:
        v15 = 1;
        goto LABEL_17;
      }
      v9 = (void *)v16;
      -[HKMedicalDate originalTimeZoneString](v5, "originalTimeZoneString");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        -[HKMedicalDate originalTimeZoneString](self, "originalTimeZoneString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicalDate originalTimeZoneString](v5, "originalTimeZoneString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if ((v21 & 1) != 0)
          goto LABEL_20;
LABEL_16:
        v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
LABEL_15:

      goto LABEL_16;
    }
    v15 = 0;
  }
LABEL_18:

  return v15;
}

- (int64_t)form
{
  return self->_form;
}

- (NSString)originalTimeZoneString
{
  return self->_originalTimeZoneString;
}

- (NSDate)underlyingDate
{
  return self->_underlyingDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDate, 0);
  objc_storeStrong((id *)&self->_originalTimeZoneString, 0);
}

@end
