@implementation NTKRichComplicationRingProgressView

- (NTKRichComplicationRingProgressView)initWithFamily:(int64_t)a3 curveWidth:(double)a4 padding:(double)a5 forDevice:(id)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NTKRichComplicationRingProgressView *v14;
  objc_super v16;

  v10 = a6;
  if (NTKShowGossamerUI(v10))
    v11 = 2;
  else
    v11 = 0;
  v12 = (void *)objc_msgSend(objc_alloc((Class)off_1E6BCA1B8), "initWithCurveWidth:padding:forDevice:withFilterStyle:", v10, v11, a4, a5);
  v13 = (void *)objc_msgSend(objc_alloc((Class)off_1E6BCA1B8), "initWithCurveWidth:padding:forDevice:withFilterStyle:", v10, v11, a4, a5);
  v16.receiver = self;
  v16.super_class = (Class)NTKRichComplicationRingProgressView;
  v14 = -[CDRichComplicationProgressView initForFamily:device:backgroundShapeView:foregroundShapeView:](&v16, sel_initForFamily_device_backgroundShapeView_foregroundShapeView_, a3, v10, v12, v13);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_backgroundView, v12);
    objc_storeStrong((id *)&v14->_foregroundView, v13);
  }

  return v14;
}

- (void)setClockwise:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_clockwise = a3;
  -[CDRichComplicationRingView setClockwise:](self->_backgroundView, "setClockwise:");
  -[CDRichComplicationRingView setClockwise:](self->_foregroundView, "setClockwise:", v3);
  -[NTKRichComplicationRingProgressView setNeedsLayout](self, "setNeedsLayout");
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
