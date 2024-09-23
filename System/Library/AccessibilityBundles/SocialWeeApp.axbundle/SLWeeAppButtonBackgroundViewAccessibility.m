@implementation SLWeeAppButtonBackgroundViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLWeeAppButtonBackgroundView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsFacebookButton
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SLWeeAppButtonBackgroundViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "accessibilityIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("facebookglyph"));

        if ((v8 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (SLWeeAppButtonBackgroundViewAccessibility)initWithFrame:(CGRect)a3
{
  SLWeeAppButtonBackgroundViewAccessibility *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLWeeAppButtonBackgroundViewAccessibility;
  v3 = -[SLWeeAppButtonBackgroundViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SLWeeAppButtonBackgroundViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("_labelView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  __CFString *v2;

  if (-[SLWeeAppButtonBackgroundViewAccessibility _accessibilityIsFacebookButton](self, "_accessibilityIsFacebookButton"))
  {
    v2 = CFSTR("post.to.facebook");
  }
  else
  {
    v2 = CFSTR("post.to.unknown");
  }
  accessibilityLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLWeeAppButtonBackgroundViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SLWeeAppButtonBackgroundViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
