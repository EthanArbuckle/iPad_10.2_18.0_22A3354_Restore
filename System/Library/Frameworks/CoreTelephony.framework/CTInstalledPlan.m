@implementation CTInstalledPlan

- (CTInstalledPlan)init
{
  CTInstalledPlan *v2;
  CTInstalledPlan *v3;
  CTPlanIdentifier *planID;
  CTPlanTransferAttributes *transferAttributes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTInstalledPlan;
  v2 = -[CTInstalledPlan init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    planID = v2->_planID;
    v2->_planID = 0;

    v3->_isSelected = 0;
    transferAttributes = v3->_transferAttributes;
    v3->_transferAttributes = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTInstalledPlan planID](self, "planID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" planID=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" isSelected=%d"), -[CTInstalledPlan isSelected](self, "isSelected"));
  -[CTInstalledPlan transferAttributes](self, "transferAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" transferAttributes=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTInstalledPlan *v6;
  void *v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (CTInstalledPlan *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTInstalledPlan planID](self, "planID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTInstalledPlan planID](v6, "planID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTInstalledPlan planID](self, "planID"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTInstalledPlan planID](v6, "planID"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v10 = -[CTInstalledPlan isSelected](self, "isSelected");
        if (v10 == -[CTInstalledPlan isSelected](v6, "isSelected"))
        {
          -[CTInstalledPlan transferAttributes](self, "transferAttributes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTInstalledPlan transferAttributes](v6, "transferAttributes");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v11 == (void *)v12)
          {

            v9 = 1;
          }
          else
          {
            v13 = (void *)v12;
            -[CTInstalledPlan transferAttributes](self, "transferAttributes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CTInstalledPlan transferAttributes](v6, "transferAttributes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v14, "isEqual:", v15);

          }
        }
        else
        {
          v9 = 0;
        }
        if (v7 == v8)
          goto LABEL_15;
      }
      else
      {
        v9 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (id)iccid
{
  return -[CTPlanIdentifier iccid](self->_planID, "iccid");
}

- (id)carrierName
{
  return -[CTPlanIdentifier carrierName](self->_planID, "carrierName");
}

- (id)phoneNumber
{
  return -[CTPlanIdentifier phoneNumber](self->_planID, "phoneNumber");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTInstalledPlan)initWithCoder:(id)a3
{
  id v4;
  CTInstalledPlan *v5;
  uint64_t v6;
  CTPlanIdentifier *planID;
  uint64_t v8;
  CTPlanTransferAttributes *transferAttributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTInstalledPlan;
  v5 = -[CTInstalledPlan init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planID"));
    v6 = objc_claimAutoreleasedReturnValue();
    planID = v5->_planID;
    v5->_planID = (CTPlanIdentifier *)v6;

    v5->_isSelected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSelected"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferAttributes"));
    v8 = objc_claimAutoreleasedReturnValue();
    transferAttributes = v5->_transferAttributes;
    v5->_transferAttributes = (CTPlanTransferAttributes *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CTPlanIdentifier *planID;
  id v5;

  planID = self->_planID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", planID, CFSTR("planID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSelected, CFSTR("isSelected"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferAttributes, CFSTR("transferAttributes"));

}

- (CTPlanIdentifier)planID
{
  return self->_planID;
}

- (void)setPlanID:(id)a3
{
  objc_storeStrong((id *)&self->_planID, a3);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (CTPlanTransferAttributes)transferAttributes
{
  return self->_transferAttributes;
}

- (void)setTransferAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_transferAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferAttributes, 0);
  objc_storeStrong((id *)&self->_planID, 0);
}

@end
