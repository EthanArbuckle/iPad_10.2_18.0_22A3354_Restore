@implementation CAMExpandingControlButtonAccessibility

uint64_t __68___CAMExpandingControlButtonAccessibility__axCameraExpandingControl__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2348BFB60](CFSTR("CAMExpandingControl"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
