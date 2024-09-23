@implementation WFCallRegistrationMethodsIfNeeded

void __WFCallRegistrationMethodsIfNeeded_block_invoke(uint64_t a1, objc_method *a2, SEL aSelector)
{
  id v6;

  NSStringFromSelector(aSelector);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0 && method_getNumberOfArguments(a2) <= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 40), aSelector);
  }

}

@end
