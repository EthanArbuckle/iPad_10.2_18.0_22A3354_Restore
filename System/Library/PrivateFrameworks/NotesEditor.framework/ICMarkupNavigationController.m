@implementation ICMarkupNavigationController

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICMarkupNavigationController;
  -[ICMarkupNavigationController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[ICMarkupNavigationController markupDelegate](self, "markupDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markupViewWillDissappear");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICMarkupNavigationController;
  -[ICMarkupNavigationController viewDidLoad](&v6, sel_viewDidLoad);
  -[ICMarkupNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMarkupNavigationController navigationBar](self, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEdgeAppearance:", v4);

}

- (ICMarkupDismissalDelegate)markupDelegate
{
  return (ICMarkupDismissalDelegate *)objc_loadWeakRetained((id *)&self->markupDelegate);
}

- (void)setMarkupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->markupDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->markupDelegate);
}

@end
