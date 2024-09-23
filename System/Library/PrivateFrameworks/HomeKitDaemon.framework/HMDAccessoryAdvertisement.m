@implementation HMDAccessoryAdvertisement

- (HMDAccessoryAdvertisement)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDAccessoryAdvertisement *v12;
  HMDAccessoryAdvertisement *v13;
  uint64_t v14;
  HMAccessoryCategory *category;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryAdvertisement;
  v12 = -[HMDAccessoryAdvertisement init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_msgSend(MEMORY[0x24BDD7668], "cachedInstanceForHMAccessoryCategory:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    category = v13->_category;
    v13->_category = (HMAccessoryCategory *)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessoryAdvertisement name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryAdvertisement identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryAdvertisement category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ name = %@, identifier = %@, category = %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setCategory:(id)a3
{
  HMAccessoryCategory *v4;
  HMAccessoryCategory *category;

  objc_msgSend(MEMORY[0x24BDD7668], "cachedInstanceForHMAccessoryCategory:", a3);
  v4 = (HMAccessoryCategory *)objc_claimAutoreleasedReturnValue();
  category = self->_category;
  self->_category = v4;

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryAdvertisement identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryAdvertisement *v4;
  HMDAccessoryAdvertisement *v5;
  HMDAccessoryAdvertisement *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccessoryAdvertisement *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAccessoryAdvertisement identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryAdvertisement identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (int64_t)associationOptions
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (HMAccessoryCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
