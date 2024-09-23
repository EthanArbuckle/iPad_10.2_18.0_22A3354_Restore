@implementation SUUITextBoxView

- (SUUITextBoxView)initWithFrame:(CGRect)a3
{
  char *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxView;
  v3 = -[SUUITextBoxView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInterfaceIdiom");

    *(_OWORD *)(v3 + 472) = xmmword_241EFB840;
    *(_OWORD *)(v3 + 488) = xmmword_241EFB850;
    *((_QWORD *)v3 + 72) = 0x4000000000000000;
  }
  return (SUUITextBoxView *)v3;
}

- (void)dealloc
{
  __CTFrame *textFrame;
  __CTFrame *titleTextFrame;
  __CTLine *truncationToken;
  objc_super v6;

  textFrame = self->_textFrame;
  if (textFrame)
    CFRelease(textFrame);
  titleTextFrame = self->_titleTextFrame;
  if (titleTextFrame)
    CFRelease(titleTextFrame);
  truncationToken = self->_truncationToken;
  if (truncationToken)
    CFRelease(truncationToken);
  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxView;
  -[SUUITextBoxView dealloc](&v6, sel_dealloc);
}

- (NSString)moreButtonTitle
{
  return -[UILabel text](self->_moreButtonLabel, "text");
}

- (NSString)ratingText
{
  return -[UILabel text](self->_ratingLabel, "text");
}

- (void)reset
{
  -[SUUITextBoxView setFixedWidthTextFrame:](self, "setFixedWidthTextFrame:", 0);
  -[SUUITextBoxView setFixedWidthTitleTextFrame:](self, "setFixedWidthTitleTextFrame:", 0);
  -[SUUITextBoxView setRating:](self, "setRating:", 0.0);
  -[SUUITextBoxView setRatingText:](self, "setRatingText:", 0);
  -[SUUITextBoxView setSubtitle:](self, "setSubtitle:", 0);
  -[SUUITextBoxView setTitle:](self, "setTitle:", 0);
  -[UILabel setHidden:](self->_moreButtonLabel, "setHidden:", 1);
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  UILabel *titleLabel;
  void *v8;
  void *v9;
  UILabel *subtitleLabel;
  void *v11;
  void *v12;
  UILabel *ratingLabel;
  void *v14;
  void *v15;
  UILabel *moreButtonLabel;
  void *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  void *v21;
  SUUIColorScheme *v22;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v22 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    titleLabel = self->_titleLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v9);

    }
    subtitleLabel = self->_subtitleLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UILabel setTextColor:](subtitleLabel, "setTextColor:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](subtitleLabel, "setTextColor:", v12);

    }
    ratingLabel = self->_ratingLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[UILabel setTextColor:](ratingLabel, "setTextColor:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](ratingLabel, "setTextColor:", v15);

    }
    moreButtonLabel = self->_moreButtonLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[UILabel setTextColor:](moreButtonLabel, "setTextColor:", v17);
    }
    else
    {
      -[SUUITextBoxView tintColor](self, "tintColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](moreButtonLabel, "setTextColor:", v18);

    }
    v19 = self->_moreButtonLabel;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[UILabel setHighlightedTextColor:](v19, "setHighlightedTextColor:", v20);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setHighlightedTextColor:](v19, "setHighlightedTextColor:", v21);

    }
    -[SUUITextBoxView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v22;
  }

}

- (void)setFixedWidthTextFrame:(__CTFrame *)a3
{
  __CTFrame *textFrame;
  NSString *underlyingText;
  __CTFrame *v7;

  textFrame = self->_textFrame;
  if (textFrame != a3)
  {
    if (textFrame)
      CFRelease(textFrame);
    self->_textFrame = a3;
    underlyingText = self->_underlyingText;
    self->_underlyingText = 0;

    v7 = self->_textFrame;
    if (v7)
      CFRetain(v7);
    -[SUUITextBoxView setNeedsDisplay](self, "setNeedsDisplay");
    -[SUUITextBoxView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setFixedWidthTitleTextFrame:(__CTFrame *)a3
{
  __CTFrame *titleTextFrame;
  UILabel *titleLabel;

  titleTextFrame = self->_titleTextFrame;
  if (titleTextFrame != a3)
  {
    if (titleTextFrame)
      CFRelease(titleTextFrame);
    self->_titleTextFrame = a3;
    if (a3)
    {
      CFRetain(a3);
      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
      titleLabel = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SUUITextBoxView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setMoreButtonTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SUUITextBoxView moreButtonTitle](self, "moreButtonTitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v6 && (objc_msgSend(v4, "isEqualToString:", v6) & 1) == 0)
  {
    -[SUUITextBoxView _moreButtonLabel](self, "_moreButtonLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);
    objc_msgSend(v5, "sizeToFit");

  }
}

- (void)setNumberOfVisibleLines:(int64_t)a3
{
  if (self->_numberOfVisibleLines != a3)
  {
    self->_numberOfVisibleLines = a3;
    -[SUUITextBoxView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setRating:(double)a3
{
  UIImageView *ratingImageView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  UIImageView *v9;
  void *v10;

  if (self->_rating != a3)
  {
    ratingImageView = self->_ratingImageView;
    if (a3 == 0.0)
    {
      -[UIImageView removeFromSuperview](ratingImageView, "removeFromSuperview");
      v8 = self->_ratingImageView;
      self->_ratingImageView = 0;
    }
    else
    {
      if (!ratingImageView)
      {
        v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v7 = self->_ratingImageView;
        self->_ratingImageView = v6;

        -[SUUITextBoxView addSubview:](self, "addSubview:", self->_ratingImageView);
      }
      +[SUUIRatingStarsCache cacheWithProperties:](SUUIRatingStarsCache, "cacheWithProperties:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_ratingImageView;
      objc_msgSend(v8, "ratingStarsImageForRating:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v9, "setImage:", v10);

      -[UIImageView sizeToFit](self->_ratingImageView, "sizeToFit");
    }

    -[SUUITextBoxView setNeedsLayout](self, "setNeedsLayout");
  }
  self->_rating = a3;
}

- (void)setRatingText:(id)a3
{
  id v4;
  UILabel *ratingLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_ratingLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v4, "isEqualToString:", v16) & 1) == 0)
  {
    ratingLabel = self->_ratingLabel;
    if (v16)
    {
      if (!ratingLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_ratingLabel;
        self->_ratingLabel = v6;

        v8 = self->_ratingLabel;
        -[SUUITextBoxView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_ratingLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_ratingLabel;
        -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[UILabel setTextColor:](v12, "setTextColor:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v15);

        }
        -[SUUITextBoxView addSubview:](self, "addSubview:", self->_ratingLabel);
        ratingLabel = self->_ratingLabel;
      }
      -[UILabel setText:](ratingLabel, "setText:");
    }
    else
    {
      -[UILabel removeFromSuperview](ratingLabel, "removeFromSuperview");
      v14 = self->_ratingLabel;
      self->_ratingLabel = 0;

    }
    -[SUUITextBoxView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitle:(id)a3
{
  id v4;
  UILabel *subtitleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v4, "isEqualToString:", v16) & 1) == 0)
  {
    subtitleLabel = self->_subtitleLabel;
    if (v16)
    {
      if (!subtitleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v7 = self->_subtitleLabel;
        self->_subtitleLabel = v6;

        v8 = self->_subtitleLabel;
        -[SUUITextBoxView backgroundColor](self, "backgroundColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_subtitleLabel;
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_subtitleLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[UILabel setTextColor:](v12, "setTextColor:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v12, "setTextColor:", v15);

        }
        -[SUUITextBoxView addSubview:](self, "addSubview:", self->_subtitleLabel);
        subtitleLabel = self->_subtitleLabel;
      }
      -[UILabel setText:](subtitleLabel, "setText:");
      -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](subtitleLabel, "removeFromSuperview");
      v14 = self->_subtitleLabel;
      self->_subtitleLabel = 0;

    }
    -[SUUITextBoxView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTextFrameWithText:(id)a3
{
  NSString *v4;
  __CTFrame *textFrame;
  NSString *v6;
  NSString *underlyingText;
  NSString *v8;

  v4 = (NSString *)a3;
  if (self->_underlyingText != v4)
  {
    textFrame = self->_textFrame;
    v8 = v4;
    if (textFrame)
    {
      CFRelease(textFrame);
      v4 = v8;
      self->_textFrame = 0;
    }
    v6 = (NSString *)-[NSString copy](v4, "copy");
    underlyingText = self->_underlyingText;
    self->_underlyingText = v6;

    -[SUUITextBoxView setNeedsDisplay](self, "setNeedsDisplay");
    v4 = v8;
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  __CTFrame *titleTextFrame;
  UILabel *titleLabel;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v19 && (objc_msgSend(v4, "isEqualToString:", v19) & 1) == 0)
  {
    if (v19)
    {
      titleTextFrame = self->_titleTextFrame;
      if (titleTextFrame)
      {
        CFRelease(titleTextFrame);
        self->_titleTextFrame = 0;
      }
      titleLabel = self->_titleLabel;
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        -[SUUITextBoxView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_titleLabel;
        v12 = (void *)MEMORY[0x24BEBB520];
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userInterfaceIdiom");

        objc_msgSend(v12, "systemFontOfSize:", 17.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v14);

        v15 = self->_titleLabel;
        -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[UILabel setTextColor:](v15, "setTextColor:", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v15, "setTextColor:", v18);

        }
        -[SUUITextBoxView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v19);
    }
    else
    {
      -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
      v17 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    self->_titleTextIsNaturallyRTL = objc_msgSend(v19, "_isNaturallyRTL");
    -[SUUITextBoxView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTruncationStyle:(int64_t)a3
{
  if (self->_truncationStyle != a3)
  {
    self->_truncationStyle = a3;
    -[UILabel setHidden:](self->_moreButtonLabel, "setHidden:", a3 == 1);
  }
}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  double height;
  __CTFrame *titleTextFrame;
  _OWORD *v13;
  const __CFArray *Lines;
  uint64_t Count;
  CGPoint *v16;
  CGContext *CurrentContext;
  __int128 v18;
  void *v19;
  void *v20;
  void *v21;
  const CGPath *Path;
  CFIndex v23;
  double v24;
  const __CTLine *ValueAtIndex;
  double Width;
  double v27;
  __CTFrame *v28;
  const __CTFrame *v29;
  const __CFArray *v30;
  CFIndex v31;
  uint64_t v32;
  CGPoint *v33;
  CGContext *v34;
  __int128 v35;
  void *v36;
  void *v37;
  void *v38;
  UIImageView *ratingImageView;
  UIEdgeInsets *p_contentInsets;
  double top;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double bottom;
  void *v47;
  double v48;
  const CGPath *v49;
  CFIndex v50;
  CFIndex v51;
  double v52;
  const __CTLine *v53;
  double v54;
  CGFloat x;
  CGFloat y;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  __CFAttributedString *v61;
  __CFAttributedString *v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  int v71;
  double v72;
  double v73;
  const __CTLine *TruncatedLine;
  double TrailingWhitespaceWidth;
  float v76;
  double v77;
  float v78;
  double v79;
  float v80;
  float v81;
  void *v82;
  double v83;
  BOOL v84;
  float v85;
  double v86;
  _QWORD v87[2];
  uint64_t v88;
  const __CFArray *v89;
  double v90;
  CFIndex v91;
  _QWORD *length;
  CGFloat v93;
  double v94;
  double v95;
  CGAffineTransform v96;
  uint64_t v97;
  CFRange v98;
  CFRange v99;
  CGRect BoundingBox;
  CGRect v101;
  CGRect BoundsWithOptions;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v97 = *MEMORY[0x24BDAC8D0];
  -[SUUITextBoxView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v94 = v9;
  v95 = v8;
  if (self->_titleLabel)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInterfaceIdiom");

    height = 22.0;
  }
  else
  {
    height = 0.0;
  }
  titleTextFrame = self->_titleTextFrame;
  v13 = (_OWORD *)MEMORY[0x24BDBD8B8];
  if (titleTextFrame)
  {
    Lines = CTFrameGetLines(titleTextFrame);
    Count = CFArrayGetCount(Lines);
    length = v87;
    v16 = (CGPoint *)&v87[-2 * MEMORY[0x24BDAC7A8]()];
    v98.location = 0;
    v98.length = Count;
    CTFrameGetLineOrigins(self->_titleTextFrame, v98, v16);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    v18 = v13[1];
    *(_OWORD *)&v96.a = *v13;
    *(_OWORD *)&v96.c = v18;
    *(_OWORD *)&v96.tx = v13[2];
    CGContextSetTextMatrix(CurrentContext, &v96);
    -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "set");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "set");

    }
    Path = CTFrameGetPath(self->_titleTextFrame);
    BoundingBox = CGPathGetBoundingBox(Path);
    height = BoundingBox.size.height;
    if (Count >= 1)
    {
      v23 = 0;
      v24 = self->_contentInsets.top + BoundingBox.size.height;
      do
      {
        ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v23);
        if (self->_titleTextIsNaturallyRTL)
        {
          v101.origin.x = v5;
          v101.origin.y = v7;
          v101.size.height = v94;
          v101.size.width = v95;
          Width = CGRectGetWidth(v101);
          BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0);
          v27 = Width - CGRectGetWidth(BoundsWithOptions) - (self->_contentInsets.left + v16->x);
        }
        else
        {
          v27 = self->_contentInsets.left + v16->x;
        }
        CGContextSetTextPosition(CurrentContext, v27, v16->y - v24);
        CTLineDraw(ValueAtIndex, CurrentContext);
        ++v23;
        ++v16;
      }
      while (Count != v23);
    }
    CGContextRestoreGState(CurrentContext);
  }
  v28 = -[SUUITextBoxView _textFrame](self, "_textFrame");
  if (!v28)
    return;
  v29 = v28;
  v30 = CTFrameGetLines(v28);
  v31 = CFArrayGetCount(v30);
  v87[1] = v87;
  v32 = 512;
  v91 = v31;
  MEMORY[0x24BDAC7A8]();
  v33 = (CGPoint *)&v87[-2 * v99.length];
  v99.location = 0;
  length = (_QWORD *)v99.length;
  CTFrameGetLineOrigins(v29, v99, v33);
  v34 = UIGraphicsGetCurrentContext();
  CGContextSaveGState(v34);
  CGContextScaleCTM(v34, 1.0, -1.0);
  v35 = v13[1];
  *(_OWORD *)&v96.a = *v13;
  *(_OWORD *)&v96.c = v35;
  *(_OWORD *)&v96.tx = v13[2];
  CGContextSetTextMatrix(v34, &v96);
  -[SUUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "set");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "set");

  }
  ratingImageView = self->_ratingImageView;
  v93 = v7;
  if (ratingImageView)
  {
    p_contentInsets = &self->_contentInsets;
    top = self->_contentInsets.top;
    if (height <= 0.00000011920929)
    {
      if (self->_subtitleLabel)
        v42 = top + 16.0;
      else
        v42 = self->_contentInsets.top;
    }
    else
    {
      v42 = height + top;
    }
    v43 = 14.0;
    goto LABEL_32;
  }
  if (self->_ratingLabel)
    v43 = 17.0;
  else
    v43 = 0.0;
  p_contentInsets = &self->_contentInsets;
  v44 = self->_contentInsets.top;
  v45 = (uint64_t)length;
  if (height <= 0.00000011920929)
  {
    if (self->_subtitleLabel)
      v42 = v44 + 16.0;
    else
      v42 = self->_contentInsets.top;
    if (v43 <= 0.00000011920929)
      goto LABEL_34;
    goto LABEL_32;
  }
  v42 = height + v44;
  if (v43 > 0.00000011920929)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "userInterfaceIdiom");

    v45 = (uint64_t)length;
    bottom = v43 + 1.0 + 5.0;
    goto LABEL_33;
  }
  bottom = self->_titleInsets.bottom;
LABEL_33:
  v42 = v42 + bottom;
LABEL_34:
  v48 = p_contentInsets->bottom;
  v49 = CTFrameGetPath(v29);
  v103 = CGPathGetBoundingBox(v49);
  v50 = v45 - 1;
  if (v45 >= 1)
  {
    v51 = 0;
    v52 = p_contentInsets->bottom - v94 + v94 - v48 - v42 - v103.size.height;
    v90 = v5;
    v89 = v30;
    v88 = 512;
    while (1)
    {
      v53 = (const __CTLine *)CFArrayGetValueAtIndex(v30, v51);
      v104 = CTLineGetBoundsWithOptions(v53, 0);
      v54 = v104.size.width;
      if (self->_textIsNaturallyRTL)
      {
        x = v104.origin.x;
        y = v104.origin.y;
        v57 = v104.size.height;
        v105.origin.x = v5;
        v105.origin.y = v93;
        v105.size.height = v94;
        v105.size.width = v95;
        v58 = CGRectGetWidth(v105);
        v106.origin.x = x;
        v106.origin.y = y;
        v106.size.width = v54;
        v106.size.height = v57;
        v59 = v58 - CGRectGetWidth(v106) - (p_contentInsets->left + v33->x);
      }
      else
      {
        v59 = p_contentInsets->left + v33->x;
      }
      v60 = v52 + v33->y;
      CGContextSetTextPosition(v34, v59, v60);
      if (v51 >= v50 && *(Class *)((char *)&self->super.super.super.super.isa + v32) && v91 != v45)
        break;
      CTLineDraw(v53, v34);
LABEL_57:
      ++v51;
      ++v33;
      if (v45 == v51)
        goto LABEL_58;
    }
    if (!self->_truncationToken)
    {
      v61 = +[SUUITextLayout newAttributedStringWithText:](SUUITextLayout, "newAttributedStringWithText:", CFSTR("…"));
      self->_truncationToken = CTLineCreateWithAttributedString(v61);
      v62 = v61;
      v45 = (uint64_t)length;
      CFRelease(v62);
    }
    v63 = v95 - p_contentInsets->left - p_contentInsets->right;
    -[SUUITextBoxView _moreButtonLabel](self, "_moreButtonLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "frame");
    v66 = v65;
    v68 = v67;
    v107 = CTLineGetBoundsWithOptions(self->_truncationToken, 0x20uLL);
    v69 = v107.size.width;
    v70 = v63 - v107.size.width;
    v71 = objc_msgSend(v64, "isHidden", v107.origin.x, v107.origin.y);
    v72 = v66 + 1.0;
    if (v71)
      v72 = 0.0;
    v73 = v70 - v72;
    if (v73 < v54)
    {
      TruncatedLine = CTLineCreateTruncatedLine(v53, v73, kCTLineTruncationEnd, 0);
      v108 = CTLineGetBoundsWithOptions(TruncatedLine, 0);
      v54 = v108.size.width;
      if (TruncatedLine)
      {
        TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(TruncatedLine);
        CTLineDraw(TruncatedLine, v34);
        CFRelease(TruncatedLine);
        v45 = (uint64_t)length;
LABEL_52:
        v76 = v59 + v54 - TrailingWhitespaceWidth;
        v77 = ceilf(v76);
        CGContextSetTextPosition(v34, v77, v60);
        CTLineDraw(self->_truncationToken, v34);
        if (v64)
        {
          v78 = v69 + v77 + 1.0;
          v79 = ceilf(v78);
          v80 = fabs(v60) - v68;
          v81 = floorf(v80);
          objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "scale");
          v84 = v83 == 1.0;
          v85 = 3.5;
          if (v84)
            v85 = 4.0;
          v86 = (float)(v81 + v85);

          v45 = (uint64_t)length;
          objc_msgSend(v64, "setFrame:", v79, v86, v66, v68);
        }

        v5 = v90;
        v30 = v89;
        v32 = v88;
        goto LABEL_57;
      }
      v45 = (uint64_t)length;
    }
    TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(v53);
    CTLineDraw(v53, v34);
    goto LABEL_52;
  }
LABEL_58:
  CGContextRestoreGState(v34);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *subtitleLabel;
  _BOOL4 v9;
  UIEdgeInsets *p_contentInsets;
  _BOOL4 v11;
  double top;
  CGFloat *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UILabel *titleLabel;
  double v19;
  void *v20;
  double v21;
  double v22;
  double left;
  double v24;
  void *v25;
  double bottom;
  double v27;
  CGFloat v28;
  UILabel *ratingLabel;
  double v30;
  UIImageView *ratingImageView;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  UIImageView *v36;
  double v37;
  CGFloat v38;
  float v39;
  double v40;
  UILabel *v41;
  double v42;
  float v43;
  __CTFrame *v44;
  void *v45;
  uint64_t v46;
  const __CFArray *Lines;
  CFIndex Count;
  int64_t numberOfVisibleLines;
  double v50;
  CGFloat v51;
  CGFloat v52;
  id v53;
  id v54;
  CGRect v55;

  -[SUUITextBoxView bounds](self, "bounds");
  v52 = v4;
  v53 = v3;
  v6 = v5;
  v51 = v7;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
    v9 = 1;
  else
    v9 = self->_titleLabel != 0;
  p_contentInsets = &self->_contentInsets;
  if (self->_ratingLabel)
    v11 = 1;
  else
    v11 = self->_ratingImageView != 0;
  top = p_contentInsets->top;
  v13 = (CGFloat *)MEMORY[0x24BDBF090];
  v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v16 = v14;
  v50 = v15;
  if (subtitleLabel)
  {
    -[UILabel frame](subtitleLabel, "frame");
    v15 = v17;
    v16 = 16.0;
  }
  titleLabel = self->_titleLabel;
  v19 = v14;
  if (titleLabel)
  {
    -[UILabel frame](titleLabel, "frame");
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userInterfaceIdiom");

    v19 = 22.0;
  }
  if (v16 >= v19)
    v21 = v16;
  else
    v21 = v19;
  v22 = v6 - self->_contentInsets.right - v15;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v22, self->_contentInsets.top + v21 - v16 + -1.0, v15, v16, *(CGFloat *)&v53, v52, v6, v51));
  left = self->_contentInsets.left;
  if (v15 <= 0.0)
    v24 = v6 - left - self->_contentInsets.right;
  else
    v24 = v22 + -5.0 - left;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(left, v21 + p_contentInsets->top - v19, v24, v19, *(CGFloat *)&v53, v52, v6, v51));
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "userInterfaceIdiom");

      bottom = 1.0;
    }
    else
    {
      bottom = self->_titleInsets.bottom;
    }
    v27 = top + v21 + bottom;
  }
  else
  {
    v27 = top;
  }
  v28 = v50;
  ratingLabel = self->_ratingLabel;
  v30 = v14;
  if (ratingLabel)
  {
    -[UILabel frame](ratingLabel, "frame");
    v30 = 17.0;
  }
  ratingImageView = self->_ratingImageView;
  if (ratingImageView)
  {
    -[UIImageView frame](ratingImageView, "frame");
    v28 = v34;
    v14 = v35;
    v36 = self->_ratingImageView;
    if (v30 >= v35)
      v37 = v30;
    else
      v37 = v35;
    if (v36)
    {
      v38 = self->_contentInsets.left;
      v39 = (v37 - v35) * 0.5;
      v40 = v27 + floorf(v39) + 2.0;
      -[UIImageView setFrame:](v36, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v38, v40, v34, v35, *(CGFloat *)&v53, v52, v6, v51));
    }
    else
    {
      v38 = v32;
      v40 = v33;
    }
  }
  else
  {
    v38 = *v13;
    v40 = v13[1];
    if (v30 >= v14)
      v37 = v30;
    else
      v37 = v14;
  }
  v41 = self->_ratingLabel;
  if (v41)
  {
    if (self->_ratingImageView)
    {
      v55.origin.x = v38;
      v55.origin.y = v40;
      v55.size.width = v28;
      v55.size.height = v14;
      v42 = CGRectGetMaxX(v55) + 5.0;
      v41 = self->_ratingLabel;
    }
    else
    {
      v42 = self->_contentInsets.left;
    }
    v43 = (v37 - v30) * 0.5;
    -[UILabel setFrame:](v41, "setFrame:", SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v42, v27 + floorf(v43), v6 - v42 - self->_contentInsets.right, v30, *(CGFloat *)&v53, v52, v6, v51));
  }
  v44 = -[SUUITextBoxView _textFrame](self, "_textFrame", *(_QWORD *)&v50);
  if (v44 && self->_truncationStyle != 1)
  {
    Lines = CTFrameGetLines(v44);
    Count = CFArrayGetCount(Lines);
    numberOfVisibleLines = self->_numberOfVisibleLines;
    -[SUUITextBoxView _moreButtonLabel](self, "_moreButtonLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v45;
    if (numberOfVisibleLines && Count > numberOfVisibleLines)
    {
      v46 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    -[SUUITextBoxView _moreButtonLabel](self, "_moreButtonLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v45;
  }
  v46 = 1;
LABEL_44:
  objc_msgSend(v45, "setHidden:", v46);

}

- (void)setBackgroundColor:(id)a3
{
  UILabel *moreButtonLabel;
  id v5;
  objc_super v6;

  moreButtonLabel = self->_moreButtonLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](moreButtonLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_ratingLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUITextBoxView;
  -[SUUITextBoxView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_underlyingText)
  {
    if (self->_textFrame)
    {
      -[SUUITextBoxView frame](self, "frame");
      if (v8 != width)
      {
        CFRelease(self->_textFrame);
        self->_textFrame = 0;
        -[SUUITextBoxView setNeedsDisplay](self, "setNeedsDisplay");
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUITextBoxView;
  -[SUUITextBoxView setFrame:](&v9, sel_setFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  UIEdgeInsets *p_contentInsets;
  double top;
  double bottom;
  void *v8;
  double v9;
  __CTFrame *titleTextFrame;
  const CGPath *Path;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect BoundingBox;

  width = a3.width;
  p_contentInsets = &self->_contentInsets;
  top = self->_contentInsets.top;
  bottom = self->_contentInsets.bottom;
  if (self->_titleLabel)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", a3.width, a3.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInterfaceIdiom");

    v9 = 22.0;
  }
  else
  {
    titleTextFrame = self->_titleTextFrame;
    if (titleTextFrame)
    {
      Path = CTFrameGetPath(titleTextFrame);
      BoundingBox = CGPathGetBoundingBox(Path);
      *(float *)&BoundingBox.origin.x = BoundingBox.size.height;
      v9 = ceilf(*(float *)&BoundingBox.origin.x);
    }
    else
    {
      v9 = 0.0;
    }
  }
  v12 = top + bottom;
  v13 = 16.0;
  if (v9 >= 16.0)
    v13 = v9;
  if (self->_subtitleLabel)
    v9 = v13;
  if (v9 > 0.0)
    v12 = v12 + v9 + self->_titleInsets.bottom;
  if (self->_ratingLabel)
  {
    if (v9 != 0.0)
      v12 = v12 - self->_titleInsets.bottom;
    v12 = v12 + 27.0;
  }
  -[SUUITextBoxView _textSizeToFitSize:](self, "_textSizeToFitSize:", width - p_contentInsets->left - p_contentInsets->right, 1.79769313e308);
  v15 = v12 + v14;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (id)_moreButtonLabel
{
  UILabel *moreButtonLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;

  moreButtonLabel = self->_moreButtonLabel;
  if (!moreButtonLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v5 = self->_moreButtonLabel;
    self->_moreButtonLabel = v4;

    v6 = self->_moreButtonLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setHidden:](self->_moreButtonLabel, "setHidden:", self->_truncationStyle == 1);
    v8 = self->_moreButtonLabel;
    -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UILabel setTextColor:](v8, "setTextColor:", v9);
    }
    else
    {
      -[SUUITextBoxView tintColor](self, "tintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v8, "setTextColor:", v10);

    }
    v11 = self->_moreButtonLabel;
    -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[UILabel setHighlightedTextColor:](v11, "setHighlightedTextColor:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setHighlightedTextColor:](v11, "setHighlightedTextColor:", v13);

    }
    -[UILabel setTextAlignment:](self->_moreButtonLabel, "setTextAlignment:", 2);
    -[SUUITextBoxView addSubview:](self, "addSubview:", self->_moreButtonLabel);
    moreButtonLabel = self->_moreButtonLabel;
  }
  return moreButtonLabel;
}

- (__CTFrame)_textFrame
{
  __CTFrame *result;
  CGFloat v4;
  __CFAttributedString *v5;
  const __CTFramesetter *v6;
  CGSize v7;
  CGPath *Mutable;
  CFRange v9;
  CFRange v10;
  CGSize v11;
  CGRect v12;
  CGRect v13;

  result = self->_textFrame;
  if (!result)
  {
    if (self->_underlyingText)
    {
      -[SUUITextBoxView bounds](self, "bounds");
      v4 = CGRectGetWidth(v12) - self->_contentInsets.left - self->_contentInsets.right;
      v5 = +[SUUITextLayout newAttributedStringWithText:](SUUITextLayout, "newAttributedStringWithText:", self->_underlyingText);
      v6 = CTFramesetterCreateWithAttributedString(v5);
      v11.height = 1.79769313e308;
      v9.location = 0;
      v9.length = 0;
      v11.width = v4;
      v7 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v9, 0, v11, 0);
      Mutable = CGPathCreateMutable();
      v13.origin.x = 0.0;
      v13.origin.y = 0.0;
      v13.size.width = v7.width;
      v13.size.height = v7.height;
      CGPathAddRect(Mutable, 0, v13);
      v10.location = 0;
      v10.length = 0;
      self->_textFrame = CTFramesetterCreateFrame(v6, v10, Mutable, 0);
      CGPathRelease(Mutable);
      CFRelease(v6);
      CFRelease(v5);
      self->_textIsNaturallyRTL = -[NSString _isNaturallyRTL](self->_underlyingText, "_isNaturallyRTL");
      return self->_textFrame;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (CGSize)_textSizeToFitSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  __CFAttributedString *v5;
  const __CTFramesetter *v6;
  CGSize v7;
  double v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  __CTFrame *textFrame;
  const CGPath *Path;
  const __CFArray *Lines;
  CFIndex Count;
  int64_t numberOfVisibleLines;
  BOOL v20;
  const __CTLine *ValueAtIndex;
  CGPoint v22;
  CGPoint origins;
  CFRange v24;
  CFRange v25;
  CFRange v26;
  CGSize v27;
  CGSize result;
  CGRect BoundingBox;
  CGRect BoundsWithOptions;

  if (self->_underlyingText)
  {
    height = a3.height;
    width = a3.width;
    v5 = +[SUUITextLayout newAttributedStringWithText:](SUUITextLayout, "newAttributedStringWithText:");
    v6 = CTFramesetterCreateWithAttributedString(v5);
    v24.location = 0;
    v24.length = 0;
    v27.width = width;
    v27.height = height;
    v7 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v24, 0, v27, 0);
    v8 = v7.width;
    v9 = v7.height;
    CFRelease(v6);
    CFRelease(v5);
  }
  else
  {
    textFrame = self->_textFrame;
    if (textFrame)
    {
      Path = CTFrameGetPath(textFrame);
      BoundingBox = CGPathGetBoundingBox(Path);
      v8 = BoundingBox.size.width;
      v9 = BoundingBox.size.height;
      Lines = CTFrameGetLines(self->_textFrame);
      Count = CFArrayGetCount(Lines);
      numberOfVisibleLines = self->_numberOfVisibleLines;
      if (numberOfVisibleLines)
        v20 = numberOfVisibleLines < Count;
      else
        v20 = 0;
      if (v20)
      {
        origins.x = 0.0;
        origins.y = 0.0;
        v22.x = 0.0;
        v22.y = 0.0;
        v25.location = 0;
        v25.length = 1;
        CTFrameGetLineOrigins(self->_textFrame, v25, &v22);
        v26.location = self->_numberOfVisibleLines - 1;
        v26.length = 1;
        CTFrameGetLineOrigins(self->_textFrame, v26, &origins);
        ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, self->_numberOfVisibleLines - 1);
        BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0x14uLL);
        v9 = BoundsWithOptions.size.height + v22.y - origins.y - BoundsWithOptions.origin.y;
      }
    }
    else
    {
      v8 = *MEMORY[0x24BDBF148];
      v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }
  }
  v10 = v9;
  v11 = ceilf(v10);
  v12 = v8;
  v13 = ceilf(v12);
  result.height = v11;
  result.width = v13;
  return result;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)numberOfVisibleLines
{
  return self->_numberOfVisibleLines;
}

- (double)rating
{
  return self->_rating;
}

- (int64_t)truncationStyle
{
  return self->_truncationStyle;
}

- (BOOL)textIsNaturallyRTL
{
  return self->_textIsNaturallyRTL;
}

- (void)setTextIsNaturallyRTL:(BOOL)a3
{
  self->_textIsNaturallyRTL = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)titleInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titleInsets.top;
  left = self->_titleInsets.left;
  bottom = self->_titleInsets.bottom;
  right = self->_titleInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  self->_titleInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_ratingImageView, 0);
  objc_storeStrong((id *)&self->_moreButtonLabel, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end
