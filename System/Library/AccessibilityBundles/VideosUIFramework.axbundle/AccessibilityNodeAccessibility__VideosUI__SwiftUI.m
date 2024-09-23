@implementation AccessibilityNodeAccessibility__VideosUI__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUI.AccessibilityNode");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityAttributedLabel
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AccessibilityNodeAccessibility__VideosUI__SwiftUI;
  -[AccessibilityNodeAccessibility__VideosUI__SwiftUI accessibilityAttributedLabel](&v18, sel_accessibilityAttributedLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AccessibilityNodeAccessibility__VideosUI__SwiftUI safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("viewRendererHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "axContainsString:", CFSTR("AVInfoTabView"));

  if (v7)
  {
    -[AccessibilityNodeAccessibility__VideosUI__SwiftUI safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("children"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ax_mappedArrayUsingBlock:", &__block_literal_global_4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXLabelForElements();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v10);

      v3 = (void *)v11;
    }

  }
  if (v3
    && (objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "firstObject"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("en")),
        v13,
        v12,
        v14))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithCFAttributedString:", v3);
    objc_msgSend(v15, "setAttribute:forKey:", &unk_2503DE1E8, *MEMORY[0x24BDFE990]);
    objc_msgSend(v15, "attributedString");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v3;
  }

  return v16;
}

@end
