@implementation StackElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StackElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)itemViewCreateIfNeeded:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)StackElementAccessibility;
  -[StackElementAccessibility itemViewCreateIfNeeded:](&v11, sel_itemViewCreateIfNeeded_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("message.to.be.moved.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[StackElementAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MFMailMessage"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("subject.subjectWithoutPrefix"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v8, v7, CFSTR("__AXStringForVariablesSentinel"));

  accessibilityLocalizedString(CFSTR("message.to.be.moved.hint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v9);

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  return v4;
}

@end
