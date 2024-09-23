@implementation HKCloudSyncRecordDescription

- (HKCloudSyncRecordDescription)initWithRecordIDDescription:(id)a3 recordType:(id)a4 schemaVersion:(id)a5 modificationDate:(id)a6 detailedDescription:(id)a7 childRecordDescriptions:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKCloudSyncRecordDescription *v20;
  uint64_t v21;
  HKCloudSyncRecordIDDescription *recordIDDescription;
  uint64_t v23;
  NSString *recordType;
  uint64_t v25;
  NSNumber *schemaVersion;
  uint64_t v27;
  NSDate *modificationDate;
  uint64_t v29;
  NSString *detailedDescription;
  uint64_t v31;
  NSArray *childRecordDescriptions;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HKCloudSyncRecordDescription;
  v20 = -[HKCloudSyncRecordDescription init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    recordIDDescription = v20->_recordIDDescription;
    v20->_recordIDDescription = (HKCloudSyncRecordIDDescription *)v21;

    v23 = objc_msgSend(v15, "copy");
    recordType = v20->_recordType;
    v20->_recordType = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    schemaVersion = v20->_schemaVersion;
    v20->_schemaVersion = (NSNumber *)v25;

    v27 = objc_msgSend(v17, "copy");
    modificationDate = v20->_modificationDate;
    v20->_modificationDate = (NSDate *)v27;

    v29 = objc_msgSend(v18, "copy");
    detailedDescription = v20->_detailedDescription;
    v20->_detailedDescription = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    childRecordDescriptions = v20->_childRecordDescriptions;
    v20->_childRecordDescriptions = (NSArray *)v31;

  }
  return v20;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Record ID: %@,Record Type: %@Schema Version: %@Modification Date: %@Detailed Description: %@Child Descriptions: %@"), self->_recordIDDescription, self->_recordType, self->_schemaVersion, self->_modificationDate, self->_detailedDescription, self->_childRecordDescriptions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKCloudSyncRecordIDDescription *recordIDDescription;
  id v5;

  recordIDDescription = self->_recordIDDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordIDDescription, CFSTR("RecordIDDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordType, CFSTR("RecordType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_schemaVersion, CFSTR("SchemaVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailedDescription, CFSTR("DetailedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_childRecordDescriptions, CFSTR("ChildRecordDescriptions"));

}

- (HKCloudSyncRecordDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKCloudSyncRecordDescription *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordIDDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SchemaVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DetailedDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("ChildRecordDescriptions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKCloudSyncRecordDescription initWithRecordIDDescription:recordType:schemaVersion:modificationDate:detailedDescription:childRecordDescriptions:](self, "initWithRecordIDDescription:recordType:schemaVersion:modificationDate:detailedDescription:childRecordDescriptions:", v5, v6, v7, v8, v9, v13);
  return v14;
}

- (HKCloudSyncRecordIDDescription)recordIDDescription
{
  return self->_recordIDDescription;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (NSArray)childRecordDescriptions
{
  return self->_childRecordDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childRecordDescriptions, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordIDDescription, 0);
}

@end
