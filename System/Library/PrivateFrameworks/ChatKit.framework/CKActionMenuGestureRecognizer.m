@implementation CKActionMenuGestureRecognizer

+ (id)actionMenuGestureRecognizer
{
  CKActionMenuGestureRecognizer *v2;
  void *v3;
  CKActionMenuGestureRecognizer *v4;

  v2 = [CKActionMenuGestureRecognizer alloc];
  +[CKActionMenuWindow sharedInstance](CKActionMenuWindow, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKActionMenuGestureRecognizer initWithTarget:action:](v2, "initWithTarget:action:", v3, sel_actionMenuGestureRecognized_);

  -[CKActionMenuGestureRecognizer setMinimumPressDuration:](v4, "setMinimumPressDuration:", 0.255);
  return v4;
}

- (CKActionMenuGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  CKActionMenuGestureRecognizer *v4;
  CKActionMenuGestureRecognizer *v5;
  CKActionMenuGestureVelocitySample *v6;
  CKActionMenuGestureVelocitySample *velocitySample;
  CKActionMenuGestureVelocitySample *v8;
  CKActionMenuGestureVelocitySample *previousVelocitySample;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKActionMenuGestureRecognizer;
  v4 = -[CKActionMenuGestureRecognizer initWithTarget:action:](&v12, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v11.receiver = v4;
    v11.super_class = (Class)CKActionMenuGestureRecognizer;
    -[CKActionMenuGestureRecognizer setAllowableMovement:](&v11, sel_setAllowableMovement_, 1.79769313e308);
    v6 = objc_alloc_init(CKActionMenuGestureVelocitySample);
    velocitySample = v5->_velocitySample;
    v5->_velocitySample = v6;

    v8 = objc_alloc_init(CKActionMenuGestureVelocitySample);
    previousVelocitySample = v5->_previousVelocitySample;
    v5->_previousVelocitySample = v8;

  }
  return v5;
}

- (void)reset
{
  CGPoint v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKActionMenuGestureRecognizer;
  -[CKActionMenuGestureRecognizer reset](&v4, sel_reset);
  v3 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_velocitySample->start = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_velocitySample->end = v3;
  self->_velocitySample->dt = 0.0;
  self->_previousVelocitySample->start = v3;
  self->_previousVelocitySample->end = v3;
  self->_previousVelocitySample->dt = 0.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKActionMenuGestureRecognizer;
  v6 = a4;
  v7 = a3;
  -[CKActionMenuGestureRecognizer touchesBegan:withEvent:](&v16, sel_touchesBegan_withEvent_, v7, v6);
  objc_msgSend(v6, "timestamp", v16.receiver, v16.super_class);
  v9 = v8;

  objc_msgSend(v7, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationInView:", 0);
  objc_msgSend(v11, "convertPoint:toWindow:", 0);
  v13 = v12;
  v15 = v14;

  self->_lastScreenLocation.x = v13;
  self->_lastScreenLocation.y = v15;
  self->_lastTouchTime = v9;

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CKActionMenuGestureVelocitySample *velocitySample;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKActionMenuGestureRecognizer;
  v6 = a4;
  v7 = a3;
  -[CKActionMenuGestureRecognizer touchesMoved:withEvent:](&v18, sel_touchesMoved_withEvent_, v7, v6);
  objc_msgSend(v6, "timestamp", v18.receiver, v18.super_class);
  v9 = v8;

  objc_msgSend(v7, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationInView:", 0);
  objc_msgSend(v11, "convertPoint:toWindow:", 0);
  v13 = v12;
  v15 = v14;

  v16 = v9 - self->_lastTouchTime;
  if (v16 > 0.008)
  {
    self->_previousVelocitySample->start = self->_velocitySample->start;
    self->_previousVelocitySample->end = self->_velocitySample->end;
    self->_previousVelocitySample->dt = self->_velocitySample->dt;
    self->_velocitySample->start = self->_lastScreenLocation;
    velocitySample = self->_velocitySample;
    velocitySample->end.x = v13;
    velocitySample->end.y = v15;
    self->_velocitySample->dt = v16;
  }
  self->_lastScreenLocation.x = v13;
  self->_lastScreenLocation.y = v15;
  self->_lastTouchTime = v9;

}

- (CGPoint)velocityInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  -[CKActionMenuGestureRecognizer _convertVelocitySample:fromScreenCoordinatesToView:](self, "_convertVelocitySample:fromScreenCoordinatesToView:", self->_velocitySample, v4);
  v6 = v5;
  v8 = v7;
  if (self->_previousVelocitySample->dt > 0.00000011920929)
  {
    -[CKActionMenuGestureRecognizer _convertVelocitySample:fromScreenCoordinatesToView:](self, "_convertVelocitySample:fromScreenCoordinatesToView:");
    v6 = v9 * 0.75 + v6 * 0.25;
    v8 = v10 * 0.75 + v8 * 0.25;
  }

  v11 = v6;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)_convertVelocitySample:(id)a3 fromScreenCoordinatesToView:(id)a4
{
  double *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  v6 = (double *)a3;
  v7 = a4;
  v8 = v7;
  if (v6[5] >= 0.001)
  {
    if (v7)
    {
      v11 = v7;
    }
    else
    {
      -[CKActionMenuGestureRecognizer view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "window");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CEA950], "convertPoint:toView:", v11, v6[1], v6[2]);
    v14 = v13;
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0CEA950], "convertPoint:toView:", v11, v6[3], v6[4]);
    v18 = v6[5];
    v9 = (v17 - v14) / v18;
    v10 = (v19 - v16) / v18;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v20 = v9;
  v21 = v10;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
}

@end
