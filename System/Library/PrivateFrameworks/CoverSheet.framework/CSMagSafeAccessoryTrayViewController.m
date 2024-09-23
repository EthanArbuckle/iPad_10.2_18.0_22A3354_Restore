@implementation CSMagSafeAccessoryTrayViewController

- (CSMagSafeAccessoryTrayViewController)initWithAccessory:(id)a3
{
  id v4;
  CSMagSafeAccessoryTrayViewController *v5;
  CSMagSafeAccessoryTrayView *v6;
  void *v7;
  uint64_t v8;
  CSMagSafeAccessoryTrayView *trayView;
  UIView *v10;
  UIView *tapGestureView;
  uint64_t v12;
  UITapGestureRecognizer *dismissalTapGesture;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSMagSafeAccessoryTrayViewController;
  v5 = -[CSMagSafeAccessoryViewController initWithAccessory:](&v15, sel_initWithAccessory_, v4);
  if (v5)
  {
    v6 = [CSMagSafeAccessoryTrayView alloc];
    -[CSMagSafeAccessoryTrayViewController _trayColorForAccessory:](v5, "_trayColorForAccessory:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CSMagSafeAccessoryTrayView initWithTrayColor:](v6, "initWithTrayColor:", v7);
    trayView = v5->_trayView;
    v5->_trayView = (CSMagSafeAccessoryTrayView *)v8;

    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    tapGestureView = v5->_tapGestureView;
    v5->_tapGestureView = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v5, sel__handleTap_);
    dismissalTapGesture = v5->_dismissalTapGesture;
    v5->_dismissalTapGesture = (UITapGestureRecognizer *)v12;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessoryTrayViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);
  -[CSMagSafeAccessoryTrayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_trayView);

  -[CSMagSafeAccessoryTrayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_tapGestureView);

  -[UIView addGestureRecognizer:](self->_tapGestureView, "addGestureRecognizer:", self->_dismissalTapGesture);
}

- (void)viewDidAppear:(BOOL)a3
{
  CSMagSafeAccessoryTrayView *trayView;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessoryTrayViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CSMagSafeAccessoryTrayViewController setIsAnimatingPresentation:](self, "setIsAnimatingPresentation:", 1);
  trayView = self->_trayView;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__CSMagSafeAccessoryTrayViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_1E8E2DB38;
  v5[4] = self;
  -[CSMagSafeAccessoryTrayView performAnimation:completionHandler:](trayView, "performAnimation:completionHandler:", 0, v5);
}

uint64_t __54__CSMagSafeAccessoryTrayViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPresentation:", 0);
}

- (void)viewDidLayoutSubviews
{
  UIView *tapGestureView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessoryTrayViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  tapGestureView = self->_tapGestureView;
  -[CSMagSafeAccessoryTrayViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIView setFrame:](tapGestureView, "setFrame:");

}

- (id)_trayColorForAccessory:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 2 || objc_msgSend(v3, "type") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "primaryColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessoryView
{
  return self->_trayView;
}

- (double)animationDurationBeforeDismissal
{
  double result;

  -[CSMagSafeAccessoryTrayView animationDurationBeforeDismissal](self->_trayView, "animationDurationBeforeDismissal");
  return result;
}

- (void)_handleTap:(id)a3
{
  if (self->_dismissalTapGesture == a3)
    -[CSMagSafeAccessoryTrayViewController _dismissIfAllowed](self, "_dismissIfAllowed");
}

- (void)_dismissIfAllowed
{
  if (-[CSMagSafeAccessoryViewController allowsQuickDismissal](self, "allowsQuickDismissal"))
    -[CSCoverSheetViewControllerBase dismiss](self, "dismiss");
}

- (BOOL)isAnimatingPresentation
{
  return self->_isAnimatingPresentation;
}

- (void)setIsAnimatingPresentation:(BOOL)a3
{
  self->_isAnimatingPresentation = a3;
}

- (CSMagSafeAccessoryTrayView)trayView
{
  return self->_trayView;
}

- (void)setTrayView:(id)a3
{
  objc_storeStrong((id *)&self->_trayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayView, 0);
  objc_storeStrong((id *)&self->_dismissalTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGestureView, 0);
}

@end
