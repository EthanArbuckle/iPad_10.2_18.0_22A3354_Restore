@implementation CKLabel

- (void)_rotateTitleIconImageView
{
  _BOOL4 v3;
  __int128 v4;
  CGFloat v5;
  __int128 v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  memset(&v11, 0, sizeof(v11));
  if (-[CKLabel shouldHaveRotatedTitleIconImage](self, "shouldHaveRotatedTitleIconImage"))
  {
    v3 = -[CKLabel isLTR](self, "isLTR");
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10.c = v4;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (v3)
      v5 = 1.57079633;
    else
      v5 = -1.57079633;
    CGAffineTransformRotate(&v11, &v10, v5);
  }
  else
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v11.c = v6;
    *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v9 = v11;
  -[CKLabel titleIconImageView](self, "titleIconImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

- (BOOL)shouldHaveRotatedTitleIconImage
{
  return self->_shouldHaveRotatedTitleIconImage;
}

- (void)setTitleIconImageType:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  if (self->_titleIconImageType != a3)
    -[CKLabel setNeedsDisplay](self, "setNeedsDisplay");
  self->_titleIconImageType = a3;
  -[CKLabel titleIconImageView](self, "titleIconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[CKLabel setTitleIconImageView:](self, "setTitleIconImageView:", 0);
  switch(a3)
  {
    case 1:
      v6 = objc_alloc(MEMORY[0x1E0CEA658]);
      v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKLabel setTitleIconImageView:](self, "setTitleIconImageView:", v7);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "businessVerifiedImageLarge");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      v26 = objc_alloc(MEMORY[0x1E0CEA658]);
      v27 = (void *)objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKLabel setTitleIconImageView:](self, "setTitleIconImageView:", v27);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "theme");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "navBarGrayColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLabel titleIconImageView](self, "titleIconImageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTintColor:", v30);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "navBarHeaderChevronImageNoAvatar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLabel titleIconImageView](self, "titleIconImageView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setImage:", v15);

      goto LABEL_13;
    case 3:
      v10 = objc_alloc(MEMORY[0x1E0CEA658]);
      v11 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKLabel setTitleIconImageView:](self, "setTitleIconImageView:", v11);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navBarHeaderOpaqueChevronImageNoAvatar");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v12 = (void *)v9;
      -[CKLabel titleIconImageView](self, "titleIconImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:", v12);

      -[CKLabel textColor](self, "textColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLabel titleIconImageView](self, "titleIconImageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTintColor:", v14);
      goto LABEL_13;
    case 4:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isKeyTransparencyEnabled");

      if (!v34)
        goto LABEL_14;
      v35 = objc_alloc(MEMORY[0x1E0CEA658]);
      v36 = (void *)objc_msgSend(v35, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKLabel setTitleIconImageView:](self, "setTitleIconImageView:", v36);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "theme");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "navBarGrayColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLabel titleIconImageView](self, "titleIconImageView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setTintColor:", v39);

      v24 = (void *)MEMORY[0x1E0CEA638];
      v25 = CFSTR("checkmark.circle.fill");
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isKeyTransparencyEnabled");

      if (!v17)
        goto LABEL_14;
      v18 = objc_alloc(MEMORY[0x1E0CEA658]);
      v19 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKLabel setTitleIconImageView:](self, "setTitleIconImageView:", v19);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "theme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "navBarGrayColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKLabel titleIconImageView](self, "titleIconImageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTintColor:", v22);

      v24 = (void *)MEMORY[0x1E0CEA638];
      v25 = CFSTR("exclamationmark.triangle.fill");
      break;
    default:
      goto LABEL_14;
  }
  objc_msgSend(v24, "systemImageNamed:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel titleIconImageView](self, "titleIconImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v14);
LABEL_13:

  -[CKLabel titleIconImageView](self, "titleIconImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLabel addSubview:](self, "addSubview:", v41);

LABEL_14:
  if (-[CKLabel titleIconImageTypeSupportsRotation:](self, "titleIconImageTypeSupportsRotation:", a3))
  {
    -[CKLabel titleIconImageView](self, "titleIconImageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setContentMode:", 4);

  }
  else
  {
    -[CKLabel setShouldHaveRotatedTitleIconImage:](self, "setShouldHaveRotatedTitleIconImage:", 0);
    -[CKLabel _rotateTitleIconImageView](self, "_rotateTitleIconImageView");
  }
  -[CKLabel setNeedsLayout](self, "setNeedsLayout");
}

- (UIImageView)titleIconImageView
{
  return self->_titleIconImageView;
}

- (BOOL)titleIconImageTypeSupportsRotation:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[CKLabel titleIconImageTypesSupportingRotation](self, "titleIconImageTypesSupportingRotation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (NSSet)titleIconImageTypesSupportingRotation
{
  NSSet *titleIconImageTypesSupportingRotation;
  NSSet *v4;
  NSSet *v5;

  titleIconImageTypesSupportingRotation = self->_titleIconImageTypesSupportingRotation;
  if (!titleIconImageTypesSupportingRotation)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E286FB38);
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_titleIconImageTypesSupportingRotation;
    self->_titleIconImageTypesSupportingRotation = v4;

    titleIconImageTypesSupportingRotation = self->_titleIconImageTypesSupportingRotation;
  }
  return titleIconImageTypesSupportingRotation;
}

- (void)setTitleIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_titleIconImageView, a3);
}

- (void)setShouldHaveRotatedTitleIconImage:(BOOL)a3
{
  self->_shouldHaveRotatedTitleIconImage = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[CKLabel hasAccessoryImageView](self, "hasAccessoryImageView"))
  {
    -[CKLabel sizeOfAccessoryImageView](self, "sizeOfAccessoryImageView");
    v7 = v6;
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v15.receiver = self;
      v15.super_class = (Class)CKLabel;
      -[CKLabel sizeThatFits:](&v15, sel_sizeThatFits_, width, height);
      v11 = v7 + 4.0 + v12;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)CKLabel;
      -[CKLabel sizeThatFits:](&v14, sel_sizeThatFits_, width + -4.0 - v6, height);
      v11 = v7 + 4.0 + v10;
      if (v11 >= width)
        v11 = width;
      if (v9 >= height)
        v9 = height;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKLabel;
    -[CKLabel sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  }
  result.height = v9;
  result.width = v11;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  objc_super v4;

  -[CKLabel rectToDrawTextInForRect:](self, "rectToDrawTextInForRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4.receiver = self;
  v4.super_class = (Class)CKLabel;
  -[CKLabel drawTextInRect:](&v4, sel_drawTextInRect_);
}

- (CGRect)rectToDrawTextInForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CKLabel hasAccessoryImageView](self, "hasAccessoryImageView"))
  {
    -[CKLabel textRectForAccessoryImageView](self, "textRectForAccessoryImageView");
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double Height;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
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
  CGFloat rect;
  double rect_8a;
  double rect_8;
  double rect_8b;
  double rect_16;
  double rect_24;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v47.receiver = self;
  v47.super_class = (Class)CKLabel;
  -[CKLabel layoutSubviews](&v47, sel_layoutSubviews);
  if (!-[CKLabel hasAccessoryImageView](self, "hasAccessoryImageView"))
    return;
  -[CKLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKLabel sizeOfAccessoryImageView](self, "sizeOfAccessoryImageView");
  v12 = v11;
  rect_16 = v13;
  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  rect_24 = v12;
  v14 = CGRectGetWidth(v48) + -2.0 - v12;
  v49.origin.x = v4;
  v49.origin.y = v6;
  v49.size.width = v8;
  v49.size.height = v10;
  -[CKLabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", -[CKLabel numberOfLines](self, "numberOfLines"), 0.0, 0.0, v14, CGRectGetHeight(v49));
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  rect = v15;
  if (-[CKLabel textAlignment](self, "textAlignment") == 1)
  {
    v50.origin.x = v4;
    v50.origin.y = v6;
    v50.size.width = v8;
    v50.size.height = v10;
    rect_8a = CGRectGetWidth(v50);
    v51.origin.x = v16;
    v51.origin.y = v18;
    v51.size.width = v20;
    v51.size.height = v22;
    v23 = (rect_8a - (rect_24 + CGRectGetWidth(v51) + 2.0)) * 0.5;
  }
  else
  {
    if (!-[CKLabel isLTR](self, "isLTR"))
    {
      v52.origin.x = v4;
      v52.origin.y = v6;
      v52.size.width = v8;
      v52.size.height = v10;
      rect_8b = CGRectGetWidth(v52);
      v53.origin.x = v16;
      v53.origin.y = v18;
      v53.size.width = v20;
      v53.size.height = v22;
      v24 = v6;
      rect_8 = rect_8b - (rect_24 + CGRectGetWidth(v53) + 2.0);
      goto LABEL_8;
    }
    v23 = 0.0;
  }
  rect_8 = v23;
  v24 = v6;
LABEL_8:
  v54.origin.x = v4;
  v54.origin.y = v24;
  v54.size.width = v8;
  v54.size.height = v10;
  v40 = (CGRectGetHeight(v54) - rect_16) * 0.5;
  v55.origin.x = v4;
  v55.origin.y = v24;
  v55.size.width = v8;
  v55.size.height = v10;
  Height = CGRectGetHeight(v55);
  v56.origin.x = rect;
  v56.origin.y = v18;
  v56.size.width = v20;
  v56.size.height = v22;
  v26 = (Height - CGRectGetHeight(v56)) * 0.5;
  if (-[CKLabel isLTR](self, "isLTR"))
  {
    v27 = rect_8;
    v28 = v26;
    v29 = v20;
    v30 = v22;
  }
  else
  {
    v27 = rect_8;
    v28 = v40;
    v29 = rect_24;
    v30 = rect_16;
  }
  CGRectGetMaxX(*(CGRect *)&v27);
  UIRectRoundToViewScale();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[CKLabel titleIconImageView](self, "titleIconImageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  UIRectRoundToViewScale();
  -[CKLabel setTextRectForAccessoryImageView:](self, "setTextRectForAccessoryImageView:");
}

- (BOOL)hasAccessoryImageView
{
  int64_t v2;
  void *v3;
  char v4;

  v2 = -[CKLabel titleIconImageType](self, "titleIconImageType");
  if (v2)
  {
    if (v2 == 5 || v2 == 4)
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isKeyTransparencyEnabled");

      LOBYTE(v2) = v4;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (void)setTextColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKLabel;
  -[CKLabel setTextColor:](&v6, sel_setTextColor_, v4);
  if (-[CKLabel titleIconImageType](self, "titleIconImageType") == 1
    || -[CKLabel titleIconImageType](self, "titleIconImageType") == 3)
  {
    -[CKLabel titleIconImageView](self, "titleIconImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

  }
}

- (int64_t)titleIconImageType
{
  return self->_titleIconImageType;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)CKLabel;
  -[CKLabel intrinsicContentSize](&v10, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  if (-[CKLabel hasAccessoryImageView](self, "hasAccessoryImageView"))
  {
    -[CKLabel sizeOfAccessoryImageView](self, "sizeOfAccessoryImageView");
    v4 = v4 + v7 + 2.0;
  }
  v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeOfAccessoryImageView
{
  double v2;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  CGSize result;

  switch(-[CKLabel titleIconImageType](self, "titleIconImageType"))
  {
    case 0:
      goto LABEL_5;
    case 1:
      -[CKLabel font](self, "font");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lineHeight");
      UICeilToViewScale();
      v2 = v23;

      v4 = v2;
      break;
    case 2:
    case 3:
      -[CKLabel titleIconImageView](self, "titleIconImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "size");
      v8 = v7;
      v10 = v9;

      v4 = v8 * 1.5;
      v2 = v10 * 1.5;
      break;
    case 4:
    case 5:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isKeyTransparencyEnabled");

      if (v12)
      {
        -[CKLabel font](self, "font");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lineHeight");
        UICeilToViewScale();
        v15 = v14;

        -[CKLabel titleIconImageView](self, "titleIconImageView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "image");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "size");
        v19 = v18;
        v21 = v20;

        v4 = v19 * (v15 / v21);
        v2 = v21 * (v15 / v21);
      }
      else
      {
LABEL_5:
        v4 = *MEMORY[0x1E0C9D820];
        v2 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      break;
    default:
      break;
  }
  v24 = v2;
  result.height = v24;
  result.width = v4;
  return result;
}

- (void)setShouldHaveRotatedTitleIconImage:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[5];

  v4 = a4;
  v5 = a3;
  if (-[CKLabel titleIconImageTypeSupportsRotation:](self, "titleIconImageTypeSupportsRotation:", -[CKLabel titleIconImageType](self, "titleIconImageType")))
  {
    -[CKLabel setShouldHaveRotatedTitleIconImage:](self, "setShouldHaveRotatedTitleIconImage:", v5);
    if (v4)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transcriptHeaderChevronRotationAnimationSpeed");
      v9 = v8;

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __55__CKLabel_setShouldHaveRotatedTitleIconImage_animated___block_invoke;
      v10[3] = &unk_1E274A208;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x20000, v10, 0, v9, 0.0);
    }
    else
    {
      -[CKLabel _rotateTitleIconImageView](self, "_rotateTitleIconImageView");
    }
  }
}

uint64_t __55__CKLabel_setShouldHaveRotatedTitleIconImage_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rotateTitleIconImageView");
}

- (BOOL)isLTR
{
  return -[CKLabel _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ 1;
}

- (void)setTitleIconImageTypesSupportingRotation:(id)a3
{
  objc_storeStrong((id *)&self->_titleIconImageTypesSupportingRotation, a3);
}

- (CGRect)textRectForAccessoryImageView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textRectForAccessoryImageView.origin.x;
  y = self->_textRectForAccessoryImageView.origin.y;
  width = self->_textRectForAccessoryImageView.size.width;
  height = self->_textRectForAccessoryImageView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTextRectForAccessoryImageView:(CGRect)a3
{
  self->_textRectForAccessoryImageView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleIconImageTypesSupportingRotation, 0);
  objc_storeStrong((id *)&self->_titleIconImageView, 0);
}

@end
