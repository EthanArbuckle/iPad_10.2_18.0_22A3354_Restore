@implementation UISearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  v4 = CFSTR("UISearchTextField");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{_NSRange=QQ}", "@", "^B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_setClearButtonImage:forState:"), "v", v3, "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_customClearButtons"), "NSMutableDictionary");
  objc_storeStrong(v6, v5);
}

- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5
{
  char v6;
  objc_super v8;
  char v9;
  BOOL *v10;
  id location[2];
  UISearchTextFieldAccessibility *v12;
  _NSRange v13;

  v13 = a3;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v10 = a5;
  v9 = 0;
  v8.receiver = v12;
  v8.super_class = (Class)UISearchTextFieldAccessibility;
  v9 = -[UISearchTextFieldAccessibility _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](&v8, sel__delegateShouldChangeCharactersInTextStorageRange_replacementString_delegateCares_, v13.location, v13.length, location[0], a5);
  if (!v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
  v6 = v9;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id obj;
  uint64_t v9;
  _QWORD __b[8];
  id v11;
  objc_super v12;
  SEL v13;
  UISearchTextFieldAccessibility *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13 = a2;
  v12.receiver = self;
  v12.super_class = (Class)UISearchTextFieldAccessibility;
  -[UISearchTextFieldAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  memset(__b, 0, sizeof(__b));
  v7 = (id)-[UISearchTextFieldAccessibility safeDictionaryForKey:](v14, "safeDictionaryForKey:", CFSTR("_customClearButtons"));
  obj = (id)objc_msgSend(v7, "allValues");

  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v9)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v9;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = *(id *)(__b[1] + 8 * v5);
      v2 = (id)UIKitAccessibilityLocalizedString();
      objc_msgSend(v11, "setAccessibilityLabel:");

      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v6)
          break;
      }
    }
  }

}

- (void)_setClearButtonImage:(id)a3 forState:(unint64_t)a4
{
  id v5;
  objc_super v6;
  unint64_t v7;
  id location[2];
  UISearchTextFieldAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = a4;
  v6.receiver = v9;
  v6.super_class = (Class)UISearchTextFieldAccessibility;
  -[UISearchTextFieldAccessibility _setClearButtonImage:forState:](&v6, sel__setClearButtonImage_forState_, location[0], a4);
  v5 = (id)UIKitAccessibilityLocalizedString();
  objc_msgSend(location[0], "setAccessibilityLabel:");

  objc_storeStrong(location, 0);
}

@end
