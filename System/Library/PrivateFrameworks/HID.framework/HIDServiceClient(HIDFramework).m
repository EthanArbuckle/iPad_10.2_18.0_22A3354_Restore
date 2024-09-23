@implementation HIDServiceClient(HIDFramework)

- (void)setRemovalHandler:()HIDFramework
{
  uint64_t v4;
  id aBlock;

  aBlock = a3;
  v4 = a1 + (int)*MEMORY[0x1E0CBBA40];
  os_unfair_recursive_lock_lock_with_options();
  if (*(_QWORD *)(v4 + 112))
    -[HIDServiceClient(HIDFramework) setRemovalHandler:].cold.1();
  *(_QWORD *)(v4 + 112) = _Block_copy(aBlock);
  os_unfair_recursive_lock_unlock();
  IOHIDServiceClientRegisterRemovalCallback();

}

- (CFTypeRef)propertyForKey:()HIDFramework
{
  return (id)IOHIDServiceClientCopyProperty(a1, key);
}

- (id)propertiesForKeys:()HIDFramework
{
  return (id)IOHIDServiceClientCopyProperties();
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDServiceClientSetProperty(a1, key, a3) != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDServiceClientConformsTo(a1, usagePage, usage) != 0;
}

- (id)eventMatching:()HIDFramework
{
  return (id)IOHIDServiceClientCopyMatchingEvent();
}

- (uint64_t)serviceID
{
  void *v1;
  void *v2;
  uint64_t v3;

  IOHIDServiceClientGetRegistryID(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedLongLongValue");
  else
    v3 = 0;

  return v3;
}

- (void)setRemovalHandler:()HIDFramework .cold.1()
{
  _os_crash();
  __break(1u);
}

@end
