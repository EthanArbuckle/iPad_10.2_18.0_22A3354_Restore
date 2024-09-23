@implementation AMUIOnboardingViewController

- (void)performPresentationAnimation
{
  -[AMUIOnboardingContainerView performPresentationAnimation](self->_onboardingContainerView, "performPresentationAnimation");
}

- (void)performDismissalAnimation
{
  -[AMUIOnboardingContainerView performDismissalAnimation](self->_onboardingContainerView, "performDismissalAnimation");
}

- (void)loadView
{
  AMUIOnboardingContainerView *v3;
  AMUIOnboardingContainerView *onboardingContainerView;
  AMUIOnboardingContainerView *v5;
  void *v6;

  v3 = objc_alloc_init(AMUIOnboardingContainerView);
  onboardingContainerView = self->_onboardingContainerView;
  self->_onboardingContainerView = v3;

  -[AMUIOnboardingContainerView setDelegate:](self->_onboardingContainerView, "setDelegate:", self);
  v5 = self->_onboardingContainerView;
  -[AMUIOnboardingViewController ambientDefaults](self, "ambientDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIOnboardingContainerView setAmbientDefaults:](v5, "setAmbientDefaults:", v6);

  -[AMUIOnboardingViewController setView:](self, "setView:", self->_onboardingContainerView);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)onboardingContainerView:(id)a3 requestsDismissalWithUserIntent:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIOnboardingViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onboardingViewController:requestsDismissalWithUserIntent:", self, v4);

}

- (AMUIOnboardingViewControllerDelegate)delegate
{
  return (AMUIOnboardingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMAmbientDefaults)ambientDefaults
{
  return (AMAmbientDefaults *)objc_loadWeakRetained((id *)&self->_ambientDefaults);
}

- (void)setAmbientDefaults:(id)a3
{
  objc_storeWeak((id *)&self->_ambientDefaults, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientDefaults);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_onboardingContainerView, 0);
}

@end
