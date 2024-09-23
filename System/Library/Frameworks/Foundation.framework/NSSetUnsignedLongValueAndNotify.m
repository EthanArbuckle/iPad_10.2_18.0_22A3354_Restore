@implementation NSSetUnsignedLongValueAndNotify

uint64_t ___NSSetUnsignedLongValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))MethodImplementation)(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

@end
