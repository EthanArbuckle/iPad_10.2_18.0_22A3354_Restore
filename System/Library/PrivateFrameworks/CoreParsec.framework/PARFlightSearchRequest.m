@implementation PARFlightSearchRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARFlightSearchRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("date"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_flightQuery, CFSTR("flightQuery"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appBundleId, CFSTR("appBundleId"));

}

- (PARFlightSearchRequest)initWithCoder:(id)a3
{
  id v4;
  PARFlightSearchRequest *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSString *flightQuery;
  uint64_t v10;
  NSString *appBundleId;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PARFlightSearchRequest;
  v5 = -[PARRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flightQuery"));
    v8 = objc_claimAutoreleasedReturnValue();
    flightQuery = v5->_flightQuery;
    v5->_flightQuery = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleId"));
    v10 = objc_claimAutoreleasedReturnValue();
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v10;

  }
  return v5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (unsigned)nwActivityLabel
{
  return 10;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)flightQuery
{
  return self->_flightQuery;
}

- (void)setFlightQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_flightQuery, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
