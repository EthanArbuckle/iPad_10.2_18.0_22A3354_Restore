@implementation _SFPopoverPresentationDelegate

- (_SFPopoverPresentationDelegate)initWithSourceInfo:(id)a3
{
  id v5;
  _SFPopoverPresentationDelegate *v6;
  _SFPopoverPresentationDelegate *v7;
  _SFPopoverPresentationDelegate *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPopoverPresentationDelegate;
  v6 = -[_SFPopoverPresentationDelegate init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_nestsAdaptiveSheetPresentationInNavigationController = 257;
    objc_storeStrong((id *)&v6->_sourceInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (void)attachToPopoverPresentationController:(id)a3
{
  UIPopoverPresentationController **p_popoverPresentationController;
  id object;

  if (a3)
  {
    p_popoverPresentationController = &self->_popoverPresentationController;
    object = a3;
    objc_storeWeak((id *)p_popoverPresentationController, object);
    objc_msgSend(object, "setDelegate:", self);
    objc_msgSend(object, "setPassthroughViews:", 0);
    objc_msgSend(object, "setPermittedArrowDirections:", 3);
    objc_msgSend(object, "_setIgnoreBarButtonItemSiblings:", 1);
    -[_SFPopoverPresentationDelegate updatePopoverPosition](self, "updatePopoverPosition");
    objc_setAssociatedObject(object, &popoverPresentationDelegateKey, self, (void *)1);

  }
}

- (void)updatePopoverPosition
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_popoverPresentationController);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("popover presentation delegate (%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _SFContextInfoWithComment();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = WeakRetained;
  v10 = v12;
  _SFPopoverSourceInfoUnwrap();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_popoverUsesAdaptivePresentationInCompact && objc_msgSend(v7, "horizontalSizeClass") == 1)
    v9 = 2;
  else
    v9 = -1;

  return v9;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;

  if (self->_nestsAdaptiveSheetPresentationInNavigationController)
  {
    objc_msgSend(a3, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 != 2
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = v5;
    }
    else
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("popover presentation delegate (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SFContextInfoWithComment();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15 = v5;
  v13 = v5;
  _SFPopoverSourceInfoUnwrap();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id object;

  object = objc_loadWeakRetained((id *)&self->_popoverPresentationController);
  objc_msgSend(object, "setDelegate:", 0);
  objc_setAssociatedObject(object, &popoverPresentationDelegateKey, 0, (void *)1);

}

+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToReloadButtonInNavigationBar:(id)a4
{
  id v5;
  id v6;
  _SFPopoverPresentationDelegate *v7;
  void *v8;
  _SFPopoverPresentationDelegate *v9;

  v5 = a4;
  v6 = a3;
  v7 = [_SFPopoverPresentationDelegate alloc];
  objc_msgSend(v5, "reloadButtonPopoverSourceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_SFPopoverPresentationDelegate initWithSourceInfo:](v7, "initWithSourceInfo:", v8);
  -[_SFPopoverPresentationDelegate attachToPopoverPresentationController:](v9, "attachToPopoverPresentationController:", v6);

}

+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToURLOutlineInNavigationBar:(id)a4
{
  objc_msgSend(a1, "attachDelegateToPopoverPresentationController:anchoredToURLOutlineInNavigationBar:usesAdaptivePresentationInCompact:", a3, a4, 1);
}

+ (void)attachDelegateToPopoverPresentationController:(id)a3 anchoredToURLOutlineInNavigationBar:(id)a4 usesAdaptivePresentationInCompact:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _SFPopoverPresentationDelegate *v9;
  void *v10;
  _SFPopoverPresentationDelegate *v11;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = [_SFPopoverPresentationDelegate alloc];
  objc_msgSend(v7, "URLOutlinePopoverSourceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_SFPopoverPresentationDelegate initWithSourceInfo:](v9, "initWithSourceInfo:", v10);
  -[_SFPopoverPresentationDelegate setPopoverUsesAdaptivePresentationInCompact:](v11, "setPopoverUsesAdaptivePresentationInCompact:", v5);
  -[_SFPopoverPresentationDelegate attachToPopoverPresentationController:](v11, "attachToPopoverPresentationController:", v8);

}

- (BOOL)nestsAdaptiveSheetPresentationInNavigationController
{
  return self->_nestsAdaptiveSheetPresentationInNavigationController;
}

- (void)setNestsAdaptiveSheetPresentationInNavigationController:(BOOL)a3
{
  self->_nestsAdaptiveSheetPresentationInNavigationController = a3;
}

- (BOOL)popoverUsesAdaptivePresentationInCompact
{
  return self->_popoverUsesAdaptivePresentationInCompact;
}

- (void)setPopoverUsesAdaptivePresentationInCompact:(BOOL)a3
{
  self->_popoverUsesAdaptivePresentationInCompact = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_popoverPresentationController);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
}

@end
