@implementation GKRemoteUITableFooterView

- (GKRemoteUITableFooterView)initWithAttributes:(id)a3
{
  id v5;
  GKRemoteUITableFooterView *v6;
  GKRemoteUITableFooterView *v7;
  void *v8;
  double v9;
  GKRemoteUITableFooterView *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKRemoteUITableFooterView;
  v6 = -[GKRemoteUITableFooterView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributes, a3);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GKLayoutStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_layoutStyle = objc_msgSend(v8, "integerValue");

    v9 = 60.0;
    if (!v7->_layoutStyle)
      v9 = 38.0;
    v7->_buttonBaselineOffset = v9;
    -[GKRemoteUITableFooterView createButtonWithAttributes:](v7, "createButtonWithAttributes:", v5);
    -[GKRemoteUITableFooterView setNeedsLayout](v7, "setNeedsLayout");
    v10 = v7;
  }

  return v7;
}

- (void)createButtonWithAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GKButton *v9;
  GKButton *button;
  id v11;

  v4 = (void *)MEMORY[0x1E0D25B28];
  v5 = a3;
  objc_msgSend(v4, "textStyle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buttonStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "styleWithName:fallback:layoutMode:", v6, CFSTR("remoteUITableFooterButton"), -[GKRemoteUITableFooterView layoutStyle](self, "layoutStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKButton buttonWithType:](GKButton, "buttonWithType:", 1);
  v9 = (GKButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v9;

  -[GKButton setTitle:forState:](self->_button, "setTitle:forState:", v8, 0);
  -[GKButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_buttonTapped_, 64);
  -[GKButton applyTextStyle:](self->_button, "applyTextStyle:", v7);
  -[GKRemoteUITableFooterView addSubview:](self, "addSubview:", self->_button);

}

- (GKRemoteUIAuxiliaryViewDelegate)delegate
{
  return (GKRemoteUIAuxiliaryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  objc_super v29;
  CGRect v30;

  v29.receiver = self;
  v29.super_class = (Class)GKRemoteUITableFooterView;
  -[GKRemoteUITableFooterView layoutSubviews](&v29, sel_layoutSubviews);
  -[GKRemoteUITableFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[GKRemoteUITableFooterView button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, 1.79769313e308);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v12, "frame");
  v19 = (v17 - v18) * 0.5;
  if (-[GKRemoteUITableFooterView pinToBottom](self, "pinToBottom"))
  {
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    v20 = CGRectGetMaxY(v30) - v17;
    -[GKRemoteUITableFooterView buttonBaselineOffset](self, "buttonBaselineOffset");
    v22 = v20 - v21;
    objc_msgSend(v13, "descender");
    v24 = v19 + v22 + fabs(v23);
  }
  else
  {
    -[GKRemoteUITableFooterView buttonBaselineOffset](self, "buttonBaselineOffset");
    v26 = v25;
    objc_msgSend(v13, "ascender");
    v24 = v26 - v27 - v19;
  }
  v28 = v24;
  objc_msgSend(v11, "setFrame:", round(v4 + (v8 - v15) * 0.5), ceilf(v28), v15, v17);

}

- (double)footerHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v4;

  -[GKRemoteUITableFooterView sizeThatFits:](self, "sizeThatFits:", a4, a3, 1.79769313e308);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  -[GKRemoteUITableFooterView button](self, "button", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v5, "intrinsicContentSize");
  v9 = v8;
  -[GKRemoteUITableFooterView buttonBaselineOffset](self, "buttonBaselineOffset");
  v11 = v10;
  objc_msgSend(v7, "ascender");
  v13 = v9 + v11 - v12;

  v14 = width;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)adjustSizeToFillSuperview:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;

  v4 = a3;
  objc_msgSend(v4, "setTableFooterView:", self);
  v39 = v4;
  objc_msgSend(v39, "contentInset");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0DC3F20];
  objc_msgSend(v39, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "viewControllerForView:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0.0;
  if (objc_msgSend(v14, "modalPresentationStyle") != 16 && objc_msgSend(v14, "modalPresentationStyle") != 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "statusBarFrame");
    v15 = v17 + 0.0;

  }
  if (v14 && (objc_msgSend(v14, "isNavigationBarHidden") & 1) == 0)
  {
    objc_msgSend(v14, "navigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v15 = v15 + v19;

  }
  objc_msgSend(v39, "frame");
  v21 = v20 - (v6 + v10);
  v23 = v22 - (v8 + v15);
  -[GKRemoteUITableFooterView frame](self, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v39, "contentSize");
  v33 = v32;
  v35 = v34;
  -[GKRemoteUITableFooterView sizeThatFits:](self, "sizeThatFits:", v21, 1.79769313e308);
  v37 = v35 - v31;
  v38 = v23 - (v35 - v31);
  if (v38 <= v36)
  {
    if (v38 < v31)
    {
      if (v38 >= v36)
        v31 = v23 - (v35 - v31);
      else
        v31 = v36;
    }
  }
  else
  {
    v31 = v23 - (v35 - v31);
  }
  objc_msgSend(v39, "setContentSize:", v33, v37 + v31);
  -[GKRemoteUITableFooterView setFrame:](self, "setFrame:", v25, v27, v29, v31);

}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKRemoteUITableFooterView;
  -[GKRemoteUITableFooterView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  if (-[GKRemoteUITableFooterView pinToBottom](self, "pinToBottom"))
  {
    -[GKRemoteUITableFooterView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKRemoteUITableFooterView adjustSizeToFillSuperview:](self, "adjustSizeToFillSuperview:", v3);

  }
}

- (void)buttonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKRemoteUITableFooterView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "auxiliaryView:pressedLink:attributes:", self, v6, self->_attributes);
  }
  else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "auxiliaryView:pressedButton:attributes:", self, v4, self->_attributes);
  }

}

- (void)objectModelDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("enabledFunction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[GKButton setEnabled:](self->_button, "setEnabled:", objc_msgSend(v5, "validateWithFunction:", v4));

}

- (void)tableViewDidUpdateContentInset:(id)a3
{
  id v4;

  if (-[GKRemoteUITableFooterView pinToBottom](self, "pinToBottom", a3))
  {
    -[GKRemoteUITableFooterView superview](self, "superview");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[GKRemoteUITableFooterView adjustSizeToFillSuperview:](self, "adjustSizeToFillSuperview:", v4);

  }
}

- (GKButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (BOOL)pinToBottom
{
  return self->_pinToBottom;
}

- (void)setPinToBottom:(BOOL)a3
{
  self->_pinToBottom = a3;
}

- (NSArray)replaceableConstraints
{
  return self->_replaceableConstraints;
}

- (void)setReplaceableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_replaceableConstraints, a3);
}

- (double)buttonBaselineOffset
{
  return self->_buttonBaselineOffset;
}

- (void)setButtonBaselineOffset:(double)a3
{
  self->_buttonBaselineOffset = a3;
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceableConstraints, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
