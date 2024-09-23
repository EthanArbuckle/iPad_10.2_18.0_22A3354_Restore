@implementation MKPuckAnnotationViewInnerStaleColor

id ___MKPuckAnnotationViewInnerStaleColor_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "userInterfaceStyle") == 2)
  {
    objc_msgSend(v2, "traitCollectionByModifyingTraits:", &__block_literal_global_15_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedColorWithTraitCollection:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t ___MKPuckAnnotationViewInnerStaleColor_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessibilityContrast:", 1);
}

@end
