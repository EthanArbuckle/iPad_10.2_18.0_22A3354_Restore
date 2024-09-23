@implementation FTSelectedPNRSubscriptionCache

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_phoneNumber(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_dualSIMCapability(self, v8, v9);
  objc_msgSend_selectedContext(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscriptionInfo(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeSubscriptionInfo(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v20, (uint64_t)CFSTR("<%@: %p phoneNumber: %@, dualSIMCapability: %ld, selectedContext: %@, subsriptionInfo: %@, activeSubscriptionInfo: %@>"), v4, self, v7, v10, v13, v16, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfo, a3);
}

- (CTXPCContexts)activeSubscriptionInfo
{
  return self->_activeSubscriptionInfo;
}

- (void)setActiveSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_activeSubscriptionInfo, a3);
}

- (CTXPCServiceSubscriptionContext)selectedContext
{
  return self->_selectedContext;
}

- (void)setSelectedContext:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContext, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (int64_t)dualSIMCapability
{
  return self->_dualSIMCapability;
}

- (void)setDualSIMCapability:(int64_t)a3
{
  self->_dualSIMCapability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_selectedContext, 0);
  objc_storeStrong((id *)&self->_activeSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end
