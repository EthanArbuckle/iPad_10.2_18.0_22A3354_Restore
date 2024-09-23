@implementation FUScrollWheel

- (FUScrollWheel)initWithFrame:(CGRect)a3
{
  double width;
  FUScrollWheel *v4;
  uint64_t v5;
  UIFont *font;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  UIScrollView *scrollView;
  uint64_t v12;
  NSMutableArray *reusableLabelsQueue;
  uint64_t v14;
  NSMutableDictionary *usedLabels;
  uint64_t v16;
  UIView *topDividerView;
  UIView *v18;
  void *v19;
  uint64_t v20;
  UIView *bottomDividerView;
  UIView *v22;
  void *v23;
  id v24;
  uint64_t v25;
  UIImageView *maskLayer;
  void *v27;
  void *v28;
  objc_super v30;

  width = a3.size.width;
  v30.receiver = self;
  v30.super_class = (Class)FUScrollWheel;
  v4 = -[FUScrollWheel initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v5 = objc_claimAutoreleasedReturnValue();
    font = v4->_font;
    v4->_font = (UIFont *)v5;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lineHeight");
    UICeilToViewScale();
    v4->_scrollWheelLabelHeight = v8;

    v4->_scrollWheelLabelPageSize = v4->_scrollWheelLabelHeight + -1.0;
    v4->_shouldRegenerateOpacityMask = 1;
    -[FUScrollWheel setItemTitleAligmnent:](v4, "setItemTitleAligmnent:", 1);
    v4->_loaded = 0;
    v9 = objc_alloc(MEMORY[0x24BEBD918]);
    -[FUScrollWheel bounds](v4, "bounds");
    v10 = objc_msgSend(v9, "initWithFrame:");
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v10;

    -[UIScrollView setShowsVerticalScrollIndicator:](v4->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setDelegate:](v4->_scrollView, "setDelegate:", v4);
    -[FUScrollWheel addSubview:](v4, "addSubview:", v4->_scrollView);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    v12 = objc_claimAutoreleasedReturnValue();
    reusableLabelsQueue = v4->_reusableLabelsQueue;
    v4->_reusableLabelsQueue = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    usedLabels = v4->_usedLabels;
    v4->_usedLabels = (NSMutableDictionary *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, width, 0.5);
    topDividerView = v4->_topDividerView;
    v4->_topDividerView = (UIView *)v16;

    v18 = v4->_topDividerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, width, 0.5);
    bottomDividerView = v4->_bottomDividerView;
    v4->_bottomDividerView = (UIView *)v20;

    v22 = v4->_bottomDividerView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    v24 = objc_alloc(MEMORY[0x24BEBD668]);
    -[FUScrollWheel bounds](v4, "bounds");
    v25 = objc_msgSend(v24, "initWithFrame:");
    maskLayer = v4->_maskLayer;
    v4->_maskLayer = (UIImageView *)v25;

    -[UIImageView setUserInteractionEnabled:](v4->_maskLayer, "setUserInteractionEnabled:", 0);
    -[FUScrollWheel addSubview:](v4, "addSubview:", v4->_maskLayer);
    v4->_numberOfRows = 0;
    -[FUScrollWheel addSubview:](v4, "addSubview:", v4->_topDividerView);
    -[FUScrollWheel addSubview:](v4, "addSubview:", v4->_bottomDividerView);
    -[UIView setHidden:](v4->_topDividerView, "setHidden:", 1);
    -[UIView setHidden:](v4->_bottomDividerView, "setHidden:", 1);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v4, sel__setActiveScrollwheelIfNotActive);
    -[FUScrollWheel addGestureRecognizer:](v4, "addGestureRecognizer:", v27);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v4, sel__textSizeDidChange, *MEMORY[0x24BEBE088], 0);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FUScrollWheel;
  -[FUScrollWheel dealloc](&v3, sel_dealloc);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)_setActiveScrollwheelIfNotActive
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  char v9;
  id v10;

  -[FUScrollWheel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[FUScrollWheel delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scrollWheelShouldBecomeFirstResponder:", self);

    v7 = v6 ^ 1;
  }
  else
  {
    v7 = 0;
  }
  if ((-[UIScrollView isFirstResponder](self->_scrollView, "isFirstResponder") & 1) == 0 && (v7 & 1) == 0)
  {
    -[UIScrollView becomeFirstResponder](self->_scrollView, "becomeFirstResponder");
    -[UIScrollView becomeFirstResponder](self->_scrollView, "becomeFirstResponder");
    -[FUScrollWheel delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[FUScrollWheel delegate](self, "delegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tappedScrollWheel:", self);

    }
  }
}

- (void)_textSizeDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__FUScrollWheel__textSizeDidChange__block_invoke;
  block[3] = &unk_24CF30600;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __35__FUScrollWheel__textSizeDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "becomeFirstResponder");
}

- (void)setHidden:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FUScrollWheel;
  -[FUScrollWheel setHidden:](&v5, sel_setHidden_);
  if (!a3)
    -[UIScrollView becomeFirstResponder](self->_scrollView, "becomeFirstResponder");
}

- (void)setItemTitleAligmnent:(int64_t)a3
{
  NSMutableDictionary *usedLabels;
  uint64_t v6;
  NSMutableArray *reusableLabelsQueue;
  _QWORD v8[5];
  _QWORD v9[5];

  self->_itemTitleAligmnent = a3;
  usedLabels = self->_usedLabels;
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__FUScrollWheel_setItemTitleAligmnent___block_invoke;
  v9[3] = &__block_descriptor_40_e24_v32__0_8__UILabel_16_B24l;
  v9[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](usedLabels, "enumerateKeysAndObjectsUsingBlock:", v9);
  reusableLabelsQueue = self->_reusableLabelsQueue;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __39__FUScrollWheel_setItemTitleAligmnent___block_invoke_2;
  v8[3] = &__block_descriptor_40_e24_v32__0__UILabel_8Q16_B24l;
  v8[4] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](reusableLabelsQueue, "enumerateObjectsUsingBlock:", v8);
}

uint64_t __39__FUScrollWheel_setItemTitleAligmnent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setTextAlignment:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__FUScrollWheel_setItemTitleAligmnent___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTextAlignment:", *(_QWORD *)(a1 + 32));
}

- (void)layoutSubviews
{
  unint64_t currentIndex;
  unint64_t numberOfRows;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIScrollView *scrollView;
  UIView *topDividerView;
  UIView *bottomDividerView;
  double v13;
  unint64_t v14;

  currentIndex = self->_currentIndex;
  numberOfRows = self->_numberOfRows;
  -[FUScrollWheel _startingLocation](self, "_startingLocation");
  v6 = v5;
  v7 = v6 + v6 + (double)numberOfRows * self->_scrollWheelLabelPageSize + 1.0;
  -[FUScrollWheel frame](self, "frame");
  v9 = v8;
  scrollView = self->_scrollView;
  -[FUScrollWheel bounds](self, "bounds");
  -[UIScrollView setFrame:](scrollView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v9, v7);
  topDividerView = self->_topDividerView;
  -[FUScrollWheel frame](self, "frame");
  -[UIView setFrame:](topDividerView, "setFrame:", 0.0, v6);
  bottomDividerView = self->_bottomDividerView;
  v13 = v6 + self->_scrollWheelLabelPageSize;
  -[FUScrollWheel frame](self, "frame");
  -[UIView setFrame:](bottomDividerView, "setFrame:", 0.0, v13);
  self->_currentIndex = currentIndex;
  v14 = self->_numberOfRows - 1;
  if (currentIndex < v14)
    v14 = currentIndex;
  self->_currentIndex = v14;
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, self->_scrollWheelLabelPageSize * (double)v14);
  -[FUScrollWheel _recycleAllLabels](self, "_recycleAllLabels");
  -[FUScrollWheel _layoutScrollView](self, "_layoutScrollView");
  if (self->_shouldRegenerateOpacityMask)
  {
    self->_shouldRegenerateOpacityMask = 0;
    -[FUScrollWheel _generateOpacityMask](self, "_generateOpacityMask");
  }
}

- (void)willMoveToSuperview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FUScrollWheel;
  -[FUScrollWheel willMoveToSuperview:](&v4, sel_willMoveToSuperview_, a3);
  if (!self->_loaded)
    -[FUScrollWheel reloadData](self, "reloadData");
}

- (void)reloadData
{
  self->_loaded = 1;
  self->_numberOfRows = -[FUScrollWheel _numberOfRows](self, "_numberOfRows");
  -[FUScrollWheel _recycleAllLabels](self, "_recycleAllLabels");
  -[FUScrollWheel layoutSubviews](self, "layoutSubviews");
  -[FUScrollWheel _layoutScrollView](self, "_layoutScrollView");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FUScrollWheel frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  self->_shouldRegenerateOpacityMask = !CGRectEqualToRect(v13, v14);
  v12.receiver = self;
  v12.super_class = (Class)FUScrollWheel;
  -[FUScrollWheel setFrame:](&v12, sel_setFrame_, x, y, width, height);
  -[FUScrollWheel setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCurrentIndex:(unint64_t)a3
{
  -[FUScrollWheel setCurrentIndex:animated:](self, "setCurrentIndex:animated:", a3, 0);
}

- (void)setCurrentIndex:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v4;

  self->_currentIndex = a3;
  v4 = self->_numberOfRows - 1;
  if (v4 >= a3)
    v4 = a3;
  self->_currentIndex = v4;
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", a4, 0.0, self->_scrollWheelLabelPageSize * (double)v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[FUScrollWheel scrollViewDidEndDecelerating:](self, "scrollViewDidEndDecelerating:", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v6;

  UIRoundToViewScale();
  a5->y = v6;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[FUScrollWheel _alertDidChangeToCurrentIndex:](self, "_alertDidChangeToCurrentIndex:", self->_currentIndex);
}

- (void)_generateOpacityMask
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  double x;
  double y;
  double width;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  CGFloat v25;
  void *v26;
  UIImageView *maskLayer;
  _QWORD v28[3];
  CGSize v29;
  CGRect v30;

  v28[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 1.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");

  v28[0] = v4;
  v28[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUScrollWheel bounds](self, "bounds");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  if (!CGRectIsEmpty(v30))
  {
    -[FUScrollWheel bounds](self, "bounds");
    UIRoundToViewScale();
    v12 = v11;
    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", x, y, width, v12);
    objc_msgSend(v13, "setColors:", v7);
    objc_msgSend(v13, "setLocations:", &unk_24CF4F158);
    -[FUScrollWheel bounds](self, "bounds");
    v15 = v14 - v12;
    objc_msgSend(MEMORY[0x24BDE56B8], "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", x, v15, width, v12);
    objc_msgSend(v7, "reverseObjectEnumerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColors:", v18);

    objc_msgSend(v16, "setLocations:", &unk_24CF4F170);
    objc_msgSend(v13, "addSublayer:", v16);
    -[FUScrollWheel bounds](self, "bounds");
    v20 = v19;
    v22 = v21;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    v25 = v24;
    v29.width = v20;
    v29.height = v22;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v25);

    objc_msgSend(v13, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    maskLayer = self->_maskLayer;
    -[FUScrollWheel bounds](self, "bounds");
    -[UIImageView setFrame:](maskLayer, "setFrame:");
    -[UIImageView setImage:](self->_maskLayer, "setImage:", v26);

  }
}

- (void)_layoutScrollView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSUInteger v9;
  double v10;
  NSUInteger v11;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[FUScrollWheel _startingLocation](self, "_startingLocation");
  v8 = v6 - v7;
  if (v8 < 0.0)
    v8 = 0.0;
  v9 = vcvtmd_u64_f64(v8 / self->_scrollWheelLabelPageSize);
  -[FUScrollWheel bounds](self, "bounds");
  v11 = (unint64_t)(ceil(v10 / self->_scrollWheelLabelPageSize) + 1.0);
  -[FUScrollWheel _reuseLabelsWithRange:contentOffset:](self, "_reuseLabelsWithRange:contentOffset:", v9, v11, v4, v6);
  self->_previousRange.location = v9;
  self->_previousRange.length = v11;
}

- (double)_startingLocation
{
  double result;

  -[FUScrollWheel frame](self, "frame");
  UIRoundToViewScale();
  return result;
}

- (void)_reuseLabelsWithRange:(_NSRange)a3 contentOffset:(CGPoint)a4
{
  double y;
  NSUInteger length;
  NSUInteger location;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  unint64_t numberOfRows;
  NSMutableDictionary *usedLabels;
  void *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
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
  uint64_t v39;
  double v40;
  double v43;
  BOOL v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  y = a4.y;
  length = a3.length;
  location = a3.location;
  v53 = *MEMORY[0x24BDAC8D0];
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset", a4.x);
  v9 = v8;
  -[UIScrollView frame](self->_scrollView, "frame");
  v11 = v10;
  -[UIScrollView frame](self->_scrollView, "frame");
  v13 = v12;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[NSMutableDictionary allKeys](self->_usedLabels, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_usedLabels, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frame");
        v56.origin.x = 0.0;
        v56.origin.y = v9;
        v56.size.width = v11;
        v56.size.height = v13;
        if (!CGRectIntersectsRect(v54, v56))
          -[FUScrollWheel _recycleLabel:forKey:](self, "_recycleLabel:forKey:", v20, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v16);
  }

  if (location + length >= self->_numberOfRows)
    numberOfRows = self->_numberOfRows;
  else
    numberOfRows = location + length;
  if (location < numberOfRows)
  {
    while (1)
    {
      usedLabels = self->_usedLabels;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](usedLabels, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        -[FUScrollWheel _dequeueLabel](self, "_dequeueLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[FUScrollWheel _textForLabelAtIndex:](self, "_textForLabelAtIndex:", location);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", v25);

        v26 = self->_usedLabels;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v24, v27);

      }
      objc_msgSend(v24, "setHidden:", 0);
      -[FUScrollWheel _frameForLabelAtIndex:](self, "_frameForLabelAtIndex:", location);
      objc_msgSend(v24, "setFrame:");
      -[FUScrollWheel font](self, "font");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFont:", v28);

      -[FUScrollWheel bounds](self, "bounds");
      v30 = v29 + -7.5;
      objc_msgSend(v24, "frame");
      v32 = v31;
      objc_msgSend(v24, "center");
      v34 = v33 - y - v30 * 0.5;
      if (v34 < 0.0)
        v34 = -v34;
      if (v34 <= self->_scrollWheelLabelPageSize * 0.5)
        self->_currentIndex = location;
      v35 = (v32 - y + 2.5) / v30;
      if (v35 > 0.45)
      {
        v36 = 15.0;
        if (v35 < 0.55)
          goto LABEL_25;
      }
      if (v35 >= 0.3 && v35 <= 0.7)
        break;
LABEL_26:
      objc_msgSend(v24, "frame");
      if (v35 > 0.7)
        v43 = 3.0;
      else
        v43 = 0.0;
      if (v35 <= 0.5)
        v43 = -3.0;
      if (v35 < 0.3 || v35 > 0.5)
      {
        v45 = v35 > 0.7 || v35 <= 0.5;
        v46 = v35 + -0.5;
        if (v45)
          v46 = 0.0;
      }
      else
      {
        v46 = v35 + -0.3;
      }
      v47 = v40 + v43 + v46 / 0.2 * 3.0;
      v55 = CGRectIntegral(*(CGRect *)&v39);
      objc_msgSend(v24, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);

      if (numberOfRows == ++location)
        return;
    }
    v37 = fabs(v35 + -0.5);
    v36 = round(((v37 + -0.05) / -0.15 + 1.0) * 3.0 + ((v37 + -0.05) / -0.15 + 1.0) * 3.0) * 0.5 + 12.0;
LABEL_25:
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v38);

    goto LABEL_26;
  }
}

- (void)_recycleLabel:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  objc_msgSend(v6, "setHidden:", 1);
  -[NSMutableArray addObject:](self->_reusableLabelsQueue, "addObject:", v6);

  -[NSMutableDictionary removeObjectForKey:](self->_usedLabels, "removeObjectForKey:", v7);
}

- (void)_recycleAllLabels
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](self->_usedLabels, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_usedLabels, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromSuperview");
        -[NSMutableDictionary removeObjectForKey:](self->_usedLabels, "removeObjectForKey:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_dequeueLabel
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[NSMutableArray count](self->_reusableLabelsQueue, "count"))
  {
    v3 = objc_alloc(MEMORY[0x24BEBD708]);
    -[FUScrollWheel frame](self, "frame");
    v5 = (void *)objc_msgSend(v3, "initWithFrame:", 2.0, 0.0, v4 + -4.0, self->_scrollWheelLabelHeight);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

    objc_msgSend(v5, "setTextAlignment:", -[FUScrollWheel itemTitleAligmnent](self, "itemTitleAligmnent"));
    objc_msgSend(v5, "setOpaque:", 1);
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
    -[NSMutableArray addObject:](self->_reusableLabelsQueue, "addObject:", v5);
    -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v5);

  }
  -[NSMutableArray lastObject](self->_reusableLabelsQueue, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_reusableLabelsQueue, "removeLastObject");
  return v7;
}

- (CGRect)_frameForLabelAtIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double scrollWheelLabelHeight;
  double v9;
  double v10;
  CGRect result;

  -[FUScrollWheel _yPositionForLabelAtIndex:](self, "_yPositionForLabelAtIndex:", a3);
  v5 = v4;
  -[FUScrollWheel frame](self, "frame");
  v7 = v6 + -4.0;
  scrollWheelLabelHeight = self->_scrollWheelLabelHeight;
  v9 = 2.0;
  v10 = v5;
  result.size.height = scrollWheelLabelHeight;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)_yPositionForLabelAtIndex:(unint64_t)a3
{
  double v3;
  double scrollWheelLabelPageSize;
  double v5;

  v3 = (double)a3;
  scrollWheelLabelPageSize = self->_scrollWheelLabelPageSize;
  -[FUScrollWheel _startingLocation](self, "_startingLocation");
  return v5 + v3 * scrollWheelLabelPageSize;
}

- (id)_titleForItemAtIndex:(unint64_t)a3
{
  FUScrollWheelDataSource **p_dataSource;
  id WeakRetained;
  id v7;
  void *v8;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v7, "scrollWheel:titleForItemAtIndex:", self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (unint64_t)_numberOfRows
{
  FUScrollWheelDataSource **p_dataSource;
  id WeakRetained;
  id v5;
  unint64_t v6;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_dataSource);
  v6 = objc_msgSend(v5, "numberOfRowsInScrollWheel:", self);

  return v6;
}

- (void)_alertDidChangeToCurrentIndex:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[FUScrollWheel delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[FUScrollWheel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[FUScrollWheel delegate](self, "delegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scrollWheel:didChangeCurrentIndexTo:", self, a3);

    }
  }
}

- (FUScrollWheelDataSource)dataSource
{
  return (FUScrollWheelDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (FUScrollWheelDelegate)delegate
{
  return (FUScrollWheelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)itemTitleAligmnent
{
  return self->_itemTitleAligmnent;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (double)scrollWheelLabelPageSize
{
  return self->_scrollWheelLabelPageSize;
}

- (void)setScrollWheelLabelPageSize:(double)a3
{
  self->_scrollWheelLabelPageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
  objc_storeStrong((id *)&self->_topDividerView, 0);
  objc_storeStrong((id *)&self->_usedLabels, 0);
  objc_storeStrong((id *)&self->_reusableLabelsQueue, 0);
}

@end
