@implementation HKCloudSyncDatabaseDescription

- (HKCloudSyncDatabaseDescription)initWithScope:(id)a3 zoneDescriptions:(id)a4
{
  id v6;
  id v7;
  HKCloudSyncDatabaseDescription *v8;
  uint64_t v9;
  NSString *scope;
  uint64_t v11;
  NSArray *zoneDescriptions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKCloudSyncDatabaseDescription;
  v8 = -[HKCloudSyncDatabaseDescription init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    scope = v8->_scope;
    v8->_scope = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    zoneDescriptions = v8->_zoneDescriptions;
    v8->_zoneDescriptions = (NSArray *)v11;

  }
  return v8;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Scope: %@ \nZone Descriptions: %@"), self->_scope, self->_zoneDescriptions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *scope;
  id v5;

  scope = self->_scope;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scope, CFSTR("Scope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneDescriptions, CFSTR("ZoneDescriptions"));

}

- (HKCloudSyncDatabaseDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKCloudSyncDatabaseDescription *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Scope"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ZoneDescriptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HKCloudSyncDatabaseDescription initWithScope:zoneDescriptions:](self, "initWithScope:zoneDescriptions:", v5, v9);
  return v10;
}

- (NSString)scope
{
  return self->_scope;
}

- (NSArray)zoneDescriptions
{
  return self->_zoneDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneDescriptions, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

@end
