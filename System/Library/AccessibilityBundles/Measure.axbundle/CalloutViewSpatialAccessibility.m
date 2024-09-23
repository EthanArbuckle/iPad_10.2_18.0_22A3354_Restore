@implementation CalloutViewSpatialAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.CalloutViewSpatial");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.CalloutViewSpatial"), CFSTR("updateText:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.CalloutViewSpatial"), CFSTR("boxLayer"), "@", 0);

}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const CGPath *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect BoundingBox;
  CGRect result;

  v25.receiver = self;
  v25.super_class = (Class)CalloutViewSpatialAccessibility;
  -[CalloutViewSpatialAccessibility accessibilityFrame](&v25, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  -[CalloutViewSpatialAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("boxLayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_msgSend(v12, "path");
    if (v13)
    {
      v14 = (const CGPath *)v13;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      BoundingBox = CGPathGetBoundingBox(v14);
      objc_msgSend(v16, "convertRect:fromLayer:", v12, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);

      UIAccessibilityFrameForBounds();
      v4 = v17;
      v6 = v18;
      v8 = v19;
      v10 = v20;
    }
  }

  v21 = v4;
  v22 = v6;
  v23 = v8;
  v24 = v10;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)updateText:(int64_t)a3
{
  void *v5;
  objc_super v6;

  -[CalloutViewAccessibility axCalloutText](self, "axCalloutText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)CalloutViewSpatialAccessibility;
  -[CalloutViewSpatialAccessibility updateText:](&v6, sel_updateText_, a3);
  -[CalloutViewAccessibility axDidUpdateFromPreviousCalloutText:](self, "axDidUpdateFromPreviousCalloutText:", v5);

}

@end
