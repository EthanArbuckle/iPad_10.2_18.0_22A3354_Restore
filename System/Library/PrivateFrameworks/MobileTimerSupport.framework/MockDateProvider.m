@implementation MockDateProvider

- (id)date
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[MockDateProvider overrideDate](self, "overrideDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "mockDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)mockDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setYear:", 2023);
  objc_msgSend(v2, "setMonth:", 9);
  objc_msgSend(v2, "setDay:", 20);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
}

@end
