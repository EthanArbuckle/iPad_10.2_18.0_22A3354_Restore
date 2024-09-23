@implementation CAMSlashMaskView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMSlashMaskView)initWithFrame:(CGRect)a3
{
  CAMSlashMaskView *v3;
  CAMSlashMaskView *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMSlashMaskView;
  v3 = -[CAMSlashMaskView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMSlashMaskView _shapeLayer](v3, "_shapeLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setFillRule:", *MEMORY[0x1E0CD2B70]);
  }
  return v4;
}

- (void)layoutSubviews
{
  -[CAMSlashMaskView _updateShapeLayerAnimated:](self, "_updateShapeLayerAnimated:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  -[CAMSlashMaskView _updateShapeLayerAnimated:](self, "_updateShapeLayerAnimated:", 0);
}

- (void)setSlashBounds:(CGRect)a3
{
  -[CAMSlashMaskView setSlashBounds:animated:](self, "setSlashBounds:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setSlashBounds:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_slashBounds;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_slashBounds = &self->_slashBounds;
  if (!CGRectEqualToRect(a3, self->_slashBounds))
  {
    p_slashBounds->origin.x = x;
    p_slashBounds->origin.y = y;
    p_slashBounds->size.width = width;
    p_slashBounds->size.height = height;
    -[CAMSlashMaskView _updateShapeLayerAnimated:](self, "_updateShapeLayerAnimated:", v4);
  }
}

- (void)updateMaskAnimated
{
  -[CAMSlashMaskView _updateShapeLayerAnimated:](self, "_updateShapeLayerAnimated:", 1);
}

- (void)_updateShapeLayerAnimated:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  CGFloat MaxX;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;

  -[CAMSlashMaskView _shapeLayer](self, "_shapeLayer");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSlashMaskView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAMSlashMaskView slashBounds](self, "slashBounds");
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  MaxX = CGRectGetMaxX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  MaxY = CGRectGetMaxY(v39);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v6, v8, v10, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSlashMaskView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "legibilityWeight");

  if (v20 == 1)
    v21 = 2.0;
  else
    v21 = 1.2;
  objc_msgSend(v18, "moveToPoint:", x - v21, y + v21, *(_QWORD *)&MaxX);
  objc_msgSend(v18, "addLineToPoint:", x + v21, y - v21);
  objc_msgSend(v18, "addLineToPoint:", v36 + v21, MaxY - v21);
  objc_msgSend(v18, "addLineToPoint:", v36 - v21, MaxY + v21);
  objc_msgSend(v37, "animationForKey:", CFSTR("slashMask"));
  v22 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v22;
  if (a3 || v22)
  {
    LODWORD(v23) = 1045220557;
    LODWORD(v25) = 1041865114;
    LODWORD(v26) = 1.0;
    LODWORD(v24) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v23, v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "presentationLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
    {
      if (v27)
      {
        objc_msgSend(v27, "fromValue");
        v31 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      v29 = v37;
    }
    v31 = (id)objc_msgSend(v29, "path");
LABEL_10:
    v32 = v31;
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFromValue:", v32);
    objc_msgSend(v33, "setToValue:", objc_msgSend(objc_retainAutorelease(v18), "CGPath"));
    objc_msgSend(v33, "setTimingFunction:", v28);
    objc_msgSend(v33, "setDuration:", 0.4);
    objc_msgSend(v37, "addAnimation:forKey:", v33, CFSTR("slashMask"));

  }
  v34 = objc_retainAutorelease(v18);
  objc_msgSend(v37, "setPath:", objc_msgSend(v34, "CGPath"));

}

- (CGRect)slashBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_slashBounds.origin.x;
  y = self->_slashBounds.origin.y;
  width = self->_slashBounds.size.width;
  height = self->_slashBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
