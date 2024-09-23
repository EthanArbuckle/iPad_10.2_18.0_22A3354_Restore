@implementation NTKBezierPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NTKPromise *v10;
  NTKPromise *pointModel;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_path, a3);
  -[NTKBezierPathView _shapeLayer](self, "_shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "setPath:", objc_msgSend(v7, "CGPath"));

  -[NTKBezierPathView _shapeLayer](self, "_shapeLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineWidth");
  objc_msgSend(v8, "setLineWidth:");

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__NTKBezierPathView_setPath___block_invoke;
  v12[3] = &unk_1E6BD3F80;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  +[NTKPromise promiseNamed:withBlock:](NTKPromise, "promiseNamed:withBlock:", CFSTR("BezierPathView Point Model"), v12);
  v10 = (NTKPromise *)objc_claimAutoreleasedReturnValue();
  pointModel = self->_pointModel;
  self->_pointModel = v10;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

NTKBezierPathPointModel *__29__NTKBezierPathView_setPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NTKBezierPathPointModel *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v3 = -[NTKBezierPathPointModel initWithPath:]([NTKBezierPathPointModel alloc], "initWithPath:", *(_QWORD *)(a1 + 32));
  else
    v3 = 0;

  return v3;
}

- (void)setPathColor:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  objc_storeStrong((id *)&self->_pathColor, a3);
  v5 = a3;
  -[NTKBezierPathView _shapeLayer](self, "_shapeLayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "setFillColor:", objc_msgSend(v8, "CGColor"));

}

- (void)setLineCap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTKBezierPathView _shapeLayer](self, "_shapeLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineCap:", v4);

}

- (NSString)lineCap
{
  void *v2;
  void *v3;

  -[NTKBezierPathView _shapeLayer](self, "_shapeLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineCap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)animateToPath:(id)a3 duration:(double)a4 curve:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NTKPromise *v14;
  NTKPromise *pointModel;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v8 = a3;
  -[NTKBezierPathView _shapeLayer](self, "_shapeLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAnimationForKey:", CFSTR("animation"));
  objc_msgSend(v9, "setShouldRasterize:", 0);
  objc_storeStrong((id *)&self->_animateToPath, a3);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setDuration:", a4);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimingFunction:", v11);

  objc_msgSend(v10, "setFromValue:", -[UIBezierPath CGPath](self->_path, "CGPath"));
  v12 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "setToValue:", objc_msgSend(v12, "CGPath"));
  objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("animation"));
  objc_storeStrong((id *)&self->_path, v12);
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__NTKBezierPathView_animateToPath_duration_curve___block_invoke;
  v16[3] = &unk_1E6BD3F80;
  objc_copyWeak(&v18, &location);
  v13 = v12;
  v17 = v13;
  +[NTKPromise promiseNamed:withBlock:](NTKPromise, "promiseNamed:withBlock:", CFSTR("BezierPathView Point Model"), v16);
  v14 = (NTKPromise *)objc_claimAutoreleasedReturnValue();
  pointModel = self->_pointModel;
  self->_pointModel = v14;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

NTKBezierPathPointModel *__50__NTKBezierPathView_animateToPath_duration_curve___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NTKBezierPathPointModel *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v3 = -[NTKBezierPathPointModel initWithPath:]([NTKBezierPathPointModel alloc], "initWithPath:", *(_QWORD *)(a1 + 32));
  else
    v3 = 0;

  return v3;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  UIBezierPath *animateToPath;
  id v9;

  v4 = a4;
  -[NTKBezierPathView _shapeLayer](self, "_shapeLayer", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAnimationForKey:", CFSTR("animation"));
  objc_msgSend(v9, "setPath:", -[UIBezierPath CGPath](self->_animateToPath, "CGPath"));
  objc_msgSend(v9, "setShouldRasterize:", 1);
  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "screenScale");
  objc_msgSend(v9, "setRasterizationScale:");
  if (v4)
  {
    animateToPath = self->_animateToPath;
    self->_animateToPath = 0;

  }
}

- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[NTKPromise object](self->_pointModel, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointOnPathForHorizontalPercentage:", a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (NTKBezierPathPointModel)pointModel
{
  return (NTKBezierPathPointModel *)-[NTKPromise object](self->_pointModel, "object");
}

- (UIBezierPath)path
{
  return self->_path;
}

- (UIColor)pathColor
{
  return self->_pathColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathColor, 0);
  objc_storeStrong((id *)&self->_pointModel, 0);
  objc_storeStrong((id *)&self->_animateToPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
