@implementation CTRemotePlan

- (CTRemotePlan)init
{
  CTRemotePlan *v2;
  CTRemotePlan *v3;
  CTRemotePlanIdentifier *planID;
  CTPlanTransferAttributes *transferAttributes;
  CTPlanSignUpDetails *signUpDetails;
  NSNumber *primaryAccount;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTRemotePlan;
  v2 = -[CTRemotePlan init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    planID = v2->_planID;
    v2->_planID = 0;

    transferAttributes = v3->_transferAttributes;
    v3->_transferAttributes = 0;

    signUpDetails = v3->_signUpDetails;
    v3->_signUpDetails = 0;

    v3->_addOnPurchaseType = 0;
    v3->_addOnCarrierFlowType = 0;
    primaryAccount = v3->_primaryAccount;
    v3->_primaryAccount = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTRemotePlan planID](self, "planID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" planID=%@"), v4);

  -[CTRemotePlan transferAttributes](self, "transferAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" transferAttributes=%@"), v5);

  -[CTRemotePlan signUpDetails](self, "signUpDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" signUpDetails=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(" addOnPurchaseType=%s"), CTPlanAddOnPurchaseTypeAsString(-[CTRemotePlan addOnPurchaseType](self, "addOnPurchaseType")));
  objc_msgSend(v3, "appendFormat:", CFSTR(" addOnCarrierFlowType=%s"), CTPlanAddOnCarrierFlowTypeAsString(-[CTRemotePlan addOnCarrierFlowType](self, "addOnCarrierFlowType")));
  -[CTRemotePlan primaryAccount](self, "primaryAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CTRemotePlan primaryAccount](self, "primaryAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" primaryAccount=%d"), objc_msgSend(v8, "BOOLValue"));

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CTRemotePlan *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = (CTRemotePlan *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTRemotePlan planID](self, "planID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemotePlan planID](v5, "planID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[CTRemotePlan planID](self, "planID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemotePlan planID](v5, "planID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = 0;
          goto LABEL_27;
        }
        v26 = v9;
        v27 = v8;
      }
      -[CTRemotePlan transferAttributes](self, "transferAttributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemotePlan transferAttributes](v5, "transferAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[CTRemotePlan transferAttributes](self, "transferAttributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemotePlan transferAttributes](v5, "transferAttributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
          v10 = 0;
LABEL_25:

          goto LABEL_26;
        }
        v24 = v14;
        v25 = v13;
      }
      -[CTRemotePlan signUpDetails](self, "signUpDetails");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemotePlan signUpDetails](v5, "signUpDetails");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 != v16)
      {
        -[CTRemotePlan signUpDetails](self, "signUpDetails");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemotePlan signUpDetails](v5, "signUpDetails");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "isEqual:", v3))
          goto LABEL_21;
        v23 = v17;
      }
      v18 = -[CTRemotePlan addOnPurchaseType](self, "addOnPurchaseType");
      if (v18 == -[CTRemotePlan addOnPurchaseType](v5, "addOnPurchaseType"))
      {
        v19 = -[CTRemotePlan addOnCarrierFlowType](self, "addOnCarrierFlowType");
        if (v19 == -[CTRemotePlan addOnCarrierFlowType](v5, "addOnCarrierFlowType"))
        {
          -[CTRemotePlan primaryAccount](self, "primaryAccount");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTRemotePlan primaryAccount](v5, "primaryAccount");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v20 == v21;

          if (v15 == v16)
          {

            if (v11 != v12)
            {

            }
LABEL_26:

            v9 = v26;
            v8 = v27;
            if (v6 == v7)
            {
LABEL_28:

              goto LABEL_29;
            }
LABEL_27:

            goto LABEL_28;
          }
          v17 = v23;
          goto LABEL_22;
        }
      }
      v17 = v23;
      if (v15 == v16)
      {

        v10 = 0;
LABEL_24:
        v14 = v24;
        v13 = v25;
        if (v11 == v12)
          goto LABEL_26;
        goto LABEL_25;
      }
LABEL_21:
      v10 = 0;
LABEL_22:

      goto LABEL_24;
    }
    v10 = 0;
  }
LABEL_29:

  return v10;
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

- (id)countryCode
{
  return -[CTPlanIdentifier countryCode](self->_planID, "countryCode");
}

- (id)label
{
  return -[CTPlanIdentifier label](self->_planID, "label");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTRemotePlan)initWithCoder:(id)a3
{
  id v4;
  CTRemotePlan *v5;
  uint64_t v6;
  CTRemotePlanIdentifier *planID;
  uint64_t v8;
  CTPlanTransferAttributes *transferAttributes;
  uint64_t v10;
  CTPlanSignUpDetails *signUpDetails;
  uint64_t v12;
  NSNumber *primaryAccount;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTRemotePlan;
  v5 = -[CTRemotePlan init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planID"));
    v6 = objc_claimAutoreleasedReturnValue();
    planID = v5->_planID;
    v5->_planID = (CTRemotePlanIdentifier *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferAttributes"));
    v8 = objc_claimAutoreleasedReturnValue();
    transferAttributes = v5->_transferAttributes;
    v5->_transferAttributes = (CTPlanTransferAttributes *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signUpDetails"));
    v10 = objc_claimAutoreleasedReturnValue();
    signUpDetails = v5->_signUpDetails;
    v5->_signUpDetails = (CTPlanSignUpDetails *)v10;

    v5->_addOnPurchaseType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("addOnFlowType"));
    v5->_addOnCarrierFlowType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("addOnCarrierFlowType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccount"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryAccount = v5->_primaryAccount;
    v5->_primaryAccount = (NSNumber *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *primaryAccount;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_planID, CFSTR("planID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferAttributes, CFSTR("transferAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signUpDetails, CFSTR("signUpDetails"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_addOnPurchaseType, CFSTR("addOnFlowType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_addOnCarrierFlowType, CFSTR("addOnCarrierFlowType"));
  primaryAccount = self->_primaryAccount;
  if (primaryAccount)
    objc_msgSend(v5, "encodeObject:forKey:", primaryAccount, CFSTR("primaryAccount"));

}

- (CTRemotePlanIdentifier)planID
{
  return self->_planID;
}

- (void)setPlanID:(id)a3
{
  objc_storeStrong((id *)&self->_planID, a3);
}

- (CTPlanTransferAttributes)transferAttributes
{
  return self->_transferAttributes;
}

- (void)setTransferAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_transferAttributes, a3);
}

- (CTPlanSignUpDetails)signUpDetails
{
  return self->_signUpDetails;
}

- (void)setSignUpDetails:(id)a3
{
  objc_storeStrong((id *)&self->_signUpDetails, a3);
}

- (unint64_t)addOnCarrierFlowType
{
  return self->_addOnCarrierFlowType;
}

- (void)setAddOnCarrierFlowType:(unint64_t)a3
{
  self->_addOnCarrierFlowType = a3;
}

- (NSNumber)primaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccount, a3);
}

- (unint64_t)addOnPurchaseType
{
  return self->_addOnPurchaseType;
}

- (void)setAddOnPurchaseType:(unint64_t)a3
{
  self->_addOnPurchaseType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_signUpDetails, 0);
  objc_storeStrong((id *)&self->_transferAttributes, 0);
  objc_storeStrong((id *)&self->_planID, 0);
}

@end
