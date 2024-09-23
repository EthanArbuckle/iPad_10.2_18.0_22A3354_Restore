@implementation DOCTraitCollectionWithDefinedIdiom

void ___DOCTraitCollectionWithDefinedIdiom_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BEBD538];
  v3 = a2;
  objc_msgSend(v2, "currentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));

}

@end
