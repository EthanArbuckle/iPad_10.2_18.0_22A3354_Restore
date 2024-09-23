@implementation LACSecureStorageConfiguration

- (LACSecureStorageConfiguration)initWithBypassEntitlementChecks:(BOOL)a3
{
  LACSecureStorageConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACSecureStorageConfiguration;
  result = -[LACSecureStorageConfiguration init](&v5, sel_init);
  if (result)
    result->_bypassEntitlementChecks = a3;
  return result;
}

- (BOOL)bypassEntitlementChecks
{
  return self->_bypassEntitlementChecks;
}

@end
