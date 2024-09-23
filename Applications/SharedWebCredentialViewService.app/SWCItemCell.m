@implementation SWCItemCell

- (SWCItemCell)initWithDictionary:(id)a3
{
  id v5;
  SWCItemCell *v6;
  SWCItemCell *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SWCItemCell;
  v6 = -[SWCItemCell initWithStyle:reuseIdentifier:](&v32, "initWithStyle:reuseIdentifier:", 3, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dict, a3);
    -[SWCItemCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[SWCItemCell setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell textLabel](v7, "textLabel"));
    objc_msgSend(v10, "setTextColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell textLabel](v7, "textLabel"));
    objc_msgSend(v11, "setTextAlignment:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell textLabel](v7, "textLabel"));
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell textLabel](v7, "textLabel"));
    objc_msgSend(v13, "setBaselineAdjustment:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("acct")));
    v15 = v14;
    if (!v14)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("--"), &stru_100008450, 0));
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell textLabel](v7, "textLabel"));
    objc_msgSend(v16, "setText:", v15);

    if (!v14)
    {

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell detailTextLabel](v7, "detailTextLabel"));
    objc_msgSend(v18, "setTextColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell detailTextLabel](v7, "detailTextLabel"));
    objc_msgSend(v19, "setTextAlignment:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell detailTextLabel](v7, "detailTextLabel"));
    objc_msgSend(v20, "setAdjustsFontSizeToFitWidth:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell detailTextLabel](v7, "detailTextLabel"));
    objc_msgSend(v21, "setBaselineAdjustment:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("srvr")));
    v23 = v22;
    if (!v22)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("--"), &stru_100008450, 0));
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell detailTextLabel](v7, "detailTextLabel"));
    objc_msgSend(v24, "setText:", v23);

    if (!v22)
    {

    }
    v25 = objc_alloc_init((Class)UIView);
    -[SWCItemCell setBackgroundView:](v7, "setBackgroundView:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell backgroundView](v7, "backgroundView"));
    objc_msgSend(v27, "setBackgroundColor:", v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell imageView](v7, "imageView"));
    objc_msgSend(v29, "setImage:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell imageView](v7, "imageView"));
    objc_msgSend(v30, "setHidden:", 1);

  }
  return v7;
}

- (void)setTicked:(BOOL)a3
{
  self->_isTicked = a3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  UIView *bottomLine;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  UIView *bottomLineSelected;
  double v13;
  double v14;
  void *v15;
  UIView *topLine;
  void *v17;
  UIView *topLineSelected;
  _BOOL8 v19;
  void *v20;
  objc_super v21;

  if (self->_bottomLine)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "scale");
    v5 = v4;

    bottomLine = self->_bottomLine;
    -[SWCItemCell frame](self, "frame");
    v8 = v7 - 1.0 / v5;
    -[SWCItemCell frame](self, "frame");
    -[UIView setFrame:](bottomLine, "setFrame:", 0.0, v8);
  }
  if (self->_bottomLineSelected)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "scale");
    v11 = v10;

    bottomLineSelected = self->_bottomLineSelected;
    -[SWCItemCell frame](self, "frame");
    v14 = v13 - 1.0 / v11;
    -[SWCItemCell frame](self, "frame");
    -[UIView setFrame:](bottomLineSelected, "setFrame:", 0.0, v14);
  }
  if (self->_topLine)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v15, "scale");

    topLine = self->_topLine;
    -[SWCItemCell frame](self, "frame");
    -[UIView setFrame:](topLine, "setFrame:", 0.0, 0.0);
  }
  if (self->_topLineSelected)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v17, "scale");

    topLineSelected = self->_topLineSelected;
    -[SWCItemCell frame](self, "frame");
    -[UIView setFrame:](topLineSelected, "setFrame:", 0.0, 0.0);
  }
  v19 = !self->_isTicked;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell imageView](self, "imageView"));
  objc_msgSend(v20, "setHidden:", v19);

  v21.receiver = self;
  v21.super_class = (Class)SWCItemCell;
  -[SWCItemCell layoutSubviews](&v21, "layoutSubviews");
}

- (void)setShowSeparator:(BOOL)a3
{
  UIView *bottomLine;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *bottomLineSelected;
  void *v11;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  void *v15;

  if (self->_showSeparator != a3)
  {
    self->_showSeparator = a3;
    bottomLine = self->_bottomLine;
    if (a3)
    {
      if (!bottomLine)
      {
        v5 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        v6 = self->_bottomLine;
        self->_bottomLine = v5;

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
        -[UIView setBackgroundColor:](self->_bottomLine, "setBackgroundColor:", v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell backgroundView](self, "backgroundView"));
        objc_msgSend(v8, "addSubview:", self->_bottomLine);

      }
      if (!self->_bottomLineSelected)
      {
        v9 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        bottomLineSelected = self->_bottomLineSelected;
        self->_bottomLineSelected = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
        -[UIView setBackgroundColor:](self->_bottomLineSelected, "setBackgroundColor:", v11);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell selectedBackgroundView](self, "selectedBackgroundView"));
        objc_msgSend(v15, "addSubview:", self->_bottomLineSelected);

      }
    }
    else
    {
      if (bottomLine)
      {
        -[UIView removeFromSuperview](bottomLine, "removeFromSuperview");
        v12 = self->_bottomLine;
        self->_bottomLine = 0;

      }
      v13 = self->_bottomLineSelected;
      if (v13)
      {
        -[UIView removeFromSuperview](v13, "removeFromSuperview");
        v14 = self->_bottomLineSelected;
        self->_bottomLineSelected = 0;

      }
    }
  }
}

- (void)setShowTopSeparator:(BOOL)a3
{
  UIView *topLine;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *topLineSelected;
  void *v11;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  void *v15;

  if (self->_showTopSeparator != a3)
  {
    self->_showTopSeparator = a3;
    topLine = self->_topLine;
    if (a3)
    {
      if (!topLine)
      {
        v5 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        v6 = self->_topLine;
        self->_topLine = v5;

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
        -[UIView setBackgroundColor:](self->_topLine, "setBackgroundColor:", v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell backgroundView](self, "backgroundView"));
        objc_msgSend(v8, "addSubview:", self->_topLine);

      }
      if (!self->_topLineSelected)
      {
        v9 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        topLineSelected = self->_topLineSelected;
        self->_topLineSelected = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
        -[UIView setBackgroundColor:](self->_topLineSelected, "setBackgroundColor:", v11);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SWCItemCell selectedBackgroundView](self, "selectedBackgroundView"));
        objc_msgSend(v15, "addSubview:", self->_topLineSelected);

      }
    }
    else
    {
      if (topLine)
      {
        -[UIView removeFromSuperview](topLine, "removeFromSuperview");
        v12 = self->_topLine;
        self->_topLine = 0;

      }
      v13 = self->_topLineSelected;
      if (v13)
      {
        -[UIView removeFromSuperview](v13, "removeFromSuperview");
        v14 = self->_topLineSelected;
        self->_topLineSelected = 0;

      }
    }
  }
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_topLineSelected, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_bottomLineSelected, 0);
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
