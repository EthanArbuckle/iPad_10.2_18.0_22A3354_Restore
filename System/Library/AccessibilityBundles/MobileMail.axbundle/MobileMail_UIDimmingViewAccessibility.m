@implementation MobileMail_UIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDimmingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MailActionsViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MFModernAddressAtom"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIDimmingView"), CFSTR("UIView"));

}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)MobileMail_UIDimmingViewAccessibility;
  -[MobileMail_UIDimmingViewAccessibility _accessibilityObscuredScreenAllowedViews](&v16, sel__accessibilityObscuredScreenAllowedViews);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        NSClassFromString(CFSTR("MFModernAddressAtom"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          -[MobileMail_UIDimmingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"), v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_accessibilityFindDescendant:", &__block_literal_global_14);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_191_0);
            v10 = objc_claimAutoreleasedReturnValue();

            v3 = (id)v10;
          }
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = v3;
LABEL_12:

  return v3;
}

@end
