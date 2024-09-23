@implementation CKDeviceCapabilityCheckResult

- (CKDeviceCapabilityCheckResult)init
{
  return (CKDeviceCapabilityCheckResult *)sub_18A60F234();
}

- (CKDeviceCapabilityCheckResult)initWithIsSupported:(BOOL)a3
{
  CKDeviceCapabilityCheckResult *result;

  CKDeviceCapabilityCheckResult.init(isSupported:)(a3);
  return result;
}

- (BOOL)isSupported
{
  return CKDeviceCapabilityCheckResult.isSupported.getter() & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKDeviceCapabilityCheckResult *v5;

  v4 = a3;
  v5 = self;
  CKDeviceCapabilityCheckResult.encode(with:)((NSCoder)v4);

}

- (CKDeviceCapabilityCheckResult)initWithCoder:(id)a3
{
  return (CKDeviceCapabilityCheckResult *)CKDeviceCapabilityCheckResult.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18A60F094(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKDeviceCapabilityCheckResult.isEqual(_:));
}

- (NSString)description
{
  sub_18A60F650(self, (uint64_t)a2, (void (*)(void))CKDeviceCapabilityCheckResult.description.getter);
}

@end
