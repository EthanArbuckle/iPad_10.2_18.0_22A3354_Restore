@implementation VideosUI_CollectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.CollectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CollectionHeaderView"), CFSTR("accessibilityTitleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CollectionHeaderView"), CFSTR("accessibilitySubtitleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CollectionHeaderView"), CFSTR("accessibilityButtonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CollectionHeaderView"), CFSTR("accessibilityImageView"), "@", 0);

}

- (id)_axHeaderTextContentElementStorage
{
  JUMPOUT(0x234924588);
}

- (void)_axSetHeaderTextContentElementStorage:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axHeaderTextContentElement
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[VideosUI_CollectionHeaderViewAccessibility _axHeaderTextContentElementStorage](self, "_axHeaderTextContentElementStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
    objc_initWeak(&location, self);
    v4 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke;
    v12[3] = &unk_2503D2CB0;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v3, "_setAccessibilityFrameBlock:", v12);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_2;
    v10[3] = &unk_2503D2CD8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "_setAccessibilityLabelBlock:", v10);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_3;
    v8[3] = &unk_2503D2D20;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "_setAccessibilityActivateBlock:", v8);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __73__VideosUI_CollectionHeaderViewAccessibility__axHeaderTextContentElement__block_invoke_5;
    v6[3] = &unk_2503D2D48;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "_setAccessibilityTraitsBlock:", v6);
    -[VideosUI_CollectionHeaderViewAccessibility _axSetHeaderTextContentElementStorage:](self, "_axSetHeaderTextContentElementStorage:", v3);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (AXDoesRequestingClientDeserveAutomation())
  {
    -[VideosUI_CollectionHeaderViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("subviews"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBCE30];
    -[VideosUI_CollectionHeaderViewAccessibility _axHeaderTextContentElement](self, "_axHeaderTextContentElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosUI_CollectionHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityButtonView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
