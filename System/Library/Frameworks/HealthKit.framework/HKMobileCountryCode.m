@implementation HKMobileCountryCode

- (HKMobileCountryCode)initWithMobileCountryCode:(id)a3 ISOCode:(id)a4 isOverridden:(BOOL)a5
{
  id v8;
  id v9;
  HKMobileCountryCode *v10;
  uint64_t v11;
  NSString *code;
  uint64_t v13;
  NSString *ISOCode;
  uint64_t v15;
  NSDate *timestamp;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKMobileCountryCode;
  v10 = -[HKMobileCountryCode init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    code = v10->_code;
    v10->_code = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    ISOCode = v10->_ISOCode;
    v10->_ISOCode = (NSString *)v13;

    v10->_overridden = a5;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = objc_claimAutoreleasedReturnValue();
    timestamp = v10->_timestamp;
    v10->_timestamp = (NSDate *)v15;

  }
  return v10;
}

- (id)countryCode
{
  return self->_ISOCode;
}

- (int64_t)provenance
{
  if (self->_overridden)
    return 101;
  else
    return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_overridden)
    v5 = CFSTR(" OVERRIDDEN");
  else
    v5 = &stru_1E37FD4C0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p MCC:%@ ISO:%@ %@>"), v4, self, self->_code, self->_ISOCode, v5);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)ISOCode
{
  return self->_ISOCode;
}

- (BOOL)isOverridden
{
  return self->_overridden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ISOCode, 0);
  objc_storeStrong((id *)&self->_code, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
