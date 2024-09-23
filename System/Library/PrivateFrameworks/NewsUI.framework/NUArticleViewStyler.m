@implementation NUArticleViewStyler

- (NUArticleViewStyler)initWithBackgroundColor:(id)a3 topBackgroundColor:(id)a4
{
  id v7;
  id v8;
  NUArticleViewStyler *v9;
  NUArticleViewStyler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUArticleViewStyler;
  v9 = -[NUArticleViewStyler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainBackgroundColor, a3);
    objc_storeStrong((id *)&v10->_topContentColor, a4);
    v10->_statusBarStyle = -[NUArticleViewStyler statusBarStyleForBackgroundColor:](v10, "statusBarStyleForBackgroundColor:", v7);
  }

  return v10;
}

- (void)styleTabBar:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NUArticleViewStyler tabBarTintColor](self, "tabBarTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  if (-[NUArticleViewStyler statusBarStyle](self, "statusBarStyle") == 1)
  {
    objc_msgSend(v6, "barTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleViewStyler setTabBarTintColor:](self, "setTabBarTintColor:", v5);

    -[NUArticleViewStyler mainBackgroundColor](self, "mainBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBarTintColor:", v4);
LABEL_4:

  }
}

- (void)unstyleTabBar:(id)a3 overrideRestoreColor:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (unint64_t)a4;
  -[NUArticleViewStyler tabBarTintColor](self, "tabBarTintColor");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v6 | v7;

  if (v8)
  {
    if (v6)
    {
      objc_msgSend(v10, "setBarTintColor:", v6);
    }
    else
    {
      -[NUArticleViewStyler tabBarTintColor](self, "tabBarTintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBarTintColor:", v9);

    }
    -[NUArticleViewStyler setTabBarTintColor:](self, "setTabBarTintColor:", 0);
  }

}

- (void)styleToolbar:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NUArticleViewStyler toolbarTintColor](self, "toolbarTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  if (-[NUArticleViewStyler statusBarStyle](self, "statusBarStyle") == 1)
  {
    objc_msgSend(v6, "barTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleViewStyler setToolbarTintColor:](self, "setToolbarTintColor:", v5);

    -[NUArticleViewStyler mainBackgroundColor](self, "mainBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBarTintColor:", v4);
LABEL_4:

  }
}

- (void)unstyleToolbar:(id)a3 overrideRestoreColor:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (unint64_t)a4;
  -[NUArticleViewStyler toolbarTintColor](self, "toolbarTintColor");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v6 | v7;

  if (v8)
  {
    if (v6)
    {
      objc_msgSend(v10, "setBarTintColor:", v6);
    }
    else
    {
      -[NUArticleViewStyler toolbarTintColor](self, "toolbarTintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBarTintColor:", v9);

    }
    -[NUArticleViewStyler setToolbarTintColor:](self, "setToolbarTintColor:", 0);
  }

}

- (int64_t)topBackgroundStatusBarStyle
{
  UIColor *v3;
  int64_t v4;

  v3 = self->_topContentColor;
  if (v3)
    v4 = -[NUArticleViewStyler statusBarStyleForBackgroundColor:](self, "statusBarStyleForBackgroundColor:", v3);
  else
    v4 = 0;

  return v4;
}

- (int64_t)statusBarStyleForBackgroundColor:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  v5 = 0.0;
  v6 = 0;
  v4 = 0;
  objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4);
  return v5 < 0.7;
}

- (UIColor)mainBackgroundColor
{
  return self->_mainBackgroundColor;
}

- (UIColor)topContentColor
{
  return self->_topContentColor;
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (UIColor)tabBarTintColor
{
  return self->_tabBarTintColor;
}

- (void)setTabBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarTintColor, a3);
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (void)setToolbarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_tabBarTintColor, 0);
  objc_storeStrong((id *)&self->_topContentColor, 0);
  objc_storeStrong((id *)&self->_mainBackgroundColor, 0);
}

@end
