@implementation NSProcessInfo(AEAdditions)

- (BOOL)ae_isBeingTested
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("XCTestConfigurationFilePath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (uint64_t)ae_hasEntitlement:()AEAdditions withValue:
{
  __CFString *v5;
  id v6;
  __SecTask *v7;
  __SecTask *v8;
  CFTypeRef v9;
  const void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = SecTaskCreateFromSelf(0);
  if (v7)
  {
    v8 = v7;
    v9 = SecTaskCopyValueForEntitlement(v7, v5, 0);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(v6, "isEqual:", v9);
      CFRelease(v10);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
