@implementation VUICollectionViewFeaturedCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUICollectionViewFeaturedCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("VUICollectionViewFeaturedCell"), CFSTR("featuredView"), "@");
}

- (CGRect)accessibilityFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[VUICollectionViewFeaturedCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("featuredView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("overlayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end
