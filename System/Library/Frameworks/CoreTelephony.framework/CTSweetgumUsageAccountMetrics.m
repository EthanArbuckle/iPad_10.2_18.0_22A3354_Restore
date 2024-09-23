@implementation CTSweetgumUsageAccountMetrics

- (CTSweetgumUsageAccountMetrics)init
{
  CTSweetgumUsageAccountMetrics *v2;
  CTSweetgumUsageAccountMetrics *v3;
  NSString *networkUsageLabel;
  NSString *subscriptionStatus;
  NSString *planType;
  NSDate *billingCycleEndDate;
  NSArray *applicablePlans;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTSweetgumUsageAccountMetrics;
  v2 = -[CTSweetgumUsageAccountMetrics init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    networkUsageLabel = v2->_networkUsageLabel;
    v2->_networkUsageLabel = 0;

    subscriptionStatus = v3->_subscriptionStatus;
    v3->_deviceType = 0;
    v3->_subscriptionStatus = 0;
    v3->_localDevice = 0;

    planType = v3->_planType;
    v3->_planType = 0;

    billingCycleEndDate = v3->_billingCycleEndDate;
    v3->_billingCycleEndDate = 0;

    applicablePlans = v3->_applicablePlans;
    v3->_applicablePlans = 0;

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
  -[CTSweetgumUsageAccountMetrics networkUsageLabel](self, "networkUsageLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", networkUsageLabel=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", deviceType=%s"), CTSweetgumDeviceTypeAsString(-[CTSweetgumUsageAccountMetrics deviceType](self, "deviceType")));
  objc_msgSend(v3, "appendFormat:", CFSTR(", localDevice=%d"), -[CTSweetgumUsageAccountMetrics localDevice](self, "localDevice"));
  -[CTSweetgumUsageAccountMetrics subscriptionStatus](self, "subscriptionStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", subscriptionStatus=%@"), v5);

  -[CTSweetgumUsageAccountMetrics planType](self, "planType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planType=%@"), v6);

  -[CTSweetgumUsageAccountMetrics billingCycleEndDate](self, "billingCycleEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", billingCycleEndDate=%@"), v7);

  -[CTSweetgumUsageAccountMetrics applicablePlans](self, "applicablePlans");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", applicablePlans=%@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CTSweetgumUsageAccountMetrics *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;

  v7 = (CTSweetgumUsageAccountMetrics *)a3;
  if (v7 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSweetgumUsageAccountMetrics networkUsageLabel](self, "networkUsageLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsageAccountMetrics networkUsageLabel](v7, "networkUsageLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[CTSweetgumUsageAccountMetrics networkUsageLabel](self, "networkUsageLabel");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsageAccountMetrics networkUsageLabel](v7, "networkUsageLabel");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", v4))
        {
          v10 = 0;
          goto LABEL_32;
        }
      }
      v11 = -[CTSweetgumUsageAccountMetrics deviceType](self, "deviceType");
      if (v11 != -[CTSweetgumUsageAccountMetrics deviceType](v7, "deviceType")
        || (v12 = -[CTSweetgumUsageAccountMetrics localDevice](self, "localDevice"),
            v12 != -[CTSweetgumUsageAccountMetrics localDevice](v7, "localDevice")))
      {
        v10 = 0;
        goto LABEL_31;
      }
      -[CTSweetgumUsageAccountMetrics subscriptionStatus](self, "subscriptionStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsageAccountMetrics subscriptionStatus](v7, "subscriptionStatus");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v14)
      {
        -[CTSweetgumUsageAccountMetrics subscriptionStatus](self, "subscriptionStatus");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsageAccountMetrics subscriptionStatus](v7, "subscriptionStatus");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqualToString:", v15))
        {
          v10 = 0;
          goto LABEL_29;
        }
        v38 = v15;
      }
      -[CTSweetgumUsageAccountMetrics planType](self, "planType");
      v16 = objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsageAccountMetrics planType](v7, "planType");
      v39 = v5;
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v16;
      if (v16 != v40)
      {
        -[CTSweetgumUsageAccountMetrics planType](self, "planType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsageAccountMetrics planType](v7, "planType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v17;
        if (!objc_msgSend(v17, "isEqualToString:"))
        {
          v10 = 0;
          v19 = (void *)v40;
          v18 = v41;
LABEL_27:

LABEL_28:
          v15 = v38;
          v5 = v39;
          if (v13 == v14)
          {
LABEL_30:

LABEL_31:
            if (v8 == v9)
            {
LABEL_33:

              goto LABEL_34;
            }
LABEL_32:

            goto LABEL_33;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      -[CTSweetgumUsageAccountMetrics billingCycleEndDate](self, "billingCycleEndDate");
      v20 = objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsageAccountMetrics billingCycleEndDate](v7, "billingCycleEndDate");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v20;
      if (v20 == v34
        || (-[CTSweetgumUsageAccountMetrics billingCycleEndDate](self, "billingCycleEndDate"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTSweetgumUsageAccountMetrics billingCycleEndDate](v7, "billingCycleEndDate"),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            v33 = v21,
            objc_msgSend(v21, "isEqualToDate:")))
      {
        -[CTSweetgumUsageAccountMetrics applicablePlans](self, "applicablePlans");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsageAccountMetrics applicablePlans](v7, "applicablePlans");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v24 == (void *)v25)
        {

          v10 = 1;
        }
        else
        {
          v26 = (void *)v25;
          -[CTSweetgumUsageAccountMetrics applicablePlans](self, "applicablePlans");
          v31 = v13;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSweetgumUsageAccountMetrics applicablePlans](v7, "applicablePlans");
          v30 = v14;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v27, "isEqual:", v28);

          v14 = v30;
          v13 = v31;

        }
        v23 = (void *)v34;
        v22 = v35;
        if (v35 == (void *)v34)
        {
LABEL_26:

          v19 = (void *)v40;
          v18 = v41;
          if (v41 == (void *)v40)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
      else
      {
        v10 = 0;
        v23 = (void *)v34;
        v22 = v35;
      }

      goto LABEL_26;
    }
    v10 = 0;
  }
LABEL_34:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *networkUsageLabel;
  id v5;

  networkUsageLabel = self->_networkUsageLabel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", networkUsageLabel, CFSTR("networkUsageLabel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_localDevice, CFSTR("localDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionStatus, CFSTR("subscriptionStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_planType, CFSTR("planType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_billingCycleEndDate, CFSTR("billingCycleEndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicablePlans, CFSTR("applicablePlans"));

}

- (CTSweetgumUsageAccountMetrics)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumUsageAccountMetrics *v5;
  uint64_t v6;
  NSString *networkUsageLabel;
  uint64_t v8;
  NSString *subscriptionStatus;
  uint64_t v10;
  NSString *planType;
  uint64_t v12;
  NSDate *billingCycleEndDate;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *applicablePlans;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CTSweetgumUsageAccountMetrics;
  v5 = -[CTSweetgumUsageAccountMetrics init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkUsageLabel"));
    v6 = objc_claimAutoreleasedReturnValue();
    networkUsageLabel = v5->_networkUsageLabel;
    v5->_networkUsageLabel = (NSString *)v6;

    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType"));
    v5->_localDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    subscriptionStatus = v5->_subscriptionStatus;
    v5->_subscriptionStatus = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planType"));
    v10 = objc_claimAutoreleasedReturnValue();
    planType = v5->_planType;
    v5->_planType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingCycleEndDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    billingCycleEndDate = v5->_billingCycleEndDate;
    v5->_billingCycleEndDate = (NSDate *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("applicablePlans"));
    v17 = objc_claimAutoreleasedReturnValue();
    applicablePlans = v5->_applicablePlans;
    v5->_applicablePlans = (NSArray *)v17;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)networkUsageLabel
{
  return self->_networkUsageLabel;
}

- (void)setNetworkUsageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_networkUsageLabel, a3);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(BOOL)a3
{
  self->_localDevice = a3;
}

- (NSString)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setSubscriptionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionStatus, a3);
}

- (NSString)planType
{
  return self->_planType;
}

- (void)setPlanType:(id)a3
{
  objc_storeStrong((id *)&self->_planType, a3);
}

- (NSDate)billingCycleEndDate
{
  return self->_billingCycleEndDate;
}

- (void)setBillingCycleEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_billingCycleEndDate, a3);
}

- (NSArray)applicablePlans
{
  return self->_applicablePlans;
}

- (void)setApplicablePlans:(id)a3
{
  objc_storeStrong((id *)&self->_applicablePlans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicablePlans, 0);
  objc_storeStrong((id *)&self->_billingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_planType, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_networkUsageLabel, 0);
}

@end
