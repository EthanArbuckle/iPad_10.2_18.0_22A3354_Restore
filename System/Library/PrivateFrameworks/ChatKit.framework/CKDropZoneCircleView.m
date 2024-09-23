@implementation CKDropZoneCircleView

- (CKDropZoneCircleView)initWithFrame:(CGRect)a3
{
  CKDropZoneCircleView *v3;
  CAShapeLayer *v4;
  CAShapeLayer *dropZoneShapeLayer;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDropZoneCircleView;
  v3 = -[CKDropZoneCircleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    dropZoneShapeLayer = v3->_dropZoneShapeLayer;
    v3->_dropZoneShapeLayer = v4;

    -[CAShapeLayer setFillColor:](v3->_dropZoneShapeLayer, "setFillColor:", 0);
    -[CAShapeLayer setLineWidth:](v3->_dropZoneShapeLayer, "setLineWidth:", 1.5);
    -[CAShapeLayer setLineCap:](v3->_dropZoneShapeLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
    -[CKDropZoneCircleView _updateShapeLayerStrokeColor](v3, "_updateShapeLayerStrokeColor");
    -[CAShapeLayer setLineDashPattern:](v3->_dropZoneShapeLayer, "setLineDashPattern:", &unk_1E2870090);
    -[CKDropZoneCircleView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v3->_dropZoneShapeLayer);

    -[CKDropZoneCircleView startAnimating](v3, "startAnimating");
    -[CKDropZoneCircleView setNeedsLayout](v3, "setNeedsLayout");
  }
  return v3;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[3];
  CGRect v16;
  CGRect v17;

  v15[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)CKDropZoneCircleView;
  -[CKDropZoneCircleView layoutSubviews](&v14, sel_layoutSubviews);
  -[CKDropZoneCircleView bounds](self, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v7 = CGRectGetHeight(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v8 = CGRectGetWidth(v17);
  if (v7 < v8)
    v8 = v7;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v8 * 0.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setFrame:](self->_dropZoneShapeLayer, "setFrame:", x, y, width, height);
  v10 = objc_retainAutorelease(v9);
  -[CAShapeLayer setPath:](self->_dropZoneShapeLayer, "setPath:", objc_msgSend(v10, "CGPath"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width * 3.14159265 / 30.6 * 0.8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setLineDashPattern:](self->_dropZoneShapeLayer, "setLineDashPattern:", v13);

}

- (id)spinAnimation
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByValue:", &unk_1E2871A10);
  objc_msgSend(v2, "setDuration:", 20.0);
  LODWORD(v3) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v3);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  return v2;
}

- (void)stopAnimating
{
  if (self->_isAnimating)
  {
    self->_isAnimating = 0;
    -[CAShapeLayer removeAnimationForKey:](self->_dropZoneShapeLayer, "removeAnimationForKey:", CFSTR("CKSpinAnimation"));
  }
}

- (void)startAnimating
{
  CAShapeLayer *dropZoneShapeLayer;
  id v3;

  if (!self->_isAnimating)
  {
    self->_isAnimating = 1;
    dropZoneShapeLayer = self->_dropZoneShapeLayer;
    -[CKDropZoneCircleView spinAnimation](self, "spinAnimation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer addAnimation:forKey:](dropZoneShapeLayer, "addAnimation:forKey:", v3, CFSTR("CKSpinAnimation"));

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDropZoneCircleView;
  -[CKDropZoneCircleView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKDropZoneCircleView _updateShapeLayerStrokeColor](self, "_updateShapeLayerStrokeColor");
}

- (void)_updateShapeLayerStrokeColor
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[CKDropZoneCircleView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.22);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.31372549, 0.333333333, 0.360784314, 0.14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_retainAutorelease(v5);
  v6 = objc_msgSend(v8, "CGColor");
  -[CKDropZoneCircleView dropZoneShapeLayer](self, "dropZoneShapeLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStrokeColor:", v6);

}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CAShapeLayer)dropZoneShapeLayer
{
  return self->_dropZoneShapeLayer;
}

- (void)setDropZoneShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dropZoneShapeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropZoneShapeLayer, 0);
}

@end
