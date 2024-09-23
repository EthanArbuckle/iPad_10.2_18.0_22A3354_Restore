@implementation MPCReportingIdentityProperties

- (NSString)householdID
{
  return self->_householdID;
}

- (void)setHouseholdID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->_storeAccountID = a3;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void)setStoreFrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)hasSubscriptionPlaybackCapability
{
  return self->_hasSubscriptionPlaybackCapability;
}

- (void)setHasSubscriptionPlaybackCapability:(BOOL)a3
{
  self->_hasSubscriptionPlaybackCapability = a3;
}

- (ICPlayActivityEnqueuerProperties)enqueuerProperties
{
  return self->_enqueuerProperties;
}

- (void)setEnqueuerProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
}

@end
