@implementation HIDEventService(HIDFramework)

- (uint64_t)serviceID
{
  void *v0;
  void *v1;
  uint64_t v2;

  IOHIDServiceGetRegistryID();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "unsignedLongLongValue");
  else
    v2 = 0;

  return v2;
}

- (id)propertyForKey:()HIDFramework
{
  return (id)IOHIDServiceCopyProperty();
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDServiceSetProperty() != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDServiceConformsTo() != 0;
}

- (id)eventMatching:()HIDFramework
{
  return (id)IOHIDServiceCopyMatchingEvent();
}

@end
