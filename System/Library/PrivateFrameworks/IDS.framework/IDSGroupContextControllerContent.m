@implementation IDSGroupContextControllerContent

- (IDSCloudKitContainer)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (void)setCloudKitContainer:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitContainer, a3);
}

- (ENGroupContext)groupContext
{
  return self->_groupContext;
}

- (void)setGroupContext:(id)a3
{
  objc_storeStrong((id *)&self->_groupContext, a3);
}

- (ENAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (void)setAccountIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentity, 0);
  objc_storeStrong((id *)&self->_groupContext, 0);
  objc_storeStrong((id *)&self->_cloudKitContainer, 0);
}

@end
