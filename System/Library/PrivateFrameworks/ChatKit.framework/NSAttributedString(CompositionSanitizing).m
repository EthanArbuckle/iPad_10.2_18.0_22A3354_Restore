@implementation NSAttributedString(CompositionSanitizing)

+ (id)ck_defaultAllowedAttributesForComposition
{
  if (ck_defaultAllowedAttributesForComposition_onceToken != -1)
    dispatch_once(&ck_defaultAllowedAttributesForComposition_onceToken, &__block_literal_global_238);
  return (id)ck_defaultAllowedAttributesForComposition_sAttributes;
}

- (id)ck_attributedStringByRemovingUnsupportedCompositionAttributes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3498], "ck_defaultAllowedAttributesForComposition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "__ck_attributedStringByRemovingAllAttributesExcept:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
