@implementation HIDSession(HIDFramework)

- (uint64_t)propertyForKey:()HIDFramework
{
  return IOHIDSessionGetProperty();
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDSessionSetProperty() != 0;
}

@end
