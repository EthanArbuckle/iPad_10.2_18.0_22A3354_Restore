@implementation EXLoadOperator

void __33___EXLoadOperator_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_METACLASS____EXLoadOperator;
  v2 = objc_msgSendSuper2(&v4, sel_allocWithZone_, v1);
  v3 = (void *)allocWithZone__factory_0;
  allocWithZone__factory_0 = (uint64_t)v2;

}

@end
