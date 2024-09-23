@implementation UIMapsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[UIMapsViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("distanceTimeView")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIMapsViewAccessibility;
    v4 = -[UIMapsViewAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[UIMapsViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("distanceTimeView")))
  {
    -[UIMapsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectAtIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessibilityLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      if (v7 && v9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        AXMapsLocString(CFSTR("DISTANCE_TIME_FORMAT"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v11, v7, v9);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIMapsViewAccessibility;
    -[UIMapsViewAccessibility accessibilityLabel](&v13, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
