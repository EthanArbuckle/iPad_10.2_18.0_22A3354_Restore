@implementation CAMZoomControlButtonMaskView

- (CAMZoomControlButtonMaskView)initWithFrame:(CGRect)a3
{
  CAMZoomControlButtonMaskView *v3;
  CAMZoomControlButtonMaskView *v4;
  CAShapeLayer *v5;
  CAShapeLayer *shapeLayer;
  void *v7;
  CAMZoomControlButtonMaskView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMZoomControlButtonMaskView;
  v3 = -[CAMZoomControlButtonMaskView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMZoomControlButtonMaskView setOpaque:](v3, "setOpaque:", 0);
    -[CAMZoomControlButtonMaskView setContentMode:](v4, "setContentMode:", 3);
    v5 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    shapeLayer = v4->__shapeLayer;
    v4->__shapeLayer = v5;

    -[CAMZoomControlButtonMaskView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v4->__shapeLayer);

    v8 = v4;
  }

  return v4;
}

- (void)setMaskOvalFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_maskOvalFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_maskOvalFrame = &self->_maskOvalFrame;
  if (!CGRectEqualToRect(self->_maskOvalFrame, a3))
  {
    p_maskOvalFrame->origin.x = x;
    p_maskOvalFrame->origin.y = y;
    p_maskOvalFrame->size.width = width;
    p_maskOvalFrame->size.height = height;
    -[CAMZoomControlButtonMaskView setNeedsLayout](self, "setNeedsLayout");
  }
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  -[CAMZoomControlButtonMaskView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMZoomControlButtonMaskView maskOvalFrame](self, "maskOvalFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CAMZoomControlButtonMaskView _shapeLayer](self, "_shapeLayer");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v12, v14, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bezierPathByReversingPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v4, v6, v8, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendPath:", v20);
  v22 = objc_retainAutorelease(v21);
  objc_msgSend(v24, "setPath:", objc_msgSend(v22, "CGPath"));
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v24, "setFillColor:", objc_msgSend(v23, "CGColor"));

}

- (CGRect)maskOvalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_maskOvalFrame.origin.x;
  y = self->_maskOvalFrame.origin.y;
  width = self->_maskOvalFrame.size.width;
  height = self->_maskOvalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CAShapeLayer)_shapeLayer
{
  return self->__shapeLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shapeLayer, 0);
}

@end
