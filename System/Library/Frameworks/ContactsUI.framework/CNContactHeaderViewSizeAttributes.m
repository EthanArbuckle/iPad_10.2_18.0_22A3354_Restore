@implementation CNContactHeaderViewSizeAttributes

- (double)minHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  -[CNContactHeaderViewSizeAttributes _minHeight](self, "_minHeight");
  if (v3 == 0.0)
  {
    -[CNContactHeaderViewSizeAttributes photoMinTopMargin](self, "photoMinTopMargin");
    v5 = v4;
    -[CNContactHeaderViewSizeAttributes photoMinHeight](self, "photoMinHeight");
    v7 = v5 + v6;
    -[CNContactHeaderViewSizeAttributes photoMinBottomMargin](self, "photoMinBottomMargin");
    -[CNContactHeaderViewSizeAttributes set_minHeight:](self, "set_minHeight:", v7 + v8);
  }
  -[CNContactHeaderViewSizeAttributes _minHeight](self, "_minHeight");
  return result;
}

- (double)_minHeight
{
  return self->__minHeight;
}

- (double)headerBottomMargin
{
  return self->_headerBottomMargin;
}

- (double)photoMinTopMargin
{
  return self->_photoMinTopMargin;
}

- (double)photoMinHeight
{
  return self->_photoMinHeight;
}

- (double)photoMinBottomMarginLowQuality
{
  return self->_photoMinBottomMarginLowQuality;
}

- (double)photoMaxHeightLowQuality
{
  return self->_photoMaxHeightLowQuality;
}

- (void)set_minHeight:(double)a3
{
  self->__minHeight = a3;
}

- (double)photoMinBottomMargin
{
  return self->_photoMinBottomMargin;
}

- (double)photoMaxHeight
{
  return self->_photoMaxHeight;
}

+ (id)staticDisplayAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  objc_msgSend(a1, "defaultAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 70.0;
  if (v4 == 1)
  {
    v8 = 29.0;
  }
  else
  {
    v7 = 0.0;
    v8 = 26.0;
  }
  objc_msgSend(v5, "setPhotoMinTopMargin:", v7);
  objc_msgSend(v6, "setPhotoMinBottomMargin:", v8);
  objc_msgSend(v6, "setPhotoMinBottomMarginLowQuality:", 11.0);
  objc_msgSend(v6, "setPhotoMinTopMarginPadCompact:", 0.0);
  objc_msgSend(v6, "setPhotoMinBottomMarginPadCompact:", 26.0);
  objc_msgSend(v6, "setPhotoMinBottomMarginPhoneLandscape:", 21.0);
  objc_msgSend(v6, "setPhotoMinHeight:", 88.0);
  objc_msgSend(v6, "setPhotoMaxHeight:", 320.0);
  objc_msgSend(v6, "setPhotoMaxHeightLowQuality:", 86.0);
  objc_msgSend(v6, "setPhotoMaxHeightPhoneLandscape:", 108.0);
  objc_msgSend(v6, "setPhotoMaxHeightPadCompact:", 140.0);
  objc_msgSend(v6, "setHeaderBottomMargin:", 17.0);
  return v6;
}

- (void)setPhotoMinTopMarginPadCompact:(double)a3
{
  self->_photoMinTopMarginPadCompact = a3;
}

- (void)setPhotoMinHeight:(double)a3
{
  self->_photoMinHeight = a3;
}

- (void)setPhotoMinBottomMarginPhoneLandscape:(double)a3
{
  self->_photoMinBottomMarginPhoneLandscape = a3;
}

- (void)setPhotoMinBottomMarginPadCompact:(double)a3
{
  self->_photoMinBottomMarginPadCompact = a3;
}

- (void)setPhotoMinBottomMarginLowQuality:(double)a3
{
  self->_photoMinBottomMarginLowQuality = a3;
}

- (void)setPhotoMaxHeightPhoneLandscape:(double)a3
{
  self->_photoMaxHeightPhoneLandscape = a3;
}

- (void)setPhotoMaxHeightPadCompact:(double)a3
{
  self->_photoMaxHeightPadCompact = a3;
}

- (void)setPhotoMaxHeightLowQuality:(double)a3
{
  self->_photoMaxHeightLowQuality = a3;
}

- (void)setPhotoMaxHeight:(double)a3
{
  self->_photoMaxHeight = a3;
}

+ (id)staticCollapsedDisplayAttributes
{
  void *v2;

  objc_msgSend(a1, "defaultAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhotoMinTopMargin:", 2.0);
  objc_msgSend(v2, "setPhotoMinBottomMargin:", 6.0);
  objc_msgSend(v2, "setHeaderBottomMargin:", 16.0);
  return v2;
}

- (void)setPhotoMinTopMargin:(double)a3
{
  self->_photoMinTopMargin = a3;
}

- (void)setPhotoMinBottomMargin:(double)a3
{
  self->_photoMinBottomMargin = a3;
}

- (void)setHeaderBottomMargin:(double)a3
{
  self->_headerBottomMargin = a3;
}

+ (id)defaultAttributes
{
  return objc_alloc_init(CNContactHeaderViewSizeAttributes);
}

- (CNContactHeaderViewSizeAttributes)init
{
  CNContactHeaderViewSizeAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderViewSizeAttributes;
  result = -[CNContactHeaderViewSizeAttributes init](&v3, sel_init);
  *(_OWORD *)&result->_photoMinHeight = xmmword_18AF8B8D0;
  *(_OWORD *)&result->_photoMinTopMargin = xmmword_18AF8B8E0;
  result->_photoMinBottomMargin = 6.0;
  *(_OWORD *)&result->_photoMaxBottomMargin = xmmword_18AF8B8F0;
  result->_headerBottomMargin = 0.0;
  result->_posterMaxHeight = 0.0;
  result->_maxNavbarTitleOffset = 0.0;
  return result;
}

- (double)maxHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  -[CNContactHeaderViewSizeAttributes _maxHeight](self, "_maxHeight");
  if (v3 == 0.0)
  {
    -[CNContactHeaderViewSizeAttributes photoMaxTopMargin](self, "photoMaxTopMargin");
    v5 = v4;
    -[CNContactHeaderViewSizeAttributes photoMaxHeight](self, "photoMaxHeight");
    v7 = v5 + v6;
    -[CNContactHeaderViewSizeAttributes photoMaxBottomMargin](self, "photoMaxBottomMargin");
    -[CNContactHeaderViewSizeAttributes set_maxHeight:](self, "set_maxHeight:", v7 + v8);
  }
  -[CNContactHeaderViewSizeAttributes _maxHeight](self, "_maxHeight");
  return result;
}

- (double)valueBetweenMin:(double)a3 max:(double)a4 percentMax:(double)a5
{
  return a3 + a5 * (a4 - a3);
}

- (double)photoHeightWithPercentMax:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[CNContactHeaderViewSizeAttributes photoMinHeight](self, "photoMinHeight");
  v6 = v5;
  -[CNContactHeaderViewSizeAttributes photoMaxHeight](self, "photoMaxHeight");
  -[CNContactHeaderViewSizeAttributes valueBetweenMin:max:percentMax:](self, "valueBetweenMin:max:percentMax:", v6, v7, a3);
  return result;
}

- (double)photoTopMarginWithPercentMax:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[CNContactHeaderViewSizeAttributes photoMinTopMargin](self, "photoMinTopMargin");
  v6 = v5;
  -[CNContactHeaderViewSizeAttributes photoMaxTopMargin](self, "photoMaxTopMargin");
  -[CNContactHeaderViewSizeAttributes valueBetweenMin:max:percentMax:](self, "valueBetweenMin:max:percentMax:", v6, v7, a3);
  return result;
}

- (double)photoBottomMarginWithPercentMax:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[CNContactHeaderViewSizeAttributes photoMinBottomMargin](self, "photoMinBottomMargin");
  v6 = v5;
  -[CNContactHeaderViewSizeAttributes photoMaxBottomMargin](self, "photoMaxBottomMargin");
  -[CNContactHeaderViewSizeAttributes valueBetweenMin:max:percentMax:](self, "valueBetweenMin:max:percentMax:", v6, v7, a3);
  return result;
}

- (double)navbarTitleOffsetWithPercentMax:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[CNContactHeaderViewSizeAttributes minNavbarTitleOffset](self, "minNavbarTitleOffset");
  v6 = v5;
  -[CNContactHeaderViewSizeAttributes maxNavbarTitleOffset](self, "maxNavbarTitleOffset");
  -[CNContactHeaderViewSizeAttributes valueBetweenMin:max:percentMax:](self, "valueBetweenMin:max:percentMax:", v6, v7, a3);
  return result;
}

- (double)photoMaxTopMargin
{
  return self->_photoMaxTopMargin;
}

- (void)setPhotoMaxTopMargin:(double)a3
{
  self->_photoMaxTopMargin = a3;
}

- (double)photoMaxBottomMargin
{
  return self->_photoMaxBottomMargin;
}

- (void)setPhotoMaxBottomMargin:(double)a3
{
  self->_photoMaxBottomMargin = a3;
}

- (double)minNavbarTitleOffset
{
  return self->_minNavbarTitleOffset;
}

- (void)setMinNavbarTitleOffset:(double)a3
{
  self->_minNavbarTitleOffset = a3;
}

- (double)maxNavbarTitleOffset
{
  return self->_maxNavbarTitleOffset;
}

- (void)setMaxNavbarTitleOffset:(double)a3
{
  self->_maxNavbarTitleOffset = a3;
}

- (double)posterMaxHeight
{
  return self->_posterMaxHeight;
}

- (void)setPosterMaxHeight:(double)a3
{
  self->_posterMaxHeight = a3;
}

- (double)photoMaxHeightPhoneLandscape
{
  return self->_photoMaxHeightPhoneLandscape;
}

- (double)photoMinBottomMarginPhoneLandscape
{
  return self->_photoMinBottomMarginPhoneLandscape;
}

- (double)photoMaxHeightPadCompact
{
  return self->_photoMaxHeightPadCompact;
}

- (double)photoMinTopMarginPadCompact
{
  return self->_photoMinTopMarginPadCompact;
}

- (double)photoMinBottomMarginPadCompact
{
  return self->_photoMinBottomMarginPadCompact;
}

- (double)_maxHeight
{
  return self->__maxHeight;
}

- (void)set_maxHeight:(double)a3
{
  self->__maxHeight = a3;
}

+ (id)editingAttributes
{
  void *v2;

  objc_msgSend(a1, "defaultAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhotoMaxHeight:", 168.0);
  objc_msgSend(v2, "setPhotoMaxTopMargin:", 40.0);
  objc_msgSend(v2, "setPhotoMinBottomMargin:", 12.0);
  objc_msgSend(v2, "setPhotoMaxBottomMargin:", 24.0);
  return v2;
}

+ (id)staticEditingAttributes
{
  void *v2;

  objc_msgSend(a1, "editingAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhotoMinHeight:", 40.0);
  objc_msgSend(v2, "setPhotoMaxHeight:", 175.0);
  objc_msgSend(v2, "setPhotoMaxHeightLowQuality:", 86.0);
  objc_msgSend(v2, "setPhotoMaxTopMargin:", 0.0);
  objc_msgSend(v2, "setPhotoMinTopMargin:", 0.0);
  objc_msgSend(v2, "setPhotoMaxBottomMargin:", 24.0);
  objc_msgSend(v2, "setPhotoMinBottomMargin:", 24.0);
  objc_msgSend(v2, "setPosterMaxHeight:", 250.0);
  return v2;
}

+ (id)editingAttributesWithNavBar
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "editingAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minNavbarTitleOffset");
  objc_msgSend(v2, "setMinNavbarTitleOffset:", v3 + 20.0);
  objc_msgSend(v2, "maxNavbarTitleOffset");
  objc_msgSend(v2, "setMaxNavbarTitleOffset:", v4 + 20.0);
  return v2;
}

+ (id)displayAttributesWithNavBar
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "defaultAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minNavbarTitleOffset");
  objc_msgSend(v2, "setMinNavbarTitleOffset:", v3 + 20.0);
  objc_msgSend(v2, "maxNavbarTitleOffset");
  objc_msgSend(v2, "setMaxNavbarTitleOffset:", v4 + 20.0);
  return v2;
}

+ (id)staticDisplayAttributesWithNavBar
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "staticDisplayAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minNavbarTitleOffset");
  objc_msgSend(v2, "setMinNavbarTitleOffset:", v3 + 26.0);
  objc_msgSend(v2, "maxNavbarTitleOffset");
  objc_msgSend(v2, "setMaxNavbarTitleOffset:", v4 + 26.0);
  return v2;
}

+ (id)staticCollapsedDisplayAttributesWithNavBar
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "staticCollapsedDisplayAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minNavbarTitleOffset");
  objc_msgSend(v2, "setMinNavbarTitleOffset:", v3 + 26.0);
  objc_msgSend(v2, "maxNavbarTitleOffset");
  objc_msgSend(v2, "setMaxNavbarTitleOffset:", v4 + 26.0);
  return v2;
}

+ (id)staticEditingAttributesWithNavBar
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "staticEditingAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minNavbarTitleOffset");
  objc_msgSend(v2, "setMinNavbarTitleOffset:", v3 + 26.0);
  objc_msgSend(v2, "maxNavbarTitleOffset");
  objc_msgSend(v2, "setMaxNavbarTitleOffset:", v4 + 26.0);
  return v2;
}

@end
