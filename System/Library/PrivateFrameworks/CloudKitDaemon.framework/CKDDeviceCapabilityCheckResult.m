@implementation CKDDeviceCapabilityCheckResult

- (CKDDeviceCapabilityCheckResult)initWithIsSupported:(BOOL)a3
{
  CKDDeviceCapabilityCheckResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDDeviceCapabilityCheckResult;
  result = -[CKDDeviceCapabilityCheckResult init](&v5, sel_init);
  if (result)
    result->_isSupported = a3;
  return result;
}

- (id)makeClientResult
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t isSupported;
  const char *v7;

  v3 = objc_alloc(MEMORY[0x1E0C94CD8]);
  isSupported = objc_msgSend_isSupported(self, v4, v5);
  return (id)objc_msgSend_initWithIsSupported_(v3, v7, isSupported);
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

@end
