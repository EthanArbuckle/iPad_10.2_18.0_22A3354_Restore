@implementation CKAppMenuCollectionViewCell

- (CKAppMenuCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKAppMenuCollectionViewCell *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CKAppMenuCollectionViewCell;
  v3 = -[CKAppMenuCollectionViewCell initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[CKAppMenuCollectionViewCell setTitleLabel:](v3, "setTitleLabel:", v9);

    -[CKAppMenuCollectionViewCell titleLabel](v3, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appMenuTitleFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v12);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppMenuCollectionViewCell titleLabel](v3, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    -[CKAppMenuCollectionViewCell contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppMenuCollectionViewCell titleLabel](v3, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v5, v6, v7, v8);
    -[CKAppMenuCollectionViewCell setImageView:](v3, "setImageView:", v17);

    -[CKAppMenuCollectionViewCell contentView](v3, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppMenuCollectionViewCell imageView](v3, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    -[CKAppMenuCollectionViewCell setSelectionView:](v3, "setSelectionView:", v20);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "theme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appTintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppMenuCollectionViewCell selectionView](v3, "selectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v23);

    -[CKAppMenuCollectionViewCell selectionView](v3, "selectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 0.0);

    -[CKAppMenuCollectionViewCell contentView](v3, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppMenuCollectionViewCell selectionView](v3, "selectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "insertSubview:atIndex:", v27, 0);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v3, sel_didHoverOverCell_);
    -[CKAppMenuCollectionViewCell addGestureRecognizer:](v3, "addGestureRecognizer:", v28);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_handleTap_);
    -[CKAppMenuCollectionViewCell addGestureRecognizer:](v3, "addGestureRecognizer:", v29);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double MaxX;
  double v27;
  double v28;
  void *v29;
  double MidY;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48.receiver = self;
  v48.super_class = (Class)CKAppMenuCollectionViewCell;
  -[CKAppMenuCollectionViewCell layoutSubviews](&v48, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iMessageAppIconSize");
  v5 = v4;
  v7 = v6;

  -[CKAppMenuCollectionViewCell layoutMargins](self, "layoutMargins");
  v9 = v8;
  -[CKAppMenuCollectionViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v11 = CGRectGetMidY(v49) - v7 * 0.5;
  -[CKAppMenuCollectionViewCell imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v9, v11, v5, v7);

  -[CKAppMenuCollectionViewCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intrinsicContentSize");
  v15 = v14;

  -[CKAppMenuCollectionViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  -[CKAppMenuCollectionViewCell layoutMargins](self, "layoutMargins");
  v20 = v18 - v19;
  -[CKAppMenuCollectionViewCell imageView](self, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v22 = v20 - CGRectGetMaxX(v50);
  -[CKAppMenuCollectionViewCell layoutMargins](self, "layoutMargins");
  v24 = v22 - v23;

  if (v15 >= v24)
    v15 = v24;
  -[CKAppMenuCollectionViewCell imageView](self, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  MaxX = CGRectGetMaxX(v51);
  -[CKAppMenuCollectionViewCell layoutMargins](self, "layoutMargins");
  v28 = MaxX + v27;
  -[CKAppMenuCollectionViewCell contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  MidY = CGRectGetMidY(v52);
  -[CKAppMenuCollectionViewCell titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "intrinsicContentSize");
  v33 = MidY - v32 * 0.5;
  -[CKAppMenuCollectionViewCell titleLabel](self, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "intrinsicContentSize");
  v36 = v35;
  -[CKAppMenuCollectionViewCell titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v28, v33, v15, v36);

  -[CKAppMenuCollectionViewCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[CKAppMenuCollectionViewCell selectionView](self, "selectionView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);

}

- (void)didHoverOverCell:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[CKAppMenuCollectionViewCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  objc_msgSend(v6, "appMenuCollectionViewCell:didHoverWithState:", self, v5);
}

- (void)handleTap:(id)a3
{
  id v4;

  -[CKAppMenuCollectionViewCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appMenuCollectionViewCellWasTapped:", self);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAppMenuCollectionViewCell;
  -[CKAppMenuCollectionViewCell setSelected:](&v8, sel_setSelected_);
  -[CKAppMenuCollectionViewCell selectionView](self, "selectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", (double)v3);

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppMenuCollectionViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (CKAppMenuCollectionViewCellDelegate)delegate
{
  return (CKAppMenuCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
