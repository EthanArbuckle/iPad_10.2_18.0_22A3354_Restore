@implementation HUTriggerIconView

- (HUTriggerIconView)initWithIconDescriptor:(id)a3
{
  id v4;
  HUTriggerIconView *v5;
  HUIconView *v6;
  HUIconView *iconView;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerIconView;
  v5 = -[HUTriggerIconView init](&v11, sel_init);
  if (v5)
  {
    v6 = (HUIconView *)objc_alloc_init(MEMORY[0x1E0D33720]);
    iconView = v5->_iconView;
    v5->_iconView = v6;

    -[HUIconView setIconSize:](v5->_iconView, "setIconSize:", 3);
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HFImageIconIdentifierSeparatorArrow"));

    if ((v9 & 1) == 0)
      -[HUIconView setContentMode:](v5->_iconView, "setContentMode:", 1);
    -[HUIconView updateWithIconDescriptor:displayStyle:animated:](v5->_iconView, "updateWithIconDescriptor:displayStyle:animated:", v4, 1, 0);
    -[HUTriggerIconView addSubview:](v5, "addSubview:", v5->_iconView);
  }

  return v5;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUTriggerIconView;
  -[HUTriggerIconView layoutSubviews](&v12, sel_layoutSubviews);
  -[HUTriggerIconView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUTriggerIconView iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[HUTriggerIconView iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
