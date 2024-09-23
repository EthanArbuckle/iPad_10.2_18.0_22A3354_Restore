@implementation BrowseImageManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BrowseImageManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowseImageManager"), CFSTR("_createImageForCategory:scale:traits:isCarplay:nightMode:"), "@", "d", "@", "B", "B", 0);
}

- (id)_createImageForCategory:(id)a3 scale:(double)a4 traits:(id)a5 isCarplay:(BOOL)a6 nightMode:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a7;
  v8 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BrowseImageManagerAccessibility;
  v11 = a3;
  -[BrowseImageManagerAccessibility _createImageForCategory:scale:traits:isCarplay:nightMode:](&v15, sel__createImageForCategory_scale_traits_isCarplay_nightMode_, v11, a5, v8, v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("name"), v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAccessibilityIdentifier:", v13);
  return v12;
}

@end
