@implementation HealthAppAnalyticsAcceptance

- (HealthAppAnalyticsAcceptance)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)initForAgreement:(id)a3 version:(int64_t)a4 accepted:(BOOL)a5 modificationDate:(id)a6
{
  id v10;
  NSDate *v11;
  HealthAppAnalyticsAcceptance *v12;
  uint64_t v13;
  NSString *agreement;
  objc_super v16;

  v10 = a3;
  v11 = (NSDate *)a6;
  v16.receiver = self;
  v16.super_class = (Class)HealthAppAnalyticsAcceptance;
  v12 = -[HealthAppAnalyticsAcceptance init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    agreement = v12->_agreement;
    v12->_agreement = (NSString *)v13;

    v12->_accepted = a5;
    v12->_version = a4;
    v12->_modificationDate = v11;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSDate *modificationDate;
  int64_t v5;

  v3 = -[NSString hash](self->_agreement, "hash");
  modificationDate = self->_modificationDate;
  v5 = self->_version ^ self->_accepted ^ v3;
  return v5 ^ -[NSDate hash](modificationDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *agreement;
  void *v6;
  int64_t version;
  int accepted;
  NSDate *modificationDate;
  void *v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    agreement = self->_agreement;
    objc_msgSend(v4, "agreement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](agreement, "isEqualToString:", v6)
      && (version = self->_version, version == objc_msgSend(v4, "version"))
      && (accepted = self->_accepted, accepted == objc_msgSend(v4, "accepted")))
    {
      modificationDate = self->_modificationDate;
      objc_msgSend(v4, "modificationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSDate isEqualToDate:](modificationDate, "isEqualToDate:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *agreement;
  id v5;

  agreement = self->_agreement;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", agreement, CFSTR("agreement"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_accepted, CFSTR("accepted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("modificationDate"));

}

- (HealthAppAnalyticsAcceptance)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  HealthAppAnalyticsAcceptance *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agreement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accepted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    self = (HealthAppAnalyticsAcceptance *)-[HealthAppAnalyticsAcceptance initForAgreement:version:accepted:modificationDate:](self, "initForAgreement:version:accepted:modificationDate:", v5, v6, v7, v8);
    v10 = self;
  }

  return v10;
}

- (NSString)agreement
{
  return self->_agreement;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agreement, 0);
}

@end
