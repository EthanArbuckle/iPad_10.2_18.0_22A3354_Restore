@implementation GCDevicePhysicalInputViewDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (uint64_t)makeParameters
{
  objc_msgSend((id)objc_opt_class(), "parametersClass");
  return objc_opt_new();
}

@end
