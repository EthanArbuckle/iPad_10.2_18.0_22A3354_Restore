@implementation HIDEvent(HIDFramework)

- (uint64_t)initWithData:()HIDFramework
{
  uint64_t v4;

  v4 = MEMORY[0x1D824C0C4](*MEMORY[0x1E0C9AE00], a3);

  return v4;
}

- (uint64_t)isEqual:()HIDFramework
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (a1 == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(a1, "isEqualToHIDEvent:", v4);
    else
      v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToHIDEvent:()HIDFramework
{
  return a3 && _IOHIDEventEqual() != 0;
}

- (uint64_t)initWithBytes:()HIDFramework length:
{
  uint64_t v5;

  v5 = MEMORY[0x1D824C0B8](*MEMORY[0x1E0C9AE00], a3, a4);

  return v5;
}

- (uint64_t)integerValueForField:()HIDFramework
{
  return IOHIDEventGetIntegerValue();
}

- (void)initWithType:()HIDFramework timestamp:senderID:
{
  void *v2;
  id v3;

  v2 = (void *)IOHIDEventCreate();

  if (v2)
  {
    IOHIDEventSetSenderID();
    v3 = v2;
  }

  return v2;
}

- (uint64_t)copyWithZone:()HIDFramework
{
  return IOHIDEventCreateCopy();
}

- (id)serialize:()HIDFramework error:
{
  void *Data;

  if (a3)
  {
    Data = 0;
    if (!a4)
      return Data;
  }
  else
  {
    Data = (void *)IOHIDEventCreateData();
    if (!a4)
      return Data;
  }
  if (!Data)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithIOReturn:", 3758097084);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return Data;
}

- (uint64_t)setIntegerValue:()HIDFramework forField:
{
  return IOHIDEventSetIntegerValue();
}

- (uint64_t)doubleValueForField:()HIDFramework
{
  return IOHIDEventGetDoubleValue();
}

- (uint64_t)setDoubleValue:()HIDFramework forField:
{
  return IOHIDEventSetDoubleValue();
}

- (uint64_t)dataValueForField:()HIDFramework
{
  return IOHIDEventGetDataValue();
}

- (uint64_t)appendEvent:()HIDFramework
{
  return IOHIDEventAppendEvent();
}

- (uint64_t)removeEvent:()HIDFramework
{
  return IOHIDEventRemoveEvent();
}

- (void)removeAllEvents
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "children", 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        IOHIDEventRemoveEvent();
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)conformsToEventType:()HIDFramework
{
  return IOHIDEventConformsTo() != 0;
}

- (uint64_t)setTimestamp:()HIDFramework
{
  return IOHIDEventSetTimeStamp();
}

- (uint64_t)setOptions:()HIDFramework
{
  return IOHIDEventSetEventFlags();
}

@end
