@implementation CKDetailsLocationStringCell

- (CKDetailsLocationStringCell)initWithFrame:(CGRect)a3
{
  CKDetailsLocationStringCell *v3;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKDetailsLocationStringCell;
  v3 = -[CKDetailsLocationStringCell initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[CKDetailsLocationStringCell setLocationImageView:](v3, "setLocationImageView:", v9);

    -[CKDetailsLocationStringCell locationImageView](v3, "locationImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("location.fill"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v13);

    -[CKDetailsLocationStringCell locationImageView](v3, "locationImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    -[CKDetailsLocationStringCell setLocationLabel:](v3, "setLocationLabel:", v16);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationStringCell locationLabel](v3, "locationLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v17);

    v19 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithEffect:", v20);

    -[CKDetailsLocationStringCell setBlurView:](v3, "setBlurView:", v21);
    -[CKDetailsLocationStringCell addSubview:](v3, "addSubview:", v21);
    -[CKDetailsLocationStringCell locationLabel](v3, "locationLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationStringCell addSubview:](v3, "addSubview:", v22);

    -[CKDetailsLocationStringCell locationImageView](v3, "locationImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsLocationStringCell addSubview:](v3, "addSubview:", v23);

    if (CKIsRunningInMacCatalyst())
    {
      -[CKDetailsLocationStringCell layer](v3, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setMaskedCorners:", 12);

      -[CKDetailsLocationStringCell layer](v3, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setCornerRadius:", 4.0);

      -[CKDetailsLocationStringCell layer](v3, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMasksToBounds:", 1);

    }
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
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
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v49.receiver = self;
  v49.super_class = (Class)CKDetailsLocationStringCell;
  -[CKDetailsLocationStringCell layoutSubviews](&v49, sel_layoutSubviews);
  -[CKDetailsLocationStringCell locationImageView](self, "locationImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[CKDetailsLocationStringCell locationImageView](self, "locationImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CKDetailsLocationStringCell layoutMargins](self, "layoutMargins");
  v14 = v13;
  v16 = v15;
  v17 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  -[CKDetailsLocationStringCell bounds](self, "bounds");
  if (v17)
  {
    v20 = v18 - v16;
    v50.origin.x = v6;
    v50.origin.y = v8;
    v50.size.width = v10;
    v50.size.height = v12;
    v21 = v20 - CGRectGetWidth(v50);
    -[CKDetailsLocationStringCell bounds](self, "bounds");
    v23 = v22;
    v51.origin.x = v6;
    v51.origin.y = v8;
    v51.size.width = v10;
    v51.size.height = v12;
    v24 = (v23 - CGRectGetHeight(v51)) * 0.5;
    if (CKMainScreenScale_once_79 != -1)
      dispatch_once(&CKMainScreenScale_once_79, &__block_literal_global_195);
    v25 = *(double *)&CKMainScreenScale_sMainScreenScale_79;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_79 == 0.0)
      v25 = 1.0;
    v26 = v21 * v25;
  }
  else
  {
    v27 = v19;
    v52.origin.x = v6;
    v52.origin.y = v8;
    v52.size.width = v10;
    v52.size.height = v12;
    v24 = (v27 - CGRectGetHeight(v52)) * 0.5;
    if (CKMainScreenScale_once_79 != -1)
      dispatch_once(&CKMainScreenScale_once_79, &__block_literal_global_195);
    v25 = *(double *)&CKMainScreenScale_sMainScreenScale_79;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_79 == 0.0)
      v25 = 1.0;
    v26 = v14 * v25;
  }
  v28 = floor(v26) / v25;
  v29 = floor(v24 * v25) / v25;
  -[CKDetailsLocationStringCell locationImageView](self, "locationImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v28, v29, v10, v12);

  -[CKDetailsLocationStringCell bounds](self, "bounds");
  v33 = v32;
  v35 = v34;
  if (v17)
  {
    v36 = v31;
    v53.origin.x = v28;
    v53.origin.y = v29;
    v53.size.width = v10;
    v53.size.height = v12;
    v37 = CGRectGetMinX(v53) + -3.0;
  }
  else
  {
    v54.origin.x = v28;
    v54.origin.y = v29;
    v54.size.width = v10;
    v54.size.height = v12;
    v36 = CGRectGetMaxX(v54) + 3.0;
    -[CKDetailsLocationStringCell bounds](self, "bounds");
    v37 = v38 - v36;
  }
  -[CKDetailsLocationStringCell locationLabel](self, "locationLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v36, v33, v37, v35);

  -[CKDetailsLocationStringCell bounds](self, "bounds");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[CKDetailsLocationStringCell blurView](self, "blurView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

}

- (void)setLocationString:(id)a3
{
  if (self->_locationString != a3)
  {
    -[UILabel setText:](self->_locationLabel, "setText:");
    -[CKDetailsLocationStringCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)locationString
{
  return self->_locationString;
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (UIImageView)locationImageView
{
  return self->_locationImageView;
}

- (void)setLocationImageView:(id)a3
{
  objc_storeStrong((id *)&self->_locationImageView, a3);
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_locationImageView, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
}

@end
