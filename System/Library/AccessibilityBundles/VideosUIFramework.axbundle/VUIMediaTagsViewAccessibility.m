@implementation VUIMediaTagsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIMediaTagsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("VUIImageView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIImageView"), CFSTR("image"), "@");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUIMediaTagsView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIMediaTagsView"), CFSTR("viewsMap"), "@");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)VUIMediaTagsViewAccessibility;
  -[VUIMediaTagsViewAccessibility _accessibilityLoadAccessibilityInformation](&v34, sel__accessibilityLoadAccessibilityInformation);
  v33 = 0;
  objc_opt_class();
  -[VUIMediaTagsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewsMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v27 = v5;
    v28 = *MEMORY[0x24BDF73E0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeySeparator")))
          {
            objc_msgSend(v4, "objectForKey:", CFSTR("VUIMediaTagKeySeparator"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setIsAccessibilityElement:", 0);
            goto LABEL_38;
          }
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyBrandLinkButton")))
          {
            objc_msgSend(v4, "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("BrandLinkButton"));
            goto LABEL_38;
          }
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyRatingImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyClosedCaptionImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyVideoResolutionImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyVideoDynamicRangeImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyADLocalesImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeySDHLocalesImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyDolbyAtmosImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyAvailabilityImage")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyItunesExtras")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyCommonSenseImage")) & 1) != 0
            || objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyTomatoFreshnessImage")))
          {
            objc_msgSend(v4, "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            MEMORY[0x2349244BC](CFSTR("VUIImageView"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "safeValueForKey:", CFSTR("image"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v33 = 0;
              objc_opt_class();
              __UIAccessibilityCastAsClass();
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v33)
                goto LABEL_42;
            }
            v13 = v12;
            objc_msgSend(v12, "accessibilityIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "accessibilityLabelForID:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "setAccessibilityTraits:", v28);
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyCommonSenseImage")))
            {
              v33 = 0;
              objc_opt_class();
              v17 = v4;
              v18 = CFSTR("VUIMediaTagKeyCommonSenseRating");
              goto LABEL_30;
            }
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyTomatoFreshnessImage")))
            {
              v33 = 0;
              objc_opt_class();
              v17 = v4;
              v18 = CFSTR("VUIMediaTagKeyTomatoPercentage");
LABEL_30:
              objc_msgSend(v17, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAccessibilityCastAsClass();
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
LABEL_42:
                abort();
              objc_msgSend(v20, "text");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAXStringForVariables();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setAccessibilityLabel:", v22, v21, CFSTR("__AXStringForVariablesSentinel"));

            }
            else
            {
              if (objc_msgSend(v10, "isEqualToString:", CFSTR("VUIMediaTagKeyAvailabilityImage"))
                && (objc_msgSend(v11, "accessibilityIdentifier"),
                    v23 = (void *)objc_claimAutoreleasedReturnValue(),
                    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Punchout")),
                    v23,
                    v24))
              {
                v25 = v11;
                v26 = 0;
              }
              else
              {
                objc_msgSend(v11, "setAccessibilityLabel:", v16);
                v25 = v11;
                v26 = 1;
              }
              objc_msgSend(v25, "setIsAccessibilityElement:", v26);
            }

            v5 = v27;
LABEL_38:

            continue;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

}

- (void)_accessibilityUpdateAccessibilityInformation
{
  void *v3;
  id v4;

  -[VUIMediaTagsViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[VUIMediaTagsViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", objc_msgSend(v3, "accessibilityTraits"));
    objc_msgSend(v4, "accessibilityActivationPoint");
    -[VUIMediaTagsViewAccessibility setAccessibilityActivationPoint:](self, "setAccessibilityActivationPoint:");
    v3 = v4;
  }

}

uint64_t __77__VUIMediaTagsViewAccessibility__accessibilityUpdateAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("BrandLinkButton"));

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return -[VUIMediaTagsViewAccessibility _accessibilityIsFocusForHoverTextRunningForFocusItem](self, "_accessibilityIsFocusForHoverTextRunningForFocusItem") ^ 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIMediaTagsViewAccessibility subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_251);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__VUIMediaTagsViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

- (void)didMoveToWindow
{
  objc_super v3;

  -[VUIMediaTagsViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v3.receiver = self;
  v3.super_class = (Class)VUIMediaTagsViewAccessibility;
  -[VUIMediaTagsViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIMediaTagsViewAccessibility;
  -[VUIMediaTagsViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIMediaTagsViewAccessibility _accessibilityUpdateAccessibilityInformation](self, "_accessibilityUpdateAccessibilityInformation");
}

@end
