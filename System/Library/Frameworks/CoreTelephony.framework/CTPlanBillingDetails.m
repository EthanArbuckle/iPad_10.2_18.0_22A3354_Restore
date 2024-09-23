@implementation CTPlanBillingDetails

- (CTPlanBillingDetails)initWithName:(id)a3 PlanCost:(id)a4 PlanCurrency:(id)a5 PlanDataAmount:(id)a6 PlanDataMeasureUnit:(unint64_t)a7 PlanType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CTPlanBillingDetails *v18;
  CTPlanBillingDetails *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CTPlanBillingDetails;
  v18 = -[CTPlanBillingDetails init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_planName, a3);
    objc_storeStrong((id *)&v19->_planCost, a4);
    objc_storeStrong((id *)&v19->_planCurrency, a5);
    objc_storeStrong((id *)&v19->_planDataAmount, a6);
    v19->_planDataMeasureUnit = a7;
    v19->_planType = a8;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPlanBillingDetails planName](self, "planName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" PlanName=%@"), v4);

  -[CTPlanBillingDetails planCost](self, "planCost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" PlanCost=%@"), v5);

  -[CTPlanBillingDetails planCurrency](self, "planCurrency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" PlanCurrency=%@"), v6);

  -[CTPlanBillingDetails planDataAmount](self, "planDataAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" PlanDataAmount=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(" PlanDataMeasureUnit=%lu"), -[CTPlanBillingDetails planDataMeasureUnit](self, "planDataMeasureUnit"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" PlanType=%lu"), -[CTPlanBillingDetails planType](self, "planType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CTPlanBillingDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = (CTPlanBillingDetails *)a3;
  if (v5 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTPlanBillingDetails planName](self, "planName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanBillingDetails planName](v5, "planName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[CTPlanBillingDetails planName](self, "planName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanBillingDetails planName](v5, "planName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", v8))
        {
          v9 = 0;
          goto LABEL_33;
        }
        v34 = v8;
      }
      -[CTPlanBillingDetails planCost](self, "planCost");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanBillingDetails planCost](v5, "planCost");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[CTPlanBillingDetails planCost](self, "planCost");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanBillingDetails planCost](v5, "planCost");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqualToNumber:", v13))
        {
          v9 = 0;
LABEL_31:

LABEL_32:
          v8 = v34;
          if (v6 == v7)
          {
LABEL_34:

            goto LABEL_35;
          }
LABEL_33:

          goto LABEL_34;
        }
        v32 = v13;
        v33 = v12;
      }
      -[CTPlanBillingDetails planCurrency](self, "planCurrency");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanBillingDetails planCurrency](v5, "planCurrency");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v30 = v14;
      }
      else
      {
        -[CTPlanBillingDetails planCurrency](self, "planCurrency");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanBillingDetails planCurrency](v5, "planCurrency");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v16, "isEqualToString:"))
        {
          v9 = 0;
LABEL_29:

LABEL_30:
          v13 = v32;
          v12 = v33;
          if (v10 == v11)
            goto LABEL_32;
          goto LABEL_31;
        }
        v28 = v16;
        v30 = v14;
      }
      -[CTPlanBillingDetails planDataAmount](self, "planDataAmount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanBillingDetails planDataAmount](v5, "planDataAmount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v18)
      {
        v26 = v3;
      }
      else
      {
        v25 = v10;
        v19 = v3;
        -[CTPlanBillingDetails planDataAmount](self, "planDataAmount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanBillingDetails planDataAmount](v5, "planDataAmount");
        v27 = v20;
        v29 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isEqualToNumber:"))
        {
          v9 = 0;
          v3 = v19;
          v10 = v25;
          v23 = (void *)v29;
          goto LABEL_27;
        }
        v26 = v19;
        v10 = v25;
      }
      v21 = -[CTPlanBillingDetails planDataMeasureUnit](self, "planDataMeasureUnit");
      if (v21 == -[CTPlanBillingDetails planDataMeasureUnit](v5, "planDataMeasureUnit"))
      {
        v22 = -[CTPlanBillingDetails planType](self, "planType");
        v9 = v22 == -[CTPlanBillingDetails planType](v5, "planType");
      }
      else
      {
        v9 = 0;
      }
      v3 = v26;
      v23 = (void *)v29;
      if (v17 == v18)
      {
LABEL_28:

        v14 = v30;
        v16 = v28;
        if (v30 == v15)
          goto LABEL_30;
        goto LABEL_29;
      }
LABEL_27:

      goto LABEL_28;
    }
    v9 = 0;
  }
LABEL_35:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanBillingDetails)initWithCoder:(id)a3
{
  id v4;
  CTPlanBillingDetails *v5;
  uint64_t v6;
  NSString *planName;
  uint64_t v8;
  NSNumber *planCost;
  uint64_t v10;
  NSString *planCurrency;
  uint64_t v12;
  NSNumber *planDataAmount;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTPlanBillingDetails;
  v5 = -[CTPlanBillingDetails init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlanName"));
    v6 = objc_claimAutoreleasedReturnValue();
    planName = v5->_planName;
    v5->_planName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlanCost"));
    v8 = objc_claimAutoreleasedReturnValue();
    planCost = v5->_planCost;
    v5->_planCost = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlanCurrency"));
    v10 = objc_claimAutoreleasedReturnValue();
    planCurrency = v5->_planCurrency;
    v5->_planCurrency = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlanDataAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    planDataAmount = v5->_planDataAmount;
    v5->_planDataAmount = (NSNumber *)v12;

    v5->_planDataMeasureUnit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PlanDataMeasureUnit"));
    v5->_planType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PlanType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *planName;
  id v5;

  planName = self->_planName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", planName, CFSTR("PlanName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_planCost, CFSTR("PlanCost"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_planCurrency, CFSTR("PlanCurrency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_planDataAmount, CFSTR("PlanDataAmount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_planDataMeasureUnit, CFSTR("PlanDataMeasureUnit"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_planType, CFSTR("PlanType"));

}

- (NSString)planName
{
  return self->_planName;
}

- (NSNumber)planCost
{
  return self->_planCost;
}

- (NSString)planCurrency
{
  return self->_planCurrency;
}

- (NSNumber)planDataAmount
{
  return self->_planDataAmount;
}

- (unint64_t)planDataMeasureUnit
{
  return self->_planDataMeasureUnit;
}

- (unint64_t)planType
{
  return self->_planType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planDataAmount, 0);
  objc_storeStrong((id *)&self->_planCurrency, 0);
  objc_storeStrong((id *)&self->_planCost, 0);
  objc_storeStrong((id *)&self->_planName, 0);
}

@end
