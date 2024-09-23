@implementation GCDevicePhysicalInputDescription(Client)

+ (uint64_t)facadeParametersClass
{
  return objc_opt_class();
}

- (uint64_t)makeFacadeParameters
{
  objc_msgSend((id)objc_opt_class(), "facadeParametersClass");
  return objc_opt_new();
}

@end
