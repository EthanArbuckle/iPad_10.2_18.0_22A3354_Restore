@implementation SBHIconGridSizeClassSetForCCUIGridSizeClassMask

uint64_t __SBHIconGridSizeClassSetForCCUIGridSizeClassMask_block_invoke(uint64_t result, uint64_t a2)
{
  void *v2;
  const __CFString *v3;

  if ((*(_QWORD *)(result + 40) & (1 << a2)) != 0)
  {
    v2 = *(void **)(result + 32);
    if ((unint64_t)(a2 - 1) > 9)
      v3 = CFSTR("CCUIIconGridSizeClassSmall");
    else
      v3 = off_250A35870[a2 - 1];
    return objc_msgSend(v2, "addGridSizeClass:", v3);
  }
  return result;
}

@end
