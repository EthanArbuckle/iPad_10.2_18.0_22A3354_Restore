@implementation SPUIResultsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUIResultsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axResultsFirstAppeared
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetResultsFirstAppeared:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axPreviousGoResult
{
  JUMPOUT(0x23491F06CLL);
}

- (void)_axSetPreviousGoResult:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axPreviousAnnouncement
{
  JUMPOUT(0x23491F06CLL);
}

- (void)_axSetPreviousAnnouncement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUIResultsViewController"), CFSTR("searchAgentUpdatedResults:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUIResultsViewController"), CFSTR("goTakeoverResult"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SPUISearchModel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUISearchModel"), CFSTR("queryComplete"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUISearchModel"), CFSTR("queryPartiallyComplete"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUISearchModel"), CFSTR("sections"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFResultSection"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFResultSection"), CFSTR("results"), "@", 0);

}

- (void)searchAgentUpdatedResults:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SPUIResultsViewControllerAccessibility;
  -[SPUIResultsViewControllerAccessibility searchAgentUpdatedResults:](&v41, sel_searchAgentUpdatedResults_, v4);
  MEMORY[0x23491EFE8](CFSTR("SPUIProactiveResultsViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "applicationState"))
    {
      AXLogAppAccessibility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_232A05000, v5, OS_LOG_TYPE_INFO, "Not posting search agent results because we're not active", buf, 2u);
      }
      goto LABEL_30;
    }
    -[SPUIResultsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("goTakeoverResult"));
    v5 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    *(_QWORD *)buf = 0;
    v36 = buf;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    v40 = 0;
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    AXPerformSafeBlock();
    v7 = *((id *)v36 + 5);

    _Block_object_dispose(buf, 8);
    if (v7)
    {
      objc_msgSend(v7, "accessibilityLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("search.top.hit.format"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accessibilityLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);
        v9 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "safeStringForKey:", CFSTR("secondaryTitle"));
        v31 = objc_claimAutoreleasedReturnValue();
        -[SPUIResultsViewControllerAccessibility _axStringForType:](self, "_axStringForType:", objc_msgSend(v7, "safeIntForKey:", CFSTR("type")));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("search.go.format"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)v13;
        objc_msgSend(v14, "localizedStringWithFormat:", v15, v13);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    else
    {
      v9 = 0;
    }
    v31 = 0;
    v32 = 0;
    v33 = 0;
LABEL_10:
    v16 = -[SPUIResultsViewControllerAccessibility _axNumberOfResultsInModel:](self, "_axNumberOfResultsInModel:", v6);
    v17 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("search.items.found.format"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v18, v16);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("queryComplete")))
    {
      v29 = v19;
      v30 = CFSTR("__AXStringForVariablesSentinel");
      v20 = (void *)v9;
    }
    else
    {
      v20 = (void *)v9;
      if (!objc_msgSend(v6, "safeBoolForKey:", CFSTR("queryPartiallyComplete")))
      {
        v21 = 0;
        if (!v7)
          goto LABEL_21;
LABEL_17:
        if (v5)
        {
          -[NSObject safeValueForKey:](v5, "safeValueForKey:", CFSTR("resultBundleId"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPUIResultsViewControllerAccessibility _axPreviousGoResult](self, "_axPreviousGoResult");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "safeValueForKey:", CFSTR("resultBundleId"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 != v24)
          {
            v25 = (void *)v31;
            __AXStringForVariables();
            v26 = objc_claimAutoreleasedReturnValue();

            -[SPUIResultsViewControllerAccessibility _axSetPreviousGoResult:](self, "_axSetPreviousGoResult:", v5, v31, v19, v33, CFSTR("__AXStringForVariablesSentinel"));
            v21 = (void *)v26;
            if (v26)
              goto LABEL_24;
            goto LABEL_29;
          }
LABEL_23:
          v25 = (void *)v31;
          if (v21)
          {
LABEL_24:
            -[SPUIResultsViewControllerAccessibility _axPreviousAnnouncement](self, "_axPreviousAnnouncement", v29, v30);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", v21);

            if ((v28 & 1) == 0)
            {
              if (-[SPUIResultsViewControllerAccessibility _axResultsFirstAppeared](self, "_axResultsFirstAppeared"))
              {
                UIAccessibilitySpeakOrQueueIfNeeded();
                -[SPUIResultsViewControllerAccessibility _axSetResultsFirstAppeared:](self, "_axSetResultsFirstAppeared:", 0);
              }
              else
              {
                UIAccessibilitySpeak();
              }
              -[SPUIResultsViewControllerAccessibility _axSetPreviousAnnouncement:](self, "_axSetPreviousAnnouncement:", v21);
            }
          }
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
LABEL_21:
        if (!v5)
          -[SPUIResultsViewControllerAccessibility _axSetPreviousGoResult:](self, "_axSetPreviousGoResult:", 0);
        goto LABEL_23;
      }
      v29 = CFSTR("__AXStringForVariablesSentinel");
    }
    __AXStringForVariables();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_21;
    goto LABEL_17;
  }
LABEL_31:

}

void __68__SPUIResultsViewControllerAccessibility_searchAgentUpdatedResults___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_axFirstResultInModel:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axStringForType:(int)a3
{
  if ((a3 - 1) > 0x18)
    return &stru_250365690;
  accessibilityLocalizedString(off_250365400[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axSectionsInModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("sections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("sections"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_axResultsInSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("results"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)_axNumberOfResultsInModel:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SPUIResultsViewControllerAccessibility _axSectionsInModel:](self, "_axSectionsInModel:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[SPUIResultsViewControllerAccessibility _axResultsInSection:](self, "_axResultsInSection:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v10, "count");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_axFirstResultInModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SPUIResultsViewControllerAccessibility _axSectionsInModel:](self, "_axSectionsInModel:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUIResultsViewControllerAccessibility _axResultsInSection:](self, "_axResultsInSection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUIResultsViewControllerAccessibility;
  -[SPUIResultsViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SPUIResultsViewControllerAccessibility _axSetResultsFirstAppeared:](self, "_axSetResultsFirstAppeared:", 1);
}

@end
