@implementation HKCloudSyncRecordIDDescription

- (HKCloudSyncRecordIDDescription)initWithRecordName:(id)a3
{
  id v4;
  HKCloudSyncRecordIDDescription *v5;
  uint64_t v6;
  NSString *recordName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKCloudSyncRecordIDDescription;
  v5 = -[HKCloudSyncRecordIDDescription init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Record: %@"), self->_recordName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_recordName, CFSTR("RecordName"));
}

- (HKCloudSyncRecordIDDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKCloudSyncRecordIDDescription *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKCloudSyncRecordIDDescription initWithRecordName:](self, "initWithRecordName:", v5);
  return v6;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end
