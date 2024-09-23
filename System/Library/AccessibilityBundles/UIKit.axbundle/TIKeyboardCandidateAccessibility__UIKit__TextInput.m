@implementation TIKeyboardCandidateAccessibility__UIKit__TextInput

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TIKeyboardCandidate");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TIKeyboardCandidate"), CFSTR("candidate"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[2];
  TIKeyboardCandidateAccessibility__UIKit__TextInput *v9;

  v9 = self;
  v8[1] = (id)a2;
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v3 = (id)objc_msgSend(v4, "currentInputMode");
  v8[0] = (id)objc_msgSend(v3, "primaryLanguage");

  v6 = (id)objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
  v5 = (id)-[TIKeyboardCandidateAccessibility__UIKit__TextInput safeValueForKey:](v9, "safeValueForKey:", CFSTR("candidate"));
  v7 = (id)objc_msgSend(v6, "descriptionOfWord:forLanguage:");

  objc_storeStrong(v8, 0);
  return v7;
}

@end
