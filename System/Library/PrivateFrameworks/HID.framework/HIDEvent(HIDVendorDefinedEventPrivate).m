@implementation HIDEvent(HIDVendorDefinedEventPrivate)

- (uint64_t)vendorDefinedData
{
  return IOHIDEventGetDataValue();
}

- (uint64_t)vendorDefinedDataLength
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)vendorDefinedUsage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setVendorDefinedUsage:()HIDVendorDefinedEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)vendorDefinedUsagePage
{
  return (unsigned __int16)IOHIDEventGetIntegerValue();
}

- (uint64_t)setVendorDefinedUsagePage:()HIDVendorDefinedEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)vendorDefinedVersion
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setVendorDefinedVersion:()HIDVendorDefinedEventPrivate
{
  return IOHIDEventSetIntegerValue();
}

@end
