@implementation SeymourUI_ProgramMediaTagsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ProgramMediaTagsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.ProgramMediaTagsCell"), CFSTR("accessibilityMediaTags"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.ProgramMediaTagsCell"), CFSTR("tagsTextLabel"), "@", 0);

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
  const char *v8;
  __CFString *v9;
  void *v10;

  -[SeymourUI_ProgramMediaTagsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tagsTextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SeymourUI_ProgramMediaTagsCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityMediaTags"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilityDescriptionForMediaTags(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _accessibilityReplaceStylsticBulletsForSpeaking(v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_250349750;
  }
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
