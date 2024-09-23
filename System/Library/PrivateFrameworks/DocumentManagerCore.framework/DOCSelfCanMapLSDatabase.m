@implementation DOCSelfCanMapLSDatabase

void __DOCSelfCanMapLSDatabase_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  __SecTask *v2;
  __SecTask *v3;
  CFTypeID TypeID;
  BOOL v5;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (v0)
  {
    v1 = v0;
    v2 = (__SecTask *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.coreservices.canmaplsdatabase"), 0);
    if (v2)
    {
      v3 = v2;
      TypeID = CFBooleanGetTypeID();
      v5 = TypeID == CFGetTypeID(v3) && CFBooleanGetValue(v3) != 0;
      CFRelease(v1);
    }
    else
    {
      v5 = 0;
      v3 = v1;
    }
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  DOCSelfCanMapLSDatabase_canMapLSDatabase = v5;
}

@end
