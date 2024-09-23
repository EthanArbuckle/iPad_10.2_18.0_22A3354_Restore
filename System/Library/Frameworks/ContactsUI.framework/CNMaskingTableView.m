@implementation CNMaskingTableView

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNMaskingTableView;
  -[CNMaskingTableView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[CNMaskingTableView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[CNMaskingTableView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[CNMaskingTableView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNMaskingTableView;
  -[CNMaskingTableView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[CNMaskingTableView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNMaskingTableView;
  -[CNMaskingTableView tlk_updateForAppearance:](&v7, sel_tlk_updateForAppearance_, a3);
  -[UIView _cnui_contactStyle](self, "_cnui_contactStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "usesOpaqueBackground") & 1) == 0)
  {
    -[CNMaskingTableView backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      return;
    v4 = (void *)objc_opt_new();
    -[CNMaskingTableView setBackgroundView:](self, "setBackgroundView:", v4);
  }

}

- (void)setMaskingInset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MinY;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[CNMaskingTableView backgroundColor](self, "backgroundColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v25 = objc_retainAutorelease(v9);
  if (CGColorGetAlpha((CGColorRef)objc_msgSend(v25, "CGColor")) != 1.0)
  {
    self->_maskingInset = a3;
    -[CNMaskingTableView frame](self, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[CNMaskingTableView contentOffset](self, "contentOffset");
    v17 = v16 + a3;
    v18 = vabdd_f64(v15, a3);
    v26.origin.x = v11;
    v26.origin.y = v17;
    v26.size.width = v13;
    v26.size.height = v18;
    MinY = CGRectGetMinY(v26);
    -[CNMaskingTableView maskView](self, "maskView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (MinY <= 0.0)
    {

      if (v21)
        -[CNMaskingTableView setMaskView:](self, "setMaskView:", 0);
    }
    else
    {
      -[CNMaskingTableView tableMaskView](self, "tableMaskView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21 != v22)
      {
        -[CNMaskingTableView tableMaskView](self, "tableMaskView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNMaskingTableView setMaskView:](self, "setMaskView:", v23);

      }
      -[CNMaskingTableView tableMaskView](self, "tableMaskView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFrame:", v11, v17, v13, v18);

    }
  }

}

- (UIView)tableMaskView
{
  UIView *tableMaskView;
  UIView *v4;
  UIView *v5;
  void *v6;

  tableMaskView = self->_tableMaskView;
  if (!tableMaskView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_tableMaskView;
    self->_tableMaskView = v4;

    -[UIView setUserInteractionEnabled:](self->_tableMaskView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_tableMaskView, "setBackgroundColor:", v6);

    tableMaskView = self->_tableMaskView;
  }
  return tableMaskView;
}

- (double)maskingInset
{
  return self->_maskingInset;
}

- (void)setTableMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_tableMaskView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableMaskView, 0);
}

@end
