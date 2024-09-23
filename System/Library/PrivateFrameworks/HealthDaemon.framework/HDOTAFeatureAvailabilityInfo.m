@implementation HDOTAFeatureAvailabilityInfo

- (HDOTAFeatureAvailabilityInfo)initWithDictionaryRepresentation:(id)a3
{
  void *v4;
  void *v5;
  HDOTAFeatureAvailabilityInfo *v6;

  objc_msgSend(a3, "hk_safeDictionaryForKeyPath:error:", CFSTR("AllowedCountrySet"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6538]), "initWithDictionaryRepresentation:provenance:", v4, 4);
    if (v5)
    {
      self = -[HDOTAFeatureAvailabilityInfo initWithAllowedCountrySet:](self, "initWithAllowedCountrySet:", v5);
      v6 = self;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HDOTAFeatureAvailabilityInfo)initWithAllowedCountrySet:(id)a3
{
  id v4;
  HDOTAFeatureAvailabilityInfo *v5;
  uint64_t v6;
  HKCountrySet *allowedCountrySet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDOTAFeatureAvailabilityInfo;
  v5 = -[HDOTAFeatureAvailabilityInfo init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    allowedCountrySet = v5->_allowedCountrySet;
    v5->_allowedCountrySet = (HKCountrySet *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ allowedCountrySet=%@>"), objc_opt_class(), self->_allowedCountrySet);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  HKCountrySet *allowedCountrySet;
  HKCountrySet *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDOTAFeatureAvailabilityInfo;
  if (-[HDOTAFeatureAvailabilityInfo isEqual:](&v9, sel_isEqual_, v4))
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  allowedCountrySet = self->_allowedCountrySet;
  v7 = (HKCountrySet *)v4[1];
  if (allowedCountrySet != v7)
  {
    if (v7)
    {
      v5 = -[HKCountrySet isEqual:](allowedCountrySet, "isEqual:");
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_2:
  v5 = 1;
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  return -[HKCountrySet hash](self->_allowedCountrySet, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_allowedCountrySet, CFSTR("AllowedCountrySet"));
}

- (HDOTAFeatureAvailabilityInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDOTAFeatureAvailabilityInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllowedCountrySet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[HDOTAFeatureAvailabilityInfo initWithAllowedCountrySet:](self, "initWithAllowedCountrySet:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HKCountrySet)allowedCountrySet
{
  return self->_allowedCountrySet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedCountrySet, 0);
}

@end
