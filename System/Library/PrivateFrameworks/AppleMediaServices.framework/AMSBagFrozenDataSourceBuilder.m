@implementation AMSBagFrozenDataSourceBuilder

- (AMSBagFrozenDataSourceBuilder)initWithFrozenDataSource:(id)a3
{
  id v4;
  AMSBagFrozenDataSourceBuilder *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *data;
  void *v9;
  uint64_t v10;
  NSDictionary *defaultValues;
  void *v12;
  uint64_t v13;
  NSDate *expirationDate;
  void *v15;
  uint64_t v16;
  NSString *profile;
  void *v18;
  uint64_t v19;
  NSString *profileVersion;
  void *v21;
  uint64_t v22;
  AMSProcessInfo *processInfo;

  v4 = a3;
  v5 = -[AMSBagFrozenDataSourceBuilder init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    data = v5->_data;
    v5->_data = (NSDictionary *)v7;

    objc_msgSend(v4, "defaultValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    defaultValues = v5->_defaultValues;
    v5->_defaultValues = (NSDictionary *)v10;

    objc_msgSend(v4, "expirationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v13;

    objc_msgSend(v4, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    profile = v5->_profile;
    v5->_profile = (NSString *)v16;

    objc_msgSend(v4, "profileVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    profileVersion = v5->_profileVersion;
    v5->_profileVersion = (NSString *)v19;

    objc_msgSend(v4, "processInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    processInfo = v5->_processInfo;
    v5->_processInfo = (AMSProcessInfo *)v22;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setProcessInfo:(id)a3
{
  objc_storeStrong((id *)&self->_processInfo, a3);
}

- (void)setDefaultValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValues, a3);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (id)createFrozenDataSource
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AMSBagFrozenDataSource *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[AMSBagFrozenDataSourceBuilder data](self, "data");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[AMSBagFrozenDataSourceBuilder expirationDate](self, "expirationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v13 = 0;
LABEL_10:

      return v13;
    }
    -[AMSBagFrozenDataSourceBuilder profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v13 = 0;
      goto LABEL_9;
    }
    -[AMSBagFrozenDataSourceBuilder profileVersion](self, "profileVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [AMSBagFrozenDataSource alloc];
      -[AMSBagFrozenDataSourceBuilder profile](self, "profile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagFrozenDataSourceBuilder profileVersion](self, "profileVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagFrozenDataSourceBuilder data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagFrozenDataSourceBuilder expirationDate](self, "expirationDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagFrozenDataSourceBuilder processInfo](self, "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSBagFrozenDataSourceBuilder defaultValues](self, "defaultValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[AMSBagFrozenDataSource _initWithProfile:profileVersion:data:expirationDate:processInfo:defaultValues:](v8, "_initWithProfile:profileVersion:data:expirationDate:processInfo:defaultValues:", v4, v5, v9, v10, v11, v12);

LABEL_9:
      goto LABEL_10;
    }
  }
  v13 = 0;
  return v13;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDictionary)data
{
  return self->_data;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)setProfileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_profileVersion, a3);
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (id)createFrozenBag
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AMSBag *v8;
  AMSBag *v9;

  -[AMSBagFrozenDataSourceBuilder data](self, "data");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  v4 = (void *)v3;
  -[AMSBagFrozenDataSourceBuilder expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  -[AMSBagFrozenDataSourceBuilder profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_8;
  }
  -[AMSBagFrozenDataSourceBuilder profileVersion](self, "profileVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [AMSBag alloc];
    -[AMSBagFrozenDataSourceBuilder createFrozenDataSource](self, "createFrozenDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AMSBag initWithDataSource:](v8, "initWithDataSource:", v4);
LABEL_9:

    return v9;
  }
LABEL_6:
  v9 = 0;
  return v9;
}

@end
