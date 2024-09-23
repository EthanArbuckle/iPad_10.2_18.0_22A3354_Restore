@implementation SSSCropOverlayGrabberView

- (SSSCropOverlayGrabberView)initWithEdge:(unint64_t)a3
{
  SSSCropOverlayGrabberView *v3;
  UIView *v4;
  UIView *hitTestView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSSCropOverlayGrabberView;
  v3 = -[SSSCropOverlayLineView initWithEdge:](&v7, "initWithEdge:", a3);
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  hitTestView = v3->_hitTestView;
  v3->_hitTestView = v4;

  -[UIView setHidden:](v3->_hitTestView, "setHidden:", 1);
  -[SSSCropOverlayGrabberView addSubview:](v3, "addSubview:", v3->_hitTestView);
  return v3;
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
  double v19;

  -[SSSCropOverlayGrabberView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  if (SSMinimumTouchableDimension >= v3)
    v11 = SSMinimumTouchableDimension;
  else
    v11 = v3;
  if (SSMinimumTouchableDimension >= v4)
    v12 = SSMinimumTouchableDimension;
  else
    v12 = v4;
  v13 = SSCropHandleOutsideTouchableDimension;
  v19 = SSCropHandleInsideTouchableDimension;
  v14 = SSCropHandleOutsideTouchableDimension + SSCropHandleInsideTouchableDimension;
  if ((id)-[SSSCropOverlayLineView edge](self, "edge") == (id)1
    || (id)-[SSSCropOverlayLineView edge](self, "edge") == (id)4)
  {
    v15 = UIRectCenteredXInRect(v6, v8, v11, v14, v6, v8, v9, v10);
LABEL_13:
    v6 = v15;
    v8 = v16;
    v11 = v17;
    v12 = v18;
    goto LABEL_14;
  }
  if ((id)-[SSSCropOverlayLineView edge](self, "edge") == (id)2
    || (id)-[SSSCropOverlayLineView edge](self, "edge") == (id)8)
  {
    v15 = UIRectCenteredYInRect(v6, v8, v14, v12, v6, v8, v9, v10);
    goto LABEL_13;
  }
LABEL_14:
  if ((id)-[SSSCropOverlayLineView edge](self, "edge") == (id)1)
  {
    v8 = -v13;
  }
  else if ((id)-[SSSCropOverlayLineView edge](self, "edge") == (id)4)
  {
    v8 = -v19;
  }
  else if ((id)-[SSSCropOverlayLineView edge](self, "edge") == (id)2)
  {
    v6 = -v13;
  }
  else if ((id)-[SSSCropOverlayLineView edge](self, "edge") == (id)8)
  {
    v6 = -v19;
  }
  -[UIView setFrame:](self->_hitTestView, "setFrame:", v6, v8, v11, v12);
}

+ (double)preferredDimension
{
  double result;

  +[SSChromeHelper cropsCornerWidth](SSChromeHelper, "cropsCornerWidth");
  return result;
}

+ (double)preferredOtherDimension
{
  double result;

  +[SSChromeHelper cropsCornerLength](SSChromeHelper, "cropsCornerLength");
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  SSSCropOverlayGrabberView *v6;
  id v7;
  unsigned __int8 v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v10.receiver = self;
  v10.super_class = (Class)SSSCropOverlayGrabberView;
  v7 = a4;
  v8 = -[SSSCropOverlayGrabberView pointInside:withEvent:](&v10, "pointInside:withEvent:", v7, x, y);
  -[UIView convertPoint:fromView:](v6->_hitTestView, "convertPoint:fromView:", v6, x, y, v10.receiver, v10.super_class);
  LOBYTE(v6) = -[UIView pointInside:withEvent:](v6->_hitTestView, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestView, 0);
}

@end
