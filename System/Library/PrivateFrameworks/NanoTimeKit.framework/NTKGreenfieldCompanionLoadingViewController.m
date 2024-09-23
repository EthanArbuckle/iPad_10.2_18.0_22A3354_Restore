@implementation NTKGreenfieldCompanionLoadingViewController

- (void)viewDidLoad
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinner;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldCompanionLoadingViewController;
  -[NTKGreenfieldCompanionLoadingViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v3;

  -[NTKGreenfieldCompanionLoadingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_spinner);

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKGreenfieldCompanionLoadingViewController;
  -[NTKGreenfieldCompanionLoadingViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[NTKGreenfieldCompanionLoadingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  -[UIActivityIndicatorView setCenter:](self->_spinner, "setCenter:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
