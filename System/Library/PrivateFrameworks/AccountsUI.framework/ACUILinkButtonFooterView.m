@implementation ACUILinkButtonFooterView

- (ACUILinkButtonFooterView)initWithSpecifier:(id)a3
{
  ACUILinkButtonFooterView *v3;
  ACUILinkButton *v4;
  ACUILinkButton *linkButton;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  ACUILinkButtonFooterView *v12;
  id v13;
  ACUILinkButtonFooterView *v14;
  ACUILinkButtonFooterView *v15;
  objc_super v16;
  id location[2];
  ACUILinkButtonFooterView *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v18;
  v18 = 0;
  v16.receiver = v3;
  v16.super_class = (Class)ACUILinkButtonFooterView;
  v15 = -[ACUILinkButtonFooterView init](&v16, sel_init);
  v18 = v15;
  objc_storeStrong((id *)&v18, v15);
  if (v15)
  {
    v4 = (ACUILinkButton *)(id)objc_msgSend(location[0], "propertyForKey:", CFSTR("ACUILinkButtonHolder"));
    linkButton = v18->_linkButton;
    v18->_linkButton = v4;

    v13 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x1E0D80810]);
    v6 = objc_msgSend(v13, "integerValue");
    v18->_desiredTextAlignment = v6;

    v14 = v18;
    -[ACUILinkButton bounds](v18->_linkButton, "bounds");
    -[ACUILinkButtonFooterView setFrame:](v14, "setFrame:", v7, v8, v9, v10);
    -[ACUILinkButtonFooterView addSubview:](v18, "addSubview:", v18->_linkButton);
  }
  v12 = v18;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v12;
}

- (ACUILinkButtonFooterView)initWithButton:(id)a3
{
  ACUILinkButtonFooterView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  ACUILinkButtonFooterView *v9;
  ACUILinkButtonFooterView *v10;
  ACUILinkButtonFooterView *v11;
  objc_super v12;
  id location[2];
  ACUILinkButtonFooterView *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)ACUILinkButtonFooterView;
  v11 = -[ACUILinkButtonFooterView init](&v12, sel_init);
  v14 = v11;
  objc_storeStrong((id *)&v14, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v14->_linkButton, location[0]);
    v10 = v14;
    -[ACUILinkButton bounds](v14->_linkButton, "bounds");
    -[ACUILinkButtonFooterView setFrame:](v10, "setFrame:", v4, v5, v6, v7);
    -[ACUILinkButtonFooterView addSubview:](v14, "addSubview:", v14->_linkButton);
  }
  v9 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v9;
}

- (double)preferredHeightForWidth:(double)a3
{
  return 35.0;
}

- (void)layoutSubviews
{
  double v2;
  double v3;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[ACUILinkButton frame](self->_linkButton, "frame");
  v11 = v2;
  v12 = v3;
  if (self->_desiredTextAlignment == 1)
  {
    -[ACUILinkButtonFooterView bounds](self, "bounds");
    v5 = (v4 - v11) / 2.0;
    v9 = floorf(v5);
    v7 = (v6 - v12) / 2.0;
    v10 = floorf(v7);
  }
  else
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      v9 = 12.0;
    }
    else
    {
      -[ACUILinkButtonFooterView bounds](self, "bounds");
      v9 = v8 - v11 - 12.0;
    }
    v10 = 12.0;
  }
  -[ACUILinkButton setFrame:](self->_linkButton, "setFrame:", v9, v10, v11, v12);
}

- (int64_t)alignment
{
  return self->_desiredTextAlignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_desiredTextAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end
