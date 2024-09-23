@implementation GKNavigationController

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (GKNavigationController)init
{
  GKNavigationController *v2;
  GKNavigationController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKNavigationController;
  v2 = -[GKNavigationController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GKNavigationController setupGKNavigationController](v2, "setupGKNavigationController");
  return v3;
}

- (GKNavigationController)initWithCoder:(id)a3
{
  GKNavigationController *v3;
  GKNavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKNavigationController;
  v3 = -[GKNavigationController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[GKNavigationController setupGKNavigationController](v3, "setupGKNavigationController");
  return v4;
}

- (GKNavigationController)initWithRootViewController:(id)a3
{
  GKNavigationController *v3;
  GKNavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKNavigationController;
  v3 = -[GKNavigationController initWithRootViewController:](&v6, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
    -[GKNavigationController setupGKNavigationController](v3, "setupGKNavigationController");
  return v4;
}

- (GKNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  GKNavigationController *v4;
  GKNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKNavigationController;
  v4 = -[GKNavigationController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[GKNavigationController setupGKNavigationController](v4, "setupGKNavigationController");
  return v5;
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  return objc_alloc_init((Class)a1);
}

- (void)setupGKNavigationController
{
  void *v3;
  GKNavigationController *v4;
  void *v5;
  void *v6;

  -[GKNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (GKNavigationController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[GKNavigationController navigationBar](self, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKNavigationController setDeferredTransitions:](self, "setDeferredTransitions:", v6);

  -[GKNavigationController setRestorationClass:](self, "setRestorationClass:", objc_opt_class());
  -[GKNavigationController _setClipUnderlapWhileTransitioning:](self, "_setClipUnderlapWhileTransitioning:", 1);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  -[GKNavigationController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") || *MEMORY[0x1E0D253F8])
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5)
  {

    return 2;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  if (v9 >= 414.0 && v11 >= 736.0)
  {
LABEL_13:

  }
  else
  {

    v6 = 2;
    if (v9 < 736.0 || v11 < 414.0)
      return v6;
  }
  -[GKNavigationController topViewController](self, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = (id)objc_msgSend(v13, "supportedInterfaceOrientations");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GKNavigationController;
    v15 = -[GKNavigationController supportedInterfaceOrientations](&v17, sel_supportedInterfaceOrientations);
  }
  v6 = (unint64_t)v15;

  return v6;
}

- (BOOL)shouldAutorotate
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL result;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  -[GKNavigationController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") || *MEMORY[0x1E0D253F8])
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5)
  {

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  if (v9 >= 414.0 && v11 >= 736.0)
  {
LABEL_13:

LABEL_14:
    v13.receiver = self;
    v13.super_class = (Class)GKNavigationController;
    return -[GKNavigationController shouldAutorotate](&v13, sel_shouldAutorotate);
  }

  result = 0;
  if (v9 >= 736.0 && v11 >= 414.0)
    goto LABEL_14;
  return result;
}

- (BOOL)hasEmbeddedPopoverNavigationStack
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[GKNavigationController viewControllers](self, "viewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v6, "hasEmbeddedPopoverNavigationStack") & 1) != 0)
            goto LABEL_13;
        }
        else
        {
          objc_msgSend(v6, "_gkSourcePresentingViewController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
          {
LABEL_13:
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_14:

  return v3;
}

- (id)popEmbeddedPopoverViewControllers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[GKNavigationController viewControllers](self, "viewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v4)
  {
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v25;
LABEL_3:
  v8 = 0;
  v9 = v6;
  v6 += v5;
  while (1)
  {
    if (*(_QWORD *)v25 != v7)
      objc_enumerationMutation(v3);
    v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "popEmbeddedPopoverViewControllers");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v13 = (void *)v11;
        goto LABEL_17;
      }
      goto LABEL_10;
    }
    objc_msgSend(v10, "_gkSourcePresentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      break;
LABEL_10:
    ++v9;
    if (v5 == ++v8)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v5)
        goto LABEL_3;
      goto LABEL_16;
    }
  }
  -[GKNavigationController viewControllers](self, "viewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[GKNavigationController viewControllers](self, "viewControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count") - (isKindOfClass & 1) - v9;

  if (v18 < 1)
    goto LABEL_16;
  -[GKNavigationController viewControllers](self, "viewControllers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subarrayWithRange:", v9, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[GKNavigationController viewControllers](self, "viewControllers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", v9 - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[GKNavigationController popToViewController:animated:](self, "popToViewController:animated:", v21, 0);

  }
LABEL_17:

  return v13;
}

- (void)_gkPushPresentedViewControllerForCompactSizeClass:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "viewControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[GKNavigationController pushViewController:animated:](self, "pushViewController:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (id)_gkViewControllersForRestoringPopover
{
  void *v3;

  if (-[GKNavigationController hasEmbeddedPopoverNavigationStack](self, "hasEmbeddedPopoverNavigationStack"))
  {
    -[GKNavigationController popEmbeddedPopoverViewControllers](self, "popEmbeddedPopoverViewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_gkRestorePopoverWithViewControllers:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkSourcePresentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "_gkRestorePopoverWithViewControllers:completion:", v8, v5);

  }
}

- (id)targetViewControllerForAction:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GKNavigationController viewControllers](self, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
    goto LABEL_13;
  v6 = v5;
  v7 = *(_QWORD *)v14;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "targetViewControllerForAction:", a3);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_11;
        v10 = v9;
      }
      v11 = v10;
      if (v10)
        goto LABEL_14;
LABEL_11:
      ++v8;
    }
    while (v6 != v8);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v6);
LABEL_13:
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)willShowViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKNavigationController;
  -[GKNavigationController willShowViewController:animated:](&v4, sel_willShowViewController_animated_, a3, a4);
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKNavigationController;
  -[GKNavigationController didShowViewController:animated:](&v5, sel_didShowViewController_animated_, a3, a4);
  -[GKNavigationController _performDeferredTransition](self, "_performDeferredTransition");
}

- (void)_performDeferredTransition
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;

  -[GKNavigationController deferredTransitions](self, "deferredTransitions");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v3 = -[GKNavigationController _isTransitioning](self, "_isTransitioning");

    if ((v3 & 1) == 0)
    {
      -[GKNavigationController deferredTransitions](self, "deferredTransitions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKNavigationController deferredTransitions](self, "deferredTransitions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v5);

      switch(objc_msgSend(v5, "type"))
      {
        case 0u:
          v15.receiver = self;
          v15.super_class = (Class)GKNavigationController;
          v7 = -[GKNavigationController popViewControllerAnimated:](&v15, sel_popViewControllerAnimated_, objc_msgSend(v5, "animated"));
          goto LABEL_8;
        case 1u:
          objc_msgSend(v5, "viewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v14.receiver = self;
          v14.super_class = (Class)GKNavigationController;
          v9 = -[GKNavigationController popToViewController:animated:](&v14, sel_popToViewController_animated_, v8, objc_msgSend(v5, "animated"));
          goto LABEL_10;
        case 2u:
          v13.receiver = self;
          v13.super_class = (Class)GKNavigationController;
          v7 = -[GKNavigationController popToRootViewControllerAnimated:](&v13, sel_popToRootViewControllerAnimated_, objc_msgSend(v5, "animated"));
LABEL_8:
          v10 = v7;
          break;
        case 3u:
          objc_msgSend(v5, "viewController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12.receiver = self;
          v12.super_class = (Class)GKNavigationController;
          -[GKNavigationController pushViewController:animated:](&v12, sel_pushViewController_animated_, v8, objc_msgSend(v5, "animated"));
LABEL_10:

          break;
        default:
          break;
      }

    }
  }
  else
  {

  }
}

- (void)_deferTransitionOfType:(int)a3 withViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setViewController:", v8);

  objc_msgSend(v10, "setType:", v6);
  objc_msgSend(v10, "setAnimated:", v5);
  -[GKNavigationController deferredTransitions](self, "deferredTransitions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject **v5;
  NSObject *v6;
  id v7;
  objc_super v9;

  v3 = a3;
  if (-[GKNavigationController _isTransitioning](self, "_isTransitioning"))
  {
    -[GKNavigationController _deferTransitionOfType:withViewController:animated:](self, "_deferTransitionOfType:withViewController:animated:", 0, 0, v3);
    v5 = (NSObject **)MEMORY[0x1E0D25460];
    v6 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v7 = (id)GKOSLoggers();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[GKNavigationController popViewControllerAnimated:].cold.1(v6);
    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKNavigationController;
    -[GKNavigationController popViewControllerAnimated:](&v9, sel_popViewControllerAnimated_, v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  void *v11;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  if (-[GKNavigationController _isTransitioning](self, "_isTransitioning"))
  {
    -[GKNavigationController _deferTransitionOfType:withViewController:animated:](self, "_deferTransitionOfType:withViewController:animated:", 1, v6, v4);

    v7 = (NSObject **)MEMORY[0x1E0D25460];
    v8 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v9 = (id)GKOSLoggers();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[GKNavigationController popToViewController:animated:].cold.1(v8);
    return 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)GKNavigationController;
    -[GKNavigationController popToViewController:animated:](&v12, sel_popToViewController_animated_, v6, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject **v5;
  NSObject *v6;
  id v7;
  objc_super v9;

  v3 = a3;
  if (-[GKNavigationController _isTransitioning](self, "_isTransitioning"))
  {
    -[GKNavigationController _deferTransitionOfType:withViewController:animated:](self, "_deferTransitionOfType:withViewController:animated:", 2, 0, v3);
    v5 = (NSObject **)MEMORY[0x1E0D25460];
    v6 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v7 = (id)GKOSLoggers();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[GKNavigationController popToRootViewControllerAnimated:].cold.1(v6);
    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKNavigationController;
    -[GKNavigationController popToRootViewControllerAnimated:](&v9, sel_popToRootViewControllerAnimated_, v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  if (-[GKNavigationController _isTransitioning](self, "_isTransitioning"))
  {
    -[GKNavigationController _deferTransitionOfType:withViewController:animated:](self, "_deferTransitionOfType:withViewController:animated:", 3, v6, v4);

    v7 = (NSObject **)MEMORY[0x1E0D25460];
    v8 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v9 = (id)GKOSLoggers();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[GKNavigationController pushViewController:animated:].cold.1(v8);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKNavigationController;
    -[GKNavigationController pushViewController:animated:](&v10, sel_pushViewController_animated_, v6, v4);

  }
}

- (NSMutableArray)deferredTransitions
{
  return self->_deferredTransitions;
}

- (void)setDeferredTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_deferredTransitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredTransitions, 0);
}

- (void)popViewControllerAnimated:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_2_1(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AB361000, v4, v5, "Deferring popViewController:animated:\n%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

- (void)popToViewController:(void *)a1 animated:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_2_1(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AB361000, v4, v5, "Deferring popToViewController:animated:\n%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

- (void)popToRootViewControllerAnimated:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_2_1(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AB361000, v4, v5, "Deferring popToRootViewControllerAnimated:\n%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

- (void)pushViewController:(void *)a1 animated:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_2_1(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AB361000, v4, v5, "Deferring pushViewController:animated:\n%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_3();
}

@end
