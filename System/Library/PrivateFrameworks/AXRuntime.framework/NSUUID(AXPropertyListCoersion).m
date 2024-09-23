@implementation NSUUID(AXPropertyListCoersion)

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion
{
  __CFString *v1;
  const __CFUUID *v2;
  void *v3;

  objc_msgSend(a1, "UUIDString");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = CFUUIDCreateFromString(0, v1);
  smugglingDictionaryForCFUUID(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    CFRelease(v2);

  return v3;
}

@end
