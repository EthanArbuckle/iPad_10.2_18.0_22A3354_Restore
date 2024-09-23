@implementation TVShowPlayBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.TVShowPlayBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowPlayBarView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowPlayBarView"), CFSTR("accessibilityPlayButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowPlayBarView"), CFSTR("accessibilityContextualActionsButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[TVShowPlayBarViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title"));
}

- (id)_axPlayButton
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[TVShowPlayBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlayButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityMusicLocalizedString(CFSTR("play.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  return v4;
}

- (id)_axContextActionButton
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[TVShowPlayBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityContextualActionsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityMusicLocalizedString(CFSTR("more.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  return v4;
}

- (BOOL)_accessibilityPerformMoreAction:(id)a3
{
  void *v3;

  -[TVShowPlayBarViewAccessibility _axContextActionButton](self, "_axContextActionButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivate");

  return 1;
}

- (BOOL)_accessibilityPerformPlayAction:(id)a3
{
  void *v3;

  -[TVShowPlayBarViewAccessibility _axPlayButton](self, "_axPlayButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivate");

  return 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVShowPlayBarViewAccessibility _axPlayButton](self, "_axPlayButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityMusicLocalizedString(CFSTR("play.button"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__accessibilityPerformPlayAction_);

    objc_msgSend(v3, "addObject:", v7);
  }
  -[TVShowPlayBarViewAccessibility _axContextActionButton](self, "_axContextActionButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityMusicLocalizedString(CFSTR("more.button"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithName:target:selector:", v10, self, sel__accessibilityPerformMoreAction_);

    objc_msgSend(v3, "addObject:", v11);
  }
  v15.receiver = self;
  v15.super_class = (Class)TVShowPlayBarViewAccessibility;
  -[TVShowPlayBarViewAccessibility accessibilityCustomActions](&v15, sel_accessibilityCustomActions);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TVShowPlayBarViewAccessibility;
  -[TVShowPlayBarViewAccessibility automationElements](&v11, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[TVShowPlayBarViewAccessibility _axPlayButton](self, "_axPlayButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  -[TVShowPlayBarViewAccessibility _axContextActionButton](self, "_axContextActionButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v9);

  return v7;
}

@end
