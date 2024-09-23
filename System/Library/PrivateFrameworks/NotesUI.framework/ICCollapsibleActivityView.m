@implementation ICCollapsibleActivityView

- (ICCollapsibleActivityView)initWithFrame:(CGRect)a3
{
  ICCollapsibleActivityView *v3;
  ICCollapsibleActivityView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCollapsibleActivityView;
  v3 = -[ICCollapsibleActivityView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICCollapsibleActivityView commonInit](v3, "commonInit");
  return v4;
}

- (ICCollapsibleActivityView)initWithCoder:(id)a3
{
  ICCollapsibleActivityView *v3;
  ICCollapsibleActivityView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICCollapsibleActivityView;
  v3 = -[ICCollapsibleActivityView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICCollapsibleActivityView commonInit](v3, "commonInit");
  return v4;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0DC3E88], "ic_traitsAffectingSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__ICCollapsibleActivityView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1E5C205C8;
  v5[4] = self;
  v4 = (id)-[ICCollapsibleActivityView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

uint64_t __52__ICCollapsibleActivityView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCollapsed:", objc_msgSend(*(id *)(a1 + 32), "isCollapsed"));
}

- (void)setCollapsed:(BOOL)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICCollapsibleActivityView;
  -[ICCollapsibleBaseView setCollapsed:](&v7, sel_setCollapsed_);
  -[ICCollapsibleActivityView activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    objc_msgSend(v5, "stopAnimating");
  else
    objc_msgSend(v5, "startAnimating");

}

- (void)performSetup
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  -[ICCollapsibleActivityView setActivityIndicator:](self, "setActivityIndicator:", v3);

  -[ICCollapsibleActivityView activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesWhenStopped:", 0);

  -[ICCollapsibleActivityView activityIndicator](self, "activityIndicator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCollapsibleBaseView performSetUpWithContentView:](self, "performSetUpWithContentView:", v5);

}

- (BOOL)isAnimating
{
  void *v2;
  char v3;

  -[ICCollapsibleActivityView activityIndicator](self, "activityIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimating");

  return v3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
