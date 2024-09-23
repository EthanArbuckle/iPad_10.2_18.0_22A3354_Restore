@implementation AMSMockBagBuilder

- (AMSMockBagBuilder)init
{
  return -[AMSMockBagBuilder initWithData:](self, "initWithData:", MEMORY[0x1E0C9AA70]);
}

- (AMSMockBagBuilder)initWithData:(id)a3
{
  id v4;
  AMSMockBagBuilder *v5;
  uint64_t v6;
  NSMutableDictionary *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMockBagBuilder;
  v5 = -[AMSMockBagBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)addBagKey:(id)a3 value:(id)a4 valueType:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (v7)
  {
    -[AMSMockBagBuilder data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
}

- (id)createMockBag
{
  AMSBagFrozenDataSourceBuilder *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  AMSBag *v13;
  void *v14;
  AMSBag *v15;

  v3 = objc_alloc_init(AMSBagFrozenDataSourceBuilder);
  -[AMSMockBagBuilder data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBagFrozenDataSourceBuilder setData:](v3, "setData:", v4);

  -[AMSMockBagBuilder expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AMSBagFrozenDataSourceBuilder setExpirationDate:](v3, "setExpirationDate:", v6);
  if (!v5)

  -[AMSMockBagBuilder profile](self, "profile");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("AMSMockBag");
  -[AMSBagFrozenDataSourceBuilder setProfile:](v3, "setProfile:", v9);

  -[AMSMockBagBuilder profileVersion](self, "profileVersion");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("1");
  -[AMSBagFrozenDataSourceBuilder setProfileVersion:](v3, "setProfileVersion:", v12);

  v13 = [AMSBag alloc];
  -[AMSBagFrozenDataSourceBuilder createFrozenDataSource](v3, "createFrozenDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AMSBag initWithDataSource:](v13, "initWithDataSource:", v14);

  return v15;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_profileVersion, a3);
}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
