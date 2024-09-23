@implementation HKCloudSyncRecordZoneIDDescription

- (HKCloudSyncRecordZoneIDDescription)initWithZoneName:(id)a3 ownerName:(id)a4
{
  id v6;
  id v7;
  HKCloudSyncRecordZoneIDDescription *v8;
  uint64_t v9;
  NSString *zoneName;
  uint64_t v11;
  NSString *ownerName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKCloudSyncRecordZoneIDDescription;
  v8 = -[HKCloudSyncRecordZoneIDDescription init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    zoneName = v8->_zoneName;
    v8->_zoneName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    ownerName = v8->_ownerName;
    v8->_ownerName = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zone name: %@, Owner Name: %@"), self->_zoneName, self->_ownerName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *zoneName;
  id v5;

  zoneName = self->_zoneName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", zoneName, CFSTR("ZoneName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerName, CFSTR("OwnerName"));

}

- (HKCloudSyncRecordZoneIDDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKCloudSyncRecordZoneIDDescription *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ZoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OwnerName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKCloudSyncRecordZoneIDDescription initWithZoneName:ownerName:](self, "initWithZoneName:ownerName:", v5, v6);
  return v7;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
