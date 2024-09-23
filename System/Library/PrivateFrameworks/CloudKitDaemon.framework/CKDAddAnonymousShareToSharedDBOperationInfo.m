@implementation CKDAddAnonymousShareToSharedDBOperationInfo

- (NSDictionary)encryptedAnonymousSharesToAdd
{
  return self->_encryptedAnonymousSharesToAdd;
}

- (void)setEncryptedAnonymousSharesToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToAdd, a3);
}

- (id)anonymousShareSavedBlock
{
  return self->_anonymousShareSavedBlock;
}

- (void)setAnonymousShareSavedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anonymousShareSavedBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToAdd, 0);
}

@end
