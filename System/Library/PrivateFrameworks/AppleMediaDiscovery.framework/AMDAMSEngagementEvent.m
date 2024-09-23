@implementation AMDAMSEngagementEvent

- (NSDictionary)engagementData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEngagementData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementData, 0);
}

@end
