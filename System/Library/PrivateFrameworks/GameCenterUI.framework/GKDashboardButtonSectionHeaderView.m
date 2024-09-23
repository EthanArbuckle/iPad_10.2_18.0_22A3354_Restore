@implementation GKDashboardButtonSectionHeaderView

+ (double)defaultHeight
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___GKDashboardButtonSectionHeaderView;
  objc_msgSendSuper2(&v8, sel_defaultHeight);
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v5))
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
    {
      v6 = 3.1;
LABEL_10:
      v3 = v3 * v6;
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
    {
      v6 = 2.75;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
    {
      v6 = 2.35;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
    {
      v6 = 1.9;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC48D8]))
      v3 = v3 * 1.6;
  }
LABEL_11:

  return v3;
}

+ (double)widthForTitle:(id)a3
{
  double result;

  objc_msgSend(a1, "widthForTitle:buttonTitle:", a3, 0);
  return result;
}

+ (CGSize)platformSizeForTitle:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "platformSizeForTitle:buttonTitle:", a3, 0);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)widthForTitle:(id)a3 buttonTitle:(id)a4
{
  uint64_t v5;
  __CFString *v6;
  id v7;
  const __CFString *v8;
  double result;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__GKDashboardButtonSectionHeaderView_widthForTitle_buttonTitle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v5 = widthForTitle_buttonTitle__onceToken;
  v6 = (__CFString *)a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&widthForTitle_buttonTitle__onceToken, block);
  objc_msgSend((id)widthForTitle_buttonTitle__sSectionHeaderView, "setTitle:", v7);

  if (v6)
    v8 = v6;
  else
    v8 = &stru_1E59EB978;
  objc_msgSend((id)widthForTitle_buttonTitle__sSectionHeaderView, "setButtonTitle:", v8);

  objc_msgSend((id)widthForTitle_buttonTitle__sSectionHeaderView, "intrinsicContentSize");
  return result;
}

void __64__GKDashboardButtonSectionHeaderView_widthForTitle_buttonTitle___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_gkViewFromNib");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)widthForTitle_buttonTitle__sSectionHeaderView;
  widthForTitle_buttonTitle__sSectionHeaderView = v1;

}

+ (CGSize)platformSizeForTitle:(id)a3 buttonTitle:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  objc_msgSend(a1, "defaultHeight", a3, a4);
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)awakeFromNib
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)GKDashboardButtonSectionHeaderView;
  -[GKDashboardSectionHeaderView awakeFromNib](&v10, sel_awakeFromNib);
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 0x2000);
  v3 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
  -[GKDashboardButtonSectionHeaderView setFocusGuide:](self, "setFocusGuide:", v3);

  -[GKDashboardButtonSectionHeaderView focusGuide](self, "focusGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardButtonSectionHeaderView addLayoutGuide:](self, "addLayoutGuide:", v4);

  -[GKDashboardButtonSectionHeaderView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardButtonSectionHeaderView focusGuide](self, "focusGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredFocusEnvironments:", v6);

  v8 = (void *)MEMORY[0x1E0CB3718];
  -[GKDashboardButtonSectionHeaderView focusGuide](self, "focusGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_gkInstallEdgeConstraintsForLayoutGuide:containedWithinParentView:", v9, self);

}

- (void)setButtonHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GKDashboardButtonSectionHeaderView button](self, "button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setButtonTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__GKDashboardButtonSectionHeaderView_setButtonTitle___block_invoke;
  v7[3] = &unk_1E59C4708;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

void __53__GKDashboardButtonSectionHeaderView_setButtonTitle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:forState:", *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 32), "button");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)setAttributedButtonTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__GKDashboardButtonSectionHeaderView_setAttributedButtonTitle___block_invoke;
  v8[3] = &unk_1E59C4708;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v8);
  -[GKDashboardButtonSectionHeaderView button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("GKDashBoardButtonSectionHeaderView.ButtonTitle"));

}

void __63__GKDashboardButtonSectionHeaderView_setAttributedButtonTitle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttributedTitle:forState:", *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 32), "button");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)setButtonMenu:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GKDashboardButtonSectionHeaderView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenu:", v4);

  -[GKDashboardButtonSectionHeaderView button](self, "button");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContextMenuIsPrimary:", v4 != 0);

}

- (UIMenu)buttonMenu
{
  void *v2;
  void *v3;

  -[GKDashboardButtonSectionHeaderView button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v3;
}

- (NSString)buttonTitle
{
  return -[UIButton titleForState:](self->_button, "titleForState:", 0);
}

- (CGSize)intrinsicContentSize
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  v18.receiver = self;
  v18.super_class = (Class)GKDashboardButtonSectionHeaderView;
  -[GKDashboardSectionHeaderView intrinsicContentSize](&v18, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[UIButton intrinsicContentSize](self->_button, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  -[GKDashboardButtonSectionHeaderView stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spacing");
  v13 = v8 + v12;
  -[NSLayoutConstraint constant](self->_rightMarginConstraint, "constant");
  v15 = v4 + v13 + v14;

  if (v6 >= v10)
    v16 = v6;
  else
    v16 = v10;
  v17 = v15;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)buttonPressed:(id)a3
{
  id v4;
  id buttonTarget;
  SEL buttonAction;
  id v7;

  v4 = a3;
  buttonTarget = self->_buttonTarget;
  if (buttonTarget)
  {
    buttonAction = self->_buttonAction;
    if (buttonAction)
    {
      v7 = v4;
      objc_msgSend(buttonTarget, "performSelector:withObject:", buttonAction, v4);
      v4 = v7;
    }
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardButtonSectionHeaderView;
  -[GKDashboardButtonSectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[GKDashboardButtonSectionHeaderView setButtonTarget:](self, "setButtonTarget:", 0);
  -[GKDashboardButtonSectionHeaderView setButtonAction:](self, "setButtonAction:", 0);
  -[GKDashboardButtonSectionHeaderView setButtonMenu:](self, "setButtonMenu:", 0);
}

- (NSAttributedString)attributedButtonTitle
{
  return self->_attributedButtonTitle;
}

- (id)buttonTarget
{
  return self->_buttonTarget;
}

- (void)setButtonTarget:(id)a3
{
  self->_buttonTarget = a3;
}

- (SEL)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(SEL)a3
{
  self->_buttonAction = a3;
}

- (BOOL)isButtonHidden
{
  return self->_buttonHidden;
}

- (UIView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
  self->_backgroundPlatterView = (UIView *)a3;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  self->_button = (UIButton *)a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  self->_stackView = (UIStackView *)a3;
}

- (NSLayoutConstraint)rightMarginConstraint
{
  return self->_rightMarginConstraint;
}

- (void)setRightMarginConstraint:(id)a3
{
  self->_rightMarginConstraint = (NSLayoutConstraint *)a3;
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_attributedButtonTitle, 0);
}

@end
