@implementation CKNanoReplyTextInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNanoReplyTextInputView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKNanoReplyTextInputView"), CFSTR("sendMenuButton"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKNanoReplyTextInputView"), CFSTR("textInputView"), "@");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_opt_new();
  -[CKNanoReplyTextInputViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sendMenuButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  -[CKNanoReplyTextInputViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textInputView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  if (objc_msgSend(v3, "count"))
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

@end
