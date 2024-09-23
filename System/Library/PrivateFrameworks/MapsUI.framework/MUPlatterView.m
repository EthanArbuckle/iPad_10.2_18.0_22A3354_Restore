@implementation MUPlatterView

- (MUPlatterView)init
{
  return -[MUPlatterView initWithContentView:](self, "initWithContentView:", 0);
}

- (MUPlatterView)initWithContentView:(id)a3
{
  id v5;
  MUPlatterView *v6;
  MUPlatterView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlatterView;
  v6 = -[MUPlatterView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    -[MUPlatterView _setup](v7, "_setup");
  }

  return v7;
}

- (void)_setup
{
  MUPlatterViewStyleProviding *v3;
  MUPlatterViewStyleProviding *visualStyleProvider;
  void *v5;
  MUPlatterViewStyleProviding *v6;
  void *v7;
  void *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *visualEffectView;
  void *v11;
  UIView *contentView;
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
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  -[MUPlatterView _createVisualStyleProvider](self, "_createVisualStyleProvider");
  v3 = (MUPlatterViewStyleProviding *)objc_claimAutoreleasedReturnValue();
  visualStyleProvider = self->_visualStyleProvider;
  self->_visualStyleProvider = v3;

  -[MUPlatterViewStyleProviding fillColor](self->_visualStyleProvider, "fillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_visualStyleProvider;
  -[MUPlatterView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlatterViewStyleProviding visualEffectForTraitCollection:](v6, "visualEffectForTraitCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v8);
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = v9;

    -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v5);

    -[UIVisualEffectView _setContinuousCornerRadius:](self->_visualEffectView, "_setContinuousCornerRadius:", 10.0);
    -[MUPlatterView addSubview:](self, "addSubview:", self->_visualEffectView);
  }
  else
  {
    -[MUPlatterView setBackgroundColor:](self, "setBackgroundColor:", v5);
  }
  -[MUPlatterView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 10.0);
  -[MUPlatterView setClipsToBounds:](self, "setClipsToBounds:", 1);
  contentView = self->_contentView;
  if (contentView)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", 10.0);
    -[MUPlatterView addSubview:](self, "addSubview:", self->_contentView);
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlatterView leadingAnchor](self, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v25;
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlatterView trailingAnchor](self, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v21;
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlatterView topAnchor](self, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlatterView bottomAnchor](self, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v19);

  }
  -[MUPlatterView traitOverrides](self, "traitOverrides");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNSIntegerValue:forTrait:", 1, objc_opt_class());

}

- (id)_createVisualStyleProvider
{
  return (id)objc_opt_new();
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPlatterView;
  -[MUPlatterView layoutSubviews](&v3, sel_layoutSubviews);
  -[MUPlatterView bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPlatterView;
  -[MUPlatterView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MUPlatterView _fetchGroupNameIfNeeded](self, "_fetchGroupNameIfNeeded");
}

- (void)_fetchGroupNameIfNeeded
{
  void *v3;
  UIVisualEffectView *visualEffectView;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[MUPlatterView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    visualEffectView = self->_visualEffectView;
    if (visualEffectView)
    {
      if ((-[UIVisualEffectView isHidden](visualEffectView, "isHidden") & 1) == 0)
      {
        -[UIVisualEffectView _groupName](self->_visualEffectView, "_groupName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "length");

        if (!v6)
        {
          -[MUPlatterView superview](self, "superview");
          v7 = objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            while (1)
            {
              v10 = (id)v7;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                break;
              objc_msgSend(v10, "superview");
              v8 = objc_claimAutoreleasedReturnValue();

              v7 = v8;
              if (!v8)
                return;
            }
            objc_msgSend(v10, "vibrancyGroupName");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v9);

          }
        }
      }
    }
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
