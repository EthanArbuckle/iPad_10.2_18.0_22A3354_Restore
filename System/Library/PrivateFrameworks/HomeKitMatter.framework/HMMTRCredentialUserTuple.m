@implementation HMMTRCredentialUserTuple

- (MTRDoorLockClusterGetCredentialStatusResponseParams)credential
{
  return (MTRDoorLockClusterGetCredentialStatusResponseParams *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MTRDoorLockClusterGetUserResponseParams)user
{
  return (MTRDoorLockClusterGetUserResponseParams *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)currentFabricIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentFabricIndex:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFabricIndex, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
