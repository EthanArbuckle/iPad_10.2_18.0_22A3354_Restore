@implementation CPMSClientDescription

- (int64_t)clientId
{
  return self->_clientId;
}

- (id)notificationCallback
{
  return self->_notificationCallback;
}

- (id)description
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CPMSClientDescription clientId](self, "clientId");
  v5 = -[CPMSClientDescription isContinuous](self, "isContinuous");
  v6 = -[CPMSClientDescription powerBudgetUpdateMinimumPeriod](self, "powerBudgetUpdateMinimumPeriod");
  -[CPMSClientDescription powerLevels](self, "powerLevels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ClientDescription: self=%p, id=%lu, isContinuous=%d, budgetUpdatePeriodms=%d powerlevels=%@\n>"), self, v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = -[CPMSClientDescription clientId](self, "clientId");
    v6 = v5 == objc_msgSend(v4, "clientId");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setClientId:(int64_t)a3
{
  self->_clientId = a3;
}

- (NSDictionary)powerLevels
{
  return self->_powerLevels;
}

- (void)setPowerLevels:(id)a3
{
  objc_storeStrong((id *)&self->_powerLevels, a3);
}

- (BOOL)isContinuous
{
  return self->_isContinuous;
}

- (void)setIsContinuous:(BOOL)a3
{
  self->_isContinuous = a3;
}

- (void)setNotificationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)getCurrentPower
{
  return self->_getCurrentPower;
}

- (void)setGetCurrentPower:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)powerBudgetUpdateMinimumPeriod
{
  return self->_powerBudgetUpdateMinimumPeriod;
}

- (void)setPowerBudgetUpdateMinimumPeriod:(unsigned int)a3
{
  self->_powerBudgetUpdateMinimumPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getCurrentPower, 0);
  objc_storeStrong(&self->_notificationCallback, 0);
  objc_storeStrong((id *)&self->_powerLevels, 0);
}

@end
