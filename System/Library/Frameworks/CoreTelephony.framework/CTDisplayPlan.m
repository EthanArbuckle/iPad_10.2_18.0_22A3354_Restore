@implementation CTDisplayPlan

- (CTDisplayPlan)initWithPlan:(id)a3 status:(int64_t)a4 attributes:(unint64_t)a5 isPhysical:(BOOL)a6 carrierName:(id)a7 phoneNumber:(id)a8 label:(id)a9
{
  id v15;
  id v16;
  id v17;
  CTDisplayPlan *v18;
  CTDisplayPlan *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)CTDisplayPlan;
  v18 = -[CTDisplayPlan init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_plan, a3);
    v19->_status = a4;
    v19->_attributes = a5;
    v19->_isPhysical = a6;
    objc_storeStrong((id *)&v19->_carrierName, a7);
    objc_storeStrong((id *)&v19->_phoneNumber, a8);
    objc_storeStrong((id *)&v19->_label, a9);
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const char *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTDisplayPlan plan](self, "plan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" id=%@"), v5);

  -[CTDisplayPlan carrierName](self, "carrierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" carrierName=%@"), v6);

  -[CTDisplayPlan phoneNumber](self, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" phoneNumber=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(" status=%s"), CTPlanStatusAsString(-[CTDisplayPlan status](self, "status")));
  CTPlanAttributeSetAsString(-[CTDisplayPlan attributes](self, "attributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" attributes=%@"), v8);

  -[CTDisplayPlan label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" label=%@"), v9);

  v10 = -[CTDisplayPlan isPhysical](self, "isPhysical");
  v11 = "NO";
  if (v10)
    v11 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR(" isPhysical=%s"), v11);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTDisplayPlan *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v22;
  void *v23;

  v6 = (CTDisplayPlan *)a3;
  if (v6 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTDisplayPlan plan](self, "plan");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTDisplayPlan plan](v6, "plan");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[CTDisplayPlan plan](self, "plan");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTDisplayPlan plan](v6, "plan");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          LOBYTE(v9) = 0;
          goto LABEL_17;
        }
      }
      v10 = -[CTDisplayPlan status](self, "status");
      if (v10 == -[CTDisplayPlan status](v6, "status"))
      {
        v11 = -[CTDisplayPlan attributes](self, "attributes");
        if (v11 == -[CTDisplayPlan attributes](v6, "attributes"))
        {
          -[CTDisplayPlan carrierName](self, "carrierName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTDisplayPlan carrierName](v6, "carrierName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", v13))
          {
            -[CTDisplayPlan phoneNumber](self, "phoneNumber");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CTDisplayPlan phoneNumber](v6, "phoneNumber");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqualToString:", v15))
            {
              v22 = v14;
              -[CTDisplayPlan label](self, "label");
              v16 = objc_claimAutoreleasedReturnValue();
              -[CTDisplayPlan label](v6, "label");
              v17 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v16;
              v18 = (void *)v16;
              v19 = (void *)v17;
              if (objc_msgSend(v18, "isEqualToString:", v17))
              {
                v20 = -[CTDisplayPlan isPhysical](self, "isPhysical");
                v9 = v20 ^ -[CTDisplayPlan isPhysical](v6, "isPhysical") ^ 1;
              }
              else
              {
                LOBYTE(v9) = 0;
              }

              v14 = v22;
            }
            else
            {
              LOBYTE(v9) = 0;
            }

LABEL_16:
            if (v7 == v8)
            {
LABEL_18:

              goto LABEL_19;
            }
LABEL_17:

            goto LABEL_18;
          }

        }
      }
      LOBYTE(v9) = 0;
      goto LABEL_16;
    }
    LOBYTE(v9) = 0;
  }
LABEL_19:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  int64_t status;
  unint64_t attributes;
  _BOOL8 isPhysical;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[CTPlan copyWithZone:](self->_plan, "copyWithZone:", a3);
  status = self->_status;
  attributes = self->_attributes;
  isPhysical = self->_isPhysical;
  v10 = (void *)-[NSString copyWithZone:](self->_carrierName, "copyWithZone:", a3);
  v11 = (void *)-[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  v12 = (void *)-[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v13 = (void *)objc_msgSend(v5, "initWithPlan:status:attributes:isPhysical:carrierName:phoneNumber:label:", v6, status, attributes, isPhysical, v10, v11, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTDisplayPlan)initWithCoder:(id)a3
{
  id v4;
  CTDisplayPlan *v5;
  uint64_t v6;
  CTPlan *plan;
  uint64_t v8;
  NSString *carrierName;
  uint64_t v10;
  NSString *phoneNumber;
  uint64_t v12;
  NSString *label;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTDisplayPlan;
  v5 = -[CTDisplayPlan init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plan"));
    v6 = objc_claimAutoreleasedReturnValue();
    plan = v5->_plan;
    v5->_plan = (CTPlan *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierName"));
    v8 = objc_claimAutoreleasedReturnValue();
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_attributes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attributes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v12 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v12;

    v5->_isPhysical = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPhysical"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *carrierName;
  NSString *phoneNumber;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_plan, CFSTR("plan"));
  carrierName = self->_carrierName;
  if (carrierName)
    objc_msgSend(v6, "encodeObject:forKey:", carrierName, CFSTR("carrierName"));
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend(v6, "encodeObject:forKey:", phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_attributes, CFSTR("attributes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isPhysical, CFSTR("isPhysical"));

}

- (CTPlan)plan
{
  return self->_plan;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)status
{
  return self->_status;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (BOOL)isPhysical
{
  return self->_isPhysical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_plan, 0);
}

@end
