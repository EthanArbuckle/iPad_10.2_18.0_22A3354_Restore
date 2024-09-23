@implementation NSSingleLineTypesetterAccessibility__UIKit__UIFoundation

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSSingleLineTypesetter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("NSSingleLineTypesetter");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{_NSRange=QQ}", "q", "B", "B", "B", "B", "d", 0);
  v4 = CFSTR("NSTypesetter");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("attributedString"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 syncDirection:(BOOL)a7 mirrorsTextAlignment:(BOOL)a8 maximumWidth:(double)a9
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  objc_super v16;
  id v17[2];
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  int64_t v22;
  SEL v23;
  NSSingleLineTypesetterAccessibility__UIKit__UIFoundation *v24;
  _NSRange v25;

  v25 = a3;
  v24 = self;
  v23 = a2;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v19 = a7;
  v18 = a8;
  v17[1] = *(id *)&a9;
  v16.receiver = self;
  v16.super_class = (Class)NSSingleLineTypesetterAccessibility__UIKit__UIFoundation;
  v17[0] = -[NSSingleLineTypesetterAccessibility__UIKit__UIFoundation createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:](&v16, sel_createRenderingContextForCharacterRange_typesetterBehavior_usesScreenFonts_hasStrongRight_syncDirection_mirrorsTextAlignment_maximumWidth_, a3.location, a3.length, a4, a5, a6, a7, a9, a8);
  v14 = 0;
  objc_opt_class();
  v11 = (id)-[NSSingleLineTypesetterAccessibility__UIKit__UIFoundation safeValueForKey:](v24, "safeValueForKey:", CFSTR("attributedString"));
  v13 = (id)__UIAccessibilityCastAsClass();

  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15 = (id)objc_msgSend(v12, "string");

  if (objc_msgSend(v15, "length"))
    objc_msgSend(v17[0], "_accessibilitySetRetainedValue:forKey:", v15, CFSTR("AXStringToBeRenderedByContext"));
  v10 = v17[0];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v17, 0);
  return v10;
}

@end
