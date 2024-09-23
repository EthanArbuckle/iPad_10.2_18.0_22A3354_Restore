@implementation HUIStepSlider

- (HUIStepSlider)initWithFrame:(CGRect)a3
{
  HUIStepSlider *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUIStepSlider;
  v3 = -[HUIStepSlider initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIStepSlider setTickColor:](v3, "setTickColor:", v4);

    -[HUIStepSlider setRestrictsValuesToTicks:](v3, "setRestrictsValuesToTicks:", 1);
    -[HUIStepSlider setSupportsVibrancy:](v3, "setSupportsVibrancy:", 0);
    -[HUIStepSlider setDrawsEndTicks:](v3, "setDrawsEndTicks:", 1);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v3, sel_sliderTapped_);
    -[HUIStepSlider addGestureRecognizer:](v3, "addGestureRecognizer:", v5);

  }
  return v3;
}

- (void)sliderTapped:(id)a3
{
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  double v16;
  float v17;
  double v18;
  CGRect v19;
  CGRect v20;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  -[HUIStepSlider bounds](self, "bounds");
  -[HUIStepSlider trackRectForBounds:](self, "trackRectForBounds:");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  v10 = v5 - CGRectGetMinX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v11 = v10 / CGRectGetWidth(v20);
  if (v11 > 1.0)
    v11 = 1.0;
  v12 = fmax(v11, 0.0);
  -[HUIStepSlider maximumValue](self, "maximumValue");
  v14 = v13;
  -[HUIStepSlider minimumValue](self, "minimumValue");
  v16 = (float)(v14 - v15);
  -[HUIStepSlider minimumValue](self, "minimumValue");
  v18 = v17 + v12 * v16;
  *(float *)&v18 = v18;
  -[HUIStepSlider setValue:animated:](self, "setValue:animated:", 1, v18);
  -[HUIStepSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (unint64_t)numberOfTicks
{
  unint64_t segmentCount;
  float v5;
  float v6;
  float v7;

  segmentCount = self->_segmentCount;
  if (segmentCount)
  {
    return (unint64_t)(float)(segmentCount + 1);
  }
  else
  {
    -[HUIStepSlider maximumValue](self, "maximumValue");
    v6 = v5;
    -[HUIStepSlider minimumValue](self, "minimumValue");
    return (unint64_t)(float)((float)(v6 - v7) + 1.0);
  }
}

- (float)offsetBetweenTicksForNumberOfTicks:(unint64_t)a3
{
  float v5;
  float v6;
  float v7;

  -[HUIStepSlider maximumValue](self, "maximumValue");
  v6 = v5;
  -[HUIStepSlider minimumValue](self, "minimumValue");
  return (float)(v6 - v7) / (float)(a3 - 1);
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  objc_super v14;

  v4 = a4;
  if (-[HUIStepSlider restrictsValuesToTicks](self, "restrictsValuesToTicks"))
  {
    if (self->_segmentCount >= 2)
    {
      -[HUIStepSlider maximumValue](self, "maximumValue");
      if (v7 != a3)
      {
        -[HUIStepSlider offsetBetweenTicksForNumberOfTicks:](self, "offsetBetweenTicksForNumberOfTicks:", -[HUIStepSlider numberOfTicks](self, "numberOfTicks"));
        v9 = v8;
        -[HUIStepSlider minimumValue](self, "minimumValue");
        v11 = roundf((float)(a3 - v10) / v9);
        -[HUIStepSlider minimumValue](self, "minimumValue");
        a3 = v12 + (float)(v9 * (float)(int)v11);
      }
    }
  }
  -[HUIStepSlider value](self, "value");
  if (a3 != *(float *)&v13)
  {
    v14.receiver = self;
    v14.super_class = (Class)HUIStepSlider;
    *(float *)&v13 = a3;
    -[HUIStepSlider setValue:animated:](&v14, sel_setValue_animated_, v4, v13);
  }
}

- (void)setRestrictsValuesToTicks:(BOOL)a3
{
  id v4;

  if (self->_restrictsValuesToTicks != a3)
  {
    self->_restrictsValuesToTicks = a3;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[HUIStepSlider setMinimumTrackTintColor:](self, "setMinimumTrackTintColor:", v4);
      -[HUIStepSlider setMaximumTrackTintColor:](self, "setMaximumTrackTintColor:", v4);

    }
  }
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *i;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[10];
  int v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)HUIStepSlider;
  -[HUIStepSlider layoutSubviews](&v30, sel_layoutSubviews);
  -[HUIStepSlider bounds](self, "bounds");
  -[HUIStepSlider trackRectForBounds:](self, "trackRectForBounds:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[HUIStepSlider numberOfTicks](self, "numberOfTicks");
  -[HUIStepSlider offsetBetweenTicksForNumberOfTicks:](self, "offsetBetweenTicksForNumberOfTicks:", v11);
  v13 = v12;
  -[HUIStepSlider bounds](self, "bounds");
  v15 = v14 * 0.5;
  -[HUIStepSlider ticks](self, "ticks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 != v11)
  {
    -[HUIStepSlider ticks](self, "ticks");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", &__block_literal_global);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    for (i = (void *)objc_claimAutoreleasedReturnValue(); v11; --v11)
    {
      v20 = objc_alloc_init(MEMORY[0x24BDE5758]);
      -[HUIStepSlider tickColor](self, "tickColor");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v20, "setFillColor:", objc_msgSend(v21, "CGColor"));

      -[HUIStepSlider layer](self, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "insertSublayer:atIndex:", v20, 0);

      objc_msgSend(i, "addObject:", v20);
    }
    -[HUIStepSlider setTicks:](self, "setTicks:", i);

  }
  -[HUIStepSlider ticks](self, "ticks");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __31__HUIStepSlider_layoutSubviews__block_invoke_2;
  v28[3] = &unk_24DD60ED0;
  v28[4] = self;
  v29 = v13;
  v28[5] = v4;
  v28[6] = v6;
  v28[7] = v8;
  v28[8] = v10;
  *(double *)&v28[9] = v15;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v28);

  -[HUIStepSlider ticks](self, "ticks");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", -[HUIStepSlider drawsEndTicks](self, "drawsEndTicks") ^ 1);

  -[HUIStepSlider ticks](self, "ticks");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", -[HUIStepSlider drawsEndTicks](self, "drawsEndTicks") ^ 1);

  if (-[HUIStepSlider supportsVibrancy](self, "supportsVibrancy"))
    -[HUIStepSlider _setOverrideVibrancyTrait:](self, "_setOverrideVibrancyTrait:", 1);
}

uint64_t __31__HUIStepSlider_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperlayer");
}

void __31__HUIStepSlider_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "minimumValue");
  v8 = v7 + (float)((float)a3 * *(float *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "minimumValue");
  v10 = v8 - v9;
  objc_msgSend(*(id *)(a1 + 32), "maximumValue");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "minimumValue");
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", AXHARoundToPixel(*(double *)(a1 + 40) + (float)(v10 / (float)(v12 - v13)) * *(double *)(a1 + 56) + -0.5), *(double *)(a1 + 72) + -7.0, 2.0, 15.0, 10.0);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setPath:", objc_msgSend(v14, "CGPath"));

}

- (void)accessibilityIncrement
{
  unint64_t segmentCount;
  double v4;
  float v5;
  double v6;
  objc_super v7;

  if (self->_restrictsValuesToTicks && (segmentCount = self->_segmentCount, segmentCount >= 2))
  {
    v4 = (double)segmentCount;
    -[HUIStepSlider value](self, "value");
    v6 = (double)((int)(v4 * v5) + 1) / v4;
    *(float *)&v6 = v6;
    -[HUIStepSlider setValue:animated:](self, "setValue:animated:", 1, v6);
    -[HUIStepSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUIStepSlider;
    -[HUIStepSlider accessibilityIncrement](&v7, sel_accessibilityIncrement);
  }
}

- (void)accessibilityDecrement
{
  unint64_t segmentCount;
  double v4;
  float v5;
  double v6;
  objc_super v7;

  if (self->_restrictsValuesToTicks && (segmentCount = self->_segmentCount, segmentCount >= 2))
  {
    v4 = (double)segmentCount;
    -[HUIStepSlider value](self, "value");
    v6 = (double)((int)(v4 * v5) - 1) / v4;
    *(float *)&v6 = v6;
    -[HUIStepSlider setValue:animated:](self, "setValue:animated:", 1, v6);
    -[HUIStepSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUIStepSlider;
    -[HUIStepSlider accessibilityDecrement](&v7, sel_accessibilityDecrement);
  }
}

- (unint64_t)segmentCount
{
  return self->_segmentCount;
}

- (void)setSegmentCount:(unint64_t)a3
{
  self->_segmentCount = a3;
}

- (BOOL)restrictsValuesToTicks
{
  return self->_restrictsValuesToTicks;
}

- (BOOL)supportsVibrancy
{
  return self->_supportsVibrancy;
}

- (void)setSupportsVibrancy:(BOOL)a3
{
  self->_supportsVibrancy = a3;
}

- (BOOL)drawsEndTicks
{
  return self->_drawsEndTicks;
}

- (void)setDrawsEndTicks:(BOOL)a3
{
  self->_drawsEndTicks = a3;
}

- (UIColor)tickColor
{
  return self->_tickColor;
}

- (void)setTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_tickColor, a3);
}

- (NSMutableArray)ticks
{
  return self->_ticks;
}

- (void)setTicks:(id)a3
{
  objc_storeStrong((id *)&self->_ticks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticks, 0);
  objc_storeStrong((id *)&self->_tickColor, 0);
}

@end
