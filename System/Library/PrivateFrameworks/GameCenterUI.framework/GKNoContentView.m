@implementation GKNoContentView

- (GKNoContentView)initWithFrame:(CGRect)a3
{
  GKNoContentView *v3;
  GKUIContentUnavailableView *v4;
  uint64_t v5;
  GKUIContentUnavailableView *contentUnavailableView;
  uint64_t v7;
  UIActivityIndicatorView *loadingIndicatorView;
  UIStackView *v9;
  UIStackView *stackView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)GKNoContentView;
  v3 = -[GKNoContentView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [GKUIContentUnavailableView alloc];
    v5 = -[_UIContentUnavailableView initWithFrame:title:style:](v4, "initWithFrame:title:style:", 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentUnavailableView = v3->_contentUnavailableView;
    v3->_contentUnavailableView = (GKUIContentUnavailableView *)v5;

    objc_initWeak(&location, v3);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __33__GKNoContentView_initWithFrame___block_invoke;
    v27[3] = &unk_1E59C48A0;
    objc_copyWeak(&v28, &location);
    -[_UIContentUnavailableView setButtonAction:](v3->_contentUnavailableView, "setButtonAction:", v27);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 0);
    loadingIndicatorView = v3->_loadingIndicatorView;
    v3->_loadingIndicatorView = (UIActivityIndicatorView *)v7;

    v9 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v3->_stackView;
    v3->_stackView = v9;

    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 0);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v3->_loadingIndicatorView, "setColor:", v11);

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_loadingIndicatorView);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_contentUnavailableView);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKNoContentView addSubview:](v3, "addSubview:", v3->_stackView);
    -[UIStackView centerXAnchor](v3->_stackView, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNoContentView centerXAnchor](v3, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v24;
    -[UIStackView centerYAnchor](v3->_stackView, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNoContentView centerYAnchor](v3, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v12;
    -[UIStackView widthAnchor](v3->_stackView, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNoContentView widthAnchor](v3, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v15;
    -[GKUIContentUnavailableView widthAnchor](v3->_contentUnavailableView, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKNoContentView stackView](v3, "stackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKNoContentView addConstraints:](v3, "addConstraints:", v20);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __33__GKNoContentView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "buttonAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "buttonAction");
      v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v3)[2](v3, v4);

      WeakRetained = v4;
    }
  }

}

- (void)setTitle:(id)a3
{
  -[_UIContentUnavailableView setTitle:](self->_contentUnavailableView, "setTitle:", a3);
}

- (NSString)title
{
  return -[_UIContentUnavailableView title](self->_contentUnavailableView, "title");
}

- (void)setMessage:(id)a3
{
  -[_UIContentUnavailableView setMessage:](self->_contentUnavailableView, "setMessage:", a3);
}

- (NSString)message
{
  return -[_UIContentUnavailableView message](self->_contentUnavailableView, "message");
}

- (void)setButtonTitle:(id)a3
{
  -[_UIContentUnavailableView setButtonTitle:](self->_contentUnavailableView, "setButtonTitle:", a3);
}

- (NSString)buttonTitle
{
  return -[_UIContentUnavailableView buttonTitle](self->_contentUnavailableView, "buttonTitle");
}

- (void)setLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_loading != a3)
  {
    v3 = a3;
    self->_loading = a3;
    -[GKNoContentView loadingIndicatorView](self, "loadingIndicatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "startAnimating");
    else
      objc_msgSend(v5, "stopAnimating");

    -[GKNoContentView stackView](self, "stackView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

  }
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (GKUIContentUnavailableView)contentUnavailableView
{
  return self->_contentUnavailableView;
}

- (void)setContentUnavailableView:(id)a3
{
  objc_storeStrong((id *)&self->_contentUnavailableView, a3);
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
  objc_storeStrong(&self->_buttonAction, 0);
}

@end
