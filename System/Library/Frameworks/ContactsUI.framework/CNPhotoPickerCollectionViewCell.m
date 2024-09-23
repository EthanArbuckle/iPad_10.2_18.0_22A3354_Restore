@implementation CNPhotoPickerCollectionViewCell

- (CNPhotoPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  CNPhotoPickerCollectionViewCell *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  UIView *containerView;
  void *v12;
  void *v13;
  CNPhotoPickerCollectionViewCell *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNPhotoPickerCollectionViewCell;
  v3 = -[CNPhotoPickerCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[CNPhotoPickerCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    -[CNPhotoPickerCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7, v9);
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v10;

    -[UIView setClipsToBounds:](v3->_containerView, "setClipsToBounds:", 1);
    -[UIView layer](v3->_containerView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

    -[UIView setAutoresizingMask:](v3->_containerView, "setAutoresizingMask:", 18);
    -[CNPhotoPickerCollectionViewCell contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v3->_containerView);

    v14 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CNPhotoPickerCollectionViewCell;
  -[CNPhotoPickerCollectionViewCell layoutSubviews](&v36, sel_layoutSubviews);
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (v5 != v8)
  {
    -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v11, v13, v15, v15);

  }
  v17 = (void *)objc_opt_class();
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v18, "bounds");
  objc_msgSend(v17, "cornerRadiusForBounds:forCellStyle:", -[CNPhotoPickerCollectionViewCell cellStyle](self, "cellStyle"), v19, v20, v21, v22);
  v24 = v23;
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCornerRadius:", v24);

  -[CNPhotoPickerCollectionViewCell selectionLayer](self, "selectionLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_msgSend(v27, "isHidden");

  if ((v18 & 1) == 0)
  {
    v28 = (void *)objc_opt_class();
    -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v34 = objc_msgSend(v28, "selectionPathInBounds:forCellStyle:", -[CNPhotoPickerCollectionViewCell cellStyle](self, "cellStyle"), v30, v31, v32, v33);
    -[CNPhotoPickerCollectionViewCell selectionLayer](self, "selectionLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPath:", v34);

  }
  -[CNPhotoPickerCollectionViewCell updateCaptionFrame](self, "updateCaptionFrame");
}

- (void)setCellStyle:(unint64_t)a3
{
  if (self->_cellStyle != a3)
  {
    self->_cellStyle = a3;
    -[CNPhotoPickerCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateWithView:(id)a3 animation:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  CNPhotoPickerCollectionViewCell *v24;

  v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    objc_msgSend(v6, "setAlpha:", 0.0);
    -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    objc_msgSend(v7, "setFrame:");

    -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v7);

    -[CNPhotoPickerCollectionViewCell setContainerContentView:](self, "setContainerContentView:", v7);
    -[CNPhotoPickerCollectionViewCell displaySessionUUID](self, "displaySessionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_3;
    v20[3] = &unk_1E204F648;
    v21 = v7;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_4;
    v17[3] = &unk_1E2047E60;
    v17[4] = self;
    v18 = v11;
    v19 = v21;
    v14 = v11;
    objc_msgSend(v12, "animateWithDuration:animations:completion:", v20, v17, 0.5);

  }
  else
  {
    if (a4 == 2)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke;
      v22[3] = &unk_1E2050400;
      v23 = v6;
      v24 = self;
      -[CNPhotoPickerCollectionViewCell clearContainerViewAnimated:withCompletion:](self, "clearContainerViewAnimated:withCompletion:", 1, v22);
      v8 = v23;
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_5;
      v15[3] = &unk_1E2050400;
      v15[4] = self;
      v16 = v6;
      -[CNPhotoPickerCollectionViewCell clearContainerViewAnimated:withCompletion:](self, "clearContainerViewAnimated:withCompletion:", 0, v15);
      v8 = v16;
    }

  }
}

- (void)updateWithCaption:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNPhotoPickerCollectionViewCell setCaptionLabel:](self, "setCaptionLabel:", v7);

    +[CNUIFontRepository contactCardPhotoPickerCaptionFont](CNUIFontRepository, "contactCardPhotoPickerCaptionFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 2);

    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextAlignment:", 1);

    LODWORD(v12) = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

    if ((_DWORD)v12)
      v14 = 0.0;
    else
      v14 = 0.7;
    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMinimumScaleFactor:", v14);

    -[CNPhotoPickerCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

  }
  -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v4);

  -[CNPhotoPickerCollectionViewCell updateCaptionFrame](self, "updateCaptionFrame");
}

- (void)updateCaptionFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  id v37;

  -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CNPhotoPickerCollectionViewCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;

  if (v10 > v15)
  {
    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lineHeight");
    v19 = v18;
    -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19 * (double)objc_msgSend(v20, "numberOfLines");

  }
  -[CNPhotoPickerCollectionViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;

  -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v6, v8, v23, v12);

  -[CNPhotoPickerCollectionViewCell contentView](self, "contentView");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "center");
  v26 = v25;
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v29 = v28;
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  v32 = v29 + v31;
  -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v35 = v32 + v34 * 0.5 + 8.0;
  -[CNPhotoPickerCollectionViewCell captionLabel](self, "captionLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCenter:", v26, v35);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CAShapeLayer *v6;
  id v7;
  id v8;
  CAShapeLayer *selectionLayer;
  CAShapeLayer *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerCollectionViewCell;
  -[CNPhotoPickerCollectionViewCell setSelected:](&v15, sel_setSelected_);
  if (v3)
  {
    -[CNPhotoPickerCollectionViewCell selectionLayer](self, "selectionLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
      +[CNUIColorRepository photoPickerSelectionBorderColor](CNUIColorRepository, "photoPickerSelectionBorderColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setStrokeColor:](v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

      -[CAShapeLayer setLineWidth:](v6, "setLineWidth:", 3.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CAShapeLayer setFillColor:](v6, "setFillColor:", objc_msgSend(v8, "CGColor"));

      -[CAShapeLayer setHidden:](v6, "setHidden:", 1);
      selectionLayer = self->_selectionLayer;
      self->_selectionLayer = v6;
      v10 = v6;

      -[CNPhotoPickerCollectionViewCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSublayer:", v10);

    }
  }
  v13 = -[CNPhotoPickerCollectionViewCell displaySelection](self, "displaySelection") & v3 ^ 1;
  -[CNPhotoPickerCollectionViewCell selectionLayer](self, "selectionLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

}

- (void)setDisplaysBorder:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_displaysBorder != a3)
  {
    self->_displaysBorder = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scale");
      v6 = 2.0 / v5;
      -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderWidth:", v6);

      -[CNPhotoPickerCollectionViewCell tintColor](self, "tintColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "colorWithAlphaComponent:", 0.25);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "CGColor");
      -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderColor:", v10);

    }
    else
    {
      -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderWidth:", 0.0);
    }

  }
}

- (void)updateBorderTintColor:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "colorWithAlphaComponent:", 0.25);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v7, "CGColor");
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v4);

}

- (void)clearContainerViewAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  _QWORD v14[5];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = *MEMORY[0x1E0D137F8];
  -[CNPhotoPickerCollectionViewCell containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if (!(_DWORD)v7)
  {
    if (v4)
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke;
      v14[3] = &unk_1E204F648;
      v14[4] = self;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke_2;
      v12[3] = &unk_1E204FB68;
      v12[4] = self;
      v13 = v6;
      objc_msgSend(v10, "animateWithDuration:animations:completion:", v14, v12, 0.15);

      goto LABEL_7;
    }
    -[CNPhotoPickerCollectionViewCell containerContentView](self, "containerContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[CNPhotoPickerCollectionViewCell setContainerContentView:](self, "setContainerContentView:", 0);
  }
  if (v6)
    v6[2](v6);
LABEL_7:

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerCollectionViewCell;
  -[CNPhotoPickerCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CNPhotoPickerCollectionViewCell clearContainerViewAnimated:withCompletion:](self, "clearContainerViewAnimated:withCompletion:", 0, 0);
  -[CNPhotoPickerCollectionViewCell setContainerContentView:](self, "setContainerContentView:", 0);
  -[CNPhotoPickerCollectionViewCell selectionLayer](self, "selectionLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CNPhotoPickerCollectionViewCell setDisplaysBorder:](self, "setDisplaysBorder:", 0);
  -[CNPhotoPickerCollectionViewCell setDisplaySelection:](self, "setDisplaySelection:", 0);
  -[CNPhotoPickerCollectionViewCell setCellStyle:](self, "setCellStyle:", 1);
}

- (BOOL)displaySelection
{
  return self->_displaySelection;
}

- (void)setDisplaySelection:(BOOL)a3
{
  self->_displaySelection = a3;
}

- (BOOL)displaysBorder
{
  return self->_displaysBorder;
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionLayer, a3);
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_captionLabel, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)containerContentView
{
  return self->_containerContentView;
}

- (void)setContainerContentView:(id)a3
{
  objc_storeStrong((id *)&self->_containerContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerContentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

void __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v2;

  objc_msgSend(*(id *)(a1 + 32), "containerContentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v2, 0.2, 0.2);
  objc_msgSend(v1, "setTransform:", &v2);

}

uint64_t __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "containerContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setContainerContentView:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  objc_msgSend(*(id *)(a1 + 40), "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  objc_msgSend(*(id *)(a1 + 40), "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "setContainerContentView:", *(_QWORD *)(a1 + 32));
  CGAffineTransformMakeScale(&v9, 0.2, 0.2);
  v4 = *(void **)(a1 + 32);
  v8 = v9;
  objc_msgSend(v4, "setTransform:", &v8);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_2;
  v6[3] = &unk_1E204F648;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v5, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x20000, v6, 0, 0.5, 0.0, 0.6, 0.0);

}

uint64_t __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
    objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
}

void __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setContainerContentView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", *(_QWORD *)(a1 + 40));

}

uint64_t __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_2(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.0, 1.0);
  return objc_msgSend(v1, "setTransform:", &v3);
}

+ (id)cellIdentifier
{
  return CFSTR("CNPhotoPickerCellIdentifier");
}

+ (double)cornerRadiusForBounds:(CGRect)a3 forCellStyle:(unint64_t)a4
{
  double v4;

  v4 = 0.25;
  if (a4 == 1)
    v4 = 0.5;
  return a3.size.width * v4;
}

+ (CGPath)selectionPathInBounds:(CGRect)a3 forCellStyle:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  id v16;
  CGPath *v17;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = CGRectInset(a3, -6.0, -6.0);
  v10 = v19.origin.x;
  v11 = v19.origin.y;
  v12 = v19.size.width;
  v13 = v19.size.height;
  v14 = (void *)MEMORY[0x1E0DC3508];
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  }
  else
  {
    objc_msgSend(a1, "cornerRadiusForBounds:forCellStyle:", a4, x, y, width, height);
    objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v10, v11, v12, v13, v15);
  }
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (CGPath *)objc_msgSend(v16, "CGPath");

  return v17;
}

@end
