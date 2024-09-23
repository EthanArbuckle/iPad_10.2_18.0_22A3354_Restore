@implementation UIAssistantBarButtonItemProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAssistantBarButtonItemProvider");
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
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIAssistantBarButtonItemProvider"), CFSTR("actionForInputMode:"), "@", 0);
  objc_storeStrong(v4, obj);
}

+ (id)actionForInputMode:(id)a3
{
  uint64_t v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v13;
  id v14;
  id location[2];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13.receiver = v16;
  v13.super_class = (Class)&OBJC_METACLASS___UIAssistantBarButtonItemProviderAccessibility;
  v14 = objc_msgSendSuper2(&v13, sel_actionForInputMode_, location[0]);
  v12 = (id)objc_msgSend(v14, "title");
  if (objc_msgSend(v12, "length"))
  {
    v6 = (id)MEMORY[0x2348C374C](location[0]);
    v11 = (id)MEMORY[0x2348C3680]();

    v10 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v12);
    v9 = v10;
    v7 = v11;
    v8 = *MEMORY[0x24BDFEB98];
    v3 = objc_msgSend(v12, "length");
    v18 = 0;
    v17 = v3;
    v19 = 0;
    v20 = v3;
    objc_msgSend(v9, "setAttribute:forKey:withRange:", v7, v8, 0, v3);
    objc_msgSend(v14, "setAccessibilityLabel:", v10);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  v5 = v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
