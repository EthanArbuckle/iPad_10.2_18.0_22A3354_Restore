@implementation PKColorMatrixViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKColorMatrixView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKColorMatrixView"), CFSTR("colorMatrix"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKColorMatrixView"), CFSTR("colorButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKColorMatrixView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKColorMatrixView"), CFSTR("didTapColorButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKColorMatrixView"), CFSTR("UIView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKColorMatrixViewAccessibility;
  -[PKColorMatrixViewAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[PKColorMatrixViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("colorMatrix"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorMatrixViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("colorButtons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5 == objc_msgSend(v4, "count") && objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "count");
      if (v9 == objc_msgSend(v8, "count") && objc_msgSend(v7, "count"))
      {
        v10 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndex:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndex:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          AXColorStringForColor();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAccessibilityLabel:", v13);

          ++v10;
        }
        while (v10 < objc_msgSend(v7, "count"));
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }

}

- (PKColorMatrixViewAccessibility)initWithFrame:(CGRect)a3
{
  PKColorMatrixViewAccessibility *v3;
  PKColorMatrixViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKColorMatrixViewAccessibility;
  v3 = -[PKColorMatrixViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PKColorMatrixViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)didTapColorButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKColorMatrixViewAccessibility;
  -[PKColorMatrixViewAccessibility didTapColorButton:](&v22, sel_didTapColorButton_, v4);
  v21 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x24BDF7400];
    v11 = ~*MEMORY[0x24BDF7400];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v13 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = objc_msgSend(v13, "accessibilityTraits");
          if (v13 == v4)
          {
            v15 = v10 | v14;
            v16 = v4;
          }
          else
          {
            v15 = v14 & v11;
            v16 = v13;
          }
          objc_msgSend(v16, "setAccessibilityTraits:", v15);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

}

@end
