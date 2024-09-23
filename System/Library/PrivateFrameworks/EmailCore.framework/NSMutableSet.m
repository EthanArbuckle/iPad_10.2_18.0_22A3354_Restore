@implementation NSMutableSet

void __98__NSMutableSet_ECEmailAddressConvertible__ec_emailAddressConvertiblesSetFromArray_includeInvalid___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

@end
