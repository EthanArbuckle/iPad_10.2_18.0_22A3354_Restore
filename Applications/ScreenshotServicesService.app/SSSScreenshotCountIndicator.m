@implementation SSSScreenshotCountIndicator

+ (id)_labelFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleFootnote, 0, 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0));

  return v3;
}

- (SSSScreenshotCountIndicator)initWithFrame:(CGRect)a3
{
  SSSScreenshotCountIndicator *v3;
  UIPageControl *v4;
  UIPageControl *pageControl;
  UIPageControl *v6;
  void *v7;
  UILabel *v8;
  UILabel *label;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  uint64_t v13;
  double v14;
  id v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SSSScreenshotCountIndicator;
  v3 = -[SSSScreenshotCountIndicator initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIPageControl *)objc_alloc_init((Class)UIPageControl);
  pageControl = v3->_pageControl;
  v3->_pageControl = v4;

  v6 = v3->_pageControl;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.8359375, 0.87890625, 0.9453125, 1.0));
  -[UIPageControl setCurrentPageIndicatorTintColor:](v6, "setCurrentPageIndicatorTintColor:", v7);

  -[UIPageControl setUserInteractionEnabled:](v3->_pageControl, "setUserInteractionEnabled:", 0);
  v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = v3->_label;
  v3->_label = v8;

  v10 = v3->_label;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.75));
  -[UILabel setTextColor:](v10, "setTextColor:", v11);

  v12 = v3->_label;
  *(_QWORD *)&v14 = objc_opt_class(v3, v13).n128_u64[0];
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_labelFont", v14));
  -[UILabel setFont:](v12, "setFont:", v16);

  -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
  -[SSSScreenshotCountIndicator addSubview:](v3, "addSubview:", v3->_pageControl);
  -[SSSScreenshotCountIndicator addSubview:](v3, "addSubview:", v3->_label);
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char *v16;
  void *v17;
  void *v18;
  id v19;

  -[SSSScreenshotCountIndicator bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:");
  -[UILabel setFrame:](self->_label, "setFrame:", v4, v6, v8, v10);
  -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", -[SSSScreenshotCountIndicator count](self, "count"));
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", -[SSSScreenshotCountIndicator index](self, "index"));
  -[UIPageControl intrinsicContentSize](self->_pageControl, "intrinsicContentSize");
  v12 = v11;
  v13 = (v8 + v8) / 3.0;
  if (v11 > v13)
    v14 = 0.0;
  else
    v14 = 1.0;
  if (v12 > v13)
    v15 = 1.0;
  else
    v15 = 0.0;
  -[UIPageControl setAlpha:](self->_pageControl, "setAlpha:", v14);
  -[UILabel setAlpha:](self->_label, "setAlpha:", v15);
  if (v12 > v13)
  {
    v16 = (char *)-[SSSScreenshotCountIndicator index](self, "index") + 1;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("INDEX_OF_SCREENSHOT_IN_TOTAL_FORMAT"), &stru_1000937C8, 0));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v16, -[SSSScreenshotCountIndicator count](self, "count")));

    -[UILabel setText:](self->_label, "setText:", v19);
  }
  else
  {
    -[UILabel setText:](self->_label, "setText:", 0);
  }
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
  CGSize result;

  -[UIPageControl intrinsicContentSize](self->_pageControl, "intrinsicContentSize");
  v4 = v3;
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  if (v4 < v5)
    v4 = v5;
  -[UIPageControl intrinsicContentSize](self->_pageControl, "intrinsicContentSize");
  v7 = v6;
  -[UILabel intrinsicContentSize](self->_label, "intrinsicContentSize");
  if (v7 >= v8)
    v8 = v7;
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    -[SSSScreenshotCountIndicator setNeedsLayout](self, "setNeedsLayout");
    -[SSSScreenshotCountIndicator layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setIndex:(int64_t)a3
{
  if (self->_index != a3)
  {
    self->_index = a3;
    -[SSSScreenshotCountIndicator setNeedsLayout](self, "setNeedsLayout");
    -[SSSScreenshotCountIndicator layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
}

@end
