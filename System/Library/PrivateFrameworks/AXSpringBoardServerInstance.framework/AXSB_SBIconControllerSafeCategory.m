@implementation AXSB_SBIconControllerSafeCategory

- (void)iconManager:(id)a3 launchIconForIconView:(id)a4 withActions:(id)a5 modifierFlags:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[AXSpringBoardServerSideAppManager sharedInstance](AXSpringBoardServerSideAppManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "_isDockIconView:", v11))
  {
    objc_msgSend(v13, "_bundleIdentifierForIconView:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_appWithIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "dockIconActivationMode");
    switch(v16)
    {
      case 1:
        if (objc_msgSend(v13, "canLaunchAsPinnedApplicationForIconView:", v11))
        {
          v17 = v13;
          v18 = v15;
          v19 = 1;
LABEL_12:
          objc_msgSend(v17, "launchPinnedApplication:onLeadingSide:", v18, v19);
          goto LABEL_17;
        }
        break;
      case 2:
        if (objc_msgSend(v13, "canLaunchAsPinnedApplicationForIconView:", v11))
        {
          v17 = v13;
          v18 = v15;
          v19 = 0;
          goto LABEL_12;
        }
        break;
      case 3:
        if (objc_msgSend(v13, "canLaunchAsFloatingApplicationForIconView:", v11))
        {
          objc_msgSend(v13, "launchFloatingApplication:", v15);
LABEL_17:
          objc_msgSend(v13, "setDockIconActivationMode:", 0);

          goto LABEL_18;
        }
        objc_msgSend(v13, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "didFailToFloatAppForSideAppManager:", v13);
LABEL_16:

        goto LABEL_17;
      default:
        v22.receiver = self;
        v22.super_class = (Class)AXSB_SBIconControllerSafeCategory;
        -[AXSB_SBIconControllerSafeCategory iconManager:launchIconForIconView:withActions:modifierFlags:](&v22, sel_iconManager_launchIconForIconView_withActions_modifierFlags_, v10, v11, v12, a6);
        goto LABEL_17;
    }
    objc_msgSend(v13, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didFailToPinAppForSideAppManager:", v13);
    goto LABEL_16;
  }
  v21.receiver = self;
  v21.super_class = (Class)AXSB_SBIconControllerSafeCategory;
  -[AXSB_SBIconControllerSafeCategory iconManager:launchIconForIconView:withActions:modifierFlags:](&v21, sel_iconManager_launchIconForIconView_withActions_modifierFlags_, v10, v11, v12, a6);
LABEL_18:

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
