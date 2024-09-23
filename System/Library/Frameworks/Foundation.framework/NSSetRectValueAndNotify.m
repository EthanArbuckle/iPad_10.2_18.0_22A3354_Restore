@implementation NSSetRectValueAndNotify

uint64_t ___NSSetRectValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return ((uint64_t (*)(_QWORD, _QWORD, double, double, double, double))MethodImplementation)(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

@end
