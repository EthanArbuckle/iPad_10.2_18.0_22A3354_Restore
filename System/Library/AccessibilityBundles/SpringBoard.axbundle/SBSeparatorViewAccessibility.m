@implementation SBSeparatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSeparatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("side.app.divider"));
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "performMedusaGesture:", 3);

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[SBSeparatorViewAccessibility _accessibilityActionsForSideAppDivider](self, "_accessibilityActionsForSideAppDivider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSeparatorViewAccessibility;
    -[SBSeparatorViewAccessibility accessibilityCustomActions](&v7, sel_accessibilityCustomActions);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("side.app.resize.hint"));
}

- (id)_accessibilityActionsForSideAppDivider
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  AXSBSideAppCustomAction *v21;
  uint64_t v22;
  uint64_t v24;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allowedMedusaGestures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  AXSpringBoardPrimaryAppLabel();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXSpringBoardSideAppLabel();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    while (2)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(obj);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "unsignedIntegerValue");
      switch(v10)
      {
        case 0:
          v11 = CFSTR("side.app.resize.half.width");
          goto LABEL_43;
        case 1:
          if (objc_msgSend(v4, "length"))
          {
            v15 = (void *)MEMORY[0x24BDD17C8];
            accessibilityLocalizedString(CFSTR("side.app.resize.shrink.format"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", v16, v4);
            goto LABEL_27;
          }
          v11 = CFSTR("side.app.shrink.left.app");
          goto LABEL_43;
        case 2:
          if (!objc_msgSend(v5, "length"))
          {
            v11 = CFSTR("side.app.shrink.right.app");
            goto LABEL_43;
          }
          v12 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("side.app.resize.shrink.format"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", v13, v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            goto LABEL_28;
          goto LABEL_29;
        case 3:
          if (objc_msgSend(v4, "length"))
          {
            v17 = (void *)MEMORY[0x24BDD17C8];
            v18 = CFSTR("side.app.resize.expand.format");
            goto LABEL_21;
          }
          if (v24 == 1)
            goto LABEL_34;
          goto LABEL_41;
        case 4:
          if (objc_msgSend(v5, "length"))
          {
            v19 = (void *)MEMORY[0x24BDD17C8];
            v20 = CFSTR("side.app.resize.expand.format");
            goto LABEL_26;
          }
          if (v24 == 1)
LABEL_41:
            v11 = CFSTR("side.app.resize.expand.left");
          else
LABEL_34:
            v11 = CFSTR("side.app.resize.expand.right");
          goto LABEL_43;
        case 7:
          if (objc_msgSend(v4, "length"))
          {
            v17 = (void *)MEMORY[0x24BDD17C8];
            v18 = CFSTR("app.pip.nib.action.create.slideover.app");
            goto LABEL_21;
          }
          if (v24 == 1)
            goto LABEL_36;
          goto LABEL_38;
        case 8:
          if (objc_msgSend(v5, "length"))
          {
            v19 = (void *)MEMORY[0x24BDD17C8];
            v20 = CFSTR("app.pip.nib.action.create.slideover.app");
            goto LABEL_26;
          }
          if (v24 == 1)
LABEL_38:
            v11 = CFSTR("side.app.slideover.left");
          else
LABEL_36:
            v11 = CFSTR("side.app.slideover.right");
          goto LABEL_43;
        case 11:
          if (!objc_msgSend(v4, "length"))
          {
            v11 = CFSTR("side.app.remove.left.app");
            goto LABEL_43;
          }
          v17 = (void *)MEMORY[0x24BDD17C8];
          v18 = CFSTR("side.app.remove.app");
LABEL_21:
          accessibilityLocalizedString(v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", v16, v4);
          goto LABEL_27;
        case 12:
          if (objc_msgSend(v5, "length"))
          {
            v19 = (void *)MEMORY[0x24BDD17C8];
            v20 = CFSTR("side.app.remove.app");
LABEL_26:
            accessibilityLocalizedString(v20);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", v16, v5);
LABEL_27:
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
LABEL_28:
              v21 = -[AXSBSideAppCustomAction initWithName:gesture:target:selector:]([AXSBSideAppCustomAction alloc], "initWithName:gesture:target:selector:", v14, v10, self, sel__axPerformGestureForAction_);
              objc_msgSend(v27, "axSafelyAddObject:", v21);

            }
          }
          else
          {
            v11 = CFSTR("side.app.remove.right.app");
LABEL_43:
            accessibilityLocalizedString(v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              goto LABEL_28;
          }
LABEL_29:
          if (v7 != ++v9)
            continue;
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          v7 = v22;
          if (!v22)
            goto LABEL_46;
          goto LABEL_3;
        default:
          goto LABEL_29;
      }
    }
  }
LABEL_46:

  return v27;
}

- (BOOL)_axPerformGestureForAction:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BE006F0];
  v4 = a3;
  objc_msgSend(v3, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "gesture");

  LOBYTE(v4) = objc_msgSend(v5, "performMedusaGesture:", v6);
  return (char)v4;
}

@end
