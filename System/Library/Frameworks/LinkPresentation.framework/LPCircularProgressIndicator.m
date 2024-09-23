@implementation LPCircularProgressIndicator

- (LPCircularProgressIndicator)initWithHost:(id)a3 style:(id)a4
{
  id v6;
  LPCircularProgressIndicator *v7;
  LPCircularProgressIndicator *v8;
  CAShapeLayer *v9;
  CAShapeLayer *borderLayer;
  id v11;
  id v12;
  CAShapeLayer *v13;
  CAShapeLayer *progressLayer;
  id v15;
  id v16;
  void *v17;
  void *v18;
  LPCircularProgressIndicator *v19;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)LPCircularProgressIndicator;
  v7 = -[LPCircularProgressIndicator init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_style, a4);
    v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    borderLayer = v8->_borderLayer;
    v8->_borderLayer = v9;

    -[CAShapeLayer setName:](v8->_borderLayer, "setName:", CFSTR("borderLayer"));
    objc_msgSend(v6, "borderWidth");
    -[CAShapeLayer setLineWidth:](v8->_borderLayer, "setLineWidth:");
    objc_msgSend(v6, "borderColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v8->_borderLayer, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v8->_borderLayer, "setFillColor:", objc_msgSend(v12, "CGColor"));

    v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    progressLayer = v8->_progressLayer;
    v8->_progressLayer = v13;

    -[CAShapeLayer setName:](v8->_progressLayer, "setName:", CFSTR("progressLayer"));
    objc_msgSend(v6, "fillColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v8->_progressLayer, "setFillColor:", objc_msgSend(v15, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v8->_progressLayer, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

    -[LPCircularProgressIndicator layer](v8, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v8->_progressLayer);

    -[LPCircularProgressIndicator layer](v8, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v8->_borderLayer);

    v19 = v8;
  }

  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LPCircularProgressIndicator;
  -[LPCircularProgressIndicator layoutSubviews](&v3, sel_layoutSubviews);
  -[LPCircularProgressIndicator bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_borderLayer, "setFrame:");
  -[LPCircularProgressIndicator bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_progressLayer, "setFrame:");
  -[LPCircularProgressIndicator updatePaths](self, "updatePaths");
}

- (void)updatePaths
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double MidX;
  double MidY;
  void *v9;
  id v10;
  id v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v3 = (void *)MEMORY[0x1E0DC3508];
  -[LPCircularProgressIndicator bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", objc_msgSend(v11, "CGPath"));
  -[LPCircularProgressIndicator bounds](self, "bounds");
  Width = CGRectGetWidth(v12);
  -[LPCircularProgressIndicatorStyle borderWidth](self->_style, "borderWidth");
  v6 = v5;
  -[LPCircularProgressIndicator bounds](self, "bounds");
  MidX = CGRectGetMidX(v13);
  -[LPCircularProgressIndicator bounds](self, "bounds");
  MidY = CGRectGetMidY(v14);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moveToPoint:", MidX, MidY);
  objc_msgSend(v9, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, (Width - v6) * 0.5, -1.57079633, (self->_progress * 360.0 + -90.0) * 3.14159265 / 180.0);
  objc_msgSend(v9, "addLineToPoint:", MidX, MidY);
  v10 = objc_retainAutorelease(v9);
  -[CAShapeLayer setPath:](self->_progressLayer, "setPath:", objc_msgSend(v10, "CGPath"));

}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
