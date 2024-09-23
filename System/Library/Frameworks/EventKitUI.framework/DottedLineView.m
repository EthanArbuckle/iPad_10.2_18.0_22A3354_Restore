@implementation DottedLineView

- (DottedLineView)init
{
  DottedLineView *v2;
  CAShapeLayer *v3;
  CAShapeLayer *shapeLayer;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DottedLineView;
  v2 = -[DottedLineView init](&v8, sel_init);
  if (v2)
  {
    v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    shapeLayer = v2->_shapeLayer;
    v2->_shapeLayer = v3;

    -[DottedLineView layer](v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", v2->_shapeLayer);

    -[DottedLineView layer](v2, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 1);

  }
  return v2;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)DottedLineView;
  -[DottedLineView layoutSubviews](&v5, sel_layoutSubviews);
  -[DottedLineView bounds](self, "bounds");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[DottedLineView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

  -[DottedLineView _updateShapeLayer](self, "_updateShapeLayer");
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  -[DottedLineView _updateShapeLayer](self, "_updateShapeLayer");
}

- (void)_updateShapeLayer
{
  double Width;
  CGFloat MidX;
  void *v5;
  void *v6;
  void *v7;
  CGPath *Mutable;
  CGPoint points;
  CGFloat v10;
  CGFloat MinY;
  _QWORD v12[3];
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v12[2] = *MEMORY[0x1E0C80C00];
  if (self->_color)
  {
    -[DottedLineView bounds](self, "bounds");
    Width = CGRectGetWidth(v13);
    -[DottedLineView bounds](self, "bounds");
    MidX = CGRectGetMidX(v14);
    -[DottedLineView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:");

    -[CAShapeLayer setStrokeColor:](self->_shapeLayer, "setStrokeColor:", -[UIColor CGColor](self->_color, "CGColor"));
    -[CAShapeLayer setLineWidth:](self->_shapeLayer, "setLineWidth:", Width);
    v12[0] = &unk_1E606F0A8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Width + Width);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setLineDashPattern:](self->_shapeLayer, "setLineDashPattern:", v7);

    -[CAShapeLayer setLineCap:](self->_shapeLayer, "setLineCap:", *MEMORY[0x1E0CD3010]);
    -[CAShapeLayer setLineDashPhase:](self->_shapeLayer, "setLineDashPhase:", Width * -0.5);
    Mutable = CGPathCreateMutable();
    -[CAShapeLayer bounds](self->_shapeLayer, "bounds");
    points.x = MidX;
    points.y = CGRectGetMaxY(v15);
    -[CAShapeLayer bounds](self->_shapeLayer, "bounds");
    v10 = MidX;
    MinY = CGRectGetMinY(v16);
    CGPathAddLines(Mutable, 0, &points, 2uLL);
    -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end
