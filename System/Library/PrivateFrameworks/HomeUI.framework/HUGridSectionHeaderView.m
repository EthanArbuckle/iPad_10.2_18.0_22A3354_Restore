@implementation HUGridSectionHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setContentConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  v9 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v9;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(v6, "setImageToTextPadding:", 0.0);
    objc_msgSend(v6, "setAxesPreservingSuperviewLayoutMargins:", 0);
    -[HUGridSectionHeaderView listContentView](self, "listContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConfiguration:", v6);

  }
}

- (void)setActionHandler:(id)a3
{
  id v4;
  void *v5;
  id actionHandler;
  id v7;

  v4 = a3;
  if (self->_actionHandler != v4)
  {
    v7 = v4;
    v5 = _Block_copy(v4);
    actionHandler = self->_actionHandler;
    self->_actionHandler = v5;

    if (v7)
      -[HUGridSectionHeaderView _installGestureRecognizers](self, "_installGestureRecognizers");
    else
      -[HUGridSectionHeaderView _uninstallGestureRecognizers](self, "_uninstallGestureRecognizers");
    v4 = v7;
  }

}

- (void)setShowsDisclosureIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_showsDisclosureIndicator != a3)
  {
    self->_showsDisclosureIndicator = a3;
    v3 = !a3;
    -[HUGridSectionHeaderView chevronView](self, "chevronView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)_installGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__didRecognizeTapGesture_);
  -[HUGridSectionHeaderView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v3);

  -[HUGridSectionHeaderView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridSectionHeaderView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__didRecognizeLongPressGesture_);
  -[HUGridSectionHeaderView setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v6);

  -[HUGridSectionHeaderView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumPressDuration:", 0.0);

  -[HUGridSectionHeaderView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[HUGridSectionHeaderView contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HUGridSectionHeaderView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", v9);

}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[8];

  v39[6] = *MEMORY[0x1E0C80C00];
  -[HUGridSectionHeaderView layoutConstraints](self, "layoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[HUGridSectionHeaderView listContentView](self, "listContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textLayoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HUGridSectionHeaderView contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridSectionHeaderView listContentView](self, "listContentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "topAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v35);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v34;
      -[HUGridSectionHeaderView listContentView](self, "listContentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v30;
      -[HUGridSectionHeaderView listContentView](self, "listContentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v6;
      objc_msgSend(v6, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v25;
      -[HUGridSectionHeaderView chevronView](self, "chevronView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridSectionHeaderView listContentView](self, "listContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 6.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v20;
      -[HUGridSectionHeaderView chevronView](self, "chevronView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v39[4] = v8;
      -[HUGridSectionHeaderView chevronView](self, "chevronView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerYAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridSectionHeaderView listContentView](self, "listContentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textLayoutGuide");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39[5] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridSectionHeaderView setLayoutConstraints:](self, "setLayoutConstraints:", v15);

      v16 = (void *)MEMORY[0x1E0CB3718];
      -[HUGridSectionHeaderView layoutConstraints](self, "layoutConstraints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activateConstraints:", v17);

    }
  }
  v38.receiver = self;
  v38.super_class = (Class)HUGridSectionHeaderView;
  -[HUGridSectionHeaderView updateConstraints](&v38, sel_updateConstraints);
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (HUGridSectionHeaderView)initWithFrame:(CGRect)a3
{
  HUGridSectionHeaderView *v3;
  void *v4;
  uint64_t v5;
  UIListContentView *listContentView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  UIImageView *chevronView;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUGridSectionHeaderView;
  v3 = -[HUGridSectionHeaderView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", &stru_1E6F60E80);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA720]), "initWithConfiguration:", v4);
    listContentView = v3->_listContentView;
    v3->_listContentView = (UIListContentView *)v5;

    -[UIListContentView setTranslatesAutoresizingMaskIntoConstraints:](v3->_listContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUGridSectionHeaderView contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_listContentView);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithWeight:", 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationByApplyingConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithImage:", v12);
    chevronView = v3->_chevronView;
    v3->_chevronView = (UIImageView *)v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_chevronView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_chevronView, "setTintColor:", v15);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView layer](v3->_chevronView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCompositingFilter:", v16);

    -[UIImageView setHidden:](v3->_chevronView, "setHidden:", -[HUGridSectionHeaderView showsDisclosureIndicator](v3, "showsDisclosureIndicator") ^ 1);
    LODWORD(v18) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_chevronView, "setContentCompressionResistancePriority:forAxis:", 0, v18);
    -[HUGridSectionHeaderView contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v3->_chevronView);

  }
  return v3;
}

- (BOOL)showsDisclosureIndicator
{
  return self->_showsDisclosureIndicator;
}

- (void)dealloc
{
  objc_super v3;

  -[HUGridSectionHeaderView _uninstallGestureRecognizers](self, "_uninstallGestureRecognizers");
  v3.receiver = self;
  v3.super_class = (Class)HUGridSectionHeaderView;
  -[HUGridSectionHeaderView dealloc](&v3, sel_dealloc);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUGridSectionHeaderView;
  -[HUGridSectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[HUGridSectionHeaderView setActionHandler:](self, "setActionHandler:", 0);
  -[HUGridSectionHeaderView setShowsDisclosureIndicator:](self, "setShowsDisclosureIndicator:", 0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUGridSectionHeaderView;
  -[HUGridSectionHeaderView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isDescendantOfView:", self))
  {
    -[HUGridSectionHeaderView actionHandler](self, "actionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = v5;
    else
      v7 = 0;

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUGridSectionHeaderView;
  -[HUGridSectionHeaderView setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
    v5 = 0.5;
  else
    v5 = 1.0;
  -[HUGridSectionHeaderView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

- (void)_uninstallGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUGridSectionHeaderView tapGestureRecognizer](self, "tapGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUGridSectionHeaderView contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridSectionHeaderView tapGestureRecognizer](self, "tapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", v5);

  }
  -[HUGridSectionHeaderView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUGridSectionHeaderView contentView](self, "contentView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HUGridSectionHeaderView longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeGestureRecognizer:", v7);

  }
}

- (void)_didRecognizeTapGesture:(id)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  HUGridSectionHeaderView *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 3)
  {
    -[HUGridSectionHeaderView actionHandler](self, "actionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[HUGridSectionHeaderView actionHandler](self, "actionHandler");
      v5 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(v5 + 16))();
    }
    else
    {
      HFLogForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 138412290;
        v7 = self;
        _os_log_error_impl(&dword_1B8E1E000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "%@ Section header view tapped with no tap action set", (uint8_t *)&v6, 0xCu);
      }
    }

  }
  -[HUGridSectionHeaderView setHighlighted:](self, "setHighlighted:", 0);
}

- (void)_didRecognizeLongPressGesture:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "state") - 1;
  if (v4 <= 4)
    -[HUGridSectionHeaderView setHighlighted:](self, "setHighlighted:", (v4 & 0x1F) == 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  -[HUGridSectionHeaderView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v10 = 1;
  }
  else
  {
    -[HUGridSectionHeaderView longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v6;

  }
  return v10;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setListContentView:(id)a3
{
  objc_storeStrong((id *)&self->_listContentView, a3);
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
