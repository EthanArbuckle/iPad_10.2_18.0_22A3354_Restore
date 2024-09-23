@implementation FMCardContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FindMy.FMCardContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("FindMy.FMScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMCardContainerViewController"), CFSTR("expandCard"), "B", 0);

}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v21;
  double MaxY;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  -[FMCardContainerViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isScrollEnabled") & 1) == 0)
  {
    objc_msgSend(v4, "accessibilityFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v6, "accessibilityFrame");
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    v27.origin.x = v10;
    v27.origin.y = v12;
    v27.size.width = v14;
    v27.size.height = v16;
    v21 = CGRectContainsRect(v24, v27);
    v25.origin.x = v10;
    v25.origin.y = v12;
    v25.size.width = v14;
    v25.size.height = v16;
    MaxY = CGRectGetMaxY(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v23 = CGRectGetMaxY(v26);
    v7 = 1;
    if (!v21 && MaxY > v23)
      v7 = -[FMCardContainerViewAccessibility accessibilityScrollDownPage](self, "accessibilityScrollDownPage");
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __74__FMCardContainerViewAccessibility_accessibilityScrollToVisibleWithChild___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    MEMORY[0x23490EA68](CFSTR("FindMy.FMScrollView"));
    v3 = (v2 != 0) & objc_opt_isKindOfClass();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollDownPage
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("expandCard"));

  return v5;
}

@end
