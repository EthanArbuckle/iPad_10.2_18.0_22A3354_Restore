@implementation AXPIFingerLayer

- (AXPIFingerLayer)initWithAppearanceDelegate:(id)a3
{
  id v4;
  AXPIFingerLayer *v5;
  AXPIFingerLayer *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AXPIFingerLayer;
  v5 = -[AXPIFingerLayer init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXPIFingerLayer setAppearanceDelegate:](v5, "setAppearanceDelegate:", v4);
    -[AXPIFingerLayer appearanceDelegate](v6, "appearanceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fingerInnerRadius");
    v9 = v8;
    -[AXPIFingerLayer appearanceDelegate](v6, "appearanceDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeWidth");
    v12 = v11 + v9 * 2.0;

    -[AXPIFingerLayer appearanceDelegate](v6, "appearanceDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fingerWidth");
    v15 = (v14 - v12) * 0.5;

    v6->_outerFrame.origin.x = v15;
    v6->_outerFrame.origin.y = v15;
    v6->_outerFrame.size.width = v12;
    v6->_outerFrame.size.height = v12;
    v6->_shape = 0;
    if (!+[AXPIFingerUtilities laserEnabled](AXPIFingerUtilities, "laserEnabled")
      || (-[AXPIFingerLayer appearanceDelegate](v6, "appearanceDelegate"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "useSystemFilters"),
          v16,
          (v17 & 1) == 0))
    {
      -[AXPIFingerLayer appearanceDelegate](v6, "appearanceDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "deselectedFillColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[AXPIFingerLayer setFillColor:](v6, "setFillColor:", objc_msgSend(v19, "CGColor"));

    }
  }

  return v6;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (void)setShape:(unint64_t)a3
{
  self->_shape = a3;
}

- (AXPIFingerAppearanceDelegate)appearanceDelegate
{
  return (AXPIFingerAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (CGRect)outerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_outerFrame.origin.x;
  y = self->_outerFrame.origin.y;
  width = self->_outerFrame.size.width;
  height = self->_outerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appearanceDelegate);
}

@end
