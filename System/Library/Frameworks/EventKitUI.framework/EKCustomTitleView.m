@implementation EKCustomTitleView

- (EKCustomTitleView)initWithTitle:(id)a3 subTitle:(id)a4 eventViewController:(id)a5
{
  id v7;
  id v8;
  EKCustomTitleView *v9;
  uint64_t v10;
  UILabel *originalTitle;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  UIImageView *originalImage;
  uint64_t v19;
  UILabel *title;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  UIImageView *titleImage;
  uint64_t v27;
  UILabel *subTitle;
  void *v29;
  void *v30;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)EKCustomTitleView;
  v9 = -[EKCustomTitleView init](&v32, sel_init);
  if (v9)
  {
    v10 = objc_opt_new();
    originalTitle = v9->_originalTitle;
    v9->_originalTitle = (UILabel *)v10;

    -[UILabel setText:](v9->_originalTitle, "setText:", v7);
    v12 = *MEMORY[0x1E0DC1448];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1448]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_originalTitle, "setFont:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_originalTitle, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v9->_originalTitle, "setTextAlignment:", 1);
    -[EKCustomTitleView addSubview:](v9, "addSubview:", v9->_originalTitle);
    -[UILabel sizeToFit](v9->_originalTitle, "sizeToFit");
    v15 = objc_alloc(MEMORY[0x1E0DC3890]);
    captureImageFromView(v9->_originalTitle, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithImage:", v16);
    originalImage = v9->_originalImage;
    v9->_originalImage = (UIImageView *)v17;

    -[EKCustomTitleView addSubview:](v9, "addSubview:", v9->_originalImage);
    -[UILabel setAlpha:](v9->_originalTitle, "setAlpha:", 0.0);
    v19 = objc_opt_new();
    title = v9->_title;
    v9->_title = (UILabel *)v19;

    -[UILabel setText:](v9->_title, "setText:", v7);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_title, "setFont:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_title, "setTextColor:", v22);

    -[UILabel setTextAlignment:](v9->_title, "setTextAlignment:", 1);
    -[EKCustomTitleView addSubview:](v9, "addSubview:", v9->_title);
    -[UILabel sizeToFit](v9->_title, "sizeToFit");
    v23 = objc_alloc(MEMORY[0x1E0DC3890]);
    captureImageFromView(v9->_title, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithImage:", v24);
    titleImage = v9->_titleImage;
    v9->_titleImage = (UIImageView *)v25;

    -[EKCustomTitleView addSubview:](v9, "addSubview:", v9->_titleImage);
    -[UILabel setAlpha:](v9->_title, "setAlpha:", 0.0);
    v27 = objc_opt_new();
    subTitle = v9->_subTitle;
    v9->_subTitle = (UILabel *)v27;

    -[UILabel setText:](v9->_subTitle, "setText:", v8);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0DC1438]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_subTitle, "setFont:", v29);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_subTitle, "setTextColor:", v30);

    -[UILabel setTextAlignment:](v9->_subTitle, "setTextAlignment:", 1);
    -[UILabel setAlpha:](v9->_subTitle, "setAlpha:", 0.0);
    -[EKCustomTitleView addSubview:](v9, "addSubview:", v9->_subTitle);
  }
  -[EKCustomTitleView sizeToFit](v9, "sizeToFit");

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_originalTitle, "sizeThatFits:");
  v7 = v6;
  -[UILabel sizeThatFits:](self->_subTitle, "sizeThatFits:", width, height);
  if (v7 >= v8)
    v8 = v7;
  v9 = 44.0;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)_centerAndClipFrame:(CGRect)a3
{
  double width;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double MinX;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double MaxX;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat y;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  rect = a3.origin.x;
  rect_8 = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  -[EKCustomTitleView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[EKCustomTitleView bounds](self, "bounds");
  v16 = v15;
  rect_16 = v17;
  rect_24 = v18;
  v19 = v14;
  if (width >= v14)
    width = v14;
  v42.origin.x = v7;
  v42.origin.y = v9;
  v42.size.width = v11;
  v42.size.height = v13;
  MinX = CGRectGetMinX(v42);
  v43.origin.x = v7;
  v43.origin.y = v9;
  v43.size.width = v11;
  v21 = v16;
  v43.size.height = v13;
  v22 = CGRectGetWidth(v43);
  v44.origin.x = rect;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = rect_8;
  v23 = MinX + (v22 - CGRectGetWidth(v44)) * 0.5;
  -[EKCustomTitleView contentScaleFactor](self, "contentScaleFactor");
  v25 = EKRoundWithScale(v23, v24);
  -[EKCustomTitleView window](self, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0.0;
  objc_msgSend(v26, "convertPoint:toView:", self, v25, 0.0);
  v29 = v28;

  v45.origin.x = v29;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = rect_8;
  v30 = CGRectGetMinX(v45);
  v46.origin.x = v21;
  v46.origin.y = rect_16;
  v46.size.height = rect_24;
  v46.size.width = v19;
  if (v30 >= CGRectGetMinX(v46))
  {
    v47.origin.x = v29;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = rect_8;
    MaxX = CGRectGetMaxX(v47);
    v48.origin.x = v21;
    v48.origin.y = rect_16;
    v48.size.width = v19;
    v48.size.height = rect_24;
    if (MaxX <= CGRectGetMaxX(v48))
    {
      v27 = v29;
    }
    else
    {
      v49.origin.x = v21;
      v49.origin.y = rect_16;
      v49.size.width = v19;
      v49.size.height = rect_24;
      v32 = CGRectGetMaxX(v49);
      v50.origin.x = v29;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = rect_8;
      v27 = v32 - CGRectGetWidth(v50);
    }
  }
  v33 = v27;
  v34 = y;
  v35 = width;
  v36 = rect_8;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  objc_super v52;
  CGRect v53;

  -[EKCustomTitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v52.receiver = self;
  v52.super_class = (Class)EKCustomTitleView;
  -[EKCustomTitleView layoutSubviews](&v52, sel_layoutSubviews);
  -[EKCustomTitleView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (self->_showSubtitle)
    {
      -[UILabel font](self->_title, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", v4, v6);
      v10 = v9;
      v12 = v11;
      objc_msgSend(v8, "ascender");
      v14 = v13;
      -[EKCustomTitleView contentScaleFactor](self, "contentScaleFactor");
      v16 = 19.0 - EKRoundWithScale(v14, v15);
      v17 = 1.0;
      v18 = 0.0;
    }
    else
    {
      -[UILabel font](self->_originalTitle, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel sizeThatFits:](self->_originalTitle, "sizeThatFits:", v4, v6);
      v10 = v19;
      v12 = v20;
      -[EKCustomTitleView bounds](self, "bounds");
      v22 = (v21 - v12) * 0.5;
      -[EKCustomTitleView contentScaleFactor](self, "contentScaleFactor");
      v16 = EKRoundWithScale(v22, v23);
      v17 = 0.0;
      v18 = 1.0;
    }
    -[UIImageView setAlpha:](self->_originalImage, "setAlpha:", v18);
    -[UIImageView setAlpha:](self->_titleImage, "setAlpha:", v17);
    -[UILabel setAlpha:](self->_subTitle, "setAlpha:", v17);
    -[UILabel sizeThatFits:](self->_subTitle, "sizeThatFits:", v4, v6);
    v25 = v24;
    v27 = v26;
    objc_msgSend(v8, "descender");
    v29 = v28;
    -[UILabel font](self->_subTitle, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ascender");
    v32 = v31 - v29;
    -[EKCustomTitleView contentScaleFactor](self, "contentScaleFactor");
    v34 = 16.0 - EKRoundWithScale(v32, v33);

    v53.origin.x = 0.0;
    v53.origin.y = v16;
    v53.size.width = v10;
    v53.size.height = v12;
    v35 = v34 + CGRectGetMaxY(v53);
    -[EKCustomTitleView _centerAndClipFrame:](self, "_centerAndClipFrame:", 0.0, v16, v10, v12);
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    -[EKCustomTitleView _centerAndClipFrame:](self, "_centerAndClipFrame:", 0.0, v35, v25, v27);
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    -[UILabel setFrame:](self->_title, "setFrame:", v37, v39, v41, v43);
    -[UIImageView setFrame:](self->_originalImage, "setFrame:", v37, v39, v41, v43);
    -[UIImageView setFrame:](self->_titleImage, "setFrame:", v37, v39, v41, v43);
    -[UILabel setFrame:](self->_subTitle, "setFrame:", v45, v47, v49, v51);

  }
}

- (void)animateInWithCompletionBlock:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[EKCustomTitleView layoutIfNeeded](self, "layoutIfNeeded");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__EKCustomTitleView_animateInWithCompletionBlock___block_invoke;
  v5[3] = &unk_1E6018688;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, 0.300000012);

}

uint64_t __50__EKCustomTitleView_animateInWithCompletionBlock___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 416) = 1;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)animateOutWithCompletionBlock:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[EKCustomTitleView layoutIfNeeded](self, "layoutIfNeeded");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__EKCustomTitleView_animateOutWithCompletionBlock___block_invoke;
  v5[3] = &unk_1E6018688;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, 0.300000012);

}

uint64_t __51__EKCustomTitleView_animateOutWithCompletionBlock___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 416) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityElementCount
{
  return 2;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___EKCustomTitleView__subTitle;
  if (!a3)
    v3 = &OBJC_IVAR___EKCustomTitleView__title;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  return self->_title != a3;
}

- (UILabel)originalTitle
{
  return (UILabel *)objc_getProperty(self, a2, 424, 1);
}

- (void)setOriginalTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (UILabel)title
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (UIImageView)originalImage
{
  return (UIImageView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setOriginalImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (UIImageView)titleImage
{
  return (UIImageView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setTitleImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (UILabel)subTitle
{
  return (UILabel *)objc_getProperty(self, a2, 456, 1);
}

- (void)setSubTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (BOOL)showSubtitle
{
  return self->_showSubtitle;
}

- (void)setShowSubtitle:(BOOL)a3
{
  self->_showSubtitle = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_originalTitle, 0);
}

@end
