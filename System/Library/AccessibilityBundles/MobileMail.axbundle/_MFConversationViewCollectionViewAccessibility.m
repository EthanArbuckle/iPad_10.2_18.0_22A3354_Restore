@implementation _MFConversationViewCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MFConversationViewCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_axHeightOfCellsToLoad
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_axSetHeightOfCellsToLoad:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (CGRect)_accessibilityBoundsOfCellsToLoad
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect r2;
  CGRect v21;
  CGRect v23;

  *(_QWORD *)&r2.origin.y = self;
  *(_QWORD *)&r2.size.width = _MFConversationViewCollectionViewAccessibility;
  -[CGFloat _accessibilityBoundsOfCellsToLoad]((objc_super *)&r2.origin.y, sel__accessibilityBoundsOfCellsToLoad);
  r2.origin.x = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[_MFConversationViewCollectionViewAccessibility contentInset](self, "contentInset");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[_MFConversationViewCollectionViewAccessibility contentSize](self, "contentSize");
  v17 = v16;
  v19 = v18;
  v23.size.height = v9
                  + (double)-[_MFConversationViewCollectionViewAccessibility _axHeightOfCellsToLoad](self, "_axHeightOfCellsToLoad");
  v21.origin.x = -v13;
  v21.origin.y = -v11;
  v21.size.width = v17 - v15;
  v21.size.height = v19 - v13;
  v23.origin.x = r2.origin.x;
  v23.origin.y = v5;
  v23.size.width = v7;
  return CGRectIntersection(v21, v23);
}

- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset
{
  return 1;
}

@end
