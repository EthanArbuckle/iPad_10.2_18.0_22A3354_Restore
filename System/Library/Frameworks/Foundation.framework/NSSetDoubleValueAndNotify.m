@implementation NSSetDoubleValueAndNotify

uint64_t ___NSSetDoubleValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return ((uint64_t (*)(_QWORD, _QWORD, double))MethodImplementation)(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

@end
