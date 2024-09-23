@implementation SBIconDragContextAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconDragContext");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("recipientIconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("setRecipientIconView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("icon"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isFolderIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isWidgetIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isWidgetStackIcon"), "B", 0);

}

- (void)setRecipientIconView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  -[SBIconDragContextAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipientIconView"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)SBIconDragContextAccessibility;
  -[SBIconDragContextAccessibility setRecipientIconView:](&v27, sel_setRecipientIconView_, v4);
  if (!(SBAXIconCreatingFolder | SBAXPerformingAXDrag))
  {
    AXSBIconControllerSharedInstance();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_axDragManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_axIsIconDragging");

    if (v8)
    {
      if (v5 != v4)
      {
        if (v4 || !v5)
        {
          if (!v4)
            goto LABEL_22;
          objc_msgSend(v4, "safeValueForKey:", CFSTR("icon"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "safeBoolForKey:", CFSTR("isWidgetStackIcon")))
          {
            accessibilityLocalizedString(CFSTR("will.add.to.stack"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (objc_msgSend(v18, "safeBoolForKey:", CFSTR("isWidgetIcon")))
            {
              v22 = (void *)MEMORY[0x24BDD17C8];
              v23 = CFSTR("will.create.stack");
            }
            else
            {
              if (objc_msgSend(v18, "safeBoolForKey:", CFSTR("isFolderIcon")))
                v23 = CFSTR("will.open.folder");
              else
                v23 = CFSTR("will.create.folder");
              v22 = (void *)MEMORY[0x24BDD17C8];
            }
            accessibilityLocalizedString(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "accessibilityLabel");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringWithFormat:", v24, v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
        }
        else
        {
          objc_msgSend((id)SBAXIconFolderOpeningTimer, "invalidate");
          objc_msgSend(v5, "safeValueForKey:", CFSTR("icon"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("isFolderIcon"));
          v11 = CFSTR("dragged.off.app");
          if (v10)
            v11 = CFSTR("dragged.off.folder");
          v12 = v11;

          v13 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "accessibilityLabel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("finished.moving.app"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x234920010](SBAXIconMovedY);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x234920010](SBAXIconMovedX);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", v18, v19, v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v21)
        {
          UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v21);

        }
      }
    }
  }
LABEL_22:
  if (v4)
    SBHAXCancelSBAXIconMoveSpeakTimer();

}

@end
