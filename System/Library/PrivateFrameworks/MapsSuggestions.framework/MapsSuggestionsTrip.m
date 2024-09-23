@implementation MapsSuggestionsTrip

- (MapsSuggestionsTrip)initWithPlacemark:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  MapsSuggestionsTrip *v12;
  MapsSuggestionsTrip *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MapsSuggestionsTrip;
  v12 = -[MapsSuggestionsTrip init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_placemark, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

- (BOOL)isInternational
{
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLPlacemark ISOcountryCode](self->_placemark, "ISOcountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", v5);

  return v3 ^ 1;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
}

@end
