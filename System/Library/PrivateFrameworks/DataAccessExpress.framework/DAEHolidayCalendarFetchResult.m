@implementation DAEHolidayCalendarFetchResult

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)DAEHolidayCalendarFetchResult;
  -[DAEHolidayCalendarFetchResult description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEHolidayCalendarFetchResult region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEHolidayCalendarFetchResult language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEHolidayCalendarFetchResult URLString](self, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEHolidayCalendarFetchResult calendarDescription](self, "calendarDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@] region: %@  language: %@  URL: %@  description: %@"), v4, v5, v6, v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAEHolidayCalendarFetchResult)initWithCoder:(id)a3
{
  id v4;
  DAEHolidayCalendarFetchResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAEHolidayCalendarFetchResult;
  v5 = -[DAEHolidayCalendarFetchResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEHolidayCalendarFetchResult setRegion:](v5, "setRegion:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEHolidayCalendarFetchResult setLanguage:](v5, "setLanguage:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEHolidayCalendarFetchResult setURLString:](v5, "setURLString:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEHolidayCalendarFetchResult setCalendarDescription:](v5, "setCalendarDescription:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DAEHolidayCalendarFetchResult region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("region"));

  -[DAEHolidayCalendarFetchResult language](self, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("language"));

  -[DAEHolidayCalendarFetchResult URLString](self, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("URLString"));

  -[DAEHolidayCalendarFetchResult calendarDescription](self, "calendarDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("calendarDescription"));

}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_storeStrong((id *)&self->_URLString, a3);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)calendarDescription
{
  return self->_calendarDescription;
}

- (void)setCalendarDescription:(id)a3
{
  objc_storeStrong((id *)&self->_calendarDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarDescription, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
}

@end
