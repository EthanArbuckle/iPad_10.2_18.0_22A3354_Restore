@implementation SGPersistentSaltProviderGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
}

@end
