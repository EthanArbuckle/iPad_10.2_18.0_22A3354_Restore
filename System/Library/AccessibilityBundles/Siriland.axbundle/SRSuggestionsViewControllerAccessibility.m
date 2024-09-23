@implementation SRSuggestionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRSuggestionsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SRSuggestionsViewController"), CFSTR("didShowSuggestionsForSuggestionsView:"), "v", "@", 0);
}

- (void)didShowSuggestionsForSuggestionsView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v21.receiver = self;
  v21.super_class = (Class)SRSuggestionsViewControllerAccessibility;
  v3 = a3;
  -[SRSuggestionsViewControllerAccessibility didShowSuggestionsForSuggestionsView:](&v21, sel_didShowSuggestionsForSuggestionsView_, v3);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", v21.receiver, v21.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "accessibilityFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  LODWORD(v3) = CGRectIntersectsRect(v22, v23);

  if ((_DWORD)v3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
