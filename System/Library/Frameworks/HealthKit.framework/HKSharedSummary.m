@implementation HKSharedSummary

- (HKSharedSummary)initWithPackage:(id)a3 name:(id)a4 version:(id)a5 compatibilityVersion:(id)a6 authorizationIdentifiers:(id)a7 objectTypes:(id)a8 summaryData:(id)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HKSharedSummary *v25;

  v16 = (void *)MEMORY[0x1E0CB3A28];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v16, "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HKSharedSummary _initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:](self, "_initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:", v24, v23, v22, v21, v20, v19, v18, v17);

  return v25;
}

- (id)_initWithUUID:(id)a3 package:(id)a4 name:(id)a5 version:(id)a6 compatibilityVersion:(id)a7 authorizationIdentifiers:(id)a8 objectTypes:(id)a9 summaryData:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKSharedSummary *v25;
  HKSharedSummary *v26;
  uint64_t v27;
  NSString *package;
  uint64_t v29;
  NSString *name;
  uint64_t v31;
  NSString *version;
  uint64_t v33;
  NSString *compatibilityVersion;
  uint64_t v35;
  NSSet *authorizationIdentifiers;
  uint64_t v37;
  NSSet *objectTypes;
  uint64_t v39;
  NSData *summaryData;
  objc_super v42;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v42.receiver = self;
  v42.super_class = (Class)HKSharedSummary;
  v25 = -[HKSharedSummary init](&v42, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_UUID, a3);
    v27 = objc_msgSend(v18, "copy");
    package = v26->_package;
    v26->_package = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    name = v26->_name;
    v26->_name = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    version = v26->_version;
    v26->_version = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    compatibilityVersion = v26->_compatibilityVersion;
    v26->_compatibilityVersion = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    authorizationIdentifiers = v26->_authorizationIdentifiers;
    v26->_authorizationIdentifiers = (NSSet *)v35;

    v37 = objc_msgSend(v23, "copy");
    objectTypes = v26->_objectTypes;
    v26->_objectTypes = (NSSet *)v37;

    v39 = objc_msgSend(v24, "copy");
    summaryData = v26->_summaryData;
    v26->_summaryData = (NSData *)v39;

  }
  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSSet allObjects](self->_authorizationIdentifiers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_UUID, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p UUID=%@, package=%@, name=%@, version=%@, authorizations=%@>"), v7, self, v8, self->_package, self->_name, self->_version, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSharedSummary *v4;
  NSUUID *UUID;
  void *v6;
  char v7;

  v4 = (HKSharedSummary *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      UUID = self->_UUID;
      -[HKSharedSummary UUID](v4, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](UUID, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)_setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_package, CFSTR("Package"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("Name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_compatibilityVersion, CFSTR("CompatibilityVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationIdentifiers, CFSTR("AuthorizationIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectTypes, CFSTR("ObjectTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summaryData, CFSTR("SummaryData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transaction, CFSTR("Transaction"));

}

- (HKSharedSummary)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKSharedSummary *v18;
  HKSharedSummary *v19;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Package"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CompatibilityVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)v10;
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("AuthorizationIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("ObjectTypes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SummaryData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Transaction"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HKSharedSummary _initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:](self, "_initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:", v4, v5, v6, v7, v15, v16);
  v19 = v18;
  if (v18)
    -[HKSharedSummary _setTransaction:](v18, "_setTransaction:", v17);

  return v19;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)package
{
  return self->_package;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSSet)authorizationIdentifiers
{
  return self->_authorizationIdentifiers;
}

- (NSSet)objectTypes
{
  return self->_objectTypes;
}

- (NSData)summaryData
{
  return self->_summaryData;
}

- (HKSharedSummaryTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_summaryData, 0);
  objc_storeStrong((id *)&self->_objectTypes, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
