@implementation SFUnifiedBarButton

- (SFUnifiedBarButton)initWithImage:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  SFUnifiedBarButton *v8;
  SFUnifiedBarButtonView *v9;
  SFUnifiedBarButtonView *buttonView;
  void *v11;
  id action;
  SFUnifiedBarButton *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedBarButton;
  v8 = -[SFUnifiedBarButton init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(SFUnifiedBarButtonView);
    buttonView = v8->_buttonView;
    v8->_buttonView = v9;

    -[SFUnifiedBarButtonView addTarget:action:forControlEvents:](v8->_buttonView, "addTarget:action:forControlEvents:", v8, sel__performAction, 64);
    -[SFUnifiedBarButtonView setImage:](v8->_buttonView, "setImage:", v6);
    v11 = _Block_copy(v7);
    action = v8->_action;
    v8->_action = v11;

    v13 = v8;
  }

  return v8;
}

- (id)view
{
  return self->_buttonView;
}

- (UIImage)image
{
  return -[SFUnifiedBarButtonView image](self->_buttonView, "image");
}

- (void)setImage:(id)a3
{
  -[SFUnifiedBarButtonView setImage:](self->_buttonView, "setImage:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBarButton;
  -[SFUnifiedBarItem setEnabled:](&v5, sel_setEnabled_);
  -[SFUnifiedBarButtonView setEnabled:](self->_buttonView, "setEnabled:", v3);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)-[SFUnifiedBarButtonView accessibilityIdentifier](self->_buttonView, "accessibilityIdentifier");
}

- (void)setAccessibilityIdentifier:(id)a3
{
  if (a3)
    -[SFUnifiedBarButtonView setAccessibilityIdentifier:](self->_buttonView, "setAccessibilityIdentifier:");
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[SFUnifiedBarButtonView _titleView](self->_buttonView, "_titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  if (a3)
    -[SFUnifiedBarButtonView setTitle:forState:](self->_buttonView, "setTitle:forState:", a3, 0);
}

- (NSAttributedString)attributedTitle
{
  void *v2;
  void *v3;

  -[SFUnifiedBarButtonView _titleView](self->_buttonView, "_titleView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setAttributedTitle:(id)a3
{
  -[SFUnifiedBarButtonView setAttributedTitle:forState:](self->_buttonView, "setAttributedTitle:forState:", a3, 0);
}

- (void)_performAction
{
  void (**action)(id, SFUnifiedBarButton *);

  action = (void (**)(id, SFUnifiedBarButton *))self->_action;
  if (action)
    action[2](action, self);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end
