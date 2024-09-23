@implementation CTCellularPlan

- (CTCellularPlan)init
{
  return -[CTCellularPlan initWithProfile:subscription:](self, "initWithProfile:subscription:", 0, 0);
}

- (CTCellularPlan)initWithProfile:(id)a3 subscription:(id)a4
{
  id v7;
  id v8;
  CTCellularPlan *v9;
  CTCellularPlan *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTCellularPlan;
  v9 = -[CTCellularPlan init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subscription, a4);
    objc_storeStrong((id *)&v10->_profile, a3);
    v10->_isHomePlan = 0;
  }

  return v10;
}

- (int64_t)planDescriptionCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[CTCellularPlan planDescription](self, "planDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSData)profileId
{
  return -[CTCellularPlanProfile profileId](self->_profile, "profileId");
}

- (BOOL)isSelected
{
  return 0;
}

- (BOOL)isSelectable
{
  return 1;
}

- (int)status
{
  void *v2;
  int v3;

  -[CTCellularPlan subscriptionStatusOverride](self, "subscriptionStatusOverride");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (id)statusAsString:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "intValue");
  if (v3 > 0xE)
    return CFSTR("Unknown");
  else
    return off_1E9521810[v3];
}

- (NSString)iccid
{
  void *profile;

  profile = self->_profile;
  if (!profile)
    profile = self->_subscription;
  objc_msgSend(profile, "iccid");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)autoRenew
{
  return -[CTCellularPlanSubscription autoRenew](self->_subscription, "autoRenew");
}

- (double)timestamp
{
  double result;

  -[CTCellularPlanSubscription timestamp](self->_subscription, "timestamp");
  return result;
}

- (double)billingStartDate
{
  double result;

  -[CTCellularPlanSubscription billingStartDate](self->_subscription, "billingStartDate");
  return result;
}

- (double)billingEndDate
{
  double result;

  -[CTCellularPlanSubscription billingEndDate](self->_subscription, "billingEndDate");
  return result;
}

- (NSString)carrierName
{
  return -[CTCellularPlanSubscription carrierName](self->_subscription, "carrierName");
}

- (int)planType
{
  return -[CTCellularPlanSubscription planType](self->_subscription, "planType");
}

- (NSString)planDescription
{
  void *v2;
  void *v3;
  id v4;

  -[CTCellularPlanSubscription planDescription](self->_subscription, "planDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (int)planStatus
{
  return -[CTCellularPlanSubscription planStatus](self->_subscription, "planStatus");
}

- (int)accountStatus
{
  return -[CTCellularPlanSubscription accountStatus](self->_subscription, "accountStatus");
}

- (NSString)accountURL
{
  return -[CTCellularPlanSubscription accountURL](self->_subscription, "accountURL");
}

- (BOOL)isDisableNotAllowed
{
  return -[CTCellularPlanProfile isDisableNotAllowed](self->_profile, "isDisableNotAllowed");
}

- (BOOL)isDeleteNotAllowed
{
  return -[CTCellularPlanProfile isDeleteNotAllowed](self->_profile, "isDeleteNotAllowed");
}

- (BOOL)requiresUserConsent
{
  return -[CTCellularPlanProfile requiresUserConsent](self->_profile, "requiresUserConsent");
}

- (NSArray)dataUsage
{
  return -[CTCellularPlanSubscription dataUsage](self->_subscription, "dataUsage");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[CTCellularPlanProfile copy](self->_profile, "copy");
  v6 = (void *)-[CTCellularPlanSubscription copy](self->_subscription, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithProfile:subscription:", v5, v6);

  return v7;
}

- (CTCellularPlan)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlan *v5;
  uint64_t v6;
  CTCellularPlanSubscription *subscription;
  uint64_t v8;
  CTCellularPlanProfile *profile;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlan;
  v5 = -[CTCellularPlan init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscription"));
    v6 = objc_claimAutoreleasedReturnValue();
    subscription = v5->_subscription;
    v5->_subscription = (CTCellularPlanSubscription *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profile"));
    v8 = objc_claimAutoreleasedReturnValue();
    profile = v5->_profile;
    v5->_profile = (CTCellularPlanProfile *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionStatusOverride"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlan setSubscriptionStatusOverride:](v5, "setSubscriptionStatusOverride:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlan setPhoneNumber:](v5, "setPhoneNumber:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CTCellularPlanSubscription *subscription;
  id v5;
  id v6;

  subscription = self->_subscription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subscription, CFSTR("subscription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profile, CFSTR("profile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionStatusOverride, CFSTR("subscriptionStatusOverride"));
  -[CTCellularPlan phoneNumber](self, "phoneNumber");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("phoneNumber"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CTCellularPlan statusAsString:](self, "statusAsString:", self->_subscriptionStatusOverride);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<plan: subscription override:%@, %@ %@>"), v4, self->_profile, self->_subscription);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CTCellularPlan statusAsString:](self, "statusAsString:", self->_subscriptionStatusOverride);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanProfile redactedDescription](self->_profile, "redactedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanSubscription redactedDescription](self->_subscription, "redactedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<plan: subscription override:%@, %@ %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (BOOL)isHomePlan
{
  return self->_isHomePlan;
}

- (void)setIsHomePlan:(BOOL)a3
{
  self->_isHomePlan = a3;
}

- (CTCellularPlanProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (CTCellularPlanSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (NSNumber)subscriptionStatusOverride
{
  return self->_subscriptionStatusOverride;
}

- (void)setSubscriptionStatusOverride:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionStatusOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatusOverride, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
