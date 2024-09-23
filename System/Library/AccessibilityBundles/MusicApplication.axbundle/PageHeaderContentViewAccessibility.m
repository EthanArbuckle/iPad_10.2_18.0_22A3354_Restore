@implementation PageHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.PageHeaderContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PageHeaderContentView"), CFSTR("accessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PageHeaderContentView"), CFSTR("supertitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PageHeaderContentView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.PageHeaderContentView"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.JSListenNowTabViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.PageHeaderPlayButton"));

}

- (id)accessibilityLabel
{
  return (id)-[PageHeaderContentViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("supertitle, title, subtitle"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PageHeaderContentViewAccessibility;
  return *MEMORY[0x24BDF73C0] | -[PageHeaderContentViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PageHeaderContentViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessoryView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  MEMORY[0x234917594](CFSTR("MusicApplication.PageHeaderPlayButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_13);
    if (!v4)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", &__block_literal_global_200);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_3;
  v7[3] = &__block_descriptor_40_e36__CGRect__CGPoint_dd__CGSize_dd__8__0lu32l8;
  v7[4] = v4;
  objc_msgSend(v4, "_setAccessibilityFrameBlock:", v7);
  objc_msgSend(v4, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_206_0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityAttributesForAccountButtonInAccessoryView:", v4);

  if (v4)
LABEL_7:
    objc_msgSend(v3, "addObject:", v4);
LABEL_8:

  return v3;
}

id __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return accessibilityMusicLocalizedString(CFSTR("play.button"));
}

id __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2()
{
  return accessibilityMusicLocalizedString(CFSTR("account"));
}

double __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_3(uint64_t a1)
{
  CGFloat y;
  double x;
  CGFloat height;
  CGFloat width;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "accessibilityFrame");
        v23.origin.x = v10;
        v23.origin.y = v11;
        v23.size.width = v12;
        v23.size.height = v13;
        v21.origin.x = x;
        v21.origin.y = y;
        v21.size.width = width;
        v21.size.height = height;
        v22 = CGRectUnion(v21, v23);
        x = v22.origin.x;
        y = v22.origin.y;
        width = v22.size.width;
        height = v22.size.height;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return x;
}

uint64_t __76__PageHeaderContentViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.JSListenNowTabViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
