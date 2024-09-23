@implementation NSBundle(CoreMaterialInternalAdditions)

- (uint64_t)URLsForMaterialRecipes
{
  return objc_msgSend(a1, "URLsForResourcesWithExtension:subdirectory:", CFSTR("materialrecipe"), 0);
}

- (uint64_t)URLsForMaterialRecipeDescendants
{
  return objc_msgSend(a1, "URLsForResourcesWithExtension:subdirectory:", CFSTR("descendantrecipe"), 0);
}

+ (uint64_t)coreMaterialRecipeBundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreMaterial"));
}

- (uint64_t)URLForMaterialRecipeDescendant:()CoreMaterialInternalAdditions
{
  return objc_msgSend(a1, "URLForResource:withExtension:", a3, CFSTR("descendantrecipe"));
}

- (uint64_t)URLForMaterialRecipe:()CoreMaterialInternalAdditions
{
  return objc_msgSend(a1, "URLForResource:withExtension:", a3, CFSTR("materialrecipe"));
}

- (uint64_t)URLForVisualStyleSetDescendant:()CoreMaterialInternalAdditions
{
  return objc_msgSend(a1, "URLForResource:withExtension:", a3, CFSTR("descendantstyleset"));
}

- (uint64_t)URLForVisualStyleSet:()CoreMaterialInternalAdditions
{
  return objc_msgSend(a1, "URLForResource:withExtension:", a3, CFSTR("visualstyleset"));
}

- (uint64_t)URLsForVisualStyleSets
{
  return objc_msgSend(a1, "URLsForResourcesWithExtension:subdirectory:", CFSTR("visualstyleset"), 0);
}

@end
