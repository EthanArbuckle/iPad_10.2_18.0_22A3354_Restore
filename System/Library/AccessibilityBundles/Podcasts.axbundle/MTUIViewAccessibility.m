@implementation MTUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[MTUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("modalSearchView")))
  {

  }
  else
  {
    -[MTUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ModalPopup"));

    if (!v5)
    {
      v21.receiver = self;
      v21.super_class = (Class)MTUIViewAccessibility;
      -[MTUIViewAccessibility _accessibilityObscuredScreenAllowedViews](&v21, sel__accessibilityObscuredScreenAllowedViews);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
  }
  objc_getAssociatedObject(self, &MTAXSearchDelegateObject);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeValueForKey:", CFSTR("_searchBar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "addObject:", v6);
  -[MTUIViewAccessibility superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v16, "accessibilityIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("DismissView"));

        if (v18)
        {
          objc_msgSend(v8, "addObject:", v16);
          goto LABEL_16;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_16:

  return v8;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  double v5;
  objc_super v7;

  -[MTUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DismissView"));

  if (v4)
  {
    -[MTUIViewAccessibility alpha](self, "alpha");
    if (v5 > 0.0 && !-[MTUIViewAccessibility isHidden](self, "isHidden"))
      return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)MTUIViewAccessibility;
  return -[MTUIViewAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
}

@end
