@implementation CKTitledImageBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  void *v11;
  objc_super v12;

  v6 = a6;
  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKTitledImageBalloonView;
  v10 = a3;
  -[CKImageBalloonView configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](&v12, sel_configureForMediaObject_previewWidth_orientation_hasInvisibleInkEffect_, v10, v7, v6, a4);
  objc_msgSend(v10, "title", v12.receiver, v12.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTitledImageBalloonView setTitle:](self, "setTitle:", v11);
}

- (CKTitledImageBalloonView)initWithFrame:(CGRect)a3
{
  CKTitledImageBalloonView *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKTitledImageBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CEA700]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v6, "setOpaque:", 0);
    objc_msgSend(v6, "setBackgroundColor:", 0);
    objc_msgSend(v4, "previewTitleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[CKTitledImageBalloonView addSubview:](v3, "addSubview:", v6);
    -[CKTitledImageBalloonView setTitleLabel:](v3, "setTitleLabel:", v6);
    if (objc_msgSend(v4, "showsBalloonChevron"))
    {
      v8 = objc_alloc(MEMORY[0x1E0CEA658]);
      objc_msgSend(v4, "chevronImageForColorType:", 0xFFFFFFFFLL);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageFlippedForRightToLeftLayoutDirection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithImage:", v10);

      objc_msgSend(v11, "setContentMode:", 4);
      -[CKTitledImageBalloonView addSubview:](v3, "addSubview:", v11);
      -[CKTitledImageBalloonView setChevron:](v3, "setChevron:", v11);

    }
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
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
  void *v38;
  int v39;
  double v40;
  double v41;
  CGFloat v42;
  double MaxX;
  double MinX;
  double v45;
  double rect;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v47.receiver = self;
  v47.super_class = (Class)CKTitledImageBalloonView;
  -[CKImageBalloonView layoutSubviews](&v47, sel_layoutSubviews);
  -[CKTitledImageBalloonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  -[CKTitledImageBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:", v4, v6, v8, v10);
  v13 = v12;
  rect = v14;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "previewTitleBarHeight");
  v17 = v16;

  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  v18 = CGRectGetMaxY(v48) - v17;
  -[CKTitledImageBalloonView effectView](self, "effectView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, v10 - v17, v8, v17);

  -[CKTitledImageBalloonView chevron](self, "chevron");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "size");
  v45 = v22;

  -[CKTitledImageBalloonView titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_capOffsetFromBoundsTop");
  v25 = v24;
  objc_msgSend(v23, "_baselineOffsetFromBottom");
  v27 = v17 - (v25 + v26);
  if (CKMainScreenScale_once_37 != -1)
    dispatch_once(&CKMainScreenScale_once_37, &__block_literal_global_90);
  v28 = *(double *)&CKMainScreenScale_sMainScreenScale_37;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_37 == 0.0)
    v28 = 1.0;
  v29 = rect * v28;
  v30 = v27 * v28;
  v31 = v13 * v28 + floor((v29 - v29) * 0.5);
  v32 = v18 * v28 + floor((v17 * v28 - v27 * v28) * 0.5);
  v33 = 1.0 / v28;
  v34 = v33 * v31;
  v35 = v33 * v32;
  v36 = v29 * v33;
  v37 = v30 * v33;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "showsBalloonChevron");

  v40 = v45 + 10.0;
  if (!v39)
    v40 = 0.0;
  v41 = v36 - v40;
  if (v11)
  {
    v49.origin.x = v13;
    v49.origin.y = v18;
    v42 = v34;
    v49.size.width = rect;
    v49.size.height = v17;
    MaxX = CGRectGetMaxX(v49);
    v50.origin.x = v42;
    v50.origin.y = v35;
    v50.size.width = v41;
    v50.size.height = v37;
    objc_msgSend(v23, "setFrame:", MaxX - CGRectGetWidth(v50), v35, v41, v37);
    v51.origin.x = v13;
    v51.origin.y = v18;
    v51.size.width = rect;
    v51.size.height = v17;
    MinX = CGRectGetMinX(v51);
  }
  else
  {
    objc_msgSend(v23, "setFrame:", v34, v35, v41, v37);
    v52.origin.x = v13;
    v52.origin.y = v18;
    v52.size.width = rect;
    v52.size.height = v17;
    MinX = CGRectGetMaxX(v52) - v45;
  }
  objc_msgSend(v20, "setFrame:", MinX, v18, v45, v17);

}

- (void)prepareForDisplay
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKTitledImageBalloonView;
  -[CKImageBalloonView prepareForDisplay](&v9, sel_prepareForDisplay);
  -[CKTitledImageBalloonView effectView](self, "effectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);
    -[CKTitledImageBalloonView setEffectView:](self, "setEffectView:", v6);

    -[CKTitledImageBalloonView effectView](self, "effectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTitledImageBalloonView addSubview:](self, "addSubview:", v7);

  }
  -[CKTitledImageBalloonView effectView](self, "effectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTitledImageBalloonView sendSubviewToBack:](self, "sendSubviewToBack:", v8);

}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  UIEdgeInsets result;

  v3 = -[CKBalloonView orientation](self, "orientation");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView balloonDescriptor](self, "balloonDescriptor");
  objc_msgSend(v4, "balloonMaskAlignmentRectInsetsWithTailShape:", v17);
  v8 = v7;
  v10 = v9;
  if (v3)
    v11 = v5;
  else
    v11 = v6;
  if (v3)
    v12 = v6;
  else
    v12 = v5;

  v13 = v8;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTitledImageBalloonView;
  -[CKImageBalloonView prepareForReuse](&v4, sel_prepareForReuse);
  -[CKTitledImageBalloonView chevron](self, "chevron");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  objc_super v13;
  objc_super v14;
  CGRect slice;
  CGRect remainder;
  CGPoint v17;
  CGRect v18;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "handlesBalloonViewTitleTapsSeparately");

  if (v6)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationShareBalloonButtonHeight");
    v9 = v8;

    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    -[CKTitledImageBalloonView bounds](self, "bounds");
    CGRectDivide(v18, &slice, &remainder, v9, CGRectMaxYEdge);
    objc_msgSend(v4, "locationInView:", self);
    v17.x = v10;
    v17.y = v11;
    if (CGRectContainsPoint(slice, v17))
    {
      -[CKBalloonView delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "balloonViewTitleTapped:", self);

    }
    else
    {
      -[CKImageBalloonView tapGestureRecognized:](&v14, sel_tapGestureRecognized_, v4, v13.receiver, v13.super_class, self, CKTitledImageBalloonView);
    }
  }
  else
  {
    -[CKImageBalloonView tapGestureRecognized:](&v13, sel_tapGestureRecognized_, v4, self, CKTitledImageBalloonView, v14.receiver, v14.super_class);
  }

}

- (void)setOrientation:(char)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = a3;
  if (-[CKBalloonView orientation](self, "orientation") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKTitledImageBalloonView;
    -[CKBalloonView setOrientation:](&v5, sel_setOrientation_, v3);
    -[CKTitledImageBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKTitledImageBalloonView title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
  {
    -[CKTitledImageBalloonView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[CKTitledImageBalloonView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[CKTitledImageBalloonView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
}

- (void)configureForLocatingChatItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKTitledImageBalloonView setOrientation:](self, "setOrientation:", objc_msgSend(v4, "balloonOrientation"));
  -[CKImageBalloonView setHasTail:](self, "setHasTail:", objc_msgSend(v4, "hasTail"));
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", objc_msgSend(v4, "balloonCorners"));
  objc_msgSend(v4, "textAlignmentInsets");
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapPreviewMaxWidth");
  +[CKLocationMediaObject placeholderPreviewForWidth:orientation:](CKLocationMediaObject, "placeholderPreviewForWidth:orientation:", objc_msgSend(v4, "balloonOrientation"), v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[CKImageBalloonView setImage:](self, "setImage:", v8);
  objc_msgSend(v4, "locationText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTitledImageBalloonView setTitle:](self, "setTitle:", v7);
}

@end
