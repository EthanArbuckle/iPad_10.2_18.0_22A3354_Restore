@implementation HomeUserSlotResults

- (MTRDoorLockClusterGetUserResponseParams)user
{
  return (MTRDoorLockClusterGetUserResponseParams *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)availableSlots
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvailableSlots:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableSlots, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
