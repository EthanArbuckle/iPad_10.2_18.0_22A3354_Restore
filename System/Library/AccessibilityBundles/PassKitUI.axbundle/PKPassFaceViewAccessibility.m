@implementation PKPassFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassFaceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKPassFaceViewAccessibility;
  -[PKPassFaceViewAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("logoRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("LogoRect"));

  -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("localizedDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("organizationName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length", v15, CFSTR("__AXStringForVariablesSentinel")))
  {
    -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilitySetIdentification:", CFSTR("LogoImage"));

    -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("card.logo.hint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityHint:", v11);

    -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIsAccessibilityElement:", 1);

    -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityLabel:", v8);

  }
  -[PKPassFaceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIsAccessibilityElement:", 0);

}

- (void)setPass:(id)a3 colorProfile:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassFaceViewAccessibility;
  -[PKPassFaceViewAccessibility setPass:colorProfile:](&v5, sel_setPass_colorProfile_, a3, a4);
  -[PKPassFaceViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)createBodyInvariantViews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPassFaceViewAccessibility;
  -[PKPassFaceViewAccessibility createBodyInvariantViews](&v2, sel_createBodyInvariantViews);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __55__PKPassFaceViewAccessibility_createBodyInvariantViews__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("contentView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("subviews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v8, "allTargets");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v26)
          {
            v10 = *(_QWORD *)v35;
            v28 = v9;
            v29 = v2;
            v23 = v4;
            v24 = v5;
            v25 = *(_QWORD *)v35;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v35 != v10)
                {
                  v12 = v11;
                  objc_enumerationMutation(v9);
                  v11 = v12;
                }
                v27 = v11;
                v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v11);
                v30 = 0u;
                v31 = 0u;
                v32 = 0u;
                v33 = 0u;
                objc_msgSend(v8, "actionsForTarget:forControlEvent:", v13, 64);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v31;
                  while (2)
                  {
                    for (j = 0; j != v16; ++j)
                    {
                      if (*(_QWORD *)v31 != v17)
                        objc_enumerationMutation(v14);
                      v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                      if (objc_msgSend(v19, "isEqualToString:", CFSTR("_deleteButtonPressed:")))
                      {
                        accessibilityLocalizedString(CFSTR("trash.button"));
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v8, "setAccessibilityLabel:", v20);

                      }
                      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("_shareButtonPressed:")))
                      {
                        accessibilityLocalizedString(CFSTR("share.button"));
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v8, "setAccessibilityLabel:", v22);

                        v2 = v29;
                        goto LABEL_29;
                      }
                    }
                    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                    if (v16)
                      continue;
                    break;
                  }
                }

                v11 = v27 + 1;
                v9 = v28;
                v2 = v29;
                v4 = v23;
                v5 = v24;
                v10 = v25;
              }
              while (v27 + 1 != v26);
              v21 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
              v10 = v25;
              v26 = v21;
            }
            while (v21);
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v4);
  }
LABEL_29:

}

@end
