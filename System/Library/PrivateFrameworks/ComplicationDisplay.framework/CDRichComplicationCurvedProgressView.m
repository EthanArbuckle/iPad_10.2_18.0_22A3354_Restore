@implementation CDRichComplicationCurvedProgressView

- (CDRichComplicationCurvedProgressView)initWithFamily:(int64_t)a3 curveWidth:(double)a4 padding:(double)a5 beginAngle:(double)a6 endAngle:(double)a7 forDevice:(id)a8 withFilterStyle:(int64_t)a9 progressFillStyle:(int64_t)a10
{
  id v18;
  id v19;
  void (**v20)(void *, uint64_t);
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  CDRichComplicationCurvedProgressView *v25;
  objc_super v27;
  _QWORD aBlock[4];
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int64_t v34;

  v18 = a8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __138__CDRichComplicationCurvedProgressView_initWithFamily_curveWidth_padding_beginAngle_endAngle_forDevice_withFilterStyle_progressFillStyle___block_invoke;
  aBlock[3] = &unk_24CF21498;
  v30 = a4;
  v31 = a5;
  v32 = a6;
  v33 = a7;
  v19 = v18;
  v29 = v19;
  v34 = a9;
  v20 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ((unint64_t)a10 <= 7 && ((0xFDu >> a10) & 1) != 0)
    v21 = objc_opt_class();
  else
    v21 = 0;
  self->_progressFillStyle = a10;
  v20[2](v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)CDRichComplicationCurvedProgressView;
  v24 = -[CDRichComplicationProgressView initForFamily:device:backgroundShapeView:foregroundShapeView:](&v27, sel_initForFamily_device_backgroundShapeView_foregroundShapeView_, a3, v19, v22, v23);
  v25 = (CDRichComplicationCurvedProgressView *)v24;
  if (v24)
  {
    objc_storeStrong(v24 + 68, v22);
    objc_storeStrong((id *)&v25->_foregroundView, v23);
  }

  return v25;
}

id __138__CDRichComplicationCurvedProgressView_initWithFamily_curveWidth_padding_beginAngle_endAngle_forDevice_withFilterStyle_progressFillStyle___block_invoke(uint64_t a1, Class a2)
{
  return (id)objc_msgSend([a2 alloc], "initWithCurveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setBeginAngle:(double)a3
{
  self->_beginAngle = a3;
  -[CDRichComplicationCurveView setBeginAngle:](self->_backgroundView, "setBeginAngle:");
  -[CDRichComplicationCurveView setBeginAngle:](self->_foregroundView, "setBeginAngle:", a3);
  -[CDRichComplicationCurvedProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setEndAngle:(double)a3
{
  self->_endAngle = a3;
  -[CDRichComplicationCurveView setEndAngle:](self->_backgroundView, "setEndAngle:");
  -[CDRichComplicationCurveView setEndAngle:](self->_foregroundView, "setEndAngle:", a3);
  -[CDRichComplicationCurvedProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setClockwise:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_clockwise = a3;
  -[CDRichComplicationCurveView setClockwise:](self->_backgroundView, "setClockwise:");
  -[CDRichComplicationCurveView setClockwise:](self->_foregroundView, "setClockwise:", v3);
  -[CDRichComplicationCurvedProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setProgress:(double)a3
{
  objc_super v5;

  if (CDRichComplicationProgressFillStyleIsMetered(self->_progressFillStyle))
    -[CDRichComplicationShapeView setProgress:](self->_backgroundView, "setProgress:", 1.0);
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCurvedProgressView;
  -[CDRichComplicationProgressView setProgress:](&v5, sel_setProgress_, a3);
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (CDRichComplicationProgressFillStyleIsMetered(self->_progressFillStyle) && objc_msgSend(v4, "count"))
  {
    CDGenerateMeterBackgroundGradientColors(objc_msgSend(v4, "count"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CDRichComplicationCurvedProgressView;
    -[CDRichComplicationProgressView overrideBackgroundGradientColorsForGradientColors:](&v8, sel_overrideBackgroundGradientColorsForGradientColors_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (CDRichComplicationProgressFillStyleIsMetered(self->_progressFillStyle) && objc_msgSend(v6, "count"))
  {
    CDGenerateMeterBackgroundGradientColors(objc_msgSend(v6, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CDRichComplicationCurvedProgressView;
    -[CDRichComplicationProgressView overrideBackgroundGradientColorsForGradientColors:locations:](&v11, sel_overrideBackgroundGradientColorsForGradientColors_locations_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CDRichComplicationProgressView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)beginAngle
{
  return self->_beginAngle;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
