@implementation HKRegulatoryDomainEstimate

- (HKRegulatoryDomainEstimate)initWithISOCode:(id)a3 timestamp:(id)a4 provenance:(int64_t)a5
{
  id v8;
  id v9;
  HKRegulatoryDomainEstimate *v10;
  uint64_t v11;
  NSString *ISOCode;
  uint64_t v13;
  NSDate *timestamp;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKRegulatoryDomainEstimate;
  v10 = -[HKRegulatoryDomainEstimate init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    ISOCode = v10->_ISOCode;
    v10->_ISOCode = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    timestamp = v10->_timestamp;
    v10->_timestamp = (NSDate *)v13;

    v10->_provenance = a5;
  }

  return v10;
}

- (void)initWithEstimate:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    objc_msgSend(v3, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "countryCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        a1 = (id)objc_msgSend(a1, "initWithISOCode:timestamp:provenance:", v6, v7, 2);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = (id)objc_msgSend(a1, "initWithISOCode:timestamp:provenance:", v6, v8, 2);

      }
      v5 = a1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v2;
  NSString *ISOCode;
  NSDate *timestamp;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  ISOCode = self->_ISOCode;
  timestamp = self->_timestamp;
  NSStringFromHKOnboardingCompletionCountryCodeProvenance(self->_provenance);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HKRegulatoryDomainEstimate %@ %@ %@>"), ISOCode, timestamp, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKRegulatoryDomainEstimate *v4;
  HKRegulatoryDomainEstimate *v5;
  NSString *ISOCode;
  NSString *v7;
  NSDate *timestamp;
  NSDate *v9;
  BOOL v10;

  v4 = (HKRegulatoryDomainEstimate *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      ISOCode = self->_ISOCode;
      v7 = v5->_ISOCode;
      v10 = (ISOCode == v7 || v7 && -[NSString isEqualToString:](ISOCode, "isEqualToString:"))
         && ((timestamp = self->_timestamp, v9 = v5->_timestamp, timestamp == v9)
          || v9 && -[NSDate isEqual:](timestamp, "isEqual:"))
         && self->_provenance == v5->_provenance;

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_ISOCode, "hash");
  return -[NSDate hash](self->_timestamp, "hash") ^ v3 ^ self->_provenance;
}

- (NSString)ISOCode
{
  return self->_ISOCode;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_ISOCode, 0);
}

@end
