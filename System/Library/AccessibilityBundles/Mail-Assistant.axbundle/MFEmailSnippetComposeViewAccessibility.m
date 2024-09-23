@implementation MFEmailSnippetComposeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFEmailSnippetComposeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_toHeader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_toField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(v7, "length"))
  {
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8, v7, CFSTR("__AXStringForVariablesSentinel"));

  }
  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ccHeader"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ccField"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") && objc_msgSend(v12, "length"))
  {
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13, v12, CFSTR("__AXStringForVariablesSentinel"));

  }
  v28 = v7;
  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bccHeader"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bccField"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
  {
    __UIAXStringForVariables();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18, v17, CFSTR("__AXStringForVariablesSentinel"));

  }
  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subjectHeader"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subjectField"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessibilityLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "length") && objc_msgSend(v22, "length"))
  {
    __UIAXStringForVariables();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23, v22, CFSTR("__AXStringForVariablesSentinel"));

  }
  -[MFEmailSnippetComposeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bodyText"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accessibilityLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "length"))
    objc_msgSend(v3, "addObject:", v25);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
