@implementation ConversationFooterViewDisplayMetrics

+ (id)displayMetricsWithSafeAreaInsets:(UIEdgeInsets)a3 interfaceOrientation:(int64_t)a4 traitCollection:(id)a5
{
  double bottom;
  double v7;
  ConversationFooterViewDisplayMetrics *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  bottom = a3.bottom;
  if (objc_msgSend(a5, "mf_hasCompactDimension", a3.top, a3.left, a3.bottom, a3.right))
    v7 = 0.0;
  else
    v7 = bottom;
  v8 = objc_alloc_init(ConversationFooterViewDisplayMetrics);
  -[ConversationFooterViewDisplayMetrics setUsePhoneLandscapeSymbolConfiguration:](v8, "setUsePhoneLandscapeSymbolConfiguration:", 0);
  if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
  {
    -[ConversationFooterViewDisplayMetrics setTopToBaseline:](v8, "setTopToBaseline:", 31.0);
    v9 = v7 + 45.0;
    if (v7 <= 0.0)
      v9 = 50.0;
    -[ConversationFooterViewDisplayMetrics setToolbarHeight:](v8, "setToolbarHeight:", v9);
  }
  else if ((unint64_t)(a4 - 3) > 1)
  {
    if (v7 <= 0.0)
    {
      v16 = 28.0;
      -[ConversationFooterViewDisplayMetrics setToolbarHeight:](v8, "setToolbarHeight:", 44.0);
    }
    else
    {
      -[ConversationFooterViewDisplayMetrics setToolbarHeight:](v8, "setToolbarHeight:", v7 + 49.0);
      v16 = 36.0;
    }
    -[ConversationFooterViewDisplayMetrics setTopToBaseline:](v8, "setTopToBaseline:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_referenceBounds");
    v12 = v11;
    v14 = v13;

    v15 = 44.0;
    if (fmin(v12, v14) <= 375.0)
      v15 = 32.0;
    -[ConversationFooterViewDisplayMetrics setToolbarHeight:](v8, "setToolbarHeight:", v7 + v15);
    -[ConversationFooterViewDisplayMetrics setTopToBaseline:](v8, "setTopToBaseline:", 21.0);
    -[ConversationFooterViewDisplayMetrics setUsePhoneLandscapeSymbolConfiguration:](v8, "setUsePhoneLandscapeSymbolConfiguration:", 1);
  }
  return v8;
}

- (double)toolbarHeight
{
  return self->_toolbarHeight;
}

- (void)setToolbarHeight:(double)a3
{
  self->_toolbarHeight = a3;
}

- (double)topToBaseline
{
  return self->_topToBaseline;
}

- (void)setTopToBaseline:(double)a3
{
  self->_topToBaseline = a3;
}

- (BOOL)usePhoneLandscapeSymbolConfiguration
{
  return self->_usePhoneLandscapeSymbolConfiguration;
}

- (void)setUsePhoneLandscapeSymbolConfiguration:(BOOL)a3
{
  self->_usePhoneLandscapeSymbolConfiguration = a3;
}

@end
