@implementation CSDiscoveryItemExplorePostersViewController

- (CSDiscoveryItemExplorePostersViewController)initWithPlatter:(id)a3 firstDidAppearCompletion:(id)a4
{
  id v7;
  CSDiscoveryItemExplorePostersViewController *v8;
  CSDiscoveryItemExplorePostersViewController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDiscoveryItemExplorePostersViewController;
  v8 = -[CSDiscoveryItemViewController initWithPlatterDiscoveryView:firstDidAppearCompletion:](&v11, sel_initWithPlatterDiscoveryView_firstDidAppearCompletion_, v7, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_platter, a3);

  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDiscoveryItemExplorePostersViewController;
  -[CSDiscoveryItemViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CSDiscoveryItemExplorePostersViewController _updateAnimationState](self, "_updateAnimationState");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDiscoveryItemExplorePostersViewController;
  -[CSDiscoveryItemViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CSDiscoveryItemExplorePostersViewController _updateAnimationState](self, "_updateAnimationState");
}

- (void)_updateAnimationState
{
  id v3;

  if (-[CSDiscoveryItemExplorePostersViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared")&& -[CSDiscoveryItemViewController isScreenOn](self, "isScreenOn"))
  {
    -[CSDiscoveryItemExplorePostersViewController platter](self, "platter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumeAnimations");
  }
  else
  {
    -[CSDiscoveryItemExplorePostersViewController platter](self, "platter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseAnimations");
  }

}

- (void)setScreenOn:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSDiscoveryItemExplorePostersViewController;
  -[CSDiscoveryItemViewController setScreenOn:](&v4, sel_setScreenOn_, a3);
  -[CSDiscoveryItemExplorePostersViewController _updateAnimationState](self, "_updateAnimationState");
}

- (CSDiscoveryItemExplorePostersPlatterView)platter
{
  return self->_platter;
}

- (void)setPlatter:(id)a3
{
  objc_storeStrong((id *)&self->_platter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platter, 0);
}

@end
