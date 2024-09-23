@implementation HUCircularProgressView

- (HUCircularProgressView)initWithRadius:(double)a3
{
  HUCircularProgressView *v4;
  HUCircularProgressView *v5;
  uint64_t v6;
  UIColor *baseLayerStrokeLineColor;
  uint64_t v8;
  UIColor *progressLayerStrokeLineColor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUCircularProgressView;
  v4 = -[HUCircularProgressView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  v5 = v4;
  if (v4)
  {
    v4->_radius = a3;
    v4->_lineCapStyle = 0;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
    v6 = objc_claimAutoreleasedReturnValue();
    baseLayerStrokeLineColor = v5->_baseLayerStrokeLineColor;
    v5->_baseLayerStrokeLineColor = (UIColor *)v6;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
    v8 = objc_claimAutoreleasedReturnValue();
    progressLayerStrokeLineColor = v5->_progressLayerStrokeLineColor;
    v5->_progressLayerStrokeLineColor = (UIColor *)v8;

    v5->_progressBarFillDirection = 0;
    v5->_removeProgressBarOnCompletion = 1;
  }
  return v5;
}

- (HUCircularProgressView)initWithRadius:(double)a3 startAngle:(double)a4 endAngle:(double)a5 progress:(double)a6
{
  HUCircularProgressView *result;

  result = -[HUCircularProgressView initWithRadius:](self, "initWithRadius:", a3);
  if (result)
  {
    result->_startAngle = a4 + -1.57079633;
    result->_endAngle = a5 + -1.57079633;
    result->_fromValue = a6;
  }
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  -[HUCircularProgressView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  v5 = (void *)objc_opt_new();
  -[HUCircularProgressView setBaseLayer:](self, "setBaseLayer:", v5);

  -[HUCircularProgressView bounds](self, "bounds");
  v7 = v6 * 0.5;
  -[HUCircularProgressView bounds](self, "bounds");
  v9 = v8 * 0.5;
  v10 = (void *)MEMORY[0x1E0CEA390];
  -[HUCircularProgressView radius](self, "radius");
  v12 = v11;
  -[HUCircularProgressView startAngle](self, "startAngle");
  v14 = v13;
  -[HUCircularProgressView endAngle](self, "endAngle");
  objc_msgSend(v10, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", -[HUCircularProgressView progressFillCounterClockwise](self, "progressFillCounterClockwise") ^ 1, v7, v9, v12, v14, v15);
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend(v49, "CGPath");
  -[HUCircularProgressView baseLayer](self, "baseLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPath:", v16);

  -[HUCircularProgressView baseLayerStrokeLineColor](self, "baseLayerStrokeLineColor");
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend(v18, "CGColor");
  -[HUCircularProgressView baseLayer](self, "baseLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStrokeColor:", v19);

  -[HUCircularProgressView baseLayerStrokeLineWidth](self, "baseLayerStrokeLineWidth");
  v22 = v21;
  -[HUCircularProgressView baseLayer](self, "baseLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLineWidth:", v22);

  -[HUCircularProgressView _lineCapStyle](self, "_lineCapStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCircularProgressView baseLayer](self, "baseLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLineCap:", v24);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "CGColor");
  -[HUCircularProgressView baseLayer](self, "baseLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFillColor:", v27);

  -[HUCircularProgressView layer](self, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCircularProgressView baseLayer](self, "baseLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSublayer:", v30);

  -[HUCircularProgressView progressLayerStrokeLineWidth](self, "progressLayerStrokeLineWidth");
  if (v31 > 0.0)
  {
    v32 = (void *)objc_opt_new();
    -[HUCircularProgressView setProgressShapeLayer:](self, "setProgressShapeLayer:", v32);

    v33 = objc_msgSend(objc_retainAutorelease(v49), "CGPath");
    -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPath:", v33);

    -[HUCircularProgressView progressLayerStrokeLineColor](self, "progressLayerStrokeLineColor");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = objc_msgSend(v35, "CGColor");
    -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setStrokeColor:", v36);

    -[HUCircularProgressView progressLayerStrokeLineWidth](self, "progressLayerStrokeLineWidth");
    v39 = v38;
    -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLineWidth:", v39);

    -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setStrokeEnd:", 0.0);

    -[HUCircularProgressView _lineCapStyle](self, "_lineCapStyle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setLineCap:", v42);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = objc_msgSend(v44, "CGColor");
    -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFillColor:", v45);

    -[HUCircularProgressView layer](self, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSublayer:", v48);

  }
}

- (void)setBaseLayerStrokeLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_baseLayerStrokeLineColor, a3);
  -[HUCircularProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setProgressLayerStrokeLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayerStrokeLineColor, a3);
  -[HUCircularProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
  -[HUCircularProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateProgressBy:(double)a3 animationDuration:(float)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HUCircularProgressView fromValue](self, "fromValue");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFromValue:", v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HUCircularProgressView fromValue](self, "fromValue");
  objc_msgSend(v9, "numberWithDouble:", v10 + a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setToValue:", v11);

  objc_msgSend(v19, "setDuration:", a4);
  objc_msgSend(v19, "setRemovedOnCompletion:", 0);
  -[HUCircularProgressView _progressBarFillDirection](self, "_progressBarFillDirection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFillMode:", v12);

  objc_msgSend(v19, "toValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  if (v15 >= 1.0)
  {
    objc_msgSend(v19, "setRemovedOnCompletion:", -[HUCircularProgressView removeProgressBarOnCompletion](self, "removeProgressBarOnCompletion"));
    -[HUCircularProgressView setFromValue:](self, "setFromValue:", 0.0);
    objc_msgSend(v19, "setDuration:", 0.0);
  }
  else
  {
    objc_msgSend(v19, "toValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    -[HUCircularProgressView setFromValue:](self, "setFromValue:", v17);

  }
  -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v19, CFSTR("progressStrokeKey"));

}

- (void)updateProgressTo:(double)a3 animationDuration:(float)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HUCircularProgressView fromValue](self, "fromValue");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setToValue:", v9);

  objc_msgSend(v17, "setDuration:", a4);
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  -[HUCircularProgressView _progressBarFillDirection](self, "_progressBarFillDirection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFillMode:", v10);

  objc_msgSend(v17, "toValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  if (v13 >= 1.0)
  {
    objc_msgSend(v17, "setRemovedOnCompletion:", -[HUCircularProgressView removeProgressBarOnCompletion](self, "removeProgressBarOnCompletion"));
    -[HUCircularProgressView setFromValue:](self, "setFromValue:", 0.0);
    objc_msgSend(v17, "setDuration:", 0.0);
  }
  else
  {
    objc_msgSend(v17, "toValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    -[HUCircularProgressView setFromValue:](self, "setFromValue:", v15);

  }
  -[HUCircularProgressView progressShapeLayer](self, "progressShapeLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("progressStrokeKey"));

}

- (id)_lineCapStyle
{
  unint64_t v2;
  id *v3;
  id *v4;

  v2 = -[HUCircularProgressView lineCapStyle](self, "lineCapStyle");
  v3 = (id *)MEMORY[0x1E0CD3008];
  v4 = (id *)MEMORY[0x1E0CD3010];
  if (v2 != 1)
    v4 = (id *)MEMORY[0x1E0CD3018];
  if (v2 != 2)
    v3 = v4;
  return *v3;
}

- (id)_progressBarFillDirection
{
  unint64_t v2;
  id *v3;

  v2 = -[HUCircularProgressView progressBarFillDirection](self, "progressBarFillDirection");
  v3 = (id *)MEMORY[0x1E0CD2B50];
  if (v2 != 1)
    v3 = (id *)MEMORY[0x1E0CD2B60];
  return *v3;
}

- (BOOL)progressFillCounterClockwise
{
  return self->_progressFillCounterClockwise;
}

- (void)setProgressFillCounterClockwise:(BOOL)a3
{
  self->_progressFillCounterClockwise = a3;
}

- (double)baseLayerStrokeLineWidth
{
  return self->_baseLayerStrokeLineWidth;
}

- (void)setBaseLayerStrokeLineWidth:(double)a3
{
  self->_baseLayerStrokeLineWidth = a3;
}

- (UIColor)baseLayerStrokeLineColor
{
  return self->_baseLayerStrokeLineColor;
}

- (double)progressLayerStrokeLineWidth
{
  return self->_progressLayerStrokeLineWidth;
}

- (void)setProgressLayerStrokeLineWidth:(double)a3
{
  self->_progressLayerStrokeLineWidth = a3;
}

- (UIColor)progressLayerStrokeLineColor
{
  return self->_progressLayerStrokeLineColor;
}

- (unint64_t)lineCapStyle
{
  return self->_lineCapStyle;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->_lineCapStyle = a3;
}

- (unint64_t)progressBarFillDirection
{
  return self->_progressBarFillDirection;
}

- (void)setProgressBarFillDirection:(unint64_t)a3
{
  self->_progressBarFillDirection = a3;
}

- (BOOL)removeProgressBarOnCompletion
{
  return self->_removeProgressBarOnCompletion;
}

- (void)setRemoveProgressBarOnCompletion:(BOOL)a3
{
  self->_removeProgressBarOnCompletion = a3;
}

- (double)avatarDiameter
{
  return self->_avatarDiameter;
}

- (void)setAvatarDiameter:(double)a3
{
  self->_avatarDiameter = a3;
}

- (double)radius
{
  return self->_radius;
}

- (double)startAngle
{
  return self->_startAngle;
}

- (void)setStartAngle:(double)a3
{
  self->_startAngle = a3;
}

- (double)endAngle
{
  return self->_endAngle;
}

- (void)setEndAngle:(double)a3
{
  self->_endAngle = a3;
}

- (CAShapeLayer)progressShapeLayer
{
  return self->_progressShapeLayer;
}

- (void)setProgressShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressShapeLayer, a3);
}

- (CAShapeLayer)baseLayer
{
  return self->_baseLayer;
}

- (void)setBaseLayer:(id)a3
{
  objc_storeStrong((id *)&self->_baseLayer, a3);
}

- (double)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(double)a3
{
  self->_fromValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLayer, 0);
  objc_storeStrong((id *)&self->_progressShapeLayer, 0);
  objc_storeStrong((id *)&self->_progressLayerStrokeLineColor, 0);
  objc_storeStrong((id *)&self->_baseLayerStrokeLineColor, 0);
}

@end
