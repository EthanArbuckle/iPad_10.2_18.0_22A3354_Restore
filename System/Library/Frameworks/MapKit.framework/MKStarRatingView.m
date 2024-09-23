@implementation MKStarRatingView

- (MKStarRatingView)initWithFrame:(CGRect)a3
{
  MKStarRatingView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKStarRatingView;
  v3 = -[MKStarRatingView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MKStarRatingView _commonInit](v3, "_commonInit");
  -[MKStarRatingView setStarStyle:](v3, "setStarStyle:", 0);
  return v3;
}

- (MKStarRatingView)initWithCoder:(id)a3
{
  MKStarRatingView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKStarRatingView;
  v3 = -[MKStarRatingView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[MKStarRatingView _commonInit](v3, "_commonInit");
  -[MKStarRatingView setStarStyle:](v3, "setStarStyle:", 0);
  return v3;
}

- (MKStarRatingView)initWithStyle:(int64_t)a3
{
  MKStarRatingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKStarRatingView;
  v4 = -[MKStarRatingView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKStarRatingView _commonInit](v4, "_commonInit");
  -[MKStarRatingView setNumberOfRatingLevels:](v4, "setNumberOfRatingLevels:", 5);
  -[MKStarRatingView setStarStyle:](v4, "setStarStyle:", a3);
  return v4;
}

- (void)_commonInit
{
  NSMutableArray *v3;
  NSMutableArray *ratingViews;
  void *v5;
  CATransform3D v6;
  CATransform3D v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  ratingViews = self->_ratingViews;
  self->_ratingViews = v3;

  self->_numReviews = 0x7FFFFFFFFFFFFFFFLL;
  self->_starStyle = 0;
  if (MKApplicationLayoutDirectionIsRightToLeft())
  {
    CATransform3DMakeScale(&v7, -1.0, 1.0, 1.0);
    -[MKStarRatingView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    objc_msgSend(v5, "setTransform:", &v6);

  }
}

- (id)imageWithName:(id)a3 andColor:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("_%lu"), objc_msgSend(v6, "hash"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(0, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (v6
      && (objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", v7),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "_flatImageWithColor:", v6),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9)
      || (objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", v7),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(0, "setObject:forKeyedSubscript:", v9, v8);
    }
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[MKStarRatingView frame](self, "frame");
  -[MKStarRatingView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIImage *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self->_fullStarImage;
  -[UIImage size](v3, "size");
  -[UIImage size](v3, "size");

  UIRoundToViewScale();
  v5 = v4;
  UIRoundToViewScale();
  v7 = v6;
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)verticalAlignmentCenterPercentage
{
  return 1.08000004;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.5;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_layoutStarViewsCreatingIfNeeded:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double rating;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  UIImage *fullStarImage;
  BOOL v16;
  UIImage *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  double rect;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (a3)
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->_ratingViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    -[NSMutableArray removeAllObjects](self->_ratingViews, "removeAllObjects");
  }
  -[UIImage size](self->_fullStarImage, "size");
  rect = v5;
  v7 = v6;
  -[MKStarRatingView _currentScreenScale](self, "_currentScreenScale");
  v9 = v8;
  rating = self->_rating;
  if (-[MKStarRatingView numberOfRatingLevels](self, "numberOfRatingLevels"))
  {
    v11 = 0;
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v14 = round(rating + rating) * 0.5;
    do
    {
      if (v14 >= 1.0
        || ((fullStarImage = self->_halfStarImage, v14 == 0.5) ? (v16 = fullStarImage == 0) : (v16 = 0), v16))
      {
        if (!self->_highlighted || (fullStarImage = self->_fullStarHighlightedImage) == 0)
          fullStarImage = self->_fullStarImage;
      }
      else if (v14 != 0.5 || fullStarImage == 0)
      {
        if (!self->_highlighted || (fullStarImage = self->_emptyStarHighlightedImage) == 0)
          fullStarImage = self->_emptyStarImage;
      }
      else if (self->_highlighted && self->_halfStarHighlightedImage)
      {
        fullStarImage = self->_halfStarHighlightedImage;
      }
      v18 = fullStarImage;
      if (v11 >= -[NSMutableArray count](self->_ratingViews, "count"))
      {
        v20 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_ratingViews, "objectAtIndexedSubscript:", v11);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (!a3 && v19)
          goto LABEL_27;
      }
      v21 = objc_alloc_init(MEMORY[0x1E0CEA658]);

      v20 = v21;
LABEL_27:
      objc_msgSend(v20, "setImage:", v18);
      objc_msgSend(v20, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        -[MKStarRatingView addSubview:](self, "addSubview:", v20);
        if (-[NSMutableArray indexOfObject:](self->_ratingViews, "indexOfObject:", v20) == 0x7FFFFFFFFFFFFFFFLL)
          -[NSMutableArray addObject:](self->_ratingViews, "addObject:", v20);
      }
      v24.origin.x = v9 * v12;
      v24.origin.y = v13 * v9;
      v24.size.width = rect * v9;
      v24.size.height = v7 * v9;
      v25 = CGRectIntegral(v24);
      objc_msgSend(v20, "setFrame:", v25.origin.x / v9, v25.origin.y / v9, v25.size.width / v9, v25.size.height / v9);
      v26.origin.x = v12;
      v26.origin.y = v13;
      v26.size.width = rect;
      v26.size.height = v7;
      v12 = v12 + CGRectGetWidth(v26) + self->_padding;
      v14 = v14 + -1.0;

      ++v11;
    }
    while (v11 < -[MKStarRatingView numberOfRatingLevels](self, "numberOfRatingLevels"));
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[MKStarRatingView _layoutStarViewsCreatingIfNeeded:](self, "_layoutStarViewsCreatingIfNeeded:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MKStarRatingView;
  -[MKStarRatingView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKStarRatingView;
  -[MKStarRatingView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MKStarRatingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
  -[MKStarRatingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setNumberOfRatingLevels:(unint64_t)a3
{
  if (self->_numLevels != a3)
  {
    self->_numLevels = a3;
    -[MKStarRatingView _layoutStarViewsCreatingIfNeeded:](self, "_layoutStarViewsCreatingIfNeeded:", 1);
    -[MKStarRatingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[MKStarRatingView _layoutStarViewsCreatingIfNeeded:](self, "_layoutStarViewsCreatingIfNeeded:", 0);
    -[MKStarRatingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setRating:(double)a3
{
  if (self->_rating != a3)
  {
    self->_rating = a3;
    -[MKStarRatingView _layoutStarViewsCreatingIfNeeded:](self, "_layoutStarViewsCreatingIfNeeded:", 0);
    -[MKStarRatingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

+ (id)colorForRating:(double)a3
{
  unint64_t v3;
  double v4;

  v3 = vcvtpd_s64_f64(a3);
  if (v3 > 4)
    v4 = 0.450980395;
  else
    v4 = dbl_18B2AFC60[v3];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, v4, 0.0, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fullStarTextAttachmentWithFont:(id)a3
{
  return (id)objc_msgSend(a1, "textAttachmentimageNamed:font:", CFSTR("star.fill"), a3);
}

+ (id)emptyStarTextAttachmentWithFont:(id)a3
{
  return (id)objc_msgSend(a1, "textAttachmentimageNamed:font:", CFSTR("star"), a3);
}

+ (id)halfStarTextAttachmentWithFont:(id)a3
{
  return (id)objc_msgSend(a1, "textAttachmentimageNamed:font:", CFSTR("star.leadinghalf.fill"), a3);
}

+ (id)textAttachmentimageNamed:(id)a3 font:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = a4;
  objc_msgSend(v5, "systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(v6, "pointSize");
  v10 = v9;

  objc_msgSend(v8, "configurationWithPointSize:weight:scale:", 2, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithSymbolConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  objc_msgSend(v14, "setImage:", v13);

  return v14;
}

+ (id)ratingShortAsAttributedString:(double)a3 baseFont:(id)a4 theme:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a1, "colorForRating:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fullStarTextAttachmentWithFont:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapkit_fontWithWeight:", *MEMORY[0x1E0CEB5D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CEA0A0];
  v26[0] = *MEMORY[0x1E0CEA098];
  v11 = v26[0];
  v26[1] = v12;
  v27[0] = v7;
  v27[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = v12;
  v25[0] = v10;
  v25[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "addAttributes:range:", v13, 0, objc_msgSend(v16, "length"));
  v17 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v17, "appendAttributedString:", v16);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), 0);
  objc_msgSend(v17, "appendAttributedString:", v18);

  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f"), *(_QWORD *)&a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v14);
  objc_msgSend(v17, "appendAttributedString:", v21);

  v22 = (void *)objc_msgSend(v17, "copy");
  return v22;
}

+ (id)ratingAsAttributedString:(double)a3 baseFont:(id)a4 style:(int64_t)a5 theme:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int IsRightToLeft;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  int v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  int64_t v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (!v10)
  {
    +[MKFontManager sharedManager](MKFontManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subtitleFont");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a5 == 3)
  {
    objc_msgSend(a1, "ratingShortAsAttributedString:baseFont:theme:", v10, v11, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  if (a5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    objc_msgSend(a1, "colorForRating:", a3);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = v15;
      v15 = v17;
    }
    v16 = v17;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.588235319, 0.0, 1.0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    goto LABEL_9;
LABEL_12:
  v18 = v10;
  v19 = v18;
  v13 = 0;
  if (!v18 || !v16 || !v15)
    goto LABEL_31;
  v39 = IsRightToLeft;
  v41 = v10;
  v42 = v11;
  v21 = *MEMORY[0x1E0CEA0A0];
  v47[0] = *MEMORY[0x1E0CEA098];
  v20 = v47[0];
  v47[1] = v21;
  v48[0] = v18;
  v48[1] = v16;
  v38 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v20;
  v45[1] = v21;
  v46[0] = v19;
  v46[1] = v15;
  v40 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v24 = round(a3 + a3) * 0.5;
  v25 = 5;
  v44 = a5;
  do
  {
    if (v24 >= 1.0)
    {
      v26 = (void *)MEMORY[0x1E0CB3498];
      objc_msgSend(a1, "fullStarTextAttachmentWithFont:", v19);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (v24 == 0.5)
    {
      v26 = (void *)MEMORY[0x1E0CB3498];
      objc_msgSend(a1, "halfStarTextAttachmentWithFont:", v19);
      v27 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v28 = (void *)v27;
      objc_msgSend(v26, "attributedStringWithAttachment:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v29, "mutableCopy");

      objc_msgSend(v30, "addAttributes:range:", v22, 0, objc_msgSend(v30, "length"));
      objc_msgSend(v23, "appendAttributedString:", v30);
      goto LABEL_21;
    }
    if (a5 == 1)
    {
      objc_msgSend(a1, "emptyStarTextAttachmentWithFont:", v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v22;
    }
    else
    {
      objc_msgSend(a1, "fullStarTextAttachmentWithFont:", v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v43;
    }
    v33 = (void *)MEMORY[0x1E0CB3498];
    v30 = v32;
    objc_msgSend(v33, "attributedStringWithAttachment:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "mutableCopy");

    objc_msgSend(v35, "addAttributes:range:", v30, 0, objc_msgSend(v35, "length"));
    objc_msgSend(v23, "appendAttributedString:", v35);

    a5 = v44;
LABEL_21:

    v24 = v24 + -1.0;
    --v25;
  }
  while (v25);
  if (v39)
    v36 = &unk_1E215A180;
  else
    v36 = &unk_1E215A198;
  objc_msgSend(v23, "addAttribute:value:range:", *MEMORY[0x1E0CEA198], v36, 0, objc_msgSend(v23, "length"));
  v13 = (void *)objc_msgSend(v23, "copy");

  v10 = v41;
  v11 = v42;
  v15 = v40;
  v16 = v38;
LABEL_31:

LABEL_32:
  return v13;
}

- (int64_t)starStyle
{
  return self->_starStyle;
}

- (void)setStarStyle:(int64_t)a3
{
  self->_starStyle = a3;
}

- (unint64_t)numberOfRatingLevels
{
  return self->_numLevels;
}

- (double)rating
{
  return self->_rating;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIImage)fullStarImage
{
  return self->_fullStarImage;
}

- (void)setFullStarImage:(id)a3
{
  objc_storeStrong((id *)&self->_fullStarImage, a3);
}

- (UIImage)halfStarImage
{
  return self->_halfStarImage;
}

- (void)setHalfStarImage:(id)a3
{
  objc_storeStrong((id *)&self->_halfStarImage, a3);
}

- (UIImage)emptyStarImage
{
  return self->_emptyStarImage;
}

- (void)setEmptyStarImage:(id)a3
{
  objc_storeStrong((id *)&self->_emptyStarImage, a3);
}

- (UIImage)fullStarHighlightedImage
{
  return self->_fullStarHighlightedImage;
}

- (void)setFullStarHighlightedImage:(id)a3
{
  objc_storeStrong((id *)&self->_fullStarHighlightedImage, a3);
}

- (UIImage)halfStarHighlightedImage
{
  return self->_halfStarHighlightedImage;
}

- (void)setHalfStarHighlightedImage:(id)a3
{
  objc_storeStrong((id *)&self->_halfStarHighlightedImage, a3);
}

- (UIImage)emptyStarHighlightedImage
{
  return self->_emptyStarHighlightedImage;
}

- (void)setEmptyStarHighlightedImage:(id)a3
{
  objc_storeStrong((id *)&self->_emptyStarHighlightedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyStarHighlightedImage, 0);
  objc_storeStrong((id *)&self->_halfStarHighlightedImage, 0);
  objc_storeStrong((id *)&self->_fullStarHighlightedImage, 0);
  objc_storeStrong((id *)&self->_emptyStarImage, 0);
  objc_storeStrong((id *)&self->_halfStarImage, 0);
  objc_storeStrong((id *)&self->_fullStarImage, 0);
  objc_storeStrong((id *)&self->_ratingViews, 0);
}

@end
