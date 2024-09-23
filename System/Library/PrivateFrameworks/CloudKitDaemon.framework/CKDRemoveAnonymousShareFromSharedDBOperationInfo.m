@implementation CKDRemoveAnonymousShareFromSharedDBOperationInfo

- (NSDictionary)encryptedAnonymousSharesToRemove
{
  return self->_encryptedAnonymousSharesToRemove;
}

- (void)setEncryptedAnonymousSharesToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, a3);
}

- (id)anonymousShareRemovedBlock
{
  return self->_anonymousShareRemovedBlock;
}

- (void)setAnonymousShareRemovedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anonymousShareRemovedBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, 0);
}

@end
