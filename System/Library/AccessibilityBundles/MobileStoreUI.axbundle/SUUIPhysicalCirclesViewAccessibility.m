@implementation SUUIPhysicalCirclesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIPhysicalCirclesView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIPhysicalCirclesView"), CFSTR("_circleBodies"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIPhysicalCirclesView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIPhysicalCirclesView"), CFSTR("removeCircleAtIndex: animated: completionBlock:"), "v", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIPhysicalCirclesView"), CFSTR("_reloadDidFinish"), "v", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("SUUIPhysicalCirclesDelegate"), CFSTR("circleView:didTapCircleAtIndex:"));
  objc_msgSend(v3, "validateClass:", CFSTR("PKPhysicsBody"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPhysicsBody"), CFSTR("representedObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPhysicsBody"), CFSTR("applyForce:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIOnboardingAffiliationCirclesViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOnboardingAffiliationCirclesViewController"), CFSTR("_completeDeletionForCircleAtIndex:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIOnboardingAffiliationCirclesViewController"), CFSTR("_affiliationItems"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIOnboardingAffiliationItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIOnboardingAffiliationItem"), CFSTR("userAffinityCount"), "q", 0);

}

- (void)_accessibilityDeleteCircle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  AXPerformSafeBlock();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("removed.genre.circle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);
  }

}

void __67__SUUIPhysicalCirclesViewAccessibility__accessibilityDeleteCircle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_completeDeletionForCircleAtIndex:", objc_msgSend(*(id *)(a1 + 32), "_accessibilityIndexOfCircle:", *(_QWORD *)(a1 + 40)));

}

- (void)_accessibilityActivateCircle:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

void __69__SUUIPhysicalCirclesViewAccessibility__accessibilityActivateCircle___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "circleView:didTapCircleAtIndex:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "_accessibilityIndexOfCircle:", *(_QWORD *)(a1 + 40)));

}

- (id)_accessibilityValueForCircle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  -[SUUIPhysicalCirclesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_affiliationItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndex:", -[SUUIPhysicalCirclesViewAccessibility _accessibilityIndexOfCircle:](self, "_accessibilityIndexOfCircle:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safeIntegerForKey:", CFSTR("userAffinityCount"));

  -[SUUIPhysicalCirclesViewAccessibility _accessibilityValueForAffinityCount:](self, "_accessibilityValueForAffinityCount:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SUUIPhysicalCirclesViewAccessibility _accessibilityCircleBodies](self, "_accessibilityCircleBodies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("representedObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[SUUIPhysicalCirclesViewAccessibility _accessibilityCircleBodies](self, "_accessibilityCircleBodies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)_accessibilityUsesChildrenFramesForSorting
{
  return 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  -[SUUIPhysicalCirclesViewAccessibility _accessibilityForceTranslationForScrollDirection:](self, "_accessibilityForceTranslationForScrollDirection:");
  v6 = v5;
  v8 = v7;
  -[SUUIPhysicalCirclesViewAccessibility _accessibilityCircleBodies](self, "_accessibilityCircleBodies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__SUUIPhysicalCirclesViewAccessibility_accessibilityScroll___block_invoke;
  v12[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
  v12[4] = v6;
  v12[5] = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  LODWORD(v9) = *MEMORY[0x24BDF72E0];
  -[SUUIPhysicalCirclesViewAccessibility _accessibilityPushingScrollStatusInDirection:](self, "_accessibilityPushingScrollStatusInDirection:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v9, v10);

  return 1;
}

void __60__SUUIPhysicalCirclesViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AXPerformSafeBlock();

}

uint64_t __60__SUUIPhysicalCirclesViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyForce:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)_accessibilityPushingScrollStatusInDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  accessibilityLocalizedString(off_2502A6E00[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeCircleAtIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a4;
  v8 = a5;
  -[SUUIPhysicalCirclesViewAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("removed.genre.circle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)SUUIPhysicalCirclesViewAccessibility;
  -[SUUIPhysicalCirclesViewAccessibility removeCircleAtIndex:animated:completionBlock:](&v14, sel_removeCircleAtIndex_animated_completionBlock_, a3, v5, v8);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);

}

- (void)_reloadDidFinish
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUUIPhysicalCirclesViewAccessibility;
  -[SUUIPhysicalCirclesViewAccessibility _reloadDidFinish](&v2, sel__reloadDidFinish);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_accessibilityCircleBodies
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SUUIPhysicalCirclesViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_circleBodies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_accessibilityIndexOfCircle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SUUIPhysicalCirclesViewAccessibility _accessibilityCircleBodies](self, "_accessibilityCircleBodies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__SUUIPhysicalCirclesViewAccessibility__accessibilityIndexOfCircle___block_invoke;
  v9[3] = &unk_2502A6D48;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

BOOL __68__SUUIPhysicalCirclesViewAccessibility__accessibilityIndexOfCircle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "safeValueForKey:", CFSTR("representedObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_accessibilityValueForAffinityCount:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  accessibilityLocalizedString(off_2502A6E20[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGPoint)_accessibilityForceTranslationForScrollDirection:(int64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  switch(a3)
  {
    case 1:
      v3 = 4400.0;
      break;
    case 2:
      v3 = -4400.0;
      break;
    case 3:
      v4 = -4400.0;
      break;
    case 4:
      v4 = 4400.0;
      break;
    default:
      break;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

@end
