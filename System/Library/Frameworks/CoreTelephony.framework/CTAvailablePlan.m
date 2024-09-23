@implementation CTAvailablePlan

- (CTAvailablePlan)initWithIccid:(id)a3
{
  id v5;
  CTAvailablePlan *v6;
  CTAvailablePlan *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTAvailablePlan;
  v6 = -[CTAvailablePlan init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_iccid, a3);

  return v7;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", iccid=%@"), self->_iccid);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTAvailablePlan;
  if (-[CTPlan isEqual:](&v11, sel_isEqual_, v4))
  {
    -[CTAvailablePlan iccid](self, "iccid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iccid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[CTAvailablePlan iccid](self, "iccid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "iccid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTAvailablePlan)initWithCoder:(id)a3
{
  id v4;
  CTAvailablePlan *v5;
  uint64_t v6;
  NSString *iccid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTAvailablePlan;
  v5 = -[CTPlan initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v6 = objc_claimAutoreleasedReturnValue();
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTAvailablePlan;
  v4 = a3;
  -[CTPlan encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_iccid, CFSTR("iccid"), v5.receiver, v5.super_class);

}

- (NSString)iccid
{
  return self->_iccid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
}

@end
