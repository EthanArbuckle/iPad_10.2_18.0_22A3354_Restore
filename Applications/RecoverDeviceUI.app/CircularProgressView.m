@implementation CircularProgressView

- (CircularProgressView)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CircularProgressView *v5;
  CircularProgressView *v6;
  uint64_t v7;
  CATextLayer *backgroundPercentageLayer;
  uint64_t v9;
  CAShapeLayer *backgroundStrokeLayer;
  uint64_t v11;
  CAShapeLayer *animatedStrokeLayer;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v20;

  height = a3.height;
  width = a3.width;
  v20.receiver = self;
  v20.super_class = (Class)CircularProgressView;
  v5 = -[CircularProgressView initWithFrame:](&v20, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  v6 = v5;
  if (v5)
  {
    v5->_size.width = width;
    v5->_size.height = height;
    v7 = objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
    backgroundPercentageLayer = v6->_backgroundPercentageLayer;
    v6->_backgroundPercentageLayer = (CATextLayer *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    backgroundStrokeLayer = v6->_backgroundStrokeLayer;
    v6->_backgroundStrokeLayer = (CAShapeLayer *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    animatedStrokeLayer = v6->_animatedStrokeLayer;
    v6->_animatedStrokeLayer = (CAShapeLayer *)v11;

    -[CATextLayer setString:](v6->_backgroundPercentageLayer, "setString:", &stru_10001C720);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor")));
    -[CATextLayer setForegroundColor:](v6->_backgroundPercentageLayer, "setForegroundColor:", objc_msgSend(v13, "CGColor"));

    -[CATextLayer setAlignmentMode:](v6->_backgroundPercentageLayer, "setAlignmentMode:", kCAAlignmentCenter);
    -[CATextLayer setFontSize:](v6->_backgroundPercentageLayer, "setFontSize:", 31.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v14, "scale");
    -[CATextLayer setContentsScale:](v6->_backgroundPercentageLayer, "setContentsScale:");

    -[CAShapeLayer setFillColor:](v6->_backgroundStrokeLayer, "setFillColor:", 0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 0.5)));
    -[CAShapeLayer setStrokeColor:](v6->_backgroundStrokeLayer, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

    -[CAShapeLayer setStrokeStart:](v6->_backgroundStrokeLayer, "setStrokeStart:", 0.0);
    -[CAShapeLayer setStrokeEnd:](v6->_backgroundStrokeLayer, "setStrokeEnd:", 1.0);
    -[CAShapeLayer setLineWidth:](v6->_backgroundStrokeLayer, "setLineWidth:", 5.0);
    -[CAShapeLayer setFillColor:](v6->_animatedStrokeLayer, "setFillColor:", 0);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor")));
    -[CAShapeLayer setStrokeColor:](v6->_animatedStrokeLayer, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

    -[CAShapeLayer setStrokeStart:](v6->_animatedStrokeLayer, "setStrokeStart:", 0.0);
    -[CAShapeLayer setStrokeEnd:](v6->_animatedStrokeLayer, "setStrokeEnd:", 0.0);
    -[CAShapeLayer setLineWidth:](v6->_animatedStrokeLayer, "setLineWidth:", 5.0);
    -[CAShapeLayer setLineCap:](v6->_animatedStrokeLayer, "setLineCap:", kCALineCapRound);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView layer](v6, "layer"));
    objc_msgSend(v17, "addSublayer:", v6->_backgroundStrokeLayer);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView layer](v6, "layer"));
    objc_msgSend(v18, "addSublayer:", v6->_animatedStrokeLayer);

  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v36;
  double v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  objc_super v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44.receiver = self;
  v44.super_class = (Class)CircularProgressView;
  -[CircularProgressView layoutSubviews](&v44, "layoutSubviews");
  -[CircularProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView backgroundPercentageLayer](self, "backgroundPercentageLayer"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CircularProgressView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView backgroundStrokeLayer](self, "backgroundStrokeLayer"));
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[CircularProgressView bounds](self, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView animatedStrokeLayer](self, "animatedStrokeLayer"));
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[CircularProgressView bounds](self, "bounds");
  x = v45.origin.x;
  y = v45.origin.y;
  width = v45.size.width;
  height = v45.size.height;
  MidX = CGRectGetMidX(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MidY = CGRectGetMidY(v46);
  -[CircularProgressView bounds](self, "bounds");
  v36 = CGRectGetWidth(v47);
  -[CircularProgressView bounds](self, "bounds");
  v37 = CGRectGetHeight(v48);
  if (v36 < v37)
    v37 = v36;
  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v37 * 0.5, -1.57079633, 4.71238898)));
  v39 = objc_msgSend(v38, "CGPath");
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView backgroundStrokeLayer](self, "backgroundStrokeLayer"));
  objc_msgSend(v40, "setPath:", v39);

  v41 = objc_retainAutorelease(v38);
  v42 = objc_msgSend(v41, "CGPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView animatedStrokeLayer](self, "animatedStrokeLayer"));
  objc_msgSend(v43, "setPath:", v42);

}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double v4;
  double progress;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a3 < 0.0)
    a3 = 0.0;
  v4 = fmin(a3, 1.0);
  if (v4 != self->_progress)
  {
    self->_progress = v4;
    progress = v4;
    if (a4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView animatedStrokeLayer](self, "animatedStrokeLayer"));
      objc_msgSend(v8, "strokeEnd");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v7, "setFromValue:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_progress));
      objc_msgSend(v7, "setToValue:", v10);

      objc_msgSend(v7, "setDuration:", 2.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView animatedStrokeLayer](self, "animatedStrokeLayer"));
      objc_msgSend(v11, "addAnimation:forKey:", v7, CFSTR("strokeEnd"));

      progress = self->_progress;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView animatedStrokeLayer](self, "animatedStrokeLayer"));
    objc_msgSend(v12, "setStrokeEnd:", progress);

    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%d"), (int)(v4 * 100.0)));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CircularProgressView backgroundPercentageLayer](self, "backgroundPercentageLayer"));
    objc_msgSend(v13, "setString:", v14);

  }
}

- (void)setProgress:(double)a3
{
  -[CircularProgressView setProgress:animated:](self, "setProgress:animated:", 0, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)progress
{
  return self->_progress;
}

- (CATextLayer)backgroundPercentageLayer
{
  return self->_backgroundPercentageLayer;
}

- (void)setBackgroundPercentageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPercentageLayer, a3);
}

- (CAShapeLayer)backgroundStrokeLayer
{
  return self->_backgroundStrokeLayer;
}

- (void)setBackgroundStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundStrokeLayer, a3);
}

- (CAShapeLayer)animatedStrokeLayer
{
  return self->_animatedStrokeLayer;
}

- (void)setAnimatedStrokeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_animatedStrokeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStrokeLayer, 0);
  objc_storeStrong((id *)&self->_backgroundStrokeLayer, 0);
  objc_storeStrong((id *)&self->_backgroundPercentageLayer, 0);
}

@end
