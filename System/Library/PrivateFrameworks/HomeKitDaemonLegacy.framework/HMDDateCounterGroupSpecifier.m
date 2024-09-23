@implementation HMDDateCounterGroupSpecifier

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDDateCounterGroupSpecifier date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDDateCounterGroupSpecifier *v4;
  HMDDateCounterGroupSpecifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDDateCounterGroupSpecifier *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (-[HMDDateCounterGroupSpecifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventCounterGroupNameSpecifier groupName](v5, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[HMDDateCounterGroupSpecifier date](self, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDateCounterGroupSpecifier date](v5, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToDate:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

- (HMDDateCounterGroupSpecifier)initWithGroupName:(id)a3 date:(id)a4
{
  id v7;
  HMDDateCounterGroupSpecifier *v8;
  HMDDateCounterGroupSpecifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDDateCounterGroupSpecifier;
  v8 = -[HMDEventCounterGroupNameSpecifier initWithGroupName:](&v11, sel_initWithGroupName_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_date, a4);

  return v9;
}

- (HMDDateCounterGroupSpecifier)initWithCoder:(id)a3
{
  id v4;
  HMDDateCounterGroupSpecifier *v5;
  uint64_t v6;
  NSDate *date;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDateCounterGroupSpecifier;
  v5 = -[HMDEventCounterGroupNameSpecifier initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDDateCounterGroupSpecifier;
  v4 = a3;
  -[HMDEventCounterGroupNameSpecifier encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDDateCounterGroupSpecifier date](self, "date", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDEventCounterGroupNameSpecifier groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDateCounterGroupSpecifier date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)specifierWithGroupName:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  HMDDateCounterGroupSpecifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDDateCounterGroupSpecifier initWithGroupName:date:]([HMDDateCounterGroupSpecifier alloc], "initWithGroupName:date:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
