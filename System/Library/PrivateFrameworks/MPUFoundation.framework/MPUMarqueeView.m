@implementation MPUMarqueeView

- (MPUMarqueeView)initWithFrame:(CGRect)a3
{
  char *v3;
  MPUMarqueeView *v4;
  __int128 v5;
  uint64_t v6;
  NSPointerArray *coordinatedMarqueeViews;
  _MPUMarqueeContentView *v8;
  uint64_t v9;
  UIView *contentView;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MPUMarqueeView;
  v3 = -[MPUMarqueeView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (MPUMarqueeView *)v3;
  if (v3)
  {
    *((_QWORD *)v3 + 61) = 0x4008000000000000;
    *((_QWORD *)v3 + 62) = 0x403E000000000000;
    v5 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)(v3 + 536) = *MEMORY[0x24BDF7718];
    *(_OWORD *)(v3 + 552) = v5;
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v6 = objc_claimAutoreleasedReturnValue();
    coordinatedMarqueeViews = v4->_coordinatedMarqueeViews;
    v4->_coordinatedMarqueeViews = (NSPointerArray *)v6;

    -[MPUMarqueeView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v8 = [_MPUMarqueeContentView alloc];
    -[MPUMarqueeView bounds](v4, "bounds");
    v9 = -[_MPUMarqueeContentView initWithFrame:](v8, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v9;

    -[MPUMarqueeView addSubview:](v4, "addSubview:", v4->_contentView);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel_sceneDidEnterBackgroundNotification_, *MEMORY[0x24BDF7D28], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_sceneWillEnterForegroundNotification_, *MEMORY[0x24BDF7D40], 0);

  }
  return v4;
}

- (void)sceneWillEnterForegroundNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUMarqueeView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[MPUMarqueeView setMarqueeEnabled:](self, "setMarqueeEnabled:", 1);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUMarqueeView;
  -[MPUMarqueeView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[MPUMarqueeView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
  else
    -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
}

- (void)setViewForContentSize:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_viewForContentSize != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewForContentSize, a3);
    -[MPUMarqueeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v6;
  }

}

- (CGSize)intrinsicContentSize
{
  UIView *viewForContentSize;
  double width;
  double height;
  double v6;
  CGSize result;

  viewForContentSize = self->_viewForContentSize;
  if (viewForContentSize)
  {
    -[UIView intrinsicContentSize](viewForContentSize, "intrinsicContentSize");
  }
  else
  {
    width = self->_contentSize.width;
    height = self->_contentSize.height;
  }
  v6 = width + self->_fadeEdgeInsets.left + self->_fadeEdgeInsets.right;
  result.height = height;
  result.width = v6;
  return result;
}

- (void)setContentGap:(double)a3
{
  if (self->_contentGap != a3)
  {
    self->_contentGap = a3;
    -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
    -[MPUMarqueeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MPUMarqueeView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MPUMarqueeView;
  -[MPUMarqueeView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
    -[MPUMarqueeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)viewForLastBaselineLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView subviews](self->_contentView, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForLastBaselineLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_createMarqueeAnimationIfNeeded
{
  MPUMarqueeView **p_primaryMarqueeView;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSPointerArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  p_primaryMarqueeView = &self->_primaryMarqueeView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_primaryMarqueeView);

  if (WeakRetained)
  {
    v24 = objc_loadWeakRetained((id *)p_primaryMarqueeView);
    objc_msgSend(v24, "_createMarqueeAnimationIfNeeded");

  }
  else
  {
    -[MPUMarqueeView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && self->_marqueeEnabled)
    {
      -[MPUMarqueeView _duration](self, "_duration");
      v7 = v6;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v8 = self->_coordinatedMarqueeViews;
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v30 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "_duration");
            if (v7 < v13)
              v7 = v13;
          }
          v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v10);
      }

      -[UIView layer](self->_contentView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "animationForKey:", CFSTR("_MPUMarqueeViewLayerAnimationKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "beginTime");
      else
        v17 = CACurrentMediaTime();
      v18 = v17;
      -[MPUMarqueeView _createMarqueeAnimationIfNeededWithMaximumDuration:beginTime:](self, "_createMarqueeAnimationIfNeededWithMaximumDuration:beginTime:", v7, v17);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = self->_coordinatedMarqueeViews;
      v20 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "_createMarqueeAnimationIfNeededWithMaximumDuration:beginTime:", v7, v18);
          }
          v21 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v21);
      }

    }
  }
}

- (void)_applyMarqueeFade
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  double x;
  double y;
  double width;
  double height;
  double v15;
  UIEdgeInsets *p_fadeEdgeInsets;
  void *v17;
  void *v18;
  void *v19;
  double MidX;
  id v21;
  _QWORD v22[4];
  _QWORD v23[5];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v23[4] = *MEMORY[0x24BDAC8D0];
  if (-[MPUMarqueeView _contentFits](self, "_contentFits"))
  {
    -[MPUMarqueeView gradientLayer](self, "gradientLayer");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperlayer");

  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x24BDE57D8], "disableActions");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[MPUMarqueeView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUMarqueeView gradientLayer](self, "gradientLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDE56B8], "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");

      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "CGColor");

      v23[0] = v7;
      v23[1] = v9;
      v23[2] = v9;
      v23[3] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setColors:", v10);

      objc_msgSend(v5, "setCompositingFilter:", *MEMORY[0x24BDE5A48]);
      objc_msgSend(v4, "addSublayer:", v5);
    }
    -[MPUMarqueeView bounds](self, "bounds");
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    v15 = CGRectGetWidth(v24);
    v22[0] = &unk_24DD76EB8;
    p_fadeEdgeInsets = &self->_fadeEdgeInsets;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_fadeEdgeInsets.left / v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v15 - p_fadeEdgeInsets->right) / v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v18;
    v22[3] = &unk_24DD76EC8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocations:", v19);

    objc_msgSend(v5, "setBounds:", x, y, width, height);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MidX = CGRectGetMidX(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    objc_msgSend(v5, "setPosition:", MidX, CGRectGetMidY(v26));
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    objc_msgSend(v5, "setStartPoint:", 0.0, CGRectGetMidY(v27));
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    objc_msgSend(v5, "setEndPoint:", 1.0, CGRectGetMidY(v28));
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", v3);

  }
}

- (CAGradientLayer)gradientLayer
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[MPUMarqueeView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (CAGradientLayer *)v5;
}

- (BOOL)_contentFits
{
  CGRect v4;

  -[MPUMarqueeView bounds](self, "bounds");
  return round(self->_contentSize.width) <= round(CGRectGetWidth(v4)- self->_fadeEdgeInsets.left- self->_fadeEdgeInsets.right);
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  int64_t animationDirection;
  double v14;
  double Width;
  UIView *contentView;
  void *v17;
  void *v18;
  CATransform3D v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)MPUMarqueeView;
  -[MPUMarqueeView layoutSubviews](&v20, sel_layoutSubviews);
  if (-[MPUMarqueeView animationDirection](self, "animationDirection"))
    v3 = 4;
  else
    v3 = 3;
  -[UIView setSemanticContentAttribute:](self->_contentView, "setSemanticContentAttribute:", v3);
  -[MPUMarqueeView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView layer](self->_contentView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  animationDirection = self->_animationDirection;
  v14 = self->_contentSize.width + self->_contentGap;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  Width = CGRectGetWidth(v21);
  if (v14 >= Width)
    Width = v14;
  if (animationDirection == 1)
    Width = -Width;
  CATransform3DMakeTranslation(&v19, Width, 0.0, 0.0);
  objc_msgSend(v12, "setInstanceTransform:", &v19);
  objc_msgSend(v12, "setInstanceCount:", 2);
  contentView = self->_contentView;
  UIRectCenteredYInRectScale();
  -[UIView setFrame:](contentView, "setFrame:", 0);
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fadeEdgeInsets.top, *MEMORY[0x24BDF7718]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_fadeEdgeInsets.bottom, *(float64x2_t *)(MEMORY[0x24BDF7718] + 16)))), 0xFuLL))) & 1) != 0)
  {
    -[MPUMarqueeView gradientLayer](self, "gradientLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[MPUMarqueeView gradientLayer](self, "gradientLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeFromSuperlayer");

    }
  }
  else
  {
    -[MPUMarqueeView _applyMarqueeFade](self, "_applyMarqueeFade");
  }

}

- (int64_t)animationDirection
{
  return self->_animationDirection;
}

- (void)_tearDownMarqueeAnimation
{
  id v2;

  -[UIView layer](self->_contentView, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("_MPUMarqueeViewLayerAnimationKey"));

}

- (void)invalidateIntrinsicContentSize
{
  UIView *viewForContentSize;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUMarqueeView;
  -[MPUMarqueeView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  viewForContentSize = self->_viewForContentSize;
  if (viewForContentSize)
  {
    -[UIView intrinsicContentSize](viewForContentSize, "intrinsicContentSize");
    -[MPUMarqueeView setContentSize:](self, "setContentSize:");
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
    -[MPUMarqueeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)viewForContentSize
{
  return self->_viewForContentSize;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setFadeEdgeInsets:(UIEdgeInsets)a3
{
  self->_fadeEdgeInsets = a3;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MPUMarqueeView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)MPUMarqueeView;
  -[MPUMarqueeView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
  }
}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView subviews](self->_contentView, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForFirstBaselineLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  id WeakRetained;
  char v9;
  id v10;
  int64_t options;

  v4 = a4;
  objc_msgSend(a3, "valueForKey:", CFSTR("_MPUMarqueeViewAnimationIdentifierKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_currentAnimationID);

  if (v7)
  {
    -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "marqueeViewDidEndMarqueeIteration:finished:", self, v4);

    }
    if (v4)
    {
      options = self->_options;
      if ((options & 2) != 0)
        self->_options = options ^ 2;
      -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
    }
  }
}

- (void)setMarqueeDelay:(double)a3
{
  if (self->_marqueeDelay != a3)
  {
    self->_marqueeDelay = a3;
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
  }
}

- (void)setAnimationReferenceView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_animationReferenceView, obj);
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
    v5 = obj;
  }

}

- (void)setMarqueeEnabled:(BOOL)a3
{
  -[MPUMarqueeView setMarqueeEnabled:withOptions:](self, "setMarqueeEnabled:withOptions:", a3, 0);
}

- (void)setMarqueeEnabled:(BOOL)a3 withOptions:(int64_t)a4
{
  char v4;
  BOOL *p_marqueeEnabled;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a4;
  if (self->_options != a4)
  {
    self->_options = a4;
    p_marqueeEnabled = &self->_marqueeEnabled;
    if (self->_marqueeEnabled == a3)
    {
LABEL_13:
      -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded", v15, v16);
      return;
    }
LABEL_5:
    *p_marqueeEnabled = a3;
    -[UIView layer](self->_contentView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v4 & 1) == 0)
      goto LABEL_11;
    objc_msgSend(v7, "animationForKey:", CFSTR("_MPUMarqueeViewLayerAnimationKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v8, "presentationLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "affineTransform");
        v13 = *(double *)&v17;
      }
      else
      {
        v16 = 0u;
        v17 = 0u;
        v15 = 0u;
        v13 = 0.0;
      }
      v14 = fabs(v13);

      if (v14 < 2.22044605e-16)
LABEL_11:
        -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation", v15, v16, v17);
    }

    goto LABEL_13;
  }
  p_marqueeEnabled = &self->_marqueeEnabled;
  if (self->_marqueeEnabled != a3)
    goto LABEL_5;
}

- (void)setMarqueeScrollRate:(double)a3
{
  if (self->_marqueeScrollRate != a3)
  {
    self->_marqueeScrollRate = a3;
    -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
    -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
  }
}

- (void)setAnimationDirection:(int64_t)a3
{
  if (self->_animationDirection != a3)
  {
    self->_animationDirection = a3;
    -[MPUMarqueeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)addCoordinatedMarqueeView:(id)a3
{
  MPUMarqueeView **p_primaryMarqueeView;
  id WeakRetained;
  id v6;
  id *v7;
  id *v8;

  p_primaryMarqueeView = &self->_primaryMarqueeView;
  v8 = (id *)a3;
  WeakRetained = objc_loadWeakRetained((id *)p_primaryMarqueeView);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_primaryMarqueeView);
    objc_msgSend(v6, "addCoordinatedMarqueeView:", v8);

    v7 = (id *)v6;
  }
  else
  {
    objc_storeWeak(v8 + 55, self);
    -[NSPointerArray addPointer:](self->_coordinatedMarqueeViews, "addPointer:", v8);
    v7 = v8;
  }

}

- (NSArray)coordinatedMarqueeViews
{
  -[NSPointerArray compact](self->_coordinatedMarqueeViews, "compact");
  return -[NSPointerArray allObjects](self->_coordinatedMarqueeViews, "allObjects");
}

- (void)resetMarqueePosition
{
  -[MPUMarqueeView _tearDownMarqueeAnimation](self, "_tearDownMarqueeAnimation");
  -[MPUMarqueeView _createMarqueeAnimationIfNeeded](self, "_createMarqueeAnimationIfNeeded");
}

- (void)_createMarqueeAnimationIfNeededWithMaximumDuration:(double)a3 beginTime:(double)a4
{
  void *v7;
  void *v8;
  NSUUID *v9;
  NSUUID *currentAnimationID;
  id WeakRetained;
  double v12;
  void *v13;
  double v14;
  int64_t v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[5];
  CGRect v27;

  v26[4] = *MEMORY[0x24BDAC8D0];
  -[UIView layer](self->_contentView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationForKey:", CFSTR("_MPUMarqueeViewLayerAnimationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && !-[MPUMarqueeView _contentFits](self, "_contentFits"))
  {
    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    currentAnimationID = self->_currentAnimationID;
    self->_currentAnimationID = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);
    objc_msgSend(WeakRetained, "bounds");
    v12 = CGRectGetWidth(v27) - self->_fadeEdgeInsets.left - self->_fadeEdgeInsets.right - self->_contentSize.width;

    if (v12 < 0.0)
      v12 = 0.0;
    objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform.translation.x"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -self->_contentSize.width - self->_contentGap - v12;
    v15 = -[MPUMarqueeView animationDirection](self, "animationDirection");
    v16 = -v14;
    if (v15 != 1)
      v16 = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUMarqueeView _duration](self, "_duration");
    v19 = v18;
    v26[0] = &unk_24DD76EB8;
    v26[1] = &unk_24DD76EB8;
    v26[2] = v17;
    v26[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValues:", v20);

    v25[0] = &unk_24DD76EB8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_marqueeDelay / a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v21;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19 / a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v22;
    v25[3] = &unk_24DD76EC8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setKeyTimes:", v23);

    objc_msgSend(v13, "setDuration:", a3);
    objc_msgSend(v13, "setBeginTime:", a4);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTimingFunction:", v24);

    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setValue:forKey:", self->_currentAnimationID, CFSTR("_MPUMarqueeViewAnimationIdentifierKey"));
    objc_msgSend(v13, "setFrameInterval:", 0.016);
    objc_msgSend(v7, "addAnimation:forKey:", v13, CFSTR("_MPUMarqueeViewLayerAnimationKey"));

  }
}

- (double)_duration
{
  double marqueeDelay;

  marqueeDelay = 0.0;
  if ((self->_options & 2) == 0)
    marqueeDelay = self->_marqueeDelay;
  return marqueeDelay + 1.0 / self->_marqueeScrollRate * (self->_contentSize.width + self->_contentGap);
}

- (void)sceneDidEnterBackgroundNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUMarqueeView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[MPUMarqueeView setMarqueeEnabled:](self, "setMarqueeEnabled:", 0);
}

- (double)contentGap
{
  return self->_contentGap;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)animationReferenceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_animationReferenceView);
}

- (UIEdgeInsets)fadeEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fadeEdgeInsets.top;
  left = self->_fadeEdgeInsets.left;
  bottom = self->_fadeEdgeInsets.bottom;
  right = self->_fadeEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (MPUMarqueeViewDelegate)delegate
{
  return (MPUMarqueeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)marqueeDelay
{
  return self->_marqueeDelay;
}

- (double)marqueeScrollRate
{
  return self->_marqueeScrollRate;
}

- (BOOL)isMarqueeEnabled
{
  return self->_marqueeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewForContentSize, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_animationReferenceView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_primaryMarqueeView);
  objc_storeStrong((id *)&self->_coordinatedMarqueeViews, 0);
  objc_storeStrong((id *)&self->_currentAnimationID, 0);
}

@end
