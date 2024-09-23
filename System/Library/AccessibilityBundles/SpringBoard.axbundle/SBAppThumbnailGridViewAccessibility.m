@implementation SBAppThumbnailGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppThumbnailGridView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[SBAppThumbnailGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appThumbnails"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SBAppThumbnailGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_emptyLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[SBAppThumbnailGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appThumbnails"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SBAppThumbnailGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appThumbnails"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[SBAppThumbnailGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appThumbnails"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (void)removeViewAtIndex:(int64_t)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a4;
  -[SBAppThumbnailGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appThumbnails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9.receiver = self;
  v9.super_class = (Class)SBAppThumbnailGridViewAccessibility;
  -[SBAppThumbnailGridViewAccessibility removeViewAtIndex:animate:](&v9, sel_removeViewAtIndex_animate_, a3, v4);
  if (objc_msgSend(v7, "count") != v8)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (void)_layoutSubviews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  -[SBAppThumbnailGridViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appThumbnails"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7.receiver = self;
  v7.super_class = (Class)SBAppThumbnailGridViewAccessibility;
  -[SBAppThumbnailGridViewAccessibility _layoutSubviews:](&v7, sel__layoutSubviews_, v3);
  if (objc_msgSend(v5, "count") != v6)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
