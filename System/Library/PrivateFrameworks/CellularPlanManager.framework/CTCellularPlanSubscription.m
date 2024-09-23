@implementation CTCellularPlanSubscription

- (CTCellularPlanSubscription)initWithIccid:(id)a3 subscriptionResult:(int)a4 autoRenew:(BOOL)a5 billingStartDate:(double)a6 billingEndDate:(double)a7 carrierName:(id)a8 planType:(int)a9 planDescription:(id)a10 planStatus:(int)a11 accountStatus:(int)a12 accountURL:(id)a13 timestamp:(double)a14 homeCountryList:(id)a15 dataUsage:(id)a16
{
  id v23;
  id v24;
  id v25;
  CTCellularPlanSubscription *v26;
  CTCellularPlanSubscription *v27;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v23 = a3;
  v24 = a8;
  v25 = a10;
  v34 = a13;
  v33 = a15;
  v32 = a16;
  v35.receiver = self;
  v35.super_class = (Class)CTCellularPlanSubscription;
  v26 = -[CTCellularPlanSubscription init](&v35, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_iccid, a3);
    v27->_subscriptionResult = a4;
    v27->_autoRenew = a5;
    v27->_billingStartDate = a6;
    v27->_billingEndDate = a7;
    objc_storeStrong((id *)&v27->_carrierName, a8);
    v27->_planType = a9;
    objc_storeStrong((id *)&v27->_planDescription, a10);
    v27->_planStatus = a11;
    v27->_accountStatus = a12;
    objc_storeStrong((id *)&v27->_accountURL, a13);
    v27->_timestamp = a14;
    objc_storeStrong((id *)&v27->_homeCountryList, a15);
    objc_storeStrong((id *)&v27->_dataUsage, a16);
  }

  return v27;
}

- (BOOL)isEqualOrNewerThanSubscription:(id)a3
{
  id v4;
  unsigned int v5;

  if (!a3)
    return 1;
  v4 = a3;
  LODWORD(self) = -[CTCellularPlanSubscription subscriptionResult](self, "subscriptionResult");
  v5 = objc_msgSend(v4, "subscriptionResult");

  return self >= v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  _BOOL8 autoRenew;
  double billingStartDate;
  double billingEndDate;
  void *v8;
  uint64_t planType;
  void *v10;
  int planStatus;
  int accountStatus;
  void *v13;
  double timestamp;
  void *v15;
  void *v16;
  void *v17;
  unsigned int subscriptionResult;
  void *v20;

  v20 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v4 = (void *)-[NSString copy](self->_iccid, "copy");
  subscriptionResult = self->_subscriptionResult;
  autoRenew = self->_autoRenew;
  billingStartDate = self->_billingStartDate;
  billingEndDate = self->_billingEndDate;
  v8 = (void *)-[NSString copy](self->_carrierName, "copy");
  planType = self->_planType;
  v10 = (void *)-[NSString copy](self->_planDescription, "copy");
  planStatus = self->_planStatus;
  accountStatus = self->_accountStatus;
  v13 = (void *)-[NSString copy](self->_accountURL, "copy");
  timestamp = self->_timestamp;
  v15 = (void *)-[NSArray copy](self->_homeCountryList, "copy");
  v16 = (void *)-[NSArray copy](self->_dataUsage, "copy");
  v17 = (void *)objc_msgSend(v20, "initWithIccid:subscriptionResult:autoRenew:billingStartDate:billingEndDate:carrierName:planType:planDescription:planStatus:accountStatus:accountURL:timestamp:homeCountryList:dataUsage:", v4, subscriptionResult, autoRenew, v8, planType, v10, billingStartDate, billingEndDate, timestamp, __PAIR64__(accountStatus, planStatus), v13, v15, v16);

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanSubscription)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanSubscription *v5;
  uint64_t v6;
  NSString *iccid;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  uint64_t v13;
  NSString *carrierName;
  void *v15;
  uint64_t v16;
  NSString *planDescription;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *accountURL;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *homeCountryList;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *dataUsage;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CTCellularPlanSubscription;
  v5 = -[CTCellularPlanSubscription init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCID"));
    v6 = objc_claimAutoreleasedReturnValue();
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;

    v5->_subscriptionResult = objc_msgSend(v4, "decodeIntForKey:", CFSTR("subscriptionResult"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoRenew"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoRenew = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingEndDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v5->_billingEndDate = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingStartDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v5->_billingStartDate = v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrier"));
    v13 = objc_claimAutoreleasedReturnValue();
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_planType = objc_msgSend(v15, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    planDescription = v5->_planDescription;
    v5->_planDescription = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planStatus"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_planStatus = objc_msgSend(v18, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountStatus"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accountStatus = objc_msgSend(v19, "intValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    accountURL = v5->_accountURL;
    v5->_accountURL = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v5->_timestamp = v23;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("homeCountryIso"));
    v27 = objc_claimAutoreleasedReturnValue();
    homeCountryList = v5->_homeCountryList;
    v5->_homeCountryList = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("dataUsage"));
    v32 = objc_claimAutoreleasedReturnValue();
    dataUsage = v5->_dataUsage;
    v5->_dataUsage = (NSArray *)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *iccid;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  iccid = self->_iccid;
  v12 = a3;
  objc_msgSend(v12, "encodeObject:forKey:", iccid, CFSTR("ICCID"));
  objc_msgSend(v12, "encodeInt:forKey:", self->_subscriptionResult, CFSTR("subscriptionResult"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoRenew);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("autoRenew"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_billingEndDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("billingEndDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_billingStartDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("billingStartDate"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_carrierName, CFSTR("carrier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_planType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("planType"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_planDescription, CFSTR("planDescription"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_planStatus);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("planStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_accountStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("accountStatus"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_accountURL, CFSTR("accountURL"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("timestamp"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_homeCountryList, CFSTR("homeCountryIso"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_dataUsage, CFSTR("dataUsage"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<subscription: iccid:%@, complete:%d, autoRenew:%d, billingEnd:%f billingStart:%f carrierName:%@ planType:%d planDescription:%@ planStatus:%d accountStatus:%d, accountURL:%@, timestamp:%f, homeCountryList: %@ dataUsage %@ >"), self->_iccid, self->_subscriptionResult, self->_autoRenew, *(_QWORD *)&self->_billingEndDate, *(_QWORD *)&self->_billingStartDate, self->_carrierName, self->_planType, self->_planDescription, self->_planStatus, self->_accountStatus, self->_accountURL, *(_QWORD *)&self->_timestamp, self->_homeCountryList, self->_dataUsage);
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<subscription: complete:%d, autoRenew:%d, billingEnd:%f billingStart:%f carrierName:%@ planType:%d planDescription:%@ planStatus:%d accountStatus:%d, accountURL:%@, timestamp:%f, homeCountryList: %@ dataUsage %@ >"), self->_subscriptionResult, self->_autoRenew, *(_QWORD *)&self->_billingEndDate, *(_QWORD *)&self->_billingStartDate, self->_carrierName, self->_planType, self->_planDescription, self->_planStatus, self->_accountStatus, self->_accountURL, *(_QWORD *)&self->_timestamp, self->_homeCountryList, self->_dataUsage);
}

- (NSString)iccid
{
  return self->_iccid;
}

- (BOOL)autoRenew
{
  return self->_autoRenew;
}

- (double)billingStartDate
{
  return self->_billingStartDate;
}

- (double)billingEndDate
{
  return self->_billingEndDate;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_storeStrong((id *)&self->_carrierName, a3);
}

- (int)planType
{
  return self->_planType;
}

- (NSString)planDescription
{
  return self->_planDescription;
}

- (int)planStatus
{
  return self->_planStatus;
}

- (void)setPlanStatus:(int)a3
{
  self->_planStatus = a3;
}

- (int)accountStatus
{
  return self->_accountStatus;
}

- (NSString)accountURL
{
  return self->_accountURL;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSArray)homeCountryList
{
  return self->_homeCountryList;
}

- (NSArray)dataUsage
{
  return self->_dataUsage;
}

- (int)subscriptionResult
{
  return self->_subscriptionResult;
}

- (void)setSubscriptionResult:(int)a3
{
  self->_subscriptionResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUsage, 0);
  objc_storeStrong((id *)&self->_homeCountryList, 0);
  objc_storeStrong((id *)&self->_accountURL, 0);
  objc_storeStrong((id *)&self->_planDescription, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
}

@end
