@implementation HKRecalibrateEstimatesRequestRecord

- (HKRecalibrateEstimatesRequestRecord)initWithSessionIdentifier:(id)a3 source:(id)a4 sampleType:(id)a5 effectiveDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKRecalibrateEstimatesRequestRecord *v14;
  uint64_t v15;
  NSUUID *sessionIdentifier;
  uint64_t v17;
  HKSource *source;
  uint64_t v19;
  HKSampleType *sampleType;
  uint64_t v21;
  NSDate *effectiveDate;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKRecalibrateEstimatesRequestRecord;
  v14 = -[HKRecalibrateEstimatesRequestRecord init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    sessionIdentifier = v14->_sessionIdentifier;
    v14->_sessionIdentifier = (NSUUID *)v15;

    v17 = objc_msgSend(v11, "copy");
    source = v14->_source;
    v14->_source = (HKSource *)v17;

    v19 = objc_msgSend(v12, "copy");
    sampleType = v14->_sampleType;
    v14->_sampleType = (HKSampleType *)v19;

    v21 = objc_msgSend(v13, "copy");
    effectiveDate = v14->_effectiveDate;
    v14->_effectiveDate = (NSDate *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDate *effectiveDate;
  NSDate *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!-[NSUUID isEqual:](self->_sessionIdentifier, "isEqual:", v5[1])
      || !-[HKSource isEqual:](self->_source, "isEqual:", v5[2])
      || !-[HKObjectType isEqual:](self->_sampleType, "isEqual:", v5[3]))
    {
      goto LABEL_9;
    }
    effectiveDate = self->_effectiveDate;
    v7 = (NSDate *)v5[4];
    if (effectiveDate == v7)
    {
      v8 = 1;
      goto LABEL_10;
    }
    if (v7)
      v8 = -[NSDate isEqualToDate:](effectiveDate, "isEqualToDate:");
    else
LABEL_9:
      v8 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSUUID hash](self->_sessionIdentifier, "hash");
  v4 = -[HKSource hash](self->_source, "hash") ^ v3;
  v5 = -[HKObjectType hash](self->_sampleType, "hash");
  return v4 ^ v5 ^ -[NSDate hash](self->_effectiveDate, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p sessionId:%@, source:%@, sampleType:%@, effectiveDate:%@>"), objc_opt_class(), self, self->_sessionIdentifier, self->_source, self->_sampleType, self->_effectiveDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRecalibrateEstimatesRequestRecord)initWithCoder:(id)a3
{
  id v4;
  HKRecalibrateEstimatesRequestRecord *v5;
  uint64_t v6;
  NSUUID *sessionIdentifier;
  uint64_t v8;
  HKSource *source;
  uint64_t v10;
  HKSampleType *sampleType;
  uint64_t v12;
  NSDate *effectiveDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKRecalibrateEstimatesRequestRecord;
  v5 = -[HKRecalibrateEstimatesRequestRecord init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session_id"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v8 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (HKSource *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sample_type"));
    v10 = objc_claimAutoreleasedReturnValue();
    sampleType = v5->_sampleType;
    v5->_sampleType = (HKSampleType *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eff_date"));
    v12 = objc_claimAutoreleasedReturnValue();
    effectiveDate = v5->_effectiveDate;
    v5->_effectiveDate = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("session_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sampleType, CFSTR("sample_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_effectiveDate, CFSTR("eff_date"));

}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKSource)source
{
  return self->_source;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
