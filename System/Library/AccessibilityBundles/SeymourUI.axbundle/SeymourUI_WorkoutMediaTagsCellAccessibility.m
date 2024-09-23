@implementation SeymourUI_WorkoutMediaTagsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WorkoutMediaTagsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.WorkoutMediaTagsCell"), CFSTR("tagsLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.WorkoutMediaTagsCell"), CFSTR("accessibilityMediaTags"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  _QWORD v13[4];
  __CFString *v14;
  id v15;
  char v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SeymourUI_WorkoutMediaTagsCellAccessibility;
  -[SeymourUI_WorkoutMediaTagsCellAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  v16 = 0;
  objc_opt_class();
  -[SeymourUI_WorkoutMediaTagsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tagsLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SeymourUI_WorkoutMediaTagsCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityMediaTags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilityDescriptionForMediaTags(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _accessibilityReplaceStylsticBulletsForSpeaking(v8, v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_250349750;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__SeymourUI_WorkoutMediaTagsCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v13[3] = &unk_250348558;
  v14 = v10;
  v15 = v6;
  v11 = v6;
  v12 = v10;
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v13);

}

@end
