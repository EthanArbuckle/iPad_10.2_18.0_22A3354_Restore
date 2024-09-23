@implementation QLPageNumberView

- (QLPageNumberView)initWithFrame:(CGRect)a3
{
  QLPageNumberView *v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QLPageNumberView;
  v3 = -[QLPageNumberView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = v3->_label;
    v3->_label = v4;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v7);

    -[UILabel setFont:](v3->_label, "setFont:", v6);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v8);

    -[QLPageNumberView addSubview:](v3, "addSubview:", v3->_label);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPageNumberView setBackgroundColor:](v3, "setBackgroundColor:", v9);

  }
  return v3;
}

- (id)_indexFormatter
{
  NSNumberFormatter *indexFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;
  NSNumberFormatter *v6;
  void *v7;

  indexFormatter = self->_indexFormatter;
  if (!indexFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    v5 = self->_indexFormatter;
    self->_indexFormatter = v4;

    v6 = self->_indexFormatter;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](v6, "setLocale:", v7);

    -[NSNumberFormatter setGeneratesDecimalNumbers:](self->_indexFormatter, "setGeneratesDecimalNumbers:", 1);
    -[NSNumberFormatter setNumberStyle:](self->_indexFormatter, "setNumberStyle:", 1);
    indexFormatter = self->_indexFormatter;
  }
  return indexFormatter;
}

- (void)_updateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[QLPageNumberView _indexFormatter](self, "_indexFormatter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_pageNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_pageCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  QLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, objc_msgSend(v4, "intValue"), objc_msgSend(v6, "intValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_label, "setText:", v9);
  -[UILabel setText:](self->_backgroundLabel, "setText:", v9);
  -[QLPageNumberView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setPageNumber:(int64_t)a3
{
  if (self->_pageNumber != a3)
  {
    self->_pageNumber = a3;
    -[QLPageNumberView _updateString](self, "_updateString");
    -[QLPageNumberView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageCount:(int64_t)a3
{
  if (self->_pageCount != a3)
  {
    self->_pageCount = a3;
    -[QLPageNumberView _updateString](self, "_updateString");
    -[QLPageNumberView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)sizeToFit
{
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel frame](self->_label, "frame");
  -[QLPageNumberView frame](self, "frame");
  -[QLPageNumberView setFrame:](self, "setFrame:");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel frame](self->_label, "frame");
  v4 = v3;
  v6 = v5;
  -[UILabel setFrame:](self->_label, "setFrame:", 12.0, 6.0);
  -[UILabel setFrame:](self->_backgroundLabel, "setFrame:", 12.0, 7.0, v4, v6);
}

- (CGPath)_copyMutablePathForRoundedRect:(CGRect)a3 radius:(double)a4 inverted:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  CGPath *Mutable;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGPath *v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectInset(v23, a4, a4);
  v12 = v24.origin.x;
  v13 = x + width;
  v14 = v24.origin.y;
  v21 = v24.origin.y + v24.size.height;
  v22 = v24.origin.x + v24.size.width;
  v15 = y + height;
  CGPathMoveToPoint(Mutable, 0, v24.origin.x, y);
  if (a5)
  {
    CGPathAddArcToPoint(Mutable, 0, x, y, x, v14, a4);
    CGPathAddLineToPoint(Mutable, 0, x, v21);
    CGPathAddArcToPoint(Mutable, 0, x, v15, v12, v15, a4);
    CGPathAddLineToPoint(Mutable, 0, v22, v15);
    CGPathAddArcToPoint(Mutable, 0, v13, v15, v13, v21, a4);
    CGPathAddLineToPoint(Mutable, 0, v13, v14);
    v16 = Mutable;
    v17 = x + width;
    v18 = y;
    v19 = v22;
  }
  else
  {
    CGPathAddLineToPoint(Mutable, 0, v22, y);
    CGPathAddArcToPoint(Mutable, 0, v13, y, v13, v14, a4);
    CGPathAddLineToPoint(Mutable, 0, v13, v21);
    CGPathAddArcToPoint(Mutable, 0, v13, v15, v22, v15, a4);
    CGPathAddLineToPoint(Mutable, 0, v12, v15);
    CGPathAddArcToPoint(Mutable, 0, x, v15, x, v21, a4);
    CGPathAddLineToPoint(Mutable, 0, x, v14);
    v16 = Mutable;
    v17 = x;
    v18 = y;
    v19 = v12;
  }
  CGPathAddArcToPoint(v16, 0, v17, v18, v19, y, a4);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGPath *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGContextClipToRect(CurrentContext, v14);
  -[QLPageNumberView bounds](self, "bounds");
  v16 = CGRectInset(v15, 2.0, 2.0);
  v9 = -[QLPageNumberView _copyMutablePathForRoundedRect:radius:inverted:](self, "_copyMutablePathForRoundedRect:radius:inverted:", 0, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height + -3.0, 4.0);
  CGContextAddPath(CurrentContext, v9);
  v10 = (void *)MEMORY[0x24BEBD4B8];
  QLFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("QLSquaredLabelBackgroundColor"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v13, "CGColor"));
  CGContextDrawPath(CurrentContext, kCGPathFill);
  CGPathRelease(v9);
  CGContextRestoreGState(CurrentContext);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexFormatter, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_backgroundLabel, 0);
}

@end
