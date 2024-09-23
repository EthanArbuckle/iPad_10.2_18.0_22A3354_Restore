@implementation WorkoutPlanBrickItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WorkoutPlanBrickItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WorkoutPlanBrickItemCell"), CFSTR("swapButton"), "IconButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.IconButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WorkoutPlanBrickItemCell"), CFSTR("actionButtonContainerView"), "ActionButtonContainerView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WorkoutPlanBrickItemCell"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WorkoutPlanBrickItemCell"), CFSTR("subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.WorkoutPlanBrickItemCell"), CFSTR("UICollectionViewCell"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WorkoutPlanBrickItemCellAccessibility;
  -[WorkoutPlanBrickItemCellAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[WorkoutPlanBrickItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityShouldGroupAccessibilityChildrenBlock:", &__block_literal_global_0);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_250348490;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v5[3] = &unk_2503484E0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "setAccessibilityCustomActionsBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

uint64_t __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

id __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _accessibilityReplaceStylsticBulletsForSpeaking(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  char v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("swapButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("workout.button.choose.workout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v13 = &unk_2503484B8;
    v14 = v4;
    v8 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v5, &v10);
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __83__WorkoutPlanBrickItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[WorkoutPlanBrickItemCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("actionButtonContainerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WorkoutPlanBrickItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  return v3;
}

@end
