@implementation CSPresentationViewController

- (NSArray)contentViewControllers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_contentViewControllers, "copy");
}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CSPresentationViewController;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v23, sel_aggregateBehavior_, v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_activeContentViewControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "unionBehavior:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_contentViewControllers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v4, "addRestrictedCapabilities:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "restrictedCapabilities", (_QWORD)v15));
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v12);
  }

  if (!-[NSMutableArray count](self->_contentViewControllers, "count"))
    objc_msgSend(v4, "addRestrictedCapabilities:", 0x4000000);

}

- (CSPresentationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CSPresentationViewController *v4;
  uint64_t v5;
  NSMutableArray *contentViewControllers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSPresentationViewController;
  v4 = -[CSCoverSheetViewControllerBase initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    contentViewControllers = v4->_contentViewControllers;
    v4->_contentViewControllers = (NSMutableArray *)v5;

  }
  return v4;
}

- (NSArray)presentedViewControllers
{
  return (NSArray *)(id)-[NSArray copy](self->_activeContentViewControllers, "copy");
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[CSPresentationViewController contentViewControllers](self, "contentViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isPresentingContent
{
  void *v2;
  BOOL v3;

  -[CSPresentationViewController presentedViewControllers](self, "presentedViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isTransitioning
{
  return self->_transitioning != 0;
}

- (void)presentContentViewController:(id)a3 animated:(BOOL)a4
{
  -[CSPresentationViewController presentContentViewController:animated:completion:](self, "presentContentViewController:animated:completion:", a3, a4, 0);
}

- (void)presentContentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a4;
    v12 = a3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a5;
    v10 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSPresentationViewController presentContentViewControllers:animated:completion:](self, "presentContentViewControllers:animated:completion:", v11, v5, v9, v12, v13);
  }
}

- (void)presentContentViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD);
  id v21;
  _BOOL4 v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v22 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (!v9)
    goto LABEL_14;
  v10 = v9;
  v20 = v8;
  v11 = 0;
  v12 = *(_QWORD *)v25;
  v21 = v7;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      if ((-[NSMutableArray containsObject:](self->_contentViewControllers, "containsObject:", v14, v20) & 1) == 0)
      {
        SBLogDashBoard();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromBOOL();
          v18 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v29 = v23;
          v30 = 2112;
          v31 = v17;
          v32 = 2114;
          v33 = v18;
          v19 = (void *)v18;
          _os_log_debug_impl(&dword_1D0337000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Adding content view controller %@ (animated: %{public}@)", buf, 0x20u);

          v7 = v21;
        }

        -[NSMutableArray insertObject:atIndex:](self->_contentViewControllers, "insertObject:atIndex:", v14, 0);
        objc_msgSend(v14, "rebuildBehavior");
        v11 = 1;
      }
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  }
  while (v10);
  v8 = v20;
  if ((v11 & 1) != 0)
  {
    -[NSMutableArray sortWithOptions:usingComparator:](self->_contentViewControllers, "sortWithOptions:usingComparator:", 16, &__block_literal_global_15);
    -[CSPresentationViewController _updateContentViewControllersAnimated:completion:](self, "_updateContentViewControllersAnimated:completion:", v22, v20);
  }
  else
  {
LABEL_14:
    if (v8)
      v8[2](v8);
  }

}

uint64_t __82__CSPresentationViewController_presentContentViewControllers_animated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "presentationPriority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "presentationPriority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    v9 = objc_msgSend(v4, "presentationType");
    v10 = objc_msgSend(v5, "presentationType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "compare:", v12);

  }
  return v8;
}

- (void)dismissContentViewController:(id)a3 animated:(BOOL)a4
{
  -[CSPresentationViewController dismissContentViewController:animated:completion:](self, "dismissContentViewController:animated:completion:", a3, a4, 0);
}

- (void)dismissContentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a4;
    v12 = a3;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = a5;
    v10 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSPresentationViewController dismissContentViewControllers:animated:completion:](self, "dismissContentViewControllers:animated:completion:", v11, v5, v9, v12, v13);
  }
}

- (void)dismissContentViewControllers:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD);
  id v21;
  _BOOL4 v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v22 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (!v9)
    goto LABEL_14;
  v10 = v9;
  v20 = v8;
  v11 = 0;
  v12 = *(_QWORD *)v25;
  v21 = v7;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v7);
      v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
      if (-[NSMutableArray containsObject:](self->_contentViewControllers, "containsObject:", v14, v20))
      {
        SBLogDashBoard();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromBOOL();
          v18 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v29 = v23;
          v30 = 2112;
          v31 = v17;
          v32 = 2114;
          v33 = v18;
          v19 = (void *)v18;
          _os_log_debug_impl(&dword_1D0337000, v15, OS_LOG_TYPE_DEBUG, "%{public}@: Removing content view controller %@ (animated: %{public}@)", buf, 0x20u);

          v7 = v21;
        }

        -[NSMutableArray removeObject:](self->_contentViewControllers, "removeObject:", v14);
        v11 = 1;
      }
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  }
  while (v10);
  v8 = v20;
  if ((v11 & 1) != 0)
  {
    -[CSPresentationViewController _updateContentViewControllersAnimated:completion:](self, "_updateContentViewControllersAnimated:completion:", v22, v20);
  }
  else
  {
LABEL_14:
    if (v8)
      v8[2](v8);
  }

}

- (void)dismissPresentationAnimated:(BOOL)a3
{
  -[CSPresentationViewController dismissPresentationAnimated:completion:](self, "dismissPresentationAnimated:completion:", a3, 0);
}

- (void)dismissPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v7 = a4;
  SBLogDashBoard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CSPresentationViewController dismissPresentationAnimated:completion:].cold.1((uint64_t)self, (uint64_t)a2, v8);

  -[NSMutableArray removeAllObjects](self->_contentViewControllers, "removeAllObjects");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__CSPresentationViewController_dismissPresentationAnimated_completion___block_invoke;
  v10[3] = &unk_1E8E2DF80;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[CSPresentationViewController _updateContentViewControllersAnimated:completion:](self, "_updateContentViewControllersAnimated:completion:", v4, v10);

}

uint64_t __71__CSPresentationViewController_dismissPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CSPresentationViewController;
  objc_msgSendSuper2(&v3, sel_dismiss);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updatePresentationAnimated:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.35);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[CSPresentationViewController _reflowPresentationWithAnimationSettings:](self, "_reflowPresentationWithAnimationSettings:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CSPresentationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setAutoresizesSubviews:", 1);
  v5.receiver = self;
  v5.super_class = (Class)CSPresentationViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);
  -[CSPresentationViewController _updateContentViewControllersAnimated:completion:](self, "_updateContentViewControllersAnimated:completion:", 0, 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  NSArray *activeContentViewControllers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CSPresentationViewController;
  -[CSCoverSheetViewControllerBase viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  -[CSPresentationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  activeContentViewControllers = self->_activeContentViewControllers;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__CSPresentationViewController_viewWillLayoutSubviews__block_invoke;
  v10[3] = &unk_1E8E2FAC8;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v12 = v17;
  v9 = v3;
  v11 = v9;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](activeContentViewControllers, "enumerateObjectsWithOptions:usingBlock:", 2, v10);

  _Block_object_dispose(v17, 8);
}

void __54__CSPresentationViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v4 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "insertSubview:aboveSubview:", v3);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)aggregateAppearance:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSPresentationViewController;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v14, sel_aggregateAppearance_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_activeContentViewControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(v4, "unionAppearance:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)aggregatePresentation:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSPresentationViewController;
  -[CSCoverSheetViewControllerBase aggregatePresentation:](&v14, sel_aggregatePresentation_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_activeContentViewControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(v4, "unionPresentation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)rebuildEverythingForReason:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ++self->_mutatingPresentation;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_activeContentViewControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "rebuildEverythingForReason:", v4);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  --self->_mutatingPresentation;
  v10.receiver = self;
  v10.super_class = (Class)CSPresentationViewController;
  -[CSCoverSheetViewControllerBase rebuildEverythingForReason:](&v10, sel_rebuildEverythingForReason_, v4);

}

- (int64_t)participantState
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSPresentationViewController;
  if ((id)-[CSCoverSheetViewControllerBase participantState](&v4, sel_participantState) == (id)2
    && (-[CSPresentationViewController isPresentingContent](self, "isPresentingContent") || self->_transitioning))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)handleAppearanceUpdateFromController:(id)a3 animationSettings:(id *)a4
{
  CSPresentationViewController *v6;
  CSPresentationViewController *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  id v11;
  objc_super v13;

  v6 = (CSPresentationViewController *)a3;
  v7 = v6;
  if (self->_mutatingPresentation)
  {
    v8 = 0;
  }
  else
  {
    if (v6 != self)
    {
      SBLogDashBoard();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[CSPresentationViewController handleAppearanceUpdateFromController:animationSettings:].cold.1();

      if (*a4)
      {
        v10 = objc_retainAutorelease(*a4);
        *a4 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.35);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v11;

        v10 = *a4;
      }
      -[CSPresentationViewController _reflowPresentationWithAnimationSettings:](self, "_reflowPresentationWithAnimationSettings:", v10);
    }
    v13.receiver = self;
    v13.super_class = (Class)CSPresentationViewController;
    v8 = -[CSCoverSheetViewControllerBase handleAppearanceUpdateFromController:animationSettings:](&v13, sel_handleAppearanceUpdateFromController_animationSettings_, v7, a4)|| -[NSArray containsObject:](self->_activeContentViewControllers, "containsObject:", v7);
  }

  return v8;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSPresentationViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v28, sel_handleEvent_, v4)
    && (objc_msgSend(v4, "isConsumable") & 1) != 0)
  {
LABEL_25:
    v17 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    if (objc_msgSend(v4, "isConsumable"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v5 = self->_activeContentViewControllers;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v5);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "handleEvent:", v4))
            {

              goto LABEL_25;
            }
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
          if (v7)
            continue;
          break;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_contentViewControllers);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSPresentationViewController childViewControllers](self, "childViewControllers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectsInArray:", v11);

      SBLogDashBoard();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", self);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v19;
        v32 = 2114;
        v33 = v4;
        v34 = 2112;
        v35 = v10;
        _os_log_debug_impl(&dword_1D0337000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ - Sending event %{public}@ to non-active content view controllers: %@", buf, 0x20u);

      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v5 = v10;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "handleEvent:", v4, (_QWORD)v20);
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        }
        while (v14);
      }

    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSPresentationViewController;
  if (-[CSCoverSheetViewControllerBase wouldHandleButtonEvent:](&v14, sel_wouldHandleButtonEvent_, v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = self->_activeContentViewControllers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "wouldHandleButtonEvent:", v4, (_QWORD)v10) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (BOOL)canHostAnApp
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  char v11;
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
  v2 = self->_activeContentViewControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v7 = objc_opt_class();
          v8 = v6;
          if (v7)
            v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
          else
            v9 = 0;
          v10 = v9;

          v11 = objc_msgSend(v10, "canHostAnApp", (_QWORD)v13);
          if ((v11 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_17;
          }
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_17:

  return v3;
}

- (BOOL)isHostingAnApp
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  char v11;
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
  v2 = self->_activeContentViewControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v7 = objc_opt_class();
          v8 = v6;
          if (v7)
            v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
          else
            v9 = 0;
          v10 = v9;

          v11 = objc_msgSend(v10, "isHostingAnApp", (_QWORD)v13);
          if ((v11 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_17;
          }
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_17:

  return v3;
}

- (id)hostedAppSceneHandle
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_activeContentViewControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = objc_opt_class();
        v9 = v7;
        if (v8)
          v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
        else
          v10 = 0;
        v11 = v10;

        objc_msgSend(v11, "hostedAppSceneHandle", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          break;
      }
      if (v4 == ++v6)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v12 = 0;
  }

  return v12;
}

- (id)hostedAppSceneHandles
{
  void *v2;
  void *v3;

  -[NSArray bs_compactMap:](self->_activeContentViewControllers, "bs_compactMap:", &__block_literal_global_34);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_flatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __53__CSPresentationViewController_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_opt_class();
    v4 = v2;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v7 = v5;

    objc_msgSend(v7, "hostedAppSceneHandles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (BOOL)handlesRotationIndependentOfCoverSheet
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  char v11;
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
  v2 = self->_activeContentViewControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v7 = objc_opt_class();
          v8 = v6;
          if (v7)
            v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
          else
            v9 = 0;
          v10 = v9;

          v11 = objc_msgSend(v10, "handlesRotationIndependentOfCoverSheet", (_QWORD)v13);
          if ((v11 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_17;
          }
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_17:

  return v3;
}

- (NSString)description
{
  return (NSString *)-[CSPresentationViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSPresentationViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSPresentationViewController isPresentingContent](self, "isPresentingContent"), CFSTR("presentingContent"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSPresentationViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  CSPresentationViewController *v10;

  v4 = a3;
  -[CSPresentationViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSPresentationViewController isPresentingContent](self, "isPresentingContent")
    || (-[CSPresentationViewController viewIfLoaded](self, "viewIfLoaded"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__CSPresentationViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E8E2DC00;
    v9 = v5;
    v10 = self;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  }
  return v5;
}

void __70__CSPresentationViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;

  v2 = (void *)MEMORY[0x1E0D01748];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", CFSTR("presenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("presenter"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("view"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_appearState");
  SBFStringForAppearState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("appearState"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "presentedViewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendArraySection:withName:skipIfEmpty:", v14, CFSTR("presentedViewControllers"), 1);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentViewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendArraySection:withName:skipIfEmpty:", v16, CFSTR("contentViewControllers"), 1);

  v17 = *(void **)(a1 + 32);
  +[CSAppearance appearanceForProvider:](CSAppearance, "appearanceForProvider:", *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "appendObject:withName:", v18, CFSTR("appearance"));

  v20 = *(void **)(a1 + 32);
  +[CSBehavior behaviorForProvider:](CSBehavior, "behaviorForProvider:", *(_QWORD *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v20, "appendObject:withName:", v21, CFSTR("behavior"));

  v23 = *(void **)(a1 + 32);
  +[CSPresentation presentationForProvider:](CSPresentation, "presentationForProvider:", *(_QWORD *)(a1 + 40));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "appendObject:withName:", v25, CFSTR("presentation"));

}

- (void)_updateContentViewControllersAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *activeContentViewControllers;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  id v39;
  id v40;
  id v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  _BOOL8 v58;
  id v59;
  id v60;
  id v61;
  objc_class *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  void *v72;
  void (**v73)(_QWORD);
  void *v74;
  void *v75;
  id v76;
  id obj;
  id obja;
  void *v79;
  void *v80;
  id v81;
  _QWORD v82[6];
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD v87[6];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  objc_super v92;
  _QWORD v93[5];
  id v94;
  CSPresentationViewController *v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  CSPresentationViewController *v104;
  void (**v105)(_QWORD);
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[128];
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  void *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v4 = a3;
  v117 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v8 = self->_contentViewControllers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v107;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v107 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v12);
      objc_msgSend(v7, "addObject:", v13);
      if (objc_msgSend(v13, "presentationType") == 2)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_activeContentViewControllers);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v15) & 1) == 0
    && -[CSPresentationViewController isViewLoaded](self, "isViewLoaded"))
  {
    ++self->_mutatingPresentation;
    ++self->_transitioning;
    objc_msgSend(v15, "minusSet:", v14);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minusSet:", v16);

    v17 = (NSArray *)objc_msgSend(v7, "copy");
    activeContentViewControllers = self->_activeContentViewControllers;
    v68 = 1064;
    self->_activeContentViewControllers = v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke;
    v102[3] = &unk_1E8E2FB30;
    v81 = v19;
    v103 = v81;
    v104 = self;
    v105 = v6;
    v20 = MEMORY[0x1D17E1614](v102);
    v21 = objc_msgSend(v15, "count");
    v22 = objc_msgSend(v14, "count");
    v69 = (void *)v20;
    objc_msgSend(MEMORY[0x1E0D016E8], "sentinelWithQueue:signalCount:signalHandler:", MEMORY[0x1E0C80D38], v21 + v22 + 1, v20);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v15;
    v72 = v7;
    v73 = v6;
    v71 = v4;
    if (v4)
    {
      v23 = (void *)MEMORY[0x1E0D016B0];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "settingsWithDuration:timingFunction:", v24, 0.4);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0D016B0];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "settingsWithDuration:timingFunction:", v26, 0.4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v76 = v27;
        v74 = v76;
LABEL_18:
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v70 = v14;
        obj = v14;
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v99 != v30)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
              SBLogDashBoard();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                v42 = (objc_class *)objc_opt_class();
                NSStringFromClass(v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v32);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v112 = v43;
                v113 = 2112;
                v114 = v44;
                _os_log_debug_impl(&dword_1D0337000, v33, OS_LOG_TYPE_DEBUG, "%{public}@: Dismissing content view controller %@", buf, 0x16u);

              }
              v34 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v32, "appearanceIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "stringWithFormat:", CFSTR("Dismissing: %@"), v35, v68);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v81, "addObject:", v36);
              v37 = (void *)objc_msgSend(v79, "mutableCopy");
              objc_msgSend(v32, "presentationPreferredFrameRateRange");
              objc_msgSend(v37, "setPreferredFrameRateRange:");
              objc_msgSend(v37, "setHighFrameRateReason:", objc_msgSend(v32, "presentationFrameRateRangeReason"));
              objc_msgSend(v32, "willTransitionToPresented:", 0);
              objc_msgSend(v32, "setPresenter:", 0);
              v93[0] = MEMORY[0x1E0C809B0];
              v38 = v37 != 0;
              v93[1] = 3221225472;
              v93[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_70;
              v93[3] = &unk_1E8E2FBA8;
              v93[4] = v32;
              v94 = v37;
              v95 = self;
              v39 = v80;
              v96 = v39;
              v40 = v36;
              v97 = v40;
              v41 = v37;
              if ((-[CSPresentationViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", v32, v38, v93) & 1) == 0)objc_msgSend(v39, "signalWithContext:", v40);

            }
            v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
          }
          while (v29);
        }

        -[CSCoverSheetViewControllerBase presentationCoordinateSpace](self, "presentationCoordinateSpace");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSPresentation presentationWithCoordinateSpace:](CSPresentation, "presentationWithCoordinateSpace:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "setIdentifier:", CFSTR("PresentationAggregation"));
        v92.receiver = self;
        v92.super_class = (Class)CSPresentationViewController;
        -[CSCoverSheetViewControllerBase aggregatePresentation:](&v92, sel_aggregatePresentation_, v46);
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        obja = *(id *)((char *)&self->super.super.super.super.isa + v68);
        v47 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
        v15 = v75;
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v89;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v89 != v49)
                objc_enumerationMutation(obja);
              v51 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
              if (objc_msgSend(v15, "containsObject:", v51))
              {
                SBLogDashBoard();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                {
                  v62 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v62);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v51);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v112 = v63;
                  v113 = 2112;
                  v114 = v64;
                  _os_log_debug_impl(&dword_1D0337000, v52, OS_LOG_TYPE_DEBUG, "%@: Presenting content view controller %@", buf, 0x16u);

                }
                v53 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v51, "appearanceIdentifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "stringWithFormat:", CFSTR("Presenting: %@"), v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v81, "addObject:", v55);
                v56 = MEMORY[0x1E0C809B0];
                v87[0] = MEMORY[0x1E0C809B0];
                v87[1] = 3221225472;
                v87[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_79;
                v87[3] = &unk_1E8E2DC00;
                v87[4] = v51;
                v87[5] = self;
                objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v87);
                v57 = (void *)objc_msgSend(v74, "mutableCopy");
                objc_msgSend(v51, "presentationPreferredFrameRateRange");
                objc_msgSend(v57, "setPreferredFrameRateRange:");
                objc_msgSend(v57, "setHighFrameRateReason:", objc_msgSend(v51, "presentationFrameRateRangeReason"));
                v82[0] = v56;
                v58 = v57 != 0;
                v82[1] = 3221225472;
                v82[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2_80;
                v82[3] = &unk_1E8E2FBF8;
                v82[4] = v51;
                v82[5] = self;
                v83 = v46;
                v84 = v57;
                v59 = v80;
                v85 = v59;
                v60 = v55;
                v86 = v60;
                v61 = v57;
                if ((-[CSPresentationViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v51, v58, v82) & 1) == 0)objc_msgSend(v59, "signalWithContext:", v60);

                v15 = v75;
              }
              else
              {
                -[CSPresentationViewController _updatePresentationForViewController:presentation:animationSettings:](self, "_updatePresentationForViewController:presentation:animationSettings:", v51, v46, v76);
              }
            }
            v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
          }
          while (v48);
        }

        -[CSPresentationViewController _updatePresentationForViewController:presentation:animationSettings:](self, "_updatePresentationForViewController:presentation:animationSettings:", self, v46, v76);
        --self->_mutatingPresentation;
        -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
        if (v71)
        {
          v65 = (void *)MEMORY[0x1E0D016B0];
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "settingsWithDuration:timingFunction:", v66, 0.4);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v67 = 0;
        }
        v7 = v72;
        v6 = v73;
        v14 = v70;
        -[CSCoverSheetViewControllerBase updateAppearanceForController:withAnimationSettings:completion:](self, "updateAppearanceForController:withAnimationSettings:completion:", self, v67, 0);
        objc_msgSend(v80, "signal");

        goto LABEL_47;
      }
    }
    else
    {
      v79 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.35);
    v76 = (id)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    goto LABEL_18;
  }
  -[CSCoverSheetViewControllerBase updateBehaviorForController:](self, "updateBehaviorForController:", self);
  if (v6)
    v6[2](v6);
LABEL_47:

}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  if (objc_msgSend(v3, "isFailed"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("; "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("CSPresentationViewController: content transition completion was not called with missing signals: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], v7, 0);
  }
  else if (objc_msgSend(v3, "isComplete"))
  {
    --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1048);
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
  }
  objc_msgSend(v3, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    SBLogDashBoard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v9);
  }

}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[6];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[6];
  id v23;
  id v24;
  id v25;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "presentationTransition");
  v6 = *(_QWORD *)(a1 + 40);
  if (v5 == 1)
  {
    v7 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2;
    v22[3] = &unk_1E8E2FB58;
    v8 = *(void **)(a1 + 56);
    v22[4] = *(_QWORD *)(a1 + 48);
    v22[5] = v7;
    v25 = v3;
    v23 = v8;
    v24 = *(id *)(a1 + 64);
    v9 = v3;
    objc_msgSend(v7, "performCustomTransitionToVisible:withAnimationSettings:completion:", 0, v6, v22);

    v10 = v25;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D01908];
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3;
    v20[3] = &unk_1E8E2DB38;
    v21 = v4;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4;
    v15[3] = &unk_1E8E2FB80;
    v13 = *(_QWORD *)(a1 + 32);
    v15[4] = *(_QWORD *)(a1 + 48);
    v15[5] = v13;
    v16 = v21;
    v19 = v3;
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 64);
    v14 = v3;
    objc_msgSend(v11, "animateWithSettings:actions:completion:", v6, v20, v15);

    v10 = v21;
  }

}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_didTransitionViewController:toPresented:", *(_QWORD *)(a1 + 40), 0);
  }
  return objc_msgSend(*(id *)(a1 + 48), "signalWithContext:", *(_QWORD *)(a1 + 56));
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 0);
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
    objc_msgSend(*(id *)(a1 + 48), "setUserInteractionEnabled:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_didTransitionViewController:toPresented:", *(_QWORD *)(a1 + 40), 0);
  }
  return objc_msgSend(*(id *)(a1 + 56), "signalWithContext:", *(_QWORD *)(a1 + 64));
}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_79(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setAutoresizesSubviews:", 1);
  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(v3, "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "rebuildBehavior");
  objc_msgSend(*(id *)(a1 + 32), "setPresenter:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "willTransitionToPresented:", 1);

}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_2_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int8x16_t v15;
  _QWORD v16[4];
  int8x16_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  int8x16_t v26;
  id v27;
  id v28;
  id v29;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(*(id *)(a1 + 32), "rebuildAppearance");
  objc_msgSend(*(id *)(a1 + 40), "_updatePresentationForViewController:presentation:animationSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0);
  if (objc_msgSend(*(id *)(a1 + 32), "presentationTransition") == 1)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3_81;
    v25[3] = &unk_1E8E2FB58;
    v15 = *(int8x16_t *)(a1 + 32);
    v26 = vextq_s8(v15, v15, 8uLL);
    v29 = v3;
    v6 = *(_QWORD *)(a1 + 56);
    v27 = *(id *)(a1 + 64);
    v28 = *(id *)(a1 + 72);
    v7 = v3;
    objc_msgSend((id)v15.i64[0], "performCustomTransitionToVisible:withAnimationSettings:completion:", 1, v6, v25);

    v8 = v29;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CEABB0];
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4_82;
    v23[3] = &unk_1E8E2DB38;
    v11 = v4;
    v24 = v11;
    objc_msgSend(v9, "performWithoutAnimation:", v23);
    v12 = (void *)MEMORY[0x1E0D01908];
    v13 = *(_QWORD *)(a1 + 56);
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_5;
    v21[3] = &unk_1E8E2DB38;
    v22 = v11;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_6;
    v16[3] = &unk_1E8E2FBD0;
    v17 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    v20 = v3;
    v18 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 72);
    v14 = v3;
    objc_msgSend(v12, "animateWithSettings:actions:completion:", v13, v21, v16);

    v8 = v24;
  }

}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_3_81(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_didTransitionViewController:toPresented:", *(_QWORD *)(a1 + 40), 1);
  }
  return objc_msgSend(*(id *)(a1 + 48), "signalWithContext:", *(_QWORD *)(a1 + 56));
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_4_82(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_6(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_didTransitionViewController:toPresented:", *(_QWORD *)(a1 + 40), 1);
  }
  return objc_msgSend(*(id *)(a1 + 48), "signalWithContext:", *(_QWORD *)(a1 + 56));
}

- (void)_didTransitionViewController:(id)a3 toPresented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "didTransitionToPresented:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  objc_msgSend(WeakRetained, "presentationViewController:didTransitionViewController:toPresented:", self, v6, v4);

}

- (void)_reflowPresentationWithAnimationSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ++self->_mutatingPresentation;
  -[CSCoverSheetViewControllerBase presentationCoordinateSpace](self, "presentationCoordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSPresentation presentationWithCoordinateSpace:](CSPresentation, "presentationWithCoordinateSpace:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIdentifier:", CFSTR("PresentationAggregation"));
  v16.receiver = self;
  v16.super_class = (Class)CSPresentationViewController;
  -[CSCoverSheetViewControllerBase aggregatePresentation:](&v16, sel_aggregatePresentation_, v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_activeContentViewControllers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[CSPresentationViewController _updatePresentationForViewController:presentation:animationSettings:](self, "_updatePresentationForViewController:presentation:animationSettings:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6, v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

  -[CSPresentationViewController _updatePresentationForViewController:presentation:animationSettings:](self, "_updatePresentationForViewController:presentation:animationSettings:", self, v6, v4);
  --self->_mutatingPresentation;

}

- (void)_updatePresentationForViewController:(id)a3 presentation:(id)a4 animationSettings:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  CSPresentationViewController *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  CSPresentationViewController *v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  CSPresentationViewController *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSPresentationViewController.m"), 627, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentation"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSPresentationViewController.m"), 628, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

LABEL_3:
  SBLogDashBoard();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    v55 = self;
    v59 = v11;
    SBLogDashBoard();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v41 = (void *)objc_opt_class();
      v42 = v41;
      v43 = (void *)objc_opt_class();
      v44 = (void *)MEMORY[0x1E0D01748];
      v45 = v43;
      objc_msgSend(v44, "succinctDescriptionForObject:", v10);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v75 = v41;
      v76 = 2112;
      v77 = v43;
      v78 = 2112;
      v79 = (uint64_t)v46;
      _os_log_debug_impl(&dword_1D0337000, v14, OS_LOG_TYPE_DEBUG, "%@ updating %@ with %@", buf, 0x20u);

    }
    v54 = v9;

    v15 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v10, "regions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v57 = objc_claimAutoreleasedReturnValue();

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v10, "regions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v69;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v69 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v21);
          SBLogDashBoard();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v22;
            _os_log_debug_impl(&dword_1D0337000, v23, OS_LOG_TYPE_DEBUG, "    %@", buf, 0xCu);
          }

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      }
      while (v19);
    }

    v24 = (void *)v57;
    v11 = v59;
    v9 = v54;
    self = v55;
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)MEMORY[0x1E0D01908];
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __100__CSPresentationViewController__updatePresentationForViewController_presentation_animationSettings___block_invoke;
  v65[3] = &unk_1E8E2DC00;
  v26 = (CSPresentationViewController *)v9;
  v66 = v26;
  v27 = v10;
  v67 = v27;
  objc_msgSend(v25, "animateWithSettings:actions:", v11, v65);
  if (v26 != self)
  {
    objc_msgSend(v27, "unionPresentation:", v26);
    SBLogDashBoard();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);

    if (v29)
    {
      v60 = v11;
      v30 = (void *)MEMORY[0x1E0C99E20];
      v56 = v27;
      objc_msgSend(v27, "regions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setWithArray:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = v24;
      objc_msgSend(v32, "minusSet:", v24);
      SBLogDashBoard();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v47 = (void *)objc_opt_class();
        v48 = v47;
        v49 = (void *)objc_opt_class();
        v50 = v49;
        v51 = objc_msgSend(v32, "count");
        *(_DWORD *)buf = 138412802;
        v75 = v47;
        v76 = 2112;
        v77 = v49;
        v78 = 2048;
        v79 = v51;
        _os_log_debug_impl(&dword_1D0337000, v33, OS_LOG_TYPE_DEBUG, "%@ aggregated %@ by adding %ld regions", buf, 0x20u);

      }
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v34 = v32;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v62;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v62 != v37)
              objc_enumerationMutation(v34);
            v39 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v38);
            SBLogDashBoard();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v75 = v39;
              _os_log_debug_impl(&dword_1D0337000, v40, OS_LOG_TYPE_DEBUG, "    %@", buf, 0xCu);
            }

            ++v38;
          }
          while (v36 != v38);
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        }
        while (v36);
      }

      v24 = v58;
      v11 = v60;
      v27 = v56;
    }
  }

}

uint64_t __100__CSPresentationViewController__updatePresentationForViewController_presentation_animationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForPresentation:", *(_QWORD *)(a1 + 40));
}

- (CSPresentationViewControllerDelegate)presentationDelegate
{
  return (CSPresentationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_activeContentViewControllers, 0);
  objc_storeStrong((id *)&self->_contentViewControllers, 0);
}

- (void)dismissPresentationAnimated:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1D0337000, a3, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)handleAppearanceUpdateFromController:animationSettings:.cold.1()
{
  objc_class *v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1D0337000, v3, v4, "%{public}@ reflowing for appearance update from %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_4();
}

void __81__CSPresentationViewController__updateContentViewControllersAnimated_completion___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1D0337000, v2, v3, "%{public}@: Got signal: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

@end
