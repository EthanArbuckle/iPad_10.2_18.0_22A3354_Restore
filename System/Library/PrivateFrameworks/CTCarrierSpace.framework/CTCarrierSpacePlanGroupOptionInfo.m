@implementation CTCarrierSpacePlanGroupOptionInfo

- (CTCarrierSpacePlanGroupOptionInfo)init
{
  CTCarrierSpacePlanGroupOptionInfo *v2;
  CTCarrierSpacePlanGroupOptionInfo *v3;
  NSString *planId;
  NSString *planLabel;
  NSString *planValue;
  NSString *planDetailsURL;
  NSString *planTermsURL;
  NSString *planPurchaseURL;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CTCarrierSpacePlanGroupOptionInfo;
  v2 = -[CTCarrierSpacePlanGroupOptionInfo init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    planId = v2->_planId;
    v2->_planId = 0;

    planLabel = v3->_planLabel;
    v3->_planLabel = 0;

    planValue = v3->_planValue;
    v3->_planValue = 0;

    *(_WORD *)&v3->_planPurchasable = 769;
    planDetailsURL = v3->_planDetailsURL;
    v3->_planDetailsURL = 0;

    planTermsURL = v3->_planTermsURL;
    v3->_planTermsURL = 0;

    planPurchaseURL = v3->_planPurchaseURL;
    v3->_planPurchaseURL = 0;

    v3->_planType = 0;
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
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpacePlanGroupOptionInfo planId](self, "planId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planId=%@"), v4);

  -[CTCarrierSpacePlanGroupOptionInfo planLabel](self, "planLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planLabel=%@"), v5);

  -[CTCarrierSpacePlanGroupOptionInfo planValue](self, "planValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planValue=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", planStatus=%s"), CTCarrierSpacePlanStatusAsString(-[CTCarrierSpacePlanGroupOptionInfo planStatus](self, "planStatus")));
  objc_msgSend(v3, "appendFormat:", CFSTR(", planPurchasable=%d"), -[CTCarrierSpacePlanGroupOptionInfo planPurchasable](self, "planPurchasable"));
  -[CTCarrierSpacePlanGroupOptionInfo planDetailsURL](self, "planDetailsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planDetailsURL=%@"), v7);

  -[CTCarrierSpacePlanGroupOptionInfo planTermsURL](self, "planTermsURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planTermsURL=%@"), v8);

  -[CTCarrierSpacePlanGroupOptionInfo planPurchaseURL](self, "planPurchaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planPurchaseURL=%@"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(", planType=%ld"), -[CTCarrierSpacePlanGroupOptionInfo planType](self, "planType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CTCarrierSpacePlanGroupOptionInfo *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v5 = (CTCarrierSpacePlanGroupOptionInfo *)a3;
  if (v5 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpacePlanGroupOptionInfo planId](self, "planId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpacePlanGroupOptionInfo planId](v5, "planId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[CTCarrierSpacePlanGroupOptionInfo planId](self, "planId");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpacePlanGroupOptionInfo planId](v5, "planId");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v38, "isEqualToString:", v3))
        {
          v8 = 0;
          goto LABEL_21;
        }
      }
      -[CTCarrierSpacePlanGroupOptionInfo planLabel](self, "planLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpacePlanGroupOptionInfo planLabel](v5, "planLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[CTCarrierSpacePlanGroupOptionInfo planLabel](self, "planLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpacePlanGroupOptionInfo planLabel](v5, "planLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v37, "isEqualToString:"))
        {
          v8 = 0;
LABEL_19:

LABEL_20:
          if (v6 == v7)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      -[CTCarrierSpacePlanGroupOptionInfo planValue](self, "planValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpacePlanGroupOptionInfo planValue](v5, "planValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[CTCarrierSpacePlanGroupOptionInfo planValue](self, "planValue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpacePlanGroupOptionInfo planValue](v5, "planValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v36, "isEqualToString:"))
        {
          v8 = 0;
          goto LABEL_17;
        }
      }
      v13 = -[CTCarrierSpacePlanGroupOptionInfo planSubscriptionStatus](self, "planSubscriptionStatus");
      if (v13 != -[CTCarrierSpacePlanGroupOptionInfo planSubscriptionStatus](v5, "planSubscriptionStatus")
        || (v14 = -[CTCarrierSpacePlanGroupOptionInfo planPurchasable](self, "planPurchasable"),
            v14 != -[CTCarrierSpacePlanGroupOptionInfo planPurchasable](v5, "planPurchasable")))
      {
        v8 = 0;
        if (v11 == v12)
          goto LABEL_18;
        goto LABEL_17;
      }
      -[CTCarrierSpacePlanGroupOptionInfo planDetailsURL](self, "planDetailsURL");
      v16 = objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpacePlanGroupOptionInfo planDetailsURL](v5, "planDetailsURL");
      v31 = v3;
      v32 = objc_claimAutoreleasedReturnValue();
      if (v16 != v32)
      {
        -[CTCarrierSpacePlanGroupOptionInfo planDetailsURL](self, "planDetailsURL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpacePlanGroupOptionInfo planDetailsURL](v5, "planDetailsURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v30, "isEqualToString:"))
        {
          v8 = 0;
          v17 = (void *)v16;
          v18 = (void *)v32;
LABEL_36:

LABEL_37:
          v3 = v31;
          if (v11 == v12)
          {
LABEL_18:

            if (v9 == v10)
              goto LABEL_20;
            goto LABEL_19;
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      v29 = (void *)v16;
      -[CTCarrierSpacePlanGroupOptionInfo planTermsURL](self, "planTermsURL");
      v33 = objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpacePlanGroupOptionInfo planTermsURL](v5, "planTermsURL");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v33 == v28
        || (-[CTCarrierSpacePlanGroupOptionInfo planTermsURL](self, "planTermsURL"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTCarrierSpacePlanGroupOptionInfo planTermsURL](v5, "planTermsURL"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v27, "isEqualToString:")))
      {
        -[CTCarrierSpacePlanGroupOptionInfo planPurchaseURL](self, "planPurchaseURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpacePlanGroupOptionInfo planPurchaseURL](v5, "planPurchaseURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25 == v23)
        {

          v8 = 1;
        }
        else
        {
          -[CTCarrierSpacePlanGroupOptionInfo planPurchaseURL](self, "planPurchaseURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpacePlanGroupOptionInfo planPurchaseURL](v5, "planPurchaseURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v22, "isEqualToString:", v21);

        }
        v19 = (void *)v33;
        v20 = (void *)v28;
        if (v33 == v28)
        {
LABEL_35:

          v18 = (void *)v32;
          v17 = v29;
          if (v29 == (void *)v32)
            goto LABEL_37;
          goto LABEL_36;
        }
      }
      else
      {
        v8 = 0;
        v19 = (void *)v33;
        v20 = (void *)v28;
      }

      goto LABEL_35;
    }
    v8 = 0;
  }
LABEL_23:

  return v8;
}

- (int64_t)planStatus
{
  unint64_t planSubscriptionStatus;

  planSubscriptionStatus = (char)self->_planSubscriptionStatus;
  if (planSubscriptionStatus > 2)
    return 0;
  else
    return qword_209C8AD40[planSubscriptionStatus];
}

- (BOOL)planPurchasable
{
  return self->_planSubscriptionStatus != 2 && self->_planPurchasable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_planId, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlanId:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_planLabel, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlanLabel:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_planValue, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlanValue:", v8);

  objc_msgSend(v5, "setPlanSubscriptionStatus:", self->_planSubscriptionStatus);
  objc_msgSend(v5, "setPlanPurchasable:", self->_planPurchasable);
  v9 = (void *)-[NSString copyWithZone:](self->_planDetailsURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlanDetailsURL:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_planTermsURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlanTermsURL:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_planPurchaseURL, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlanPurchaseURL:", v11);

  objc_msgSend(v5, "setPlanType:", -[CTCarrierSpacePlanGroupOptionInfo planType](self, "planType"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_planId, CFSTR("planId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planLabel, CFSTR("planLabel"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planValue, CFSTR("planValue"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_planSubscriptionStatus, CFSTR("planSubscriptionStatus"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_planPurchasable, CFSTR("planPurchasable"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planDetailsURL, CFSTR("planDetailsURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planTermsURL, CFSTR("planTermsURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_planPurchaseURL, CFSTR("planPurchaseURL"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_planType, CFSTR("planType"));

}

- (CTCarrierSpacePlanGroupOptionInfo)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpacePlanGroupOptionInfo *v5;
  uint64_t v6;
  NSString *planId;
  uint64_t v8;
  NSString *planLabel;
  uint64_t v10;
  NSString *planValue;
  uint64_t v12;
  NSString *planDetailsURL;
  uint64_t v14;
  NSString *planTermsURL;
  uint64_t v16;
  NSString *planPurchaseURL;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTCarrierSpacePlanGroupOptionInfo;
  v5 = -[CTCarrierSpacePlanGroupOptionInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planId"));
    v6 = objc_claimAutoreleasedReturnValue();
    planId = v5->_planId;
    v5->_planId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planLabel"));
    v8 = objc_claimAutoreleasedReturnValue();
    planLabel = v5->_planLabel;
    v5->_planLabel = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    planValue = v5->_planValue;
    v5->_planValue = (NSString *)v10;

    v5->_planSubscriptionStatus = objc_msgSend(v4, "decodeIntForKey:", CFSTR("planSubscriptionStatus"));
    v5->_planPurchasable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("planPurchasable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planDetailsURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    planDetailsURL = v5->_planDetailsURL;
    v5->_planDetailsURL = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planTermsURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    planTermsURL = v5->_planTermsURL;
    v5->_planTermsURL = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planPurchaseURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    planPurchaseURL = v5->_planPurchaseURL;
    v5->_planPurchaseURL = (NSString *)v16;

    v5->_planType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("planType"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)planId
{
  return self->_planId;
}

- (void)setPlanId:(id)a3
{
  objc_storeStrong((id *)&self->_planId, a3);
}

- (NSString)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
  objc_storeStrong((id *)&self->_planLabel, a3);
}

- (NSString)planValue
{
  return self->_planValue;
}

- (void)setPlanValue:(id)a3
{
  objc_storeStrong((id *)&self->_planValue, a3);
}

- (void)setPlanPurchasable:(BOOL)a3
{
  self->_planPurchasable = a3;
}

- (NSString)planDetailsURL
{
  return self->_planDetailsURL;
}

- (void)setPlanDetailsURL:(id)a3
{
  objc_storeStrong((id *)&self->_planDetailsURL, a3);
}

- (NSString)planTermsURL
{
  return self->_planTermsURL;
}

- (void)setPlanTermsURL:(id)a3
{
  objc_storeStrong((id *)&self->_planTermsURL, a3);
}

- (NSString)planPurchaseURL
{
  return self->_planPurchaseURL;
}

- (void)setPlanPurchaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_planPurchaseURL, a3);
}

- (int64_t)planType
{
  return self->_planType;
}

- (void)setPlanType:(int64_t)a3
{
  self->_planType = a3;
}

- (unsigned)planSubscriptionStatus
{
  return self->_planSubscriptionStatus;
}

- (void)setPlanSubscriptionStatus:(unsigned __int8)a3
{
  self->_planSubscriptionStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planPurchaseURL, 0);
  objc_storeStrong((id *)&self->_planTermsURL, 0);
  objc_storeStrong((id *)&self->_planDetailsURL, 0);
  objc_storeStrong((id *)&self->_planValue, 0);
  objc_storeStrong((id *)&self->_planLabel, 0);
  objc_storeStrong((id *)&self->_planId, 0);
}

@end
