@implementation MCSignInPageAuthenticationCell

- (MCSignInPageAuthenticationCell)initWithAuthView:(id)a3
{
  id v5;
  MCSignInPageAuthenticationCell *v6;
  MCSignInPageAuthenticationCell *v7;

  v5 = a3;
  v6 = -[MCSignInPageAuthenticationCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authView, a3);
    -[MCSignInPageAuthenticationCell _addAuthView:](v7, "_addAuthView:", v5);
  }

  return v7;
}

- (MCSignInPageAuthenticationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCSignInPageAuthenticationCell *v4;
  MCSignInPageAuthenticationCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCSignInPageAuthenticationCell;
  v4 = -[MCSignInPageAuthenticationCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MCSignInPageAuthenticationCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCSignInPageAuthenticationCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  return v5;
}

- (void)setAuthView:(id)a3
{
  UIView *v5;
  UIView *authView;
  UIView *v7;

  v5 = (UIView *)a3;
  authView = self->_authView;
  v7 = v5;
  if (authView != v5)
  {
    -[UIView removeFromSuperview](authView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_authView, a3);
    -[MCSignInPageAuthenticationCell _addAuthView:](self, "_addAuthView:", v7);
  }

}

- (void)_addAuthView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[MCSignInPageAuthenticationCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSignInPageAuthenticationCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v4, "centerYAnchor");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[MCSignInPageAuthenticationCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

}

- (UIView)authView
{
  return self->_authView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authView, 0);
}

@end
