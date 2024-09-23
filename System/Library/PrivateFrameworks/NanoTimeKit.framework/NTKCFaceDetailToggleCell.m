@implementation NTKCFaceDetailToggleCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)rowHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 44.0);
  v4 = v3;

  return v4;
}

- (NTKCFaceDetailToggleCell)init
{
  NTKCFaceDetailToggleCell *v2;
  uint64_t v3;
  UISwitch *toggle;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKCFaceDetailToggleCell;
  v2 = -[NTKCDetailTableViewCell initWithStyle:](&v7, sel_initWithStyle_, 0);
  if (v2)
  {
    v3 = objc_opt_new();
    toggle = v2->_toggle;
    v2->_toggle = (UISwitch *)v3;

    -[UISwitch addTarget:action:forControlEvents:](v2->_toggle, "addTarget:action:forControlEvents:", v2, sel__switchToggled, 4096);
    -[NTKCFaceDetailToggleCell contentView](v2, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v2->_toggle);

    -[NTKCDetailTableViewCell setShowsSeparator:](v2, "setShowsSeparator:", 1);
  }
  return v2;
}

- (BOOL)on
{
  return -[UISwitch isOn](self->_toggle, "isOn");
}

- (void)setOn:(BOOL)a3
{
  -[UISwitch setOn:](self->_toggle, "setOn:", a3);
}

- (void)_switchToggled
{
  id v3;

  -[NTKCFaceDetailToggleCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleCell:didToggle:", self, -[UISwitch isOn](self->_toggle, "isOn"));

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  int IsRTL;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double Width;
  double MinX;
  double v33;
  double v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  CGFloat rect;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v50.receiver = self;
  v50.super_class = (Class)NTKCFaceDetailToggleCell;
  -[NTKCDetailTableViewCell layoutSubviews](&v50, sel_layoutSubviews);
  -[NTKCFaceDetailToggleCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  rect = v10;

  v11 = NTKCScreenEdgeMargin();
  IsRTL = CLKLayoutIsRTL();
  -[UISwitch frame](self->_toggle, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v47 = v5;
  v48 = v11;
  if (!IsRTL)
  {
    v20 = v13;
    v51.origin.x = v5;
    v51.origin.y = v7;
    v51.size.width = v9;
    v51.size.height = rect;
    CGRectGetWidth(v51);
    v52.origin.x = v20;
    v52.origin.y = v15;
    v52.size.width = v17;
    v52.size.height = v19;
    CGRectGetWidth(v52);
  }
  UIRectCenteredYInRectScale();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UISwitch setFrame:](self->_toggle, "setFrame:", 0);
  v29 = v9;
  v46 = v7;
  if (IsRTL)
  {
    v53.origin.x = v5;
    v53.origin.y = v7;
    v53.size.width = v9;
    v30 = rect;
    v53.size.height = rect;
    Width = CGRectGetWidth(v53);
    v54.origin.x = v22;
    v54.origin.y = v24;
    v54.size.width = v26;
    v54.size.height = v28;
    MinX = Width - CGRectGetMaxX(v54);
  }
  else
  {
    v55.origin.x = v22;
    v55.origin.y = v24;
    v55.size.width = v26;
    v55.size.height = v28;
    MinX = CGRectGetMinX(v55);
    v30 = rect;
  }
  v33 = v48;
  v34 = MinX + -16.0 - v48;
  -[NTKCFaceDetailToggleCell textLabel](self, "textLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  v56.origin.x = v37;
  v56.origin.y = v39;
  v56.size.width = v41;
  v56.size.height = v43;
  if (CGRectGetWidth(v56) > v34)
  {
    if (IsRTL)
    {
      v57.origin.y = v46;
      v57.origin.x = v47;
      v57.size.width = v29;
      v57.size.height = v30;
      v44 = CGRectGetWidth(v57);
      v58.origin.x = v37;
      v58.origin.y = v39;
      v58.size.width = v34;
      v58.size.height = v43;
      v33 = v44 - CGRectGetWidth(v58) - v48;
    }
    -[NTKCFaceDetailToggleCell textLabel](self, "textLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v33, v39, v34, v43);

  }
}

- (NTKCFaceDetailToggleCellDelegate)delegate
{
  return (NTKCFaceDetailToggleCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
  objc_storeStrong((id *)&self->_toggle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
