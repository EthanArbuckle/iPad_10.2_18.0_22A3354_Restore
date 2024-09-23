@implementation HKOnboardingCompletion

- (HKOnboardingCompletion)initWithFeatureIdentifier:(id)a3 version:(int64_t)a4 completionDate:(id)a5 countryCode:(id)a6 countryCodeProvenance:(int64_t)a7 UUID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKOnboardingCompletion *v18;
  uint64_t v19;
  NSString *featureIdentifier;
  uint64_t v21;
  NSDate *completionDate;
  uint64_t v23;
  NSString *countryCode;
  uint64_t v25;
  NSUUID *UUID;
  objc_super v28;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HKOnboardingCompletion;
  v18 = -[HKOnboardingCompletion init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    featureIdentifier = v18->_featureIdentifier;
    v18->_featureIdentifier = (NSString *)v19;

    v18->_version = a4;
    v21 = objc_msgSend(v15, "copy");
    completionDate = v18->_completionDate;
    v18->_completionDate = (NSDate *)v21;

    objc_msgSend(v16, "uppercaseString");
    v23 = objc_claimAutoreleasedReturnValue();
    countryCode = v18->_countryCode;
    v18->_countryCode = (NSString *)v23;

    v18->_countryCodeProvenance = a7;
    v25 = objc_msgSend(v17, "copy");
    UUID = v18->_UUID;
    v18->_UUID = (NSUUID *)v25;

  }
  return v18;
}

- (HKOnboardingCompletion)initWithFeatureIdentifier:(id)a3 version:(int64_t)a4 completionDate:(id)a5 countryCode:(id)a6 countryCodeProvenance:(int64_t)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HKOnboardingCompletion *v17;

  v12 = (void *)MEMORY[0x1E0CB3A28];
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v12, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKOnboardingCompletion initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:UUID:](self, "initWithFeatureIdentifier:version:completionDate:countryCode:countryCodeProvenance:UUID:", v15, a4, v14, v13, a7, v16);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *featureIdentifier;
  NSString *v7;
  NSDate *completionDate;
  NSDate *v9;
  NSString *countryCode;
  NSString *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    featureIdentifier = self->_featureIdentifier;
    v7 = (NSString *)v5[1];
    v12 = (featureIdentifier == v7 || v7 && -[NSString isEqualToString:](featureIdentifier, "isEqualToString:"))
       && self->_version == v5[2]
       && ((completionDate = self->_completionDate, v9 = (NSDate *)v5[3], completionDate == v9)
        || v9 && -[NSDate isEqualToDate:](completionDate, "isEqualToDate:"))
       && ((countryCode = self->_countryCode, v11 = (NSString *)v5[4], countryCode == v11)
        || v11 && -[NSString isEqualToString:](countryCode, "isEqualToString:"))
       && self->_countryCodeProvenance == v5[5];

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSUUID *UUID;
  NSString *featureIdentifier;
  void *v7;
  NSString *countryCode;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  UUID = self->_UUID;
  featureIdentifier = self->_featureIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  countryCode = self->_countryCode;
  NSStringFromHKOnboardingCompletionCountryCodeProvenance(self->_countryCodeProvenance);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %@ v:%@ country:%@/%@ date:%@>"), v4, self, UUID, featureIdentifier, v7, countryCode, v9, self->_completionDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *featureIdentifier;
  id v5;

  featureIdentifier = self->_featureIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", featureIdentifier, CFSTR("FeatureIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_completionDate, CFSTR("CompletionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("CountryCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_countryCodeProvenance, CFSTR("CountryCodeProvenance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UUID, CFSTR("UUID"));

}

- (HKOnboardingCompletion)initWithCoder:(id)a3
{
  id v4;
  HKOnboardingCompletion *v5;
  uint64_t v6;
  NSString *featureIdentifier;
  uint64_t v8;
  NSDate *completionDate;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSUUID *UUID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKOnboardingCompletion;
  v5 = -[HKOnboardingCompletion init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FeatureIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v6;

    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CompletionDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    completionDate = v5->_completionDate;
    v5->_completionDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CountryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    v5->_countryCodeProvenance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CountryCodeProvenance"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v12;

  }
  return v5;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)countryCodeProvenance
{
  return self->_countryCodeProvenance;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
