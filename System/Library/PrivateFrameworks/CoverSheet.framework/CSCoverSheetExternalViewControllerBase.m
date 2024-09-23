@implementation CSCoverSheetExternalViewControllerBase

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetExternalViewControllerBase;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CSCoverSheetExternalViewControllerBase _registerAsExternalProviderIfNeeded](self, "_registerAsExternalProviderIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetExternalViewControllerBase;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CSCoverSheetExternalViewControllerBase _unregisterAsExternalProvider](self, "_unregisterAsExternalProvider");
}

- (void)_registerAsExternalProviderIfNeeded
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  if ((-[CSCoverSheetExternalViewControllerBase isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    return;
  -[CSCoverSheetExternalViewControllerBase presentingViewController](self, "presentingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:

    return;
  }
  -[CSCoverSheetExternalViewControllerBase parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_6;
  }
  v9.receiver = self;
  v9.super_class = (Class)CSCoverSheetExternalViewControllerBase;
  -[CSCoverSheetViewControllerBase _presenter](&v9, sel__presenter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    self->_externalToDashBoard = 1;
    -[CSCoverSheetExternalViewControllerBase coverSheetViewController](self, "coverSheetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "registerExternalAppearanceProvider:", self);
      objc_msgSend(v7, "registerExternalBehaviorProvider:", self);
      objc_msgSend(v7, "registerExternalPresentationProvider:", self);
      objc_msgSend(v7, "registerExternalEventHandler:", self);
    }

  }
}

- (void)_unregisterAsExternalProvider
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  if ((-[CSCoverSheetExternalViewControllerBase isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    return;
  -[CSCoverSheetExternalViewControllerBase presentingViewController](self, "presentingViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:

    return;
  }
  -[CSCoverSheetExternalViewControllerBase parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_6;
  }
  v9.receiver = self;
  v9.super_class = (Class)CSCoverSheetExternalViewControllerBase;
  -[CSCoverSheetViewControllerBase _presenter](&v9, sel__presenter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    self->_externalToDashBoard = 0;
    -[CSCoverSheetExternalViewControllerBase coverSheetViewController](self, "coverSheetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "unregisterExternalAppearanceProvider:", self);
      objc_msgSend(v7, "unregisterExternalBehaviorProvider:", self);
      objc_msgSend(v7, "unregisterExternalPresentationProvider:", self);
      objc_msgSend(v7, "unregisterExternalEventHandler:", self);
    }

  }
}

- (id)_presenter
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSCoverSheetExternalViewControllerBase;
  -[CSCoverSheetViewControllerBase _presenter](&v5, sel__presenter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CSCoverSheetExternalViewControllerBase coverSheetViewController](self, "coverSheetViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isExternalToDashBoard
{
  return self->_externalToDashBoard;
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return (CSCoverSheetViewController *)objc_loadWeakRetained((id *)&self->_coverSheetViewController);
}

- (void)setCoverSheetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_coverSheetViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverSheetViewController);
}

@end
