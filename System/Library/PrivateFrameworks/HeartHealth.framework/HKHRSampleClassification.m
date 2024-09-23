@implementation HKHRSampleClassification

- (HKHRSampleClassification)initWithSampleUUID:(id)a3 classification:(int64_t)a4 sampleDateInterval:(id)a5 sampleTimeZone:(id)a6
{
  id v11;
  id v12;
  id v13;
  HKHRSampleClassification *v14;
  HKHRSampleClassification *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKHRSampleClassification;
  v14 = -[HKHRSampleClassification init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sampleUUID, a3);
    v15->_classification = a4;
    objc_storeStrong((id *)&v15->_sampleDateInterval, a5);
    objc_storeStrong((id *)&v15->_sampleTimeZone, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  HKHRSampleClassification *v4;
  HKHRSampleClassification *v5;
  BOOL v6;

  v4 = (HKHRSampleClassification *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSUUID isEqual:](self->_sampleUUID, "isEqual:", v5->_sampleUUID)
        && self->_classification == v5->_classification
        && -[NSDateInterval isEqualToDateInterval:](self->_sampleDateInterval, "isEqualToDateInterval:", v5->_sampleDateInterval)&& -[NSTimeZone isEqualToTimeZone:](self->_sampleTimeZone, "isEqualToTimeZone:", v5->_sampleTimeZone);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t v3;
  uint64_t v4;

  v3 = self->_classification ^ -[NSUUID hash](self->_sampleUUID, "hash");
  v4 = -[NSDateInterval hash](self->_sampleDateInterval, "hash");
  return v3 ^ v4 ^ -[NSTimeZone hash](self->_sampleTimeZone, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sampleUUID;
  id v5;

  sampleUUID = self->_sampleUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sampleUUID, CFSTR("SampleUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_classification, CFSTR("Classification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleDateInterval, CFSTR("SampleDateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleTimeZone, CFSTR("SampleTimeZone"));

}

- (HKHRSampleClassification)initWithCoder:(id)a3
{
  id v4;
  HKHRSampleClassification *v5;
  uint64_t v6;
  NSUUID *sampleUUID;
  uint64_t v8;
  NSDateInterval *sampleDateInterval;
  uint64_t v10;
  NSTimeZone *sampleTimeZone;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHRSampleClassification;
  v5 = -[HKHRSampleClassification init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SampleUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sampleUUID = v5->_sampleUUID;
    v5->_sampleUUID = (NSUUID *)v6;

    v5->_classification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Classification"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SampleDateInterval"));
    v8 = objc_claimAutoreleasedReturnValue();
    sampleDateInterval = v5->_sampleDateInterval;
    v5->_sampleDateInterval = (NSDateInterval *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SampleTimeZone"));
    v10 = objc_claimAutoreleasedReturnValue();
    sampleTimeZone = v5->_sampleTimeZone;
    v5->_sampleTimeZone = (NSTimeZone *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t classification;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_sampleUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)description_formatter;
  classification = self->_classification;
  -[NSDateInterval endDate](self->_sampleDateInterval, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTimeZone abbreviation](self->_sampleTimeZone, "abbreviation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p UUID:%@ classification:%ld endDate:%@, timeZone:%@>"), v4, self, v5, classification, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __39__HKHRSampleClassification_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

}

- (NSUUID)sampleUUID
{
  return self->_sampleUUID;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSDateInterval)sampleDateInterval
{
  return self->_sampleDateInterval;
}

- (NSTimeZone)sampleTimeZone
{
  return self->_sampleTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTimeZone, 0);
  objc_storeStrong((id *)&self->_sampleDateInterval, 0);
  objc_storeStrong((id *)&self->_sampleUUID, 0);
}

@end
