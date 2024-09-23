@implementation NSObject

void __57__NSObject_NTKIntrospection__ntk_listOfDynamicProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isDynamic"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
