@implementation UIAction(ITKUtilities)

+ (uint64_t)itk_itemWithTitle:()ITKUtilities
{
  return objc_msgSend(a1, "itk_itemWithTitle:subtitle:", a3, 0);
}

+ (id)itk_itemWithTitle:()ITKUtilities subtitle:
{
  __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;

  v5 = &stru_250FA1710;
  if (a3)
    v5 = a3;
  v6 = v5;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithTitle:image:identifier:handler:", v6, 0, 0, &__block_literal_global_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDiscoverabilityTitle:", v7);
  return v8;
}

@end
