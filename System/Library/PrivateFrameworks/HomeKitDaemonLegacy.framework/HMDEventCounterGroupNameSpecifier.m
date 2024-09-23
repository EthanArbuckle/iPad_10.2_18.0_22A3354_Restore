@implementation HMDEventCounterGroupNameSpecifier

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
}

- (HMDEventCounterGroupNameSpecifier)initWithGroupName:(id)a3
{
  id v5;
  HMDEventCounterGroupNameSpecifier *v6;
  HMDEventCounterGroupNameSpecifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDEventCounterGroupNameSpecifier;
  v6 = -[HMDEventCounterGroupNameSpecifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_groupName, a3);

  return v7;
}

- (HMDEventCounterGroupNameSpecifier)initWithCoder:(id)a3
{
  id v4;
  HMDEventCounterGroupNameSpecifier *v5;
  uint64_t v6;
  NSString *groupName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDEventCounterGroupNameSpecifier;
  v5 = -[HMDEventCounterGroupNameSpecifier init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupName"));

}

- (BOOL)isEqual:(id)a3
{
  HMDEventCounterGroupNameSpecifier *v4;
  BOOL v5;

  v4 = (HMDEventCounterGroupNameSpecifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[HMDEventCounterGroupNameSpecifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[HMDEventCounterGroupNameSpecifier isEqualToGroupNameSpecifier:](self, "isEqualToGroupNameSpecifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToGroupNameSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)specifierWithGroupName:(id)a3
{
  id v3;
  HMDEventCounterGroupNameSpecifier *v4;

  v3 = a3;
  v4 = -[HMDEventCounterGroupNameSpecifier initWithGroupName:]([HMDEventCounterGroupNameSpecifier alloc], "initWithGroupName:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
