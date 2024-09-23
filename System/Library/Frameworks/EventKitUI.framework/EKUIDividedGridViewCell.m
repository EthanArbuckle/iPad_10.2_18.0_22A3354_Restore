@implementation EKUIDividedGridViewCell

- (EKUIDividedGridViewCell)initWithBackgroundColor:(id)a3
{
  id v5;
  EKUIDividedGridViewCell *v6;
  EKUIDividedGridViewCell *v7;

  v5 = a3;
  v6 = -[EKUIDividedGridViewCell init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bgColor, a3);
    -[EKUIDividedGridViewCell setBackgroundColor:](v7, "setBackgroundColor:", v7->_bgColor);
  }

  return v7;
}

- (EKUIDividedGridViewCell)init
{
  EKUIDividedGridViewCell *v2;
  uint64_t v3;
  UILabel *label;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EKUIDividedGridViewCell;
  v2 = -[EKUIDividedGridViewCell init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    label = v2->_label;
    v2->_label = (UILabel *)v3;

    -[UILabel setTextAlignment:](v2->_label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v5);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIDividedGridViewCell addSubview:](v2, "addSubview:", v2->_label);
    v6 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_label"), v2->_label, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(7)-[_label]-(7)-|"), 1024, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIDividedGridViewCell addConstraints:](v2, "addConstraints:", v8);

    v9 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_label"), v2->_label, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(0)-[_label]-(0)-|"), 512, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIDividedGridViewCell addConstraints:](v2, "addConstraints:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIDividedGridViewCell setBackgroundColor:](v2, "setBackgroundColor:", v12);

  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  -[EKUIDividedGridViewCell viewController](self, "viewController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellTapped:", self);

}

- (id)selectedTextColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIDividedGridViewCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_selected = a3;
  if (!-[EKUIDividedGridViewCell selected](self, "selected"))
  {
    if (self->_bgColor)
    {
      -[EKUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:");
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[EKUIDividedGridViewCell tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_7:
    -[EKUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:", v4);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

LABEL_8:
LABEL_9:
  if (-[EKUIDividedGridViewCell selected](self, "selected"))
    -[EKUIDividedGridViewCell selectedTextColor](self, "selectedTextColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIDividedGridViewCell label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (BOOL)selected
{
  return self->_selected;
}

- (EKUIDividedGridViewController)viewController
{
  return (EKUIDividedGridViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_widthConstraint);
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_widthConstraint);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bgColor, 0);
}

@end
