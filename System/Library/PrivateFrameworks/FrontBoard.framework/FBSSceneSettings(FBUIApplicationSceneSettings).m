@implementation FBSSceneSettings(FBUIApplicationSceneSettings)

- (id)fb_fallbackSpecification
{
  objc_class *v1;
  objc_class *v2;

  if (objc_msgSend(a1, "_uikitShimming_isUISubclass")
    && UIKitLibraryCore()
    && getUIApplicationSceneSpecificationClass())
  {
    v1 = (objc_class *)UIKitLibraryCore();
    if (v1)
      v1 = getUIApplicationSceneSpecificationClass();
    v2 = v1;
  }
  else
  {
    v2 = (objc_class *)MEMORY[0x1E0D23240];
  }
  -[objc_class specification](v2, "specification");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
