@implementation UIAutocorrectInlinePromptAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAutocorrectInlinePrompt");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id v4;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  v4 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIAutocorrectInlinePrompt");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "d", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("m_correctionView"), "UIView");
  objc_storeStrong(v5, v4);
}

- (void)setCorrection:(id)a3 typedText:(id)a4 inRect:(CGRect)a5 maxX:(double)a6
{
  id v8;
  char v9;
  objc_super v10;
  double v11;
  id v12;
  id location[2];
  UIAutocorrectInlinePromptAccessibility *v14;
  CGRect v15;

  v15 = a5;
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a6;
  v10.receiver = v14;
  v10.super_class = (Class)UIAutocorrectInlinePromptAccessibility;
  -[UIAutocorrectInlinePromptAccessibility setCorrection:typedText:inRect:maxX:](&v10, sel_setCorrection_typedText_inRect_maxX_, location[0], v12, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, a6);
  v8 = (id)-[UIAutocorrectInlinePromptAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("m_correctionView"));
  v9 = objc_msgSend(v8, "_accessibilityViewIsVisible");

  if ((v9 & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIAutocorrectInlinePromptAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIAutocorrectInlinePromptAccessibility;
  return -[UIAutocorrectInlinePromptAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDFEE50];
}

- (BOOL)isAccessibilityElement
{
  id v3;
  BOOL v4;
  id v5;
  char isKindOfClass;

  v5 = (id)-[UIAutocorrectInlinePromptAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_correction"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  v3 = -[UIAutocorrectInlinePromptAccessibility accessibilityLabel](self, "accessibilityLabel");
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v10 = (id)-[UIAutocorrectInlinePromptAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("correctionView"));
  objc_msgSend(v10, "accessibilityFrame");
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;

  v6 = v11;
  v7 = v12;
  v8 = v13;
  v9 = v14;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)accessibilityLabel
{
  return (id)-[UIAutocorrectInlinePromptAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_correction"), a2, self);
}

@end
