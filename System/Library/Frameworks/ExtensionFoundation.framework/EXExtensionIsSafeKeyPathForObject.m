@implementation EXExtensionIsSafeKeyPathForObject

uint64_t __EXExtensionIsSafeKeyPathForObject_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  if (a2)
  {
    v2 = a2;
    objc_getClass("NSNumber");
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

BOOL __EXExtensionIsSafeKeyPathForObject_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

@end
