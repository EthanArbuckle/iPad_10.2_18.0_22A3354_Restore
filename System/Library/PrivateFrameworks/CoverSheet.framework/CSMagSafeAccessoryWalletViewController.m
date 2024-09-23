@implementation CSMagSafeAccessoryWalletViewController

- (CSMagSafeAccessoryWalletViewController)initWithAccessory:(id)a3
{
  CSMagSafeAccessoryWalletViewController *v3;
  CSMagSafeAccessoryWalletView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  CSMagSafeAccessoryWalletView *walletView;
  uint64_t v11;
  UIView *tapGestureView;
  uint64_t v13;
  UITapGestureRecognizer *dismissalTapGesture;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CSMagSafeAccessoryWalletViewController;
  v3 = -[CSMagSafeAccessoryViewController initWithAccessory:](&v16, sel_initWithAccessory_, a3);
  if (v3)
  {
    v4 = [CSMagSafeAccessoryWalletView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[CSMagSafeAccessoryWalletView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    walletView = v3->_walletView;
    v3->_walletView = (CSMagSafeAccessoryWalletView *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    tapGestureView = v3->_tapGestureView;
    v3->_tapGestureView = (UIView *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel__handleTap_);
    dismissalTapGesture = v3->_dismissalTapGesture;
    v3->_dismissalTapGesture = (UITapGestureRecognizer *)v13;

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessoryWalletViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);
  -[CSMagSafeAccessoryWalletViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_walletView);

  -[CSMagSafeAccessoryWalletViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_tapGestureView);

  -[UIView addGestureRecognizer:](self->_tapGestureView, "addGestureRecognizer:", self->_dismissalTapGesture);
}

- (void)viewDidAppear:(BOOL)a3
{
  CSMagSafeAccessoryWalletView *walletView;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessoryWalletViewController;
  -[CSCoverSheetViewControllerBase viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CSMagSafeAccessoryWalletViewController setIsAnimatingPresentation:](self, "setIsAnimatingPresentation:", 1);
  walletView = self->_walletView;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__CSMagSafeAccessoryWalletViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_1E8E2DB38;
  v5[4] = self;
  -[CSMagSafeAccessoryWalletView performAnimation:completionHandler:](walletView, "performAnimation:completionHandler:", 0, v5);
}

uint64_t __56__CSMagSafeAccessoryWalletViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPresentation:", 0);
}

- (void)viewDidLayoutSubviews
{
  UIView *tapGestureView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessoryWalletViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  tapGestureView = self->_tapGestureView;
  -[CSMagSafeAccessoryWalletViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIView setFrame:](tapGestureView, "setFrame:");

}

- (id)accessoryView
{
  return self->_walletView;
}

- (double)animationDurationBeforeDismissal
{
  double result;

  -[CSMagSafeAccessoryWalletView animationDurationBeforeDismissal](self->_walletView, "animationDurationBeforeDismissal");
  return result;
}

- (void)_handleTap:(id)a3
{
  if (self->_dismissalTapGesture == a3)
    -[CSMagSafeAccessoryWalletViewController _dismissIfAllowed](self, "_dismissIfAllowed");
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

- (CSMagSafeAccessoryWalletView)walletView
{
  return self->_walletView;
}

- (void)setWalletView:(id)a3
{
  objc_storeStrong((id *)&self->_walletView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletView, 0);
  objc_storeStrong((id *)&self->_dismissalTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGestureView, 0);
}

@end
