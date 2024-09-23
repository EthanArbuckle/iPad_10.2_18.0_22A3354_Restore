@implementation NSSetFloatValueAndNotify

uint64_t ___NSSetFloatValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return ((uint64_t (*)(_QWORD, _QWORD, float))MethodImplementation)(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(float *)(a1 + 56));
}

@end
