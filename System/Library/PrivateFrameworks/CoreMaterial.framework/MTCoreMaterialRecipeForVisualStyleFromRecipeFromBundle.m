@implementation MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle

void __MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "styleNameForCategory:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

}

@end
