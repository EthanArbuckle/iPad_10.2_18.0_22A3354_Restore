@implementation CNContactListHeaderView

- (void)setHeaderView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListHeaderView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_headerView, a3);
    -[CNContactListHeaderView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_headerView);

    -[UIView bounds](self->_headerView, "bounds");
    -[CNContactListHeaderView setBounds:](self, "setBounds:");
  }

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNContactListHeaderView;
  -[CNContactListHeaderView preferredLayoutAttributesFittingAttributes:](&v11, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  -[CNContactListHeaderView headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  if (v8 == 0.0)
    v9 = 0.0;
  else
    v9 = v8;

  objc_msgSend(v4, "setSize:", v6, v9);
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactListHeaderView;
  -[CNContactListHeaderView layoutSubviews](&v8, sel_layoutSubviews);
  -[CNContactListHeaderView frame](self, "frame");
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v6 != *MEMORY[0x1E0C9D538] || v3 != v5)
  {
    -[CNContactListHeaderView frame](self, "frame");
    -[CNContactListHeaderView setFrame:](self, "setFrame:", v4, v5);
  }
}

- (UIView)headerView
{
  return self->_headerView;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CNContactListHeaderView headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  -[CNContactListHeaderView headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  return (char)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
