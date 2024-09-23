@implementation CAMSlashView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMSlashView)initWithFrame:(CGRect)a3
{
  CAMSlashView *v3;
  CAMSlashView *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CAMSlashView;
  v3 = -[CAMSlashView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMSlashView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[CAMSlashView _updateShapeLayerProgressAnimated:](v4, "_updateShapeLayerProgressAnimated:", 0);
    -[CAMSlashView _updateShapeLayerLineWidth](v4, "_updateShapeLayerLineWidth");
    -[CAMSlashView _updateShapeLayerColor](v4, "_updateShapeLayerColor");
    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[CAMSlashView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, sel__updateShapeLayerLineWidth);

    v11 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)-[CAMSlashView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v7, sel__updateShapeLayerColor);

  }
  return v4;
}

- (void)_updateShapeLayerColor
{
  uint64_t v3;
  void *v4;
  id v5;

  -[CAMSlashView tintColor](self, "tintColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v5, "CGColor");
  -[CAMSlashView _shapeLayer](self, "_shapeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeColor:", v3);

}

- (void)_updateShapeLayerLineWidth
{
  void *v3;
  uint64_t v4;
  double v5;
  id v6;

  -[CAMSlashView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "legibilityWeight");

  if (v4 == 1)
    v5 = 1.75;
  else
    v5 = 1.0;
  -[CAMSlashView _shapeLayer](self, "_shapeLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineWidth:", v5);

}

- (void)_updateShapeLayerPath
{
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  -[CAMSlashView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MaxX = CGRectGetMaxX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxY = CGRectGetMaxY(v14);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moveToPoint:", x, y);
  objc_msgSend(v9, "addLineToPoint:", MaxX, MaxY);
  v12 = objc_retainAutorelease(v9);
  v10 = objc_msgSend(v12, "CGPath");
  -[CAMSlashView _shapeLayer](self, "_shapeLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPath:", v10);

}

- (void)setVisible:(BOOL)a3
{
  -[CAMSlashView setVisible:animated:](self, "setVisible:animated:", a3, 0);
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    -[CAMSlashView _updateShapeLayerProgressAnimated:](self, "_updateShapeLayerProgressAnimated:", a4);
  }
}

- (void)_updateShapeLayerProgressAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a3;
  -[CAMSlashView _shapeLayer](self, "_shapeLayer");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMSlashView isVisible](self, "isVisible");
  v8 = 1.0;
  if (v5)
    v9 = 1.0;
  else
    v9 = 0.0;
  if (v3)
  {
    LODWORD(v6) = 1041865114;
    LODWORD(v7) = 1.0;
    LODWORD(v8) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", COERCE_DOUBLE(1045220557), v8, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentationLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = v11;
    else
      v12 = v18;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "strokeEnd");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFromValue:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setToValue:", v17);

    objc_msgSend(v14, "setTimingFunction:", v10);
    objc_msgSend(v14, "setDuration:", 0.4);
    objc_msgSend(v18, "addAnimation:forKey:", v14, CFSTR("slashProgress"));

  }
  objc_msgSend(v18, "setStrokeEnd:", v9);

}

- (BOOL)isVisible
{
  return self->_visible;
}

@end
