@implementation TVLatencySetupBaseViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVLatencySetupBaseViewController;
  -[SVSBaseViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleTitle1, 1280));
  objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setFont:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UILabel)titleLabel
{
  return *(UILabel **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), a3);
}

- (UIView)animationContainerView
{
  return *(UIView **)((char *)&self->_titleLabel + 1);
}

- (void)setAnimationContainerView:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
