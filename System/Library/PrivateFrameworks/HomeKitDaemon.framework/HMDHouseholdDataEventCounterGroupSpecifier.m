@implementation HMDHouseholdDataEventCounterGroupSpecifier

- (HMDHouseholdDataEventCounterGroupSpecifier)initWithGroupName:(id)a3 homeUUID:(id)a4 date:(id)a5
{
  id v9;
  HMDHouseholdDataEventCounterGroupSpecifier *v10;
  HMDHouseholdDataEventCounterGroupSpecifier *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDHouseholdDataEventCounterGroupSpecifier;
  v10 = -[HMDDateCounterGroupSpecifier initWithGroupName:date:](&v13, sel_initWithGroupName_date_, a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_homeUUID, a4);

  return v11;
}

- (HMDHouseholdDataEventCounterGroupSpecifier)initWithCoder:(id)a3
{
  id v4;
  HMDHouseholdDataEventCounterGroupSpecifier *v5;
  uint64_t v6;
  NSUUID *homeUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHouseholdDataEventCounterGroupSpecifier;
  v5 = -[HMDDateCounterGroupSpecifier initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    homeUUID = v5->_homeUUID;
    v5->_homeUUID = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDHouseholdDataEventCounterGroupSpecifier;
  v4 = a3;
  -[HMDDateCounterGroupSpecifier encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDHouseholdDataEventCounterGroupSpecifier homeUUID](self, "homeUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("homeUUID"));

}

- (BOOL)isEqual:(id)a3
{
  HMDHouseholdDataEventCounterGroupSpecifier *v4;
  HMDHouseholdDataEventCounterGroupSpecifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMDHouseholdDataEventCounterGroupSpecifier *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[HMDHouseholdDataEventCounterGroupSpecifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventCounterGroupNameSpecifier groupName](v5, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[HMDHouseholdDataEventCounterGroupSpecifier homeUUID](self, "homeUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHouseholdDataEventCounterGroupSpecifier homeUUID](v5, "homeUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
      {
        -[HMDDateCounterGroupSpecifier date](self, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDateCounterGroupSpecifier date](v5, "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToDate:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDHouseholdDataEventCounterGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMDDateCounterGroupSpecifier date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdDataEventCounterGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDateCounterGroupSpecifier date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

+ (id)specifierWithGroupName:(id)a3 homeUUID:(id)a4 date:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDHouseholdDataEventCounterGroupSpecifier *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDHouseholdDataEventCounterGroupSpecifier initWithGroupName:homeUUID:date:]([HMDHouseholdDataEventCounterGroupSpecifier alloc], "initWithGroupName:homeUUID:date:", v9, v8, v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
