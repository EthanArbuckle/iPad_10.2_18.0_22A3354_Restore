@implementation SUUINavigationController

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  -[SUUINavigationController tabBarItem](self, "tabBarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "appendFormat:", CFSTR("; title = %@"), v8);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (id)childViewControllerForStatusBarHidden
{
  void *v3;
  objc_super v5;

  if (-[SUUINavigationController _topViewControllerPrefersNavigationBarBackgroundViewHidden](self, "_topViewControllerPrefersNavigationBarBackgroundViewHidden"))
  {
    -[SUUINavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUINavigationController;
    -[SUUINavigationController childViewControllerForStatusBarHidden](&v5, sel_childViewControllerForStatusBarHidden);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v3;
  objc_super v5;

  if (-[SUUINavigationController _topViewControllerPrefersNavigationBarBackgroundViewHidden](self, "_topViewControllerPrefersNavigationBarBackgroundViewHidden"))
  {
    -[SUUINavigationController topViewController](self, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUINavigationController;
    -[SUUINavigationController childViewControllerForStatusBarStyle](&v5, sel_childViewControllerForStatusBarStyle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationController;
  -[SUUINavigationController popToRootViewControllerAnimated:](&v6, sel_popToRootViewControllerAnimated_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController _scheduleConfigurationOfNavigationBar](self, "_scheduleConfigurationOfNavigationBar");
  return v4;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUINavigationController;
  -[SUUINavigationController popToViewController:animated:](&v7, sel_popToViewController_animated_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController _scheduleConfigurationOfNavigationBar](self, "_scheduleConfigurationOfNavigationBar");
  return v5;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationController;
  -[SUUINavigationController popViewControllerAnimated:](&v6, sel_popViewControllerAnimated_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController _scheduleConfigurationOfNavigationBar](self, "_scheduleConfigurationOfNavigationBar");
  return v4;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationController;
  -[SUUINavigationController pushViewController:animated:](&v5, sel_pushViewController_animated_, a3, a4);
  -[SUUINavigationController _scheduleConfigurationOfNavigationBar](self, "_scheduleConfigurationOfNavigationBar");
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationController;
  -[SUUINavigationController setViewControllers:animated:](&v5, sel_setViewControllers_animated_, a3, a4);
  -[SUUINavigationController _scheduleConfigurationOfNavigationBar](self, "_scheduleConfigurationOfNavigationBar");
}

- (void)attachPalette:(id)a3 isPinned:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUINavigationController;
  -[SUUINavigationController attachPalette:isPinned:](&v6, sel_attachPalette_isPinned_, a3, a4);
  -[SUUINavigationController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController _configureNavigationBarForViewController:shouldIgnoreTransitionCoordinator:](self, "_configureNavigationBarForViewController:shouldIgnoreTransitionCoordinator:", v5, 0);

}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUINavigationController;
  -[SUUINavigationController didShowViewController:animated:](&v5, sel_didShowViewController_animated_, a3, a4);
  -[SUUINavigationController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)_configureNavigationBar:(id)a3 withTintColor:(id)a4 tintAdjustmentMode:(int64_t)a5 titleTextTintColor:(id)a6 shouldTintTitleText:(BOOL)a7 accessibilityButtonBackgroundTintColor:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v9 = a7;
  v18 = a3;
  v13 = a6;
  v14 = a8;
  objc_msgSend(v18, "setTintColor:", a4);
  objc_msgSend(v18, "setTintAdjustmentMode:", a5);
  if (v9)
  {
    objc_msgSend(v18, "titleTextAttributes");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    if (v13)
    {
      if (!v16)
        v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v17, "setObject:forKey:", v13, *MEMORY[0x24BEBB368]);
    }
    else
    {
      objc_msgSend(v16, "removeObjectForKey:", *MEMORY[0x24BEBB368]);
    }
    if (v15 != v17 && (objc_msgSend(v15, "isEqualToDictionary:", v17) & 1) == 0)
      objc_msgSend(v18, "setTitleTextAttributes:", v17);

  }
  objc_msgSend(v18, "_setAccessibilityButtonBackgroundTintColor:", v14);

}

- (void)_configureNavigationBarForViewController:(id)a3 shouldIgnoreTransitionCoordinator:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  id v28;
  double v29;
  char v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  void *v46;
  _QWORD *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  BOOL v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  char v81;
  char v82;
  void *v83;
  id v84;
  uint64_t v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  char v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  SUUINavigationController *v103;
  id v104;
  double v105;
  double v106;
  char v107;
  char v108;
  char v109;
  _QWORD v110[5];
  id v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  BOOL v116;
  _QWORD v117[4];
  id v118;
  SUUINavigationController *v119;
  id v120;
  id v121;
  id v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  BOOL v127;
  char v128;

  v4 = a4;
  v6 = a3;
  -[SUUINavigationController navigationBar](self, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "tintColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[SUUINavigationController transitionCoordinator](self, "transitionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && !v4)
  {
    objc_msgSend(v11, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 != v6 && v14 != v6)
    {
      v32 = 0;
      v33 = 0;
LABEL_62:

      goto LABEL_63;
    }
    v92 = v14;
    objc_msgSend(v7, "_backgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alpha");
    v18 = v17;

    objc_msgSend(v7, "_shadowAlpha");
    v20 = v19;
    -[SUUINavigationController existingPaletteForEdge:](self, "existingPaletteForEdge:", 2);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(v77, (const void *)kHasBeginHidingPaletteShadow);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v7, "tintColor");
    v22 = objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v7, "tintAdjustmentMode");
    objc_msgSend(v7, "titleTextAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x24BEBB368]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_accessibilityButtonBackgroundTintColor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)v22;
    if (objc_msgSend(v13, "conformsToProtocol:", &unk_257201C40))
      v25 = objc_msgSend(v13, "prefersNavigationBarBackgroundViewHidden");
    else
      v25 = 0;
    v87 = v13;
    if (!objc_msgSend(v92, "conformsToProtocol:", &unk_257201C40))
    {
      v38 = 0;
      v89 = 0;
      v75 = 0;
      v76 = 0;
      v39 = 1.0;
      v74 = v24 != 0;
LABEL_47:
      objc_getAssociatedObject(v7, "com.apple.iTunesStoreUI.SUUINavigationController.originalBackgroundView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        objc_msgSend(v7, "_backgroundView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setAssociatedObject(v7, "com.apple.iTunesStoreUI.SUUINavigationController.originalBackgroundView", v46, (void *)1);
      }
      v88 = v6;
      v96 = v46;
      v98 = v8;
      v81 = v38;
      v82 = v25 ^ v38;
      v80 = v10;
      if ((v25 ^ v38) == 1)
      {
        if ((v25 | v38) == 1)
        {
          v47 = (_QWORD *)MEMORY[0x24BEBE9B8];
          if (!v25)
            v47 = (_QWORD *)MEMORY[0x24BEBE9A8];
          objc_msgSend(v12, "viewForKey:", *v47);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v73 = 0;
        }
        objc_msgSend(v7, "frame");
        v50 = v49;
        v52 = v51;
        v54 = v53;
        v56 = v55;
        objc_msgSend(v7, "superview");
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = (void *)v57;
        if (v46)
        {
          v48 = v77;
          if (v57)
          {
            objc_msgSend(v46, "frame");
            objc_msgSend(v7, "convertRect:toView:", v58);
            v50 = v59;
            v52 = v60;
            v54 = v61;
            v56 = v62;
          }
        }
        else
        {
          v48 = v77;
        }
        v63 = (void *)objc_msgSend(objc_alloc((Class)-[SUUINavigationController navigationBarClass](self, "navigationBarClass")), "initWithFrame:", v50, v52, v54, v56);
        objc_msgSend(v63, "setBarStyle:", objc_msgSend(v7, "barStyle"));
        objc_msgSend(v7, "barTintColor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setBarTintColor:", v64);

        objc_msgSend(v7, "_setBackgroundView:", 0);
        objc_msgSend(v63, "layer");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setZPosition:", 100.0);

        v78 = v63;
        objc_msgSend(v73, "addSubview:", v63);
        objc_msgSend(v7, "_setShadowAlpha:", 0.0);
        objc_msgSend(v48, "SUUI_beginHidingPaletteShadow");
        -[SUUINavigationController _setNavigationPalette:hidesPaletteShadow:](self, "_setNavigationPalette:hidesPaletteShadow:", v48, v38);

      }
      else
      {
        v78 = 0;
        v48 = v77;
      }
      v66 = MEMORY[0x24BDAC760];
      v117[0] = MEMORY[0x24BDAC760];
      v117[1] = 3221225472;
      v117[2] = __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke;
      v117[3] = &unk_2511F45C8;
      v67 = v7;
      v124 = v18;
      v125 = v20;
      v118 = v67;
      v119 = self;
      v126 = v85;
      v120 = v79;
      v121 = v24;
      v127 = v24 != 0;
      v122 = v83;
      v68 = v48;
      v123 = v68;
      v128 = v91;
      v90 = v79;
      v86 = v24;
      v84 = v83;
      objc_msgSend(v12, "notifyWhenInteractionEndsUsingBlock:", v117);
      v69 = v66;
      v110[0] = v66;
      v110[1] = 3221225472;
      v110[2] = __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_2;
      v110[3] = &unk_2511F45F0;
      v110[4] = self;
      v111 = v67;
      v10 = v80;
      v112 = v10;
      v115 = v75;
      v33 = v76;
      v113 = v33;
      v116 = v74;
      v32 = v89;
      v114 = v32;
      v99[0] = v69;
      v99[1] = 3221225472;
      v99[2] = __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_3;
      v99[3] = &unk_2511F4618;
      v100 = v78;
      v101 = v111;
      v102 = v96;
      v105 = v39;
      v106 = v39;
      v107 = v81;
      v103 = self;
      v104 = v68;
      v108 = v91;
      v109 = v82;
      v70 = v78;
      v71 = v96;
      v72 = v68;
      objc_msgSend(v12, "animateAlongsideTransition:completion:", v110, v99);

      v13 = v87;
      v6 = v88;
      v14 = v92;
      v8 = v98;
      goto LABEL_62;
    }
    v95 = v12;
    v37 = v92;
    v38 = objc_msgSend(v37, "prefersNavigationBarBackgroundViewHidden");
    if ((_DWORD)v38)
    {
      -[SUUINavigationController _accessibilityButtonBackgroundDefaultTintColor](self, "_accessibilityButtonBackgroundDefaultTintColor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0.0;
    }
    else
    {
      v89 = 0;
      v39 = 1.0;
    }
    objc_msgSend(v37, "navigationBarTintColor");
    v40 = objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v37, "navigationBarTitleTextTintColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
        v42 = v38;
      else
        v42 = 0;
      v76 = v41;
      if (v42 != 1)
      {
        v74 = 1;
        goto LABEL_43;
      }
      v43 = v40;
      objc_msgSend(v41, "colorWithAlphaComponent:", 0.2);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = 1;
    }
    else
    {
      v43 = v40;
      v44 = 0;
      v76 = 0;
      v45 = v24 != 0;
    }
    v74 = v45;

    v89 = (void *)v44;
    v40 = v43;
LABEL_43:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v75 = objc_msgSend(v37, "navigationBarTintAdjustmentMode");
    else
      v75 = 0;

    v10 = (id)v40;
    v12 = v95;
    goto LABEL_47;
  }
  v94 = v11;
  v97 = v8;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_257201C40))
  {
    v26 = v6;
    v27 = objc_msgSend(v26, "prefersNavigationBarBackgroundViewHidden");
    v28 = v6;
    if ((_DWORD)v27)
    {
      -[SUUINavigationController _accessibilityButtonBackgroundDefaultTintColor](self, "_accessibilityButtonBackgroundDefaultTintColor");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0.0;
    }
    else
    {
      v32 = 0;
      v29 = 1.0;
    }
    objc_msgSend(v26, "navigationBarTintColor");
    v93 = (id)objc_claimAutoreleasedReturnValue();

    v30 = objc_opt_respondsToSelector();
    if ((v30 & 1) != 0)
    {
      objc_msgSend(v26, "navigationBarTitleTextTintColor");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "prefersNavigationBarBackgroundViewHidden") && v33)
      {
        objc_msgSend(v33, "colorWithAlphaComponent:", 0.2);
        v34 = objc_claimAutoreleasedReturnValue();

        v32 = (id)v34;
      }
    }
    else
    {
      v33 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = objc_msgSend(v26, "navigationBarTintAdjustmentMode");
    else
      v31 = 0;

    v10 = v93;
  }
  else
  {
    v28 = v6;
    v32 = 0;
    v30 = 0;
    v31 = 0;
    v33 = 0;
    v27 = 0;
    v29 = 1.0;
  }
  objc_msgSend(v7, "_backgroundView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", v29);

  objc_msgSend(v7, "_setShadowAlpha:", v29);
  -[SUUINavigationController _configureNavigationBar:withTintColor:tintAdjustmentMode:titleTextTintColor:shouldTintTitleText:accessibilityButtonBackgroundTintColor:](self, "_configureNavigationBar:withTintColor:tintAdjustmentMode:titleTextTintColor:shouldTintTitleText:accessibilityButtonBackgroundTintColor:", v7, v10, v31, v33, v30 & 1, v32);
  -[SUUINavigationController existingPaletteForEdge:](self, "existingPaletteForEdge:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController _setNavigationPalette:hidesPaletteShadow:](self, "_setNavigationPalette:hidesPaletteShadow:", v36, v27);

  v6 = v28;
  v12 = v94;
  v8 = v97;
LABEL_63:

}

uint64_t __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", *(double *)(a1 + 80));

    objc_msgSend(*(id *)(a1 + 32), "_setShadowAlpha:", *(double *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 40), "_configureNavigationBar:withTintColor:tintAdjustmentMode:titleTextTintColor:shouldTintTitleText:accessibilityButtonBackgroundTintColor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 64));
    return objc_msgSend(*(id *)(a1 + 40), "_setNavigationPalette:hidesPaletteShadow:", *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 105));
  }
  return result;
}

uint64_t __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar:withTintColor:tintAdjustmentMode:titleTextTintColor:shouldTintTitleText:accessibilityButtonBackgroundTintColor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 64));
}

void __103__SUUINavigationController__configureNavigationBarForViewController_shouldIgnoreTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_setBackgroundView:", *(_QWORD *)(a1 + 48));
    objc_setAssociatedObject(*(id *)(a1 + 40), "com.apple.iTunesStoreUI.SUUINavigationController.originalBackgroundView", 0, (void *)1);
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  }
  if ((objc_msgSend(v6, "isCancelled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "_setNavigationPalette:hidesPaletteShadow:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 89));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_backgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 72));

    objc_msgSend(*(id *)(a1 + 40), "_setShadowAlpha:", *(double *)(a1 + 80));
    v4 = *(void **)(a1 + 56);
    objc_msgSend(v4, "existingPaletteForEdge:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setNavigationPalette:hidesPaletteShadow:", v5, *(unsigned __int8 *)(a1 + 88));

  }
  if (*(_BYTE *)(a1 + 90))
    objc_msgSend(*(id *)(a1 + 64), "SUUI_endHidingPaletteShadow");

}

- (void)_scheduleConfigurationOfNavigationBar
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[SUUINavigationController transitionCoordinator](self, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUINavigationController _configureNavigationBarForViewController:shouldIgnoreTransitionCoordinator:](self, "_configureNavigationBarForViewController:shouldIgnoreTransitionCoordinator:", v4, 0);

  if (v3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __65__SUUINavigationController__scheduleConfigurationOfNavigationBar__block_invoke;
    v5[3] = &unk_2511F4640;
    v5[4] = self;
    objc_msgSend(v3, "animateAlongsideTransition:completion:", 0, v5);
  }

}

uint64_t __65__SUUINavigationController__scheduleConfigurationOfNavigationBar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleConfigurationOfNavigationBar");
}

- (void)_setNavigationPalette:(id)a3 hidesPaletteShadow:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  int v7;
  id object;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    object = v5;
    objc_getAssociatedObject(v5, (const void *)kHasBeginHidingPaletteShadow);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v4)
    {
      v5 = object;
      if ((v7 & 1) == 0)
      {
        objc_setAssociatedObject(object, (const void *)kHasBeginHidingPaletteShadow, MEMORY[0x24BDBD1C8], (void *)1);
        objc_msgSend(object, "SUUI_beginHidingPaletteShadow");
LABEL_7:
        v5 = object;
      }
    }
    else
    {
      v5 = object;
      if (v7)
      {
        objc_setAssociatedObject(object, (const void *)kHasBeginHidingPaletteShadow, 0, (void *)1);
        objc_msgSend(object, "SUUI_endHidingPaletteShadow");
        goto LABEL_7;
      }
    }
  }

}

- (BOOL)_topViewControllerPrefersNavigationBarBackgroundViewHidden
{
  void *v2;
  char v3;

  -[SUUINavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_257201C40))
    v3 = objc_msgSend(v2, "prefersNavigationBarBackgroundViewHidden");
  else
    v3 = 0;

  return v3;
}

- (void)_viewControllerNeedsNavigationBarAppearanceUpdate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SUUINavigationController topViewController](self, "topViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SUUINavigationController transitionCoordinator](self, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SUUINavigationController topViewController](self, "topViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUINavigationController _configureNavigationBarForViewController:shouldIgnoreTransitionCoordinator:](self, "_configureNavigationBarForViewController:shouldIgnoreTransitionCoordinator:", v7, 1);

    }
    -[SUUINavigationController _scheduleConfigurationOfNavigationBar](self, "_scheduleConfigurationOfNavigationBar");
  }
}

- (id)_accessibilityButtonBackgroundDefaultTintColor
{
  if (_accessibilityButtonBackgroundDefaultTintColor_onceToken != -1)
    dispatch_once(&_accessibilityButtonBackgroundDefaultTintColor_onceToken, &__block_literal_global);
  return (id)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
}

void __74__SUUINavigationController__accessibilityButtonBackgroundDefaultTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  _accessibilityButtonBackgroundDefaultTintColor_defaultTintColor = v0;

}

@end
