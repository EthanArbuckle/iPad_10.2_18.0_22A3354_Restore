@implementation CDRichComplicationShapeView

- (id)initForDevice:(id)a3 withFilterStyle:(int64_t)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CDRichComplicationShapeView *v12;
  CDRichComplicationShapeView *v13;
  CAGradientLayer *v14;
  CAGradientLayer *gradientLayer;
  void *v16;
  CALayer *v17;
  CALayer *freezeLayer;
  uint64_t v19;
  UIView *filterView;
  void *v21;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CDRichComplicationShapeView;
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v12 = -[CDRichComplicationShapeView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x24BDBF090], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    v13->_progress = 1.0;
    v14 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x24BDE56B8]);
    gradientLayer = v13->_gradientLayer;
    v13->_gradientLayer = v14;

    -[CDRichComplicationShapeView _setupGradientLayer:](v13, "_setupGradientLayer:", v13->_gradientLayer);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BF8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setCompositingFilter:](v13->_gradientLayer, "setCompositingFilter:", v16);

    v17 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    freezeLayer = v13->_freezeLayer;
    v13->_freezeLayer = v17;

    -[CALayer setShouldRasterize:](v13->_freezeLayer, "setShouldRasterize:", 1);
    -[CLKDevice screenScale](v13->_device, "screenScale");
    -[CALayer setRasterizationScale:](v13->_freezeLayer, "setRasterizationScale:");
    -[CALayer addSublayer:](v13->_freezeLayer, "addSublayer:", v13->_gradientLayer);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v8, v9, v10, v11);
    filterView = v13->_filterView;
    v13->_filterView = (UIView *)v19;

    -[UIView layer](v13->_filterView, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", v13->_freezeLayer);

    -[CDRichComplicationShapeView addSubview:](v13, "addSubview:", v13->_filterView);
    v13->_filterStyle = a4;
  }

  return v13;
}

- (void)setProgress:(double)a3
{
  double v3;

  v3 = fmin(a3, 1.0);
  if (v3 < 0.0)
    v3 = 0.0;
  if (v3 != self->_progress)
  {
    self->_progress = v3;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[CDRichComplicationShapeView unfreezeForTransaction](self, "unfreezeForTransaction");
    -[CAShapeLayer setStrokeEnd:](self->_shapeLayer, "setStrokeEnd:", self->_progress);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CAShapeLayer *v11;
  CAShapeLayer *shapeLayer;
  id v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)CDRichComplicationShapeView;
  -[CDRichComplicationShapeView layoutSubviews](&v14, sel_layoutSubviews);
  -[CDRichComplicationShapeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  if (!CGRectEqualToRect(self->_previousBounds, v15))
  {
    -[CDRichComplicationShapeView unfreezeForTransaction](self, "unfreezeForTransaction");
    self->_previousBounds.origin.x = v4;
    self->_previousBounds.origin.y = v6;
    self->_previousBounds.size.width = v8;
    self->_previousBounds.size.height = v10;
    -[CAShapeLayer removeFromSuperlayer](self->_shapeLayer, "removeFromSuperlayer");
    v11 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    shapeLayer = self->_shapeLayer;
    self->_shapeLayer = v11;

    -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:", v4, v6, v8, v10);
    -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", -[CDRichComplicationShapeView _generatePath](self, "_generatePath"));
    -[CDRichComplicationShapeView _shapeLineWidth](self, "_shapeLineWidth");
    -[CAShapeLayer setLineWidth:](self->_shapeLayer, "setLineWidth:");
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](self->_shapeLayer, "setFillColor:", objc_msgSend(v13, "CGColor"));

    -[CAShapeLayer setStrokeStart:](self->_shapeLayer, "setStrokeStart:", 0.0);
    -[CAShapeLayer setStrokeEnd:](self->_shapeLayer, "setStrokeEnd:", self->_progress);
    -[CAShapeLayer setLineCap:](self->_shapeLayer, "setLineCap:", *MEMORY[0x24BDE5CE8]);
    -[CALayer insertSublayer:below:](self->_freezeLayer, "insertSublayer:below:", self->_shapeLayer, self->_gradientLayer);
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v4, v6, v8, v10);
    -[CDRichComplicationShapeView _updateGradient](self, "_updateGradient");
    -[CDRichComplicationShapeView _setupShapeLayer:](self, "_setupShapeLayer:", self->_shapeLayer);
  }
}

- (void)unfreezeForTransaction
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];

  if (!self->_willUnfreezeForTransaction)
  {
    self->_willUnfreezeForTransaction = 1;
    v3 = MEMORY[0x24BDAC760];
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke;
    v5[3] = &unk_24CF21410;
    v5[4] = self;
    objc_msgSend(MEMORY[0x24BDE57D8], "addCommitHandler:forPhase:", v5, 1);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke_2;
    v4[3] = &unk_24CF21410;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BDE57D8], "addCommitHandler:forPhase:", v4, 2);
  }
}

uint64_t __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 456) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrozen:", 0);
}

uint64_t __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrozen:", 1);
}

- (void)setGradientColors:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(int)v5 / (double)(unint64_t)objc_msgSend(v7, "count"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

        ++v5;
      }
      while (objc_msgSend(v7, "count") > v5);
    }
    -[CDRichComplicationShapeView setGradientColors:locations:](self, "setGradientColors:locations:", v7, v4);

  }
}

- (void)setGradientColors:(id)a3 locations:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  id v9;
  id *v10;
  uint64_t v11;
  NSArray *gradientLocations;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v7 = (uint64_t)a3;
  v8 = (unint64_t)a4;
  objc_storeStrong((id *)&self->_gradientColors, a3);
  if (self->_monochromeFraction == 1.0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v10 = (id *)v25;
  }
  else
  {
    if ((unint64_t)objc_msgSend((id)v7, "count") < 2)
      goto LABEL_5;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = (id)v7;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v9, "firstObject", (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v17) = objc_msgSend(v17, "isEqual:", v18);

          if (!(_DWORD)v17)
          {
            v11 = (uint64_t)v9;
            goto LABEL_4;
          }
        }
        v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v14)
          continue;
        break;
      }
    }

    objc_msgSend(v9, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    v10 = &v23;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1, (_QWORD)v19);
  v11 = objc_claimAutoreleasedReturnValue();

LABEL_4:
  v7 = v11;
LABEL_5:
  if (v7 | (uint64_t)self->_filteredGradientColors && !objc_msgSend((id)v7, "isEqualToArray:")
    || (gradientLocations = self->_gradientLocations, v8 | (unint64_t)gradientLocations)
    && !-[NSArray isEqualToArray:](gradientLocations, "isEqualToArray:", v8))
  {
    objc_storeStrong((id *)&self->_filteredGradientColors, (id)v7);
    objc_storeStrong((id *)&self->_gradientLocations, a4);
    -[CDRichComplicationShapeView _updateGradient](self, "_updateGradient");
  }

}

- (void)_updatePath
{
  CGPath *v3;

  v3 = -[CDRichComplicationShapeView _generatePath](self, "_generatePath");
  if ((unint64_t)-[CAShapeLayer path](self->_shapeLayer, "path") | (unint64_t)v3)
  {
    if (!CGPathEqualToPath(-[CAShapeLayer path](self->_shapeLayer, "path"), v3))
    {
      -[CDRichComplicationShapeView unfreezeForTransaction](self, "unfreezeForTransaction");
      -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", -[CDRichComplicationShapeView _generatePath](self, "_generatePath"));
    }
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CDRichComplicationShapeView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIView layer](self->_filterView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v7);

  }
  self->_monochromeFraction = a3;
  -[CDRichComplicationShapeView setGradientColors:locations:](self, "setGradientColors:locations:", self->_gradientColors, self->_gradientLocations);

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  -[CDRichComplicationShapeView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView layer](self->_filterView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
  {
    objc_msgSend(v4, "setFilters:", v7);
    v6 = 1.0;
  }
  else
  {
    objc_msgSend(v4, "setFilters:", 0);
    v6 = 0.0;
  }

  self->_monochromeFraction = v6;
  -[CDRichComplicationShapeView setGradientColors:locations:](self, "setGradientColors:locations:", self->_gradientColors, self->_gradientLocations);

}

- (void)_updateGradient
{
  id v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  CAGradientLayer *gradientLayer;
  void *v16;
  void *v17;
  CAGradientLayer *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[CDRichComplicationShapeView unfreezeForTransaction](self, "unfreezeForTransaction");
  if (-[NSArray count](self->_filteredGradientColors, "count") == 1)
  {
    -[CDRichComplicationShapeView _shapeStrokeColor](self, "_shapeStrokeColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_shapeLayer, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

    -[CAGradientLayer setHidden:](self->_gradientLayer, "setHidden:", 1);
    -[CAGradientLayer setCompositingFilter:](self->_gradientLayer, "setCompositingFilter:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationShapeView _normalizeGradientLocations:](self, "_normalizeGradientLocations:", self->_gradientLocations);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = self->_filteredGradientColors;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i));
          objc_msgSend(v4, "addObject:", objc_msgSend(v11, "CGColor", (_QWORD)v21));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    -[CDRichComplicationShapeView _shapeStrokeColor](self, "_shapeStrokeColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_shapeLayer, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    -[CAGradientLayer setHidden:](self->_gradientLayer, "setHidden:", 0);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BF8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setCompositingFilter:](self->_gradientLayer, "setCompositingFilter:", v13);

    v14 = -[CDRichComplicationShapeView _shouldReverseGradient](self, "_shouldReverseGradient");
    gradientLayer = self->_gradientLayer;
    if (v14)
    {
      objc_msgSend(v4, "reverseObjectEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setColors:](gradientLayer, "setColors:", v17);

      v18 = self->_gradientLayer;
      objc_msgSend(v5, "reverseObjectEnumerator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setLocations:](v18, "setLocations:", v20);

    }
    else
    {
      -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", v4);
      -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", v5);
    }

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit", (_QWORD)v21);
}

- (id)_shapeStrokeColor
{
  if (-[NSArray count](self->_filteredGradientColors, "count") == 1)
    -[NSArray objectAtIndexedSubscript:](self->_filteredGradientColors, "objectAtIndexedSubscript:", 0);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)device
{
  return self->_device;
}

- (id)gradientLayer
{
  return self->_gradientLayer;
}

- (id)shapeLayer
{
  return self->_shapeLayer;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (double)progress
{
  return self->_progress;
}

- (int64_t)filterStyle
{
  return self->_filterStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_gradientLocations, 0);
  objc_storeStrong((id *)&self->_filteredGradientColors, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_freezeLayer, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_setupGradientLayer:(id)a3
{
  OUTLINED_FUNCTION_1();
  NSRequestConcreteImplementation();
}

- (double)_shapeLineWidth
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0.0;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  double v3;
  double v4;
  CGPoint result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (CGPath)_generatePath
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (BOOL)_shouldReverseGradient
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

@end
