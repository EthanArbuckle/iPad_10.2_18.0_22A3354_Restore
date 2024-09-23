@implementation UIButtonAccessibility__Sharing__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AudioSoftwareUpdateViewController"), CFSTR("handleDismissButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ProximityPairingViewController"), CFSTR("handleDismissButton:"), "v", "@", 0);

}

- (BOOL)_axIsDismissButton
{
  void *v3;
  BOOL v4;
  UIButtonAccessibility__Sharing__UIKit *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
  -[UIButtonAccessibility__Sharing__UIKit accessibilityLabel](&v35, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("x")) & 1) != 0)
  {
    v4 = 1;
    goto LABEL_30;
  }
  v5 = self;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[UIButtonAccessibility__Sharing__UIKit allTargets](v5, "allTargets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (!v7)
  {
    v4 = 0;
    goto LABEL_29;
  }
  v8 = *(_QWORD *)v32;
  v21 = *(_QWORD *)v32;
  while (2)
  {
    v9 = 0;
    v22 = v7;
    do
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v9);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[UIButtonAccessibility__Sharing__UIKit actionsForTarget:forControlEvent:](v5, "actionsForTarget:forControlEvent:", v10, 0x2000, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
LABEL_10:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "isEqualToString:", CFSTR("handleDismissButton:")) & 1) != 0)goto LABEL_27;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
            if (v13)
              goto LABEL_10;
            break;
          }
        }
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[UIButtonAccessibility__Sharing__UIKit actionsForTarget:forControlEvent:](v5, "actionsForTarget:forControlEvent:", v10, 64);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
LABEL_18:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v11);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "isEqualToString:", CFSTR("handleDismissButton:")) & 1) != 0)break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
            if (v17)
              goto LABEL_18;
            goto LABEL_24;
          }
        }
LABEL_27:

        v4 = 1;
        goto LABEL_29;
      }
LABEL_24:

      ++v9;
      v8 = v21;
    }
    while (v9 != v22);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    v4 = 0;
    if (v7)
      continue;
    break;
  }
LABEL_29:

LABEL_30:
  return v4;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  objc_super v4;

  if (-[UIButtonAccessibility__Sharing__UIKit _axIsDismissButton](self, "_axIsDismissButton"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
  return -[UIButtonAccessibility__Sharing__UIKit _accessibilityUserTestingIsCancelButton](&v4, sel__accessibilityUserTestingIsCancelButton);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (-[UIButtonAccessibility__Sharing__UIKit _axIsDismissButton](self, "_axIsDismissButton"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
    -[UIButtonAccessibility__Sharing__UIKit accessibilityLabel](&v7, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "length") || (objc_msgSend(v3, "isEqualToString:", CFSTR("x")) & 1) != 0)
    {
      accessibilityLocalizedString(CFSTR("dismiss.button"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
  -[UIButtonAccessibility__Sharing__UIKit accessibilityLabel](&v6, sel_accessibilityLabel);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
