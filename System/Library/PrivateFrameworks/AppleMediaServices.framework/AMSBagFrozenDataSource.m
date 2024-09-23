@implementation AMSBagFrozenDataSource

- (void)loadWithCompletion:(id)a3
{
  AMSBagDataSourceLoadResult *v4;
  void *v5;
  void *v6;
  AMSBagDataSourceLoadResult *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a3;
  v4 = [AMSBagDataSourceLoadResult alloc];
  -[AMSBagFrozenDataSource data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagFrozenDataSource expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagDataSourceLoadResult initWithData:expirationDate:loadedBagIdentifier:loadedBagPartialIdentifier:](v4, "initWithData:expirationDate:loadedBagIdentifier:loadedBagPartialIdentifier:", v5, v6, 0, 0);

  v8[2](v8, v7, 0);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDictionary)data
{
  return self->_data;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AMSBagFrozenDataSource profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagFrozenDataSource profileVersion](self, "profileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; profile: %@; version: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)defaultValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[AMSBagFrozenDataSource defaultValues](self, "defaultValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[AMSBagFrozenDataSource profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagFrozenDataSource profileVersion](self, "profileVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBagKeySet defaultValueForKey:profile:profileVersion:](AMSBagKeySet, "defaultValueForKey:profile:profileVersion:", v4, v7, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSBagFrozenDataSource processInfo](self, "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkDataSource valueForURLVariable:account:clientInfo:completion:](AMSBagNetworkDataSource, "valueForURLVariable:account:clientInfo:completion:", v11, v8, v10, v9);

}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (AMSBagFrozenDataSource)initWithCoder:(id)a3
{
  id v4;
  AMSBagFrozenDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *data;
  uint64_t v11;
  NSDictionary *defaultValues;
  uint64_t v13;
  NSDate *expirationDate;
  uint64_t v15;
  AMSProcessInfo *processInfo;
  uint64_t v17;
  NSString *profile;
  uint64_t v19;
  NSString *profileVersion;
  objc_super v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AMSBagFrozenDataSource;
  v5 = -[AMSBagFrozenDataSource init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("data"));
    v9 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("defaultValues"));
    v11 = objc_claimAutoreleasedReturnValue();
    defaultValues = v5->_defaultValues;
    v5->_defaultValues = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processInfo"));
    v15 = objc_claimAutoreleasedReturnValue();
    processInfo = v5->_processInfo;
    v5->_processInfo = (AMSProcessInfo *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profile"));
    v17 = objc_claimAutoreleasedReturnValue();
    profile = v5->_profile;
    v5->_profile = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileVersion"));
    v19 = objc_claimAutoreleasedReturnValue();
    profileVersion = v5->_profileVersion;
    v5->_profileVersion = (NSString *)v19;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (id)_initWithProfile:(id)a3 profileVersion:(id)a4 data:(id)a5 expirationDate:(id)a6 processInfo:(id)a7 defaultValues:(id)a8
{
  id v15;
  id v16;
  id v17;
  AMSBagFrozenDataSource *v18;
  id *p_isa;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSBagFrozenDataSource;
  v18 = -[AMSBagFrozenDataSource init](&v24, sel_init);
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a5);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 1, a6);
    objc_storeStrong(p_isa + 2, a7);
    objc_storeStrong(p_isa + 3, a3);
    objc_storeStrong(p_isa + 4, a4);
  }

  return p_isa;
}

- (NSString)bagLoadingPartialIdentifier
{
  return 0;
}

- (id)valueForURLVariable:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[AMSBagFrozenDataSource processInfo](self, "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSBagNetworkDataSource valueForURLVariable:account:clientInfo:](AMSBagNetworkDataSource, "valueForURLVariable:account:clientInfo:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSBagFrozenDataSource *v5;
  uint64_t v6;
  NSDictionary *data;
  uint64_t v8;
  NSDictionary *defaultValues;
  uint64_t v10;
  NSDate *expirationDate;
  AMSProcessInfo *v12;
  AMSProcessInfo *processInfo;
  uint64_t v14;
  NSString *profile;
  uint64_t v16;
  NSString *profileVersion;

  v5 = objc_alloc_init(AMSBagFrozenDataSource);
  v6 = -[NSDictionary copyWithZone:](self->_data, "copyWithZone:", a3);
  data = v5->_data;
  v5->_data = (NSDictionary *)v6;

  v8 = -[NSDictionary copyWithZone:](self->_defaultValues, "copyWithZone:", a3);
  defaultValues = v5->_defaultValues;
  v5->_defaultValues = (NSDictionary *)v8;

  v10 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v10;

  v12 = -[AMSProcessInfo copyWithZone:](self->_processInfo, "copyWithZone:", a3);
  processInfo = v5->_processInfo;
  v5->_processInfo = v12;

  v14 = -[NSString copyWithZone:](self->_profile, "copyWithZone:", a3);
  profile = v5->_profile;
  v5->_profile = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_profileVersion, "copyWithZone:", a3);
  profileVersion = v5->_profileVersion;
  v5->_profileVersion = (NSString *)v16;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AMSBagFrozenDataSource data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("data"));

  -[AMSBagFrozenDataSource defaultValues](self, "defaultValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("defaultValues"));

  -[AMSBagFrozenDataSource expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("expirationDate"));

  -[AMSBagFrozenDataSource processInfo](self, "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("processInfo"));

  -[AMSBagFrozenDataSource profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("profile"));

  -[AMSBagFrozenDataSource profileVersion](self, "profileVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("profileVersion"));

}

@end
