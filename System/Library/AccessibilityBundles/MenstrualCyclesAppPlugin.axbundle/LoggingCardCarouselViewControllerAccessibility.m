@implementation LoggingCardCarouselViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.LoggingCardCarouselViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MenstrualCyclesAppPlugin.LoggingCardHeaderView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MenstrualCyclesAppPlugin.LoggingCardCarouselViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("MenstrualCyclesAppPlugin.LoggingCardCarouselViewController"), CFSTR("UIScrollViewDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MenstrualCyclesAppPlugin.LoggingCardCarouselViewController"), CFSTR("axCardProgressLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LoggingCardCarouselViewControllerAccessibility;
  -[LoggingCardCarouselViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "axFilterObjectsUsingBlock:", &__block_literal_global_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

}

uint64_t __92__LoggingCardCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  LoggingCardCarouselViewControllerAccessibility *v37;
  void *v38;
  id obj;
  _QWORD v40[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGPoint v47;
  CGRect v48;

  v46 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v40[0]) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingCardCarouselViewControllerAccessibility collectionViewFrom:](self, "collectionViewFrom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    AX_CGRectGetCenter();
    v9 = v8;
    v11 = v10;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v7, "indexPathsForVisibleItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v12)
    {
      v13 = v12;
      v37 = self;
      v38 = v5;
      v14 = 0;
      v16 = *MEMORY[0x24BDBEFB0];
      v15 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v17 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v7, "cellForItemAtIndexPath:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bounds");
          objc_msgSend(v7, "convertRect:fromView:", v20);
          v47.x = v9;
          v47.y = v11;
          if (CGRectContainsPoint(v48, v47))
          {
            if (a3 == 2)
            {
              v16 = 0.5;
              v21 = 1;
            }
            else
            {
              if (a3 != 1)
              {

                v5 = v38;
                goto LABEL_22;
              }
              v16 = -0.5;
              v21 = -1;
            }
            objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", objc_msgSend(v19, "item") + v21, objc_msgSend(v19, "section"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "cellForItemAtIndexPath:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v23;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v13)
          continue;
        break;
      }

      if (!v14)
      {
        v35 = 0;
        v5 = v38;
        goto LABEL_24;
      }
      objc_msgSend(v14, "center");
      v25 = v24;
      objc_msgSend(v7, "bounds");
      v27 = v25 + v26 * -0.5;
      objc_msgSend(v7, "contentOffset");
      objc_msgSend(v7, "setContentOffset:animated:", 1, v27);
      objc_msgSend(v7, "contentOffset");
      v40[0] = v28;
      v40[1] = v29;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[LoggingCardCarouselViewControllerAccessibility scrollViewWillEndDragging:withVelocity:targetContentOffset:](v37, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v7, v40, v16, v15);
      accessibilityLocalizedString(CFSTR("card"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[LoggingCardCarouselViewControllerAccessibility cardProgressLabel](v37, "cardProgressLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v31) = *MEMORY[0x24BDF72E0];
      __UIAXStringForVariables();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v31, v33);

      objc_msgSend(v14, "_accessibilityFindSubviewDescendant:", &__block_literal_global_201, v32, CFSTR("__AXStringForVariablesSentinel"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v34);

      v35 = 1;
      v5 = v38;
    }
    else
    {
      v14 = 0;
LABEL_22:

      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }
LABEL_24:

  return v35;
}

uint64_t __70__LoggingCardCarouselViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234914464](CFSTR("MenstrualCyclesAppPlugin.LoggingCardHeaderView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (id)cardProgressLabel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[LoggingCardCarouselViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axCardProgressLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)collectionViewFrom:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_202);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __69__LoggingCardCarouselViewControllerAccessibility_collectionViewFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LoggingCardCarouselViewControllerAccessibility;
  -[LoggingCardCarouselViewControllerAccessibility viewDidLoad](&v5, sel_viewDidLoad);
  -[LoggingCardCarouselViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LoggingCardCarouselViewControllerAccessibility collectionViewFrom:](self, "collectionViewFrom:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("AXLoggingCardCarouselViewCollectionView"));

}

@end
