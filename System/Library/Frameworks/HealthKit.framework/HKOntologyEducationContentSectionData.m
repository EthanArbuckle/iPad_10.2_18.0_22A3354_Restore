@implementation HKOntologyEducationContentSectionData

- (HKOntologyEducationContentSectionData)initWithStringValues:(id)a3 sectionDataType:(int64_t)a4 version:(int64_t)a5 timestamp:(double)a6 deleted:(BOOL)a7
{
  id v12;
  HKOntologyEducationContentSectionData *v13;
  uint64_t v14;
  NSArray *stringValues;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKOntologyEducationContentSectionData;
  v13 = -[HKOntologyEducationContentSectionData init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    stringValues = v13->_stringValues;
    v13->_stringValues = (NSArray *)v14;

    v13->_sectionDataType = a4;
    v13->_version = a5;
    v13->_timestamp = a6;
    v13->_deleted = a7;
  }

  return v13;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  int64_t sectionDataType;
  void *v6;
  int64_t version;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_deleted)
    v4 = CFSTR(" DELETED");
  else
    v4 = &stru_1E37FD4C0;
  sectionDataType = self->_sectionDataType;
  -[NSArray componentsJoinedByString:](self->_stringValues, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%ld%@ %@ %ld, (%@)>"), sectionDataType, v4, v6, version, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  return self->_sectionDataType ^ self->_version ^ -[NSArray hash](self->_stringValues, "hash") ^ self->_deleted ^ (unint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  HKOntologyEducationContentSectionData *v4;
  HKOntologyEducationContentSectionData *v5;
  NSArray *stringValues;
  void *v7;
  int64_t sectionDataType;
  int64_t version;
  double timestamp;
  double v11;
  _BOOL4 deleted;
  BOOL v13;

  v4 = (HKOntologyEducationContentSectionData *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      stringValues = self->_stringValues;
      -[HKOntologyEducationContentSectionData stringValues](v5, "stringValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray isEqual:](stringValues, "isEqual:", v7)
        && (sectionDataType = self->_sectionDataType,
            sectionDataType == -[HKOntologyEducationContentSectionData sectionDataType](v5, "sectionDataType"))
        && (version = self->_version, version == -[HKOntologyEducationContentSectionData version](v5, "version"))
        && (timestamp = self->_timestamp,
            -[HKOntologyEducationContentSectionData timestamp](v5, "timestamp"),
            timestamp == v11))
      {
        deleted = self->_deleted;
        v13 = deleted == -[HKOntologyEducationContentSectionData deleted](v5, "deleted");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *stringValues;
  id v5;

  stringValues = self->_stringValues;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stringValues, CFSTR("stringValues"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sectionDataType, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("deleted"));

}

- (HKOntologyEducationContentSectionData)initWithCoder:(id)a3
{
  id v4;
  HKOntologyEducationContentSectionData *v5;
  void *v6;
  uint64_t v7;
  NSArray *stringValues;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOntologyEducationContentSectionData;
  v5 = -[HKOntologyEducationContentSectionData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("stringValues"));
    v7 = objc_claimAutoreleasedReturnValue();
    stringValues = v5->_stringValues;
    v5->_stringValues = (NSArray *)v7;

    v5->_sectionDataType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v9;
    v5->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deleted"));
  }

  return v5;
}

- (NSArray)stringValues
{
  return self->_stringValues;
}

- (int64_t)sectionDataType
{
  return self->_sectionDataType;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValues, 0);
}

@end
