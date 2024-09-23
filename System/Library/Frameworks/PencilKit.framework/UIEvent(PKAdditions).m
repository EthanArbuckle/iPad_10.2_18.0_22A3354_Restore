@implementation UIEvent(PKAdditions)

- (const)PK_isEventFromPencil
{
  const __CFArray *result;
  const __CFArray *v2;

  result = (const __CFArray *)objc_msgSend(a1, "_hidEvent");
  if (result)
  {
    result = (const __CFArray *)IOHIDEventGetChildren();
    if (result)
    {
      v2 = result;
      if (CFArrayGetCount(result)
        && (CFArrayGetValueAtIndex(v2, 0), IOHIDEventGetType() == 11))
      {
        return (const __CFArray *)(IOHIDEventGetIntegerValue() == 0);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (const)PK_isEventFromCrayon
{
  const __CFArray *result;
  const __CFArray *v3;

  result = (const __CFArray *)objc_msgSend(a1, "_hidEvent");
  if (result)
  {
    result = (const __CFArray *)objc_msgSend(a1, "PK_isEventFromPencil");
    if ((_DWORD)result)
    {
      result = (const __CFArray *)IOHIDEventGetChildren();
      if (result)
      {
        v3 = result;
        if (CFArrayGetCount(result)
          && (CFArrayGetValueAtIndex(v3, 0), IOHIDEventGetType() == 11))
        {
          return (const __CFArray *)(IOHIDEventGetIntegerValue() == 11);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)PK_activeInputPropertiesForTouch:()PKAdditions
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "PK_isEventFromPencil"))
  {
    if ((objc_msgSend(v4, "estimatedProperties") & 1) != 0)
    {
      objc_msgSend(v4, "estimationUpdateIndex");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        v5 = 23;
      else
        v5 = 19;
    }
    else
    {
      v5 = 23;
    }
  }
  else
  {
    v5 = 8;
  }

  return v5;
}

@end
