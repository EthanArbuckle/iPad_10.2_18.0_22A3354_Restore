@implementation IDSMessageToDelete

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)alternateGUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAlternateGUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateGUID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
