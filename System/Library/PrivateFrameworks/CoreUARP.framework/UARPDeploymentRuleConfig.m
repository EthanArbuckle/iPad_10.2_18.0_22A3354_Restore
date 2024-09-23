@implementation UARPDeploymentRuleConfig

- (NSDate)goLiveDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGoLiveDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSArray)countryList
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCountryList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)rampPeriod
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRampPeriod:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)deploymentLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeploymentLimit:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentLimit, 0);
  objc_storeStrong((id *)&self->_rampPeriod, 0);
  objc_storeStrong((id *)&self->_countryList, 0);
  objc_storeStrong((id *)&self->_goLiveDate, 0);
}

@end
