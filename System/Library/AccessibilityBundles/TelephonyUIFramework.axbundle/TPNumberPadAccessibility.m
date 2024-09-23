@implementation TPNumberPadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TPNumberPad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("TPSimpleNumberPad"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TPSimpleNumberPad"), CFSTR("_deleteButton"), "UIButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TPSimpleNumberPad"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("canBecomeFocused"), "B", 0);

}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 1;
}

- (BOOL)_accessibilityProvidesScannerGroupElements
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPNumberPadAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 12)
  {
    v5 = -3;
    do
    {
      v5 += 3;
      v14[0] = CFSTR("GroupElements");
      objc_msgSend(v4, "subarrayWithRange:", v5, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = CFSTR("GroupTraits");
      v15[0] = v6;
      v15[1] = &unk_2503B2FE8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v7);
    }
    while (v5 < 9);
  }
  else
  {
    objc_msgSend(v4, "count");
    _AXAssert();
  }
  NSClassFromString(CFSTR("TPSimpleNumberPad"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TPNumberPadAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deleteButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isAccessibilityElement")
      && objc_msgSend(v8, "_accessibilityViewIsVisible"))
    {
      objc_msgSend(v3, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "objectForKey:", CFSTR("GroupElements"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("GroupElements"));

      objc_msgSend(v3, "replaceObjectAtIndex:withObject:", objc_msgSend(v3, "count") - 1, v10);
    }

  }
  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if ((-[TPNumberPadAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)TPNumberPadAccessibility;
  return -[TPNumberPadAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

@end
