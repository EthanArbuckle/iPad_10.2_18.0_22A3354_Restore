@implementation AMSSnapshotBagBuilder

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
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

- (id)buildWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AMSBagFrozenDataSourceBuilder *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AMSSnapshotBag *v17;
  void *v18;
  id v19;

  -[AMSSnapshotBagBuilder data](self, "data");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = (void *)v5;
  -[AMSSnapshotBagBuilder expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  -[AMSSnapshotBagBuilder profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

LABEL_7:
    goto LABEL_8;
  }
  -[AMSSnapshotBagBuilder profileVersion](self, "profileVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(AMSBagFrozenDataSourceBuilder);
    -[AMSSnapshotBagBuilder data](self, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagFrozenDataSourceBuilder setData:](v10, "setData:", v11);

    -[AMSSnapshotBagBuilder defaultValues](self, "defaultValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagFrozenDataSourceBuilder setDefaultValues:](v10, "setDefaultValues:", v12);

    -[AMSSnapshotBagBuilder expirationDate](self, "expirationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagFrozenDataSourceBuilder setExpirationDate:](v10, "setExpirationDate:", v13);

    -[AMSSnapshotBagBuilder profile](self, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagFrozenDataSourceBuilder setProfile:](v10, "setProfile:", v14);

    -[AMSSnapshotBagBuilder profileVersion](self, "profileVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagFrozenDataSourceBuilder setProfileVersion:](v10, "setProfileVersion:", v15);

    -[AMSSnapshotBagBuilder processInfo](self, "processInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagFrozenDataSourceBuilder setProcessInfo:](v10, "setProcessInfo:", v16);

    v17 = [AMSSnapshotBag alloc];
    -[AMSBagFrozenDataSourceBuilder createFrozenDataSource](v10, "createFrozenDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[AMSSnapshotBag _initWithDataSource:](v17, "_initWithDataSource:", v18);

    return v19;
  }
LABEL_8:
  if (a3)
  {
    AMSError(2, CFSTR("Missing Required Parameter"), CFSTR("One or more required parameters are missing."), 0);
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  return v19;
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

- (void)setProcessInfo:(id)a3
{
  objc_storeStrong((id *)&self->_processInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setDefaultValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValues, a3);
}

@end
