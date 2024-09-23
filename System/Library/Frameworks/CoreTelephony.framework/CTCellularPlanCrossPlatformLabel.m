@implementation CTCellularPlanCrossPlatformLabel

- (CTCellularPlanCrossPlatformLabel)initWithPhoneNumber:(id)a3 labelName:(id)a4
{
  id v7;
  id v8;
  CTCellularPlanCrossPlatformLabel *v9;
  CTCellularPlanCrossPlatformLabel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTCellularPlanCrossPlatformLabel;
  v9 = -[CTCellularPlanCrossPlatformLabel init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_phoneNumber, a3);
    objc_storeStrong((id *)&v10->_labelName, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanCrossPlatformLabel phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTCellularPlanCrossPlatformLabel phoneNumber](self, "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" phoneNumber=%@"), v5);

  }
  -[CTCellularPlanCrossPlatformLabel labelName](self, "labelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTCellularPlanCrossPlatformLabel labelName](self, "labelName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" labelName=%@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCellularPlanCrossPlatformLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTCellularPlanCrossPlatformLabel *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCellularPlanCrossPlatformLabel phoneNumber](self, "phoneNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCellularPlanCrossPlatformLabel phoneNumber](v4, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[CTCellularPlanCrossPlatformLabel labelName](self, "labelName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCellularPlanCrossPlatformLabel labelName](v4, "labelName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanCrossPlatformLabel)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanCrossPlatformLabel *v5;
  uint64_t v6;
  NSString *phoneNumber;
  uint64_t v8;
  NSString *labelName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCellularPlanCrossPlatformLabel;
  v5 = -[CTCellularPlanCrossPlatformLabel init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelName"));
    v8 = objc_claimAutoreleasedReturnValue();
    labelName = v5->_labelName;
    v5->_labelName = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTCellularPlanCrossPlatformLabel phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phoneNumber"));

  -[CTCellularPlanCrossPlatformLabel labelName](self, "labelName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("labelName"));

}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
