@implementation FindOrAddHomeUserResults

- (MTRDoorLockClusterGetUserResponseParams)existingUser
{
  return (MTRDoorLockClusterGetUserResponseParams *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExistingUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)newUserSlot
{
  return self->_newUserSlot;
}

- (void)setNewUserSlot:(int64_t)a3
{
  self->_newUserSlot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingUser, 0);
}

@end
