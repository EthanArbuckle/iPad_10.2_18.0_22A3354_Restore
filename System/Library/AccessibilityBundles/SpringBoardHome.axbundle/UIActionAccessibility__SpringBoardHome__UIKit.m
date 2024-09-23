@implementation UIActionAccessibility__SpringBoardHome__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  objc_super v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v5 = (_QWORD *)getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr;
  v28 = getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr;
  if (!getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr)
  {
    v6 = (void *)SpringBoardHomeLibrary();
    v5 = dlsym(v6, "kSBHIconChangeWidgetSizeToSmallApplicationShortcutItemType");
    v26[3] = (uint64_t)v5;
    getkSBHIconChangeWidgetSizeToSmallApplicationShortcutItemTypeSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v25, 8);
  if (!v5)
    -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel].cold.1();
  v7 = objc_msgSend(v4, "isEqualToString:", *v5);

  if (v7)
  {
    v8 = CFSTR("small.widget.size");
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v10 = (_QWORD *)getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr;
    v28 = getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr;
    if (!getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr)
    {
      v11 = (void *)SpringBoardHomeLibrary();
      v10 = dlsym(v11, "kSBHIconChangeWidgetSizeToMediumApplicationShortcutItemType");
      v26[3] = (uint64_t)v10;
      getkSBHIconChangeWidgetSizeToMediumApplicationShortcutItemTypeSymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(&v25, 8);
    if (!v10)
      -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel].cold.2();
    v12 = objc_msgSend(v9, "isEqualToString:", *v10);

    if (v12)
    {
      v8 = CFSTR("medium.widget.size");
    }
    else
    {
      objc_msgSend(v3, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v14 = (_QWORD *)getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr;
      v28 = getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr;
      if (!getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr)
      {
        v15 = (void *)SpringBoardHomeLibrary();
        v14 = dlsym(v15, "kSBHIconChangeWidgetSizeToLargeApplicationShortcutItemType");
        v26[3] = (uint64_t)v14;
        getkSBHIconChangeWidgetSizeToLargeApplicationShortcutItemTypeSymbolLoc_ptr = (uint64_t)v14;
      }
      _Block_object_dispose(&v25, 8);
      if (!v14)
        -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel].cold.3();
      v16 = objc_msgSend(v13, "isEqualToString:", *v14);

      if (v16)
      {
        v8 = CFSTR("large.widget.size");
      }
      else
      {
        objc_msgSend(v3, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v18 = (_QWORD *)getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr;
        v28 = getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr;
        if (!getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr)
        {
          v19 = (void *)SpringBoardHomeLibrary();
          v18 = dlsym(v19, "kSBHIconChangeWidgetToAppIconApplicationShortcutItemType");
          v26[3] = (uint64_t)v18;
          getkSBHIconChangeWidgetToAppIconApplicationShortcutItemTypeSymbolLoc_ptr = (uint64_t)v18;
        }
        _Block_object_dispose(&v25, 8);
        if (!v18)
          -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel].cold.4();
        v20 = objc_msgSend(v17, "isEqualToString:", *v18);

        if (!v20)
        {
          v24.receiver = self;
          v24.super_class = (Class)UIActionAccessibility__SpringBoardHome__UIKit;
          -[UIActionAccessibility__SpringBoardHome__UIKit accessibilityLabel](&v24, sel_accessibilityLabel);
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
        v8 = CFSTR("app.icon.size");
      }
    }
  }
  accessibilityLocalizedString(v8);
  v21 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v22 = (void *)v21;

  return v22;
}

- (void)accessibilityLabel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkSBHIconChangeWidgetToAppIconApplicationShortcutItemType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("UIActionAccessibility.m"), 22, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
