@implementation HMDAccessoryCounterGroupSpecifier

- (HMDAccessoryCounterGroupSpecifier)initWithGroupName:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 date:(id)a6
{
  id v11;
  HMDAccessoryCounterGroupSpecifier *v12;
  HMDAccessoryCounterGroupSpecifier *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessoryCounterGroupSpecifier;
  v12 = -[HMDHouseholdDataEventCounterGroupSpecifier initWithGroupName:homeUUID:date:](&v15, sel_initWithGroupName_homeUUID_date_, a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_accessoryUUID, a5);

  return v13;
}

- (HMDAccessoryCounterGroupSpecifier)initWithCoder:(id)a3
{
  id v4;
  HMDAccessoryCounterGroupSpecifier *v5;
  uint64_t v6;
  NSUUID *accessoryUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAccessoryCounterGroupSpecifier;
  v5 = -[HMDHouseholdDataEventCounterGroupSpecifier initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryUUID = v5->_accessoryUUID;
    v5->_accessoryUUID = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryCounterGroupSpecifier;
  v4 = a3;
  -[HMDHouseholdDataEventCounterGroupSpecifier encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDAccessoryCounterGroupSpecifier accessoryUUID](self, "accessoryUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessoryUUID"));

}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryCounterGroupSpecifier *v4;
  HMDAccessoryCounterGroupSpecifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v4 = (HMDAccessoryCounterGroupSpecifier *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else if (-[HMDAccessoryCounterGroupSpecifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
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
        -[HMDAccessoryCounterGroupSpecifier accessoryUUID](self, "accessoryUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryCounterGroupSpecifier accessoryUUID](v5, "accessoryUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "hmf_isEqualToUUID:", v11))
        {
          -[HMDDateCounterGroupSpecifier date](self, "date");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDateCounterGroupSpecifier date](v5, "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v15, "isEqualToDate:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDHouseholdDataEventCounterGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HMDAccessoryCounterGroupSpecifier accessoryUUID](self, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HMDDateCounterGroupSpecifier date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHouseholdDataEventCounterGroupSpecifier homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryCounterGroupSpecifier accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDateCounterGroupSpecifier date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@/%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (id)specifierWithGroupName:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 date:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDAccessoryCounterGroupSpecifier *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[HMDAccessoryCounterGroupSpecifier initWithGroupName:homeUUID:accessoryUUID:date:]([HMDAccessoryCounterGroupSpecifier alloc], "initWithGroupName:homeUUID:accessoryUUID:date:", v12, v11, v10, v9);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
