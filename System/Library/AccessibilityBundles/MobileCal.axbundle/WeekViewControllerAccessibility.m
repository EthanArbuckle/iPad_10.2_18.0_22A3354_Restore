@implementation WeekViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WeekViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("WeekGroupView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WeekViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("WeekView"), CFSTR("dayWidthForOrientation:withViewInViewHierarchy:"), "d", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekViewController"), CFSTR("_weekScroller"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekViewController"), CFSTR("_visibleWeeks"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("interfaceOrientation"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WeekGroupView"), CFSTR("dateForXOffset:"), "@", "d", 0);

}

- (void)_axAnnotateWeekScroller
{
  id v2;

  -[WeekViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_weekScroller"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsAccessibilityOpaqueElementProvider:", 1);
  objc_msgSend(v2, "accessibilitySetIdentification:", CFSTR("_AXWeekScrollViewIdentifier"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WeekViewControllerAccessibility;
  -[WeekViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[WeekViewControllerAccessibility _axAnnotateWeekScroller](self, "_axAnnotateWeekScroller");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WeekViewControllerAccessibility;
  -[WeekViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[WeekViewControllerAccessibility _axAnnotateWeekScroller](self, "_axAnnotateWeekScroller");
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  WeekViewControllerAccessibility *v58;
  id v59;
  uint64_t *v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WeekViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_weekScroller"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  v54 = MEMORY[0x24BDAC760];
  v55 = 3221225472;
  v56 = __74__WeekViewControllerAccessibility_accessibilityScrollStatusForScrollView___block_invoke;
  v57 = &unk_25027D698;
  v60 = &v44;
  v58 = self;
  v5 = v4;
  v59 = v5;
  AXPerformSafeBlock();
  v6 = v45[3];

  _Block_object_dispose(&v44, 8);
  objc_msgSend(v43, "frame");
  v8 = v7;
  -[WeekViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visibleWeeks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  v12 = v6 * 0.5 + v8;
  if (v11)
  {
    v13 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        -[WeekViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "frame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        objc_msgSend(v15, "superview");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "convertRect:fromView:", v25, v18, v20, v22, v24);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        if (v27 <= v12)
        {
          v63.origin.x = v27;
          v63.origin.y = v29;
          v63.size.width = v31;
          v63.size.height = v33;
          if (CGRectGetMaxX(v63) > v12)
          {
            v34 = v15;
            goto LABEL_12;
          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (v11)
        continue;
      break;
    }
  }
  v34 = 0;
LABEL_12:

  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  v49 = 0;
  v35 = v34;
  AXPerformSafeBlock();
  if (*((_QWORD *)v45 + 5) || (_AXAssert(), *((_QWORD *)v45 + 5)))
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dateFromComponents:", *((_QWORD *)v45 + 5));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    AXDateStringForFormat();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("week.scroll.status"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", v40, v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = 0;
  }

  _Block_object_dispose(&v44, 8);
  return v41;
}

uint64_t __74__WeekViewControllerAccessibility_accessibilityScrollStatusForScrollView___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = -[objc_class dayWidthForOrientation:withViewInViewHierarchy:](NSClassFromString(CFSTR("WeekView")), "dayWidthForOrientation:withViewInViewHierarchy:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

void __74__WeekViewControllerAccessibility_accessibilityScrollStatusForScrollView___block_invoke_207(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dateForXOffset:", *(double *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
