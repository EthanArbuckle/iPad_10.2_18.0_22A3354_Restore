@implementation PHVideoCallVideoGroupView

- (PHVideoCallVideoGroupView)initWithFrame:(CGRect)a3
{
  char *v3;
  PHVideoCallVideoGroupView *v4;
  CGPoint v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PHVideoCallVideoGroupView;
  v3 = -[PHVideoCallVideoGroupView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (PHVideoCallVideoGroupView *)v3;
  if (v3)
  {
    v5 = CGPointZero;
    *((CGPoint *)v3 + 1) = CGPointZero;
    *((CGPoint *)v3 + 2) = v5;
    v6 = v3 + 48;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v7, "_referenceBounds");
    *v6 = v8;
    v4->_cornerLocationsRect.origin.y = v9;
    v4->_cornerLocationsRect.size.width = v10;
    v4->_cornerLocationsRect.size.height = v11;

    v4->_corner = CNFGetAppIntegerForKey(CFSTR("lastPIPCorner"), 1);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CNFSetAppIntegerForKey(CFSTR("lastPIPCorner"), self->_corner);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PHVideoCallVideoGroupView;
  -[PHVideoCallVideoGroupView dealloc](&v3, "dealloc");
}

- (CGPoint)transformedCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[PHVideoCallVideoGroupView center](self, "center");
  v4 = v3;
  -[PHVideoCallVideoGroupView transform](self, "transform");
  -[PHVideoCallVideoGroupView center](self, "center");
  v6 = v5;
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v7 = v6 + v9;
  v8 = v4 + v10;
  result.y = v7;
  result.x = v8;
  return result;
}

- (void)setTransformForNewCenter:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[30];

  y = a3.y;
  x = a3.x;
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v6 = v13[24];
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v7 = v13[19];
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v8 = v13[14];
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v9 = v13[9];
  -[PHVideoCallVideoGroupView center](self, "center");
  v11 = x - v10;
  -[PHVideoCallVideoGroupView center](self, "center");
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v8;
  v13[3] = v9;
  *(double *)&v13[4] = v11;
  *(double *)&v13[5] = y - v12;
  -[PHVideoCallVideoGroupView setTransform:](self, "setTransform:", v13);
}

- (void)setCornerLocationsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_cornerLocationsRect;
  CGFloat v9;
  CGFloat v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_cornerLocationsRect = &self->_cornerLocationsRect;
  if (!CGRectEqualToRect(a3, self->_cornerLocationsRect))
  {
    p_cornerLocationsRect->origin.x = x;
    p_cornerLocationsRect->origin.y = y;
    p_cornerLocationsRect->size.width = width;
    p_cornerLocationsRect->size.height = height;
    -[PHVideoCallVideoGroupView centerPointForCurrentVideoGroupCorner](self, "centerPointForCurrentVideoGroupCorner");
    self->_target.x = v9;
    self->_target.y = v10;
  }
}

- (void)setCorner:(int64_t)a3
{
  CGPoint *p_target;
  CGFloat v6;
  CGFloat v7;
  id v8;

  self->_corner = a3;
  p_target = &self->_target;
  -[PHVideoCallVideoGroupView centerPointForCurrentVideoGroupCorner](self, "centerPointForCurrentVideoGroupCorner");
  p_target->x = v6;
  p_target->y = v7;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHVideoCallVideoGroupView delegate](self, "delegate"));
  objc_msgSend(v8, "videoGroupView:didUpdateCorner:", self, a3);

}

- (CGPoint)centerPointForCurrentVideoGroupCorner
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t corner;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;
  CGRect v24;
  CGRect v25;

  -[PHVideoCallVideoGroupView cornerLocationsRect](self, "cornerLocationsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PHVideoCallVideoGroupView frame](self, "frame");
  v12 = v11 * 0.5;
  -[PHVideoCallVideoGroupView frame](self, "frame");
  v14 = v13 * 0.5;
  corner = self->_corner;
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  if (corner == 3)
  {
    v20 = v12 + CGRectGetMinX(*(CGRect *)&v16);
LABEL_7:
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    v21 = CGRectGetMaxY(v24) - v14;
    goto LABEL_10;
  }
  if (corner == 2)
  {
    v20 = CGRectGetMaxX(*(CGRect *)&v16) - v12;
    goto LABEL_7;
  }
  if (corner)
    v20 = CGRectGetMaxX(*(CGRect *)&v16) - v12;
  else
    v20 = v12 + CGRectGetMinX(*(CGRect *)&v16);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v21 = v14 + CGRectGetMinY(v25);
LABEL_10:
  v22 = v20;
  result.y = v21;
  result.x = v22;
  return result;
}

- (void)refreshPositionInCorner
{
  if (!self->_displayLink)
  {
    -[PHVideoCallVideoGroupView centerPointForCurrentVideoGroupCorner](self, "centerPointForCurrentVideoGroupCorner");
    -[PHVideoCallVideoGroupView setCenter:](self, "setCenter:");
  }
}

- (void)addPanningGestureRecognizer
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panGestureRecognizer;

  v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "handlePanDetected:");
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v3;

  -[PHVideoCallVideoGroupView addGestureRecognizer:](self, "addGestureRecognizer:", self->_panGestureRecognizer);
  -[UIPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", self);
}

- (void)handlePanGestureFinished:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  _BOOL8 v22;
  double v23;
  double v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoCallVideoGroupView superview](self, "superview"));
  objc_msgSend(v4, "velocityInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PHVideoCallVideoGroupView center](self, "center");
  v11 = v10;
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v12 = v11 + v24 + v7 * 0.300000012;
  -[PHVideoCallVideoGroupView center](self, "center");
  v14 = v13;
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v15 = v14 + v23 + v9 * 0.300000012;
  self->_velocity.x = v7 / 1000.0;
  self->_velocity.y = v9 / 1000.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v16, "_referenceBounds");
  v18 = v17;
  v20 = v19;

  v21 = 3;
  if (v12 >= v18 * 0.5)
    v21 = 2;
  if (v15 >= v20 * 0.5)
    v22 = v21;
  else
    v22 = v12 >= v18 * 0.5;
  -[PHVideoCallVideoGroupView setCorner:](self, "setCorner:", v22);
  -[PHVideoCallVideoGroupView startThrowAnimation](self, "startThrowAnimation");
}

- (void)handlePanDetected:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[30];
  _QWORD v20[30];

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "state");
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == (char *)1)
    {
      -[PHVideoCallVideoGroupView finishedThrowAnimation](self, "finishedThrowAnimation");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoCallVideoGroupView superview](self, "superview"));
      objc_msgSend(v4, "setTranslation:inView:", v9, CGPointZero.x, CGPointZero.y);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoCallVideoGroupView delegate](self, "delegate"));
      objc_msgSend(v10, "videoGroupViewDidStartDrag:", self);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoCallVideoGroupView superview](self, "superview"));
      objc_msgSend(v4, "translationInView:", v11);
      v13 = v12;
      v15 = v14;

      -[PHVideoCallVideoGroupView transform](self, "transform");
      v16 = v19[24];
      -[PHVideoCallVideoGroupView transform](self, "transform");
      v17 = v19[19];
      -[PHVideoCallVideoGroupView transform](self, "transform");
      v18 = v19[14];
      -[PHVideoCallVideoGroupView transform](self, "transform");
      v19[0] = v16;
      v19[1] = v17;
      v19[2] = v18;
      v19[3] = v19[9];
      v19[4] = v13;
      v19[5] = v15;
      -[PHVideoCallVideoGroupView setTransform:](self, "setTransform:", v19);
    }
  }
  else
  {
    -[PHVideoCallVideoGroupView transformedCenter](self, "transformedCenter");
    -[PHVideoCallVideoGroupView setCenter:](self, "setCenter:");
    -[PHVideoCallVideoGroupView transform](self, "transform");
    v6 = v20[24];
    -[PHVideoCallVideoGroupView transform](self, "transform");
    v7 = v20[19];
    -[PHVideoCallVideoGroupView transform](self, "transform");
    v8 = v20[14];
    -[PHVideoCallVideoGroupView transform](self, "transform");
    v20[0] = v6;
    v20[1] = v7;
    v20[2] = v8;
    v20[3] = v20[9];
    v20[4] = 0;
    v20[5] = 0;
    -[PHVideoCallVideoGroupView setTransform:](self, "setTransform:", v20);
    -[PHVideoCallVideoGroupView handlePanGestureFinished:](self, "handlePanGestureFinished:", v4);
  }

}

- (double)_gridViewRubberBandValueForValue:(double)result target:(double)a4 timeInterval:(double)a5 velocity:(double *)a6
{
  uint64_t v6;
  double v7;

  v6 = (uint64_t)a5;
  v7 = *a6;
  if (v6 >= 1)
  {
    do
    {
      v7 = (v7 + (a4 - result) * 0.000140000004) * 0.980000019;
      result = result + v7;
      --v6;
    }
    while (v6);
  }
  *a6 = v7;
  return result;
}

- (void)startThrowAnimation
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  CADisplayLink *v5;
  CADisplayLink *v6;
  id v7;

  displayLink = self->_displayLink;
  if (displayLink)
    -[CADisplayLink invalidate](displayLink, "invalidate");
  v4 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "updateThrowAnimation:"));
  v5 = self->_displayLink;
  self->_displayLink = v4;

  v6 = self->_displayLink;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  -[CADisplayLink addToRunLoop:forMode:](v6, "addToRunLoop:forMode:", v7, NSRunLoopCommonModes);

}

- (void)updateThrowAnimation:(id)a3
{
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint *p_target;
  void *v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a3;
  if (!self->_startedThrowAnimation)
  {
    objc_msgSend(v18, "timestamp");
    qword_1002DC6E8 = v4;
    self->_startedThrowAnimation = 1;
  }
  v5 = -[PHVideoCallVideoGroupView transformedCenter](self, "transformedCenter");
  v7 = v6;
  v9 = v8;
  p_target = &self->_target;
  if (UIDistanceBetweenPoints(v5) > 1.0
    || fabs(self->_velocity.y) >= 0.00999999978
    || fabs(self->_velocity.x) >= 0.00999999978)
  {
    objc_msgSend(v18, "timestamp");
    v13 = *(_QWORD *)&v12;
    v14 = (v12 - *(double *)&qword_1002DC6E8) * 1000.0;
    -[PHVideoCallVideoGroupView _gridViewRubberBandValueForValue:target:timeInterval:velocity:](self, "_gridViewRubberBandValueForValue:target:timeInterval:velocity:", &self->_velocity, v7, p_target->x, v14);
    v16 = v15;
    -[PHVideoCallVideoGroupView _gridViewRubberBandValueForValue:target:timeInterval:velocity:](self, "_gridViewRubberBandValueForValue:target:timeInterval:velocity:", &self->_velocity.y, v9, self->_target.y, v14);
    -[PHVideoCallVideoGroupView setTransformForNewCenter:](self, "setTransformForNewCenter:", v16, v17);
    v11 = v18;
    qword_1002DC6E8 = v13;
  }
  else
  {
    -[PHVideoCallVideoGroupView setTransformForNewCenter:](self, "setTransformForNewCenter:", p_target->x, self->_target.y);
    -[PHVideoCallVideoGroupView finishedThrowAnimation](self, "finishedThrowAnimation");
    v11 = v18;
  }

}

- (void)finishedThrowAnimation
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[30];

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  self->_startedThrowAnimation = 0;
  -[PHVideoCallVideoGroupView transformedCenter](self, "transformedCenter");
  -[PHVideoCallVideoGroupView setCenter:](self, "setCenter:");
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v5 = v8[24];
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v6 = v8[19];
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v7 = v8[14];
  -[PHVideoCallVideoGroupView transform](self, "transform");
  v8[0] = v5;
  v8[1] = v6;
  v8[2] = v7;
  v8[3] = v8[9];
  v8[4] = 0;
  v8[5] = 0;
  -[PHVideoCallVideoGroupView setTransform:](self, "setTransform:", v8);
  CNFSetAppIntegerForKey(CFSTR("lastPIPCorner"), self->_corner);
}

- (void)cancelThrowAnimation
{
  -[PHVideoCallVideoGroupView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_panGestureRecognizer);
  if (self->_displayLink)
  {
    -[PHVideoCallVideoGroupView setTransformForNewCenter:](self, "setTransformForNewCenter:", self->_target.x, self->_target.y);
    -[PHVideoCallVideoGroupView finishedThrowAnimation](self, "finishedThrowAnimation");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (CGRect)cornerLocationsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cornerLocationsRect.origin.x;
  y = self->_cornerLocationsRect.origin.y;
  width = self->_cornerLocationsRect.size.width;
  height = self->_cornerLocationsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PHVideoCallVideoGroupViewDelegate)delegate
{
  return (PHVideoCallVideoGroupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
