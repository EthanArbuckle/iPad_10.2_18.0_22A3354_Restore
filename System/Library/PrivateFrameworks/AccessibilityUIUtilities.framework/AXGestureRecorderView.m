@implementation AXGestureRecorderView

- (void)_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *activeLayers;
  NSMutableDictionary *v5;
  NSMutableDictionary *instantReplayViews;
  NSMutableArray *v7;
  NSMutableArray *staticLayers;
  NSMutableArray *v9;
  NSMutableArray *transitionLayers;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  activeLayers = self->_activeLayers;
  self->_activeLayers = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  instantReplayViews = self->_instantReplayViews;
  self->_instantReplayViews = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  staticLayers = self->_staticLayers;
  self->_staticLayers = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  transitionLayers = self->_transitionLayers;
  self->_transitionLayers = v9;

  -[AXGestureRecorderView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  -[AXGestureRecorderView setMultipleTouchEnabled:](self, "setMultipleTouchEnabled:", 1);
  -[AXGestureRecorderView setNeedsDisplay](self, "setNeedsDisplay");
}

- (AXGestureRecorderView)initWithFrame:(CGRect)a3
{
  AXGestureRecorderView *v3;
  AXGestureRecorderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderView;
  v3 = -[AXGestureRecorderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AXGestureRecorderView _commonInit](v3, "_commonInit");
  return v4;
}

- (AXGestureRecorderView)initWithCoder:(id)a3
{
  AXGestureRecorderView *v3;
  AXGestureRecorderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXGestureRecorderView;
  v3 = -[AXGestureRecorderView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AXGestureRecorderView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v9;
  id v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  -[AXGestureRecorderView styleProvider](self, "styleProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gestureRecorderViewBackgroundColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v10, "CGColor"));

  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGContextFillRect(CurrentContext, v11);
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[AXGestureRecorderView deleteAllFingerPaths](self, "deleteAllFingerPaths");
    v5 = objc_msgSend(obj, "numberOfDynamicFingerPathsInGestureRecorderView:", self);
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        -[AXGestureRecorderView insertDynamicFingerPathAtIndex:](self, "insertDynamicFingerPathAtIndex:", i);
    }
  }

}

- (void)setStyleProvider:(id)a3
{
  AXGestureRecorderStyleProvider *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  AXGestureRecorderStyleProvider *v13;

  v5 = (AXGestureRecorderStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_styleProvider, a3);
    v5 = v13;
    if (v13)
    {
      -[AXGestureRecorderStyleProvider fingerLineGradientTopColor](v13, "fingerLineGradientTopColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXGestureRecorderStyleProvider fingerLineGradientBottomColor](v13, "fingerLineGradientBottomColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXGestureRecorderStyleProvider fingerLineGradientTopColorLocation](v13, "fingerLineGradientTopColorLocation");
      v9 = v8;
      -[AXGestureRecorderStyleProvider fingerLineGradientBottomColorLocation](v13, "fingerLineGradientBottomColorLocation");
      LODWORD(v11) = v10;
      LODWORD(v12) = v9;
      -[AXGestureRecorderGradientView configureGradientWithTopColor:bottomColor:topColorLocation:bottomColorLocation:](self, "configureGradientWithTopColor:bottomColor:topColorLocation:bottomColorLocation:", v6, v7, v12, v11);

      v5 = v13;
    }
  }

}

- (UIColor)dynamicFingerPathBackgroundGradientPatternColor
{
  UIColor *dynamicFingerPathBackgroundGradientPatternColor;
  void *v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  CGContext *CurrentContext;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  const __CFArray *v21;
  float v22;
  float v23;
  CGColorSpace *DeviceRGB;
  CGGradient *v25;
  void *v26;
  UIColor *v27;
  UIColor *v28;
  CGFloat locations[3];
  CGSize v31;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;

  locations[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  dynamicFingerPathBackgroundGradientPatternColor = self->_dynamicFingerPathBackgroundGradientPatternColor;
  if (!dynamicFingerPathBackgroundGradientPatternColor)
  {
    -[AXGestureRecorderView styleProvider](self, "styleProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderView bounds](self, "bounds");
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    v10 = CGRectGetWidth(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v11 = CGRectGetHeight(v35);
    if (v4)
    {
      if (v5)
      {
        if (v10 > 0.0)
        {
          v12 = v11;
          if (v11 > 0.0)
          {
            objc_msgSend(v5, "screen");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "scale");
            v15 = v14;

            v31.width = width;
            v31.height = height;
            UIGraphicsBeginImageContextWithOptions(v31, 1, v15);
            CurrentContext = UIGraphicsGetCurrentContext();
            CGContextSaveGState(CurrentContext);
            v17 = objc_alloc(MEMORY[0x1E0C99D20]);
            objc_msgSend(v4, "dynamicFingerLineGradientTopColor");
            v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v19 = objc_msgSend(v18, "CGColor");
            objc_msgSend(v4, "dynamicFingerLineGradientBottomColor");
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v21 = (const __CFArray *)objc_msgSend(v17, "initWithObjects:", v19, objc_msgSend(v20, "CGColor"), 0);

            objc_msgSend(v4, "dynamicFingerLineGradientTopColorLocation");
            locations[0] = v22;
            objc_msgSend(v4, "dynamicFingerLineGradientBottomColorLocation");
            locations[1] = v23;
            DeviceRGB = CGColorSpaceCreateDeviceRGB();
            v25 = CGGradientCreateWithColors(DeviceRGB, v21, locations);
            CGColorSpaceRelease(DeviceRGB);
            v32.x = v10 * 0.5;
            v32.y = 0.0;
            v33.x = v10 * 0.5;
            v33.y = v12;
            CGContextDrawLinearGradient(CurrentContext, v25, v32, v33, 0);
            CGGradientRelease(v25);
            UIGraphicsGetImageFromCurrentImageContext();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (UIColor *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3658]), "initWithPatternImage:", v26);
            v28 = self->_dynamicFingerPathBackgroundGradientPatternColor;
            self->_dynamicFingerPathBackgroundGradientPatternColor = v27;

            CGContextRestoreGState(CurrentContext);
            UIGraphicsEndImageContext();

          }
        }
      }
    }

    dynamicFingerPathBackgroundGradientPatternColor = self->_dynamicFingerPathBackgroundGradientPatternColor;
  }
  return dynamicFingerPathBackgroundGradientPatternColor;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect result;

  -[AXGestureRecorderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  v13 = UIAccessibilityConvertFrameToScreenCoordinates(v12, &self->super.super);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;

  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (id)accessibilityLabel
{
  return AXUILocalizedStringForKey(CFSTR("CustomGestureVoiceOverLabel"));
}

- (id)accessibilityHint
{
  return AXUILocalizedStringForKey(CFSTR("CustomInstructions"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC4658];
}

- (void)_hideControls
{
  id v3;

  -[AXGestureRecorderView dataSource](self, "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gestureRecorderView:setChromeVisible:", self, 0);

}

- (void)_showControls
{
  id v3;

  -[AXGestureRecorderView dataSource](self, "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gestureRecorderView:setChromeVisible:", self, 1);

}

- (id)accessibilityCustomActions
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[AXGestureRecorderView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canToggleChromeForGestureRecorderView:", self);

  if (!v4)
    return 0;
  -[AXGestureRecorderView dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isChromeVisibleForGestureRecorderView:", self);

  if (v6)
  {
    -[AXGestureRecorderView hideControlsAction](self, "hideControlsAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0DC33F0]);
      AXUILocalizedStringForKey(CFSTR("CustomGesturesHideControls"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithName:target:selector:", v9, self, sel__hideControls);

      -[AXGestureRecorderView setHideControlsAction:](self, "setHideControlsAction:", v10);
    }
    -[AXGestureRecorderView hideControlsAction](self, "hideControlsAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v12 = (void **)v20;
  }
  else
  {
    -[AXGestureRecorderView showControlsAction](self, "showControlsAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0DC33F0]);
      AXUILocalizedStringForKey(CFSTR("CustomGesturesShowControls"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithName:target:selector:", v16, self, sel__showControls);

      -[AXGestureRecorderView setShowControlsAction:](self, "setShowControlsAction:", v17);
    }
    -[AXGestureRecorderView showControlsAction](self, "showControlsAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    v12 = &v19;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXGestureRecorderView;
  -[AXGestureRecorderView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AXGestureRecorderView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)fingerPathDidChange:(unint64_t)a3
{
  void *v5;
  NSMutableDictionary *activeLayers;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  -[AXGestureRecorderView _dynamicFingerPathAtIndex:](self, "_dynamicFingerPathAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  activeLayers = self->_activeLayers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeLayers, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AXGestureRecorderView replayMode](self, "replayMode");
    -[AXGestureRecorderView styleProvider](self, "styleProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "finalDynamicFingerColor");
    else
      objc_msgSend(v10, "tracingDynamicFingerColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v12, "CGColor"));

    -[AXGestureRecorderView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v8);

    v14 = self->_activeLayers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v8, v15);

  }
  v16 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "setPath:", objc_msgSend(v16, "CGPath"));

}

- (id)_dynamicFingerPathAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->_freezedDynamicPaths, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_freezedDynamicPaths, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXGestureRecorderView dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "numberOfDynamicFingerPathsInGestureRecorderView:", self) <= a3)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v6, "gestureRecorderView:dynamicFingerPathAtIndex:", self, a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (void)updateInstantReplayAtIndex:(unint64_t)a3 withPartialPath:(id)a4
{
  id v6;
  NSMutableDictionary *instantReplayViews;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v6 = a4;
  instantReplayViews = self->_instantReplayViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](instantReplayViews, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderView styleProvider](self, "styleProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finalDynamicFingerColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setFillColor:", objc_msgSend(v11, "CGColor"));

    -[AXGestureRecorderView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v9);

    v13 = self->_instantReplayViews;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v9, v14);

  }
  v15 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "setPath:", objc_msgSend(v15, "CGPath"));

}

- (void)finishInstantReplayAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *instantReplayViews;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[AXGestureRecorderView previouslyActiveLayersByInstantReplayFingerIndex](self, "previouslyActiveLayersByInstantReplayFingerIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXGestureRecorderView styleProvider](self, "styleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finalDynamicFingerColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v9, "CGColor"));

  v10 = -[NSMutableArray count](self->_staticLayers, "count");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v7, "removeFromSuperlayer");
    -[AXGestureRecorderView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertSublayer:atIndex:", v7, v11);

  }
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderView _performTransitionToStaticFingers:transitionLayers:hasExistingStaticFingers:](self, "_performTransitionToStaticFingers:transitionLayers:hasExistingStaticFingers:", v13, 0, 0);

  -[AXGestureRecorderView previouslyActiveLayersByInstantReplayFingerIndex](self, "previouslyActiveLayersByInstantReplayFingerIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v15);

  instantReplayViews = self->_instantReplayViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](instantReplayViews, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeFromSuperlayer");

  v19 = self->_instantReplayViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v19, "removeObjectForKey:", v20);

}

- (void)clearInstantReplayFingerPaths
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_instantReplayViews, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperlayer");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_instantReplayViews, "removeAllObjects");
}

- (void)_performTransitionToStaticFingers:(id)a3 transitionLayers:(id)a4 hasExistingStaticFingers:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _BOOL4 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v22 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("fillColor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDuration:", 0.53);
        -[AXGestureRecorderView styleProvider](self, "styleProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "finalDynamicFingerColor");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v14, "setFromValue:", objc_msgSend(v16, "CGColor"));

        -[AXGestureRecorderView styleProvider](self, "styleProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "staticFingerColor");
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v14, "setToValue:", objc_msgSend(v18, "CGColor"));

        objc_msgSend(v14, "setValue:forKey:", CFSTR("GrayTransition"), CFSTR("AnimationName"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setValue:forKey:", v19, CFSTR("HasExistingStaticFingers"));

        objc_msgSend(v14, "setDelegate:", self);
        objc_msgSend(v14, "setValue:forKey:", v7, CFSTR("AnimatingLayers"));
        objc_msgSend(v14, "setValue:forKey:", v8, CFSTR("TransitionLayers"));
        -[AXGestureRecorderView styleProvider](self, "styleProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "staticFingerColor");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "setFillColor:", objc_msgSend(v21, "CGColor"));

        objc_msgSend(v13, "addAnimation:forKey:", v14, CFSTR("Change"));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "valueForKey:", CFSTR("AnimatingLayers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("TransitionLayers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("AnimationName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("GrayTransition"));

  if (!v10)
    goto LABEL_28;
  objc_msgSend(v6, "valueForKey:", CFSTR("HasExistingStaticFingers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    v31 = v8;
    v32 = v7;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "removeFromSuperlayer", v31);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v15);
    }
LABEL_19:
    v7 = v32;

    v8 = v31;
    goto LABEL_20;
  }
  if (v4)
  {
    v31 = v8;
    v32 = v7;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          -[AXGestureRecorderView styleProvider](self, "styleProvider", v31);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "staticFingerColor");
          v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v23, "setFillColor:", objc_msgSend(v25, "CGColor"));

          -[NSMutableArray addObject:](self->_staticLayers, "addObject:", v23);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v20);
    }
    goto LABEL_19;
  }
LABEL_20:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v8;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "removeFromSuperlayer", v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v28);
  }

LABEL_28:
}

- (void)freezeAllDynamicFingerPaths
{
  -[AXGestureRecorderView freezeAllDynamicFingerPathsWithInstantReplayOffset:](self, "freezeAllDynamicFingerPathsWithInstantReplayOffset:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)freezeAllDynamicFingerPathsWithInstantReplayOffset:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary copy](self->_activeLayers, "copy");
  -[NSMutableDictionary allValues](self->_activeLayers, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_activeLayers, "removeAllObjects");
  if (-[AXGestureRecorderView replayMode](self, "replayMode"))
  {
    -[AXGestureRecorderView _performTransitionToStaticFingers:transitionLayers:hasExistingStaticFingers:](self, "_performTransitionToStaticFingers:transitionLayers:hasExistingStaticFingers:", v6, 0, 1);
  }
  else if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _AXAssert();
  }
  else
  {
    v19 = v6;
    -[AXGestureRecorderView previouslyActiveLayersByInstantReplayFingerIndex](self, "previouslyActiveLayersByInstantReplayFingerIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXGestureRecorderView setPreviouslyActiveLayersByInstantReplayFingerIndex:](self, "setPreviouslyActiveLayersByInstantReplayFingerIndex:", v8);

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "unsignedIntegerValue") + a3;
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXGestureRecorderView previouslyActiveLayersByInstantReplayFingerIndex](self, "previouslyActiveLayersByInstantReplayFingerIndex");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v6 = v19;
    v5 = v20;
  }

}

- (void)deleteAllFingerPaths
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AXGestureRecorderView setNeedsDisplay](self, "setNeedsDisplay");
  -[AXGestureRecorderView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[AXGestureRecorderView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_6);
  -[NSMutableDictionary removeAllObjects](self->_activeLayers, "removeAllObjects");
  -[AXGestureRecorderView clearInstantReplayFingerPaths](self, "clearInstantReplayFingerPaths");

}

uint64_t __45__AXGestureRecorderView_deleteAllFingerPaths__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

- (void)hideStaticView
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_staticLayers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperlayer", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_staticLayers, "removeAllObjects");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 0;
}

- (AXGestureRecorderViewDelegate)dataSource
{
  return (AXGestureRecorderViewDelegate *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (AXGestureRecorderStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (UIView)dynamicFingerPathsContainerView
{
  return self->_dynamicFingerPathsContainerView;
}

- (void)setDynamicFingerPathsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicFingerPathsContainerView, a3);
}

- (void)setDynamicFingerPathBackgroundGradientPatternColor:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicFingerPathBackgroundGradientPatternColor, a3);
}

- (CGRect)constrainedBoundsForDrawing
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_constrainedBoundsForDrawing.origin.x;
  y = self->_constrainedBoundsForDrawing.origin.y;
  width = self->_constrainedBoundsForDrawing.size.width;
  height = self->_constrainedBoundsForDrawing.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setConstrainedBoundsForDrawing:(CGRect)a3
{
  self->_constrainedBoundsForDrawing = a3;
}

- (BOOL)replayMode
{
  return self->_replayMode;
}

- (void)setReplayMode:(BOOL)a3
{
  self->_replayMode = a3;
}

- (UIAccessibilityCustomAction)hideControlsAction
{
  return self->_hideControlsAction;
}

- (void)setHideControlsAction:(id)a3
{
  objc_storeStrong((id *)&self->_hideControlsAction, a3);
}

- (UIAccessibilityCustomAction)showControlsAction
{
  return self->_showControlsAction;
}

- (void)setShowControlsAction:(id)a3
{
  objc_storeStrong((id *)&self->_showControlsAction, a3);
}

- (NSMutableDictionary)previouslyActiveLayersByInstantReplayFingerIndex
{
  return self->_previouslyActiveLayersByInstantReplayFingerIndex;
}

- (void)setPreviouslyActiveLayersByInstantReplayFingerIndex:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyActiveLayersByInstantReplayFingerIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyActiveLayersByInstantReplayFingerIndex, 0);
  objc_storeStrong((id *)&self->_showControlsAction, 0);
  objc_storeStrong((id *)&self->_hideControlsAction, 0);
  objc_storeStrong((id *)&self->_dynamicFingerPathBackgroundGradientPatternColor, 0);
  objc_storeStrong((id *)&self->_dynamicFingerPathsContainerView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_transitionLayers, 0);
  objc_storeStrong((id *)&self->_staticLayers, 0);
  objc_storeStrong((id *)&self->_instantReplayViews, 0);
  objc_storeStrong((id *)&self->_activeLayers, 0);
  objc_storeStrong((id *)&self->_freezedDynamicPaths, 0);
}

@end
