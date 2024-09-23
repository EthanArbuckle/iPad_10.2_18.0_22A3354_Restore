@implementation BOOL

void ___get_BOOL_entitlement_block_invoke(uint64_t a1)
{
  const __CFString *v1;
  __SecTask *v2;
  __SecTask *v3;
  CFTypeRef v4;
  CFTypeID TypeID;

  v1 = *(const __CFString **)(a1 + 32);
  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v2)
  {
    v3 = v2;
    v4 = SecTaskCopyValueForEntitlement(v2, v1, 0);
    CFRelease(v3);
    if (v4)
    {
      TypeID = CFBooleanGetTypeID();
      if (TypeID == CFGetTypeID(v4))
      {
        if (CFEqual(v4, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
          _get_BOOL_entitlement__isEntitled = 1;
      }
      CFRelease(v4);
    }
  }
}

@end
