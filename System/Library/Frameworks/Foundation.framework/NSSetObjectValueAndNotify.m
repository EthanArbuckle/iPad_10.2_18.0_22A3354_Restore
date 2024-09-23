@implementation NSSetObjectValueAndNotify

uint64_t ___NSSetObjectValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation;

  MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 48), *(SEL *)(a1 + 56));
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))MethodImplementation)(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

@end
