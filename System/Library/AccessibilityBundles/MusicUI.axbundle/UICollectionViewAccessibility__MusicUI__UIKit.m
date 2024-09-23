@implementation UICollectionViewAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  UICollectionViewAccessibility__MusicUI__UIKit **v12;
  void *v13;
  UICollectionViewAccessibility__MusicUI__UIKit *v15;
  UICollectionViewAccessibility__MusicUI__UIKit *v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UICollectionViewAccessibility__MusicUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AXFeaturedStationsCollectionViewIdentifier")) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10)
  {
LABEL_6:
    v15 = self;
    v12 = &v15;
    goto LABEL_7;
  }
  -[UICollectionViewAccessibility__MusicUI__UIKit bounds](self, "bounds");
  v18.size.height = v11 + -30.0;
  v17.x = x;
  v17.y = y;
  if (!CGRectContainsPoint(v18, v17))
  {
    v13 = 0;
    goto LABEL_8;
  }
  v16 = self;
  v12 = &v16;
LABEL_7:
  v12[1] = (UICollectionViewAccessibility__MusicUI__UIKit *)UICollectionViewAccessibility__MusicUI__UIKit;
  objc_msgSendSuper2((objc_super *)v12, sel__accessibilityHitTest_withEvent_, v7, x, y, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

@end
