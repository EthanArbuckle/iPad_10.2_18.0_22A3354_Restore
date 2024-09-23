@implementation AXPIFingerModel

+ (id)fingerModelForLocation:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setLocation:", x, y);
  objc_msgSend(v5, "setShape:", 0);
  return v5;
}

- (void)setPressed:(BOOL)a3 sendDelegateCallback:(BOOL)a4
{
  id v5;

  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    if (a4)
    {
      -[AXPIFingerModel delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didUpdatePressStateForFingerModel:", self);

    }
  }
}

- (void)setPressed:(BOOL)a3
{
  -[AXPIFingerModel setPressed:sendDelegateCallback:](self, "setPressed:sendDelegateCallback:", a3, 1);
}

- (void)setSelected:(BOOL)a3
{
  id v4;

  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[AXPIFingerModel delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didUpdateSelectedStateForFingerModel:", self);

  }
}

- (void)setLocation:(CGPoint)a3
{
  id v5;

  if (self->_location.x != a3.x || self->_location.y != a3.y)
  {
    self->_location = a3;
    -[AXPIFingerModel delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didUpdateLocationForFingerModel:", self);

  }
}

- (void)setLocation3D:(id)a3
{
  objc_storeStrong((id *)&self->_location3D, a3);
}

- (void)setForce:(double)a3
{
  id v4;

  if (self->_force != a3)
  {
    self->_force = a3;
    -[AXPIFingerModel delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didUpdateForceForFingerModel:", self);

  }
}

- (void)setShape:(unint64_t)a3
{
  id v4;

  if (self->_shape != a3)
  {
    self->_shape = a3;
    -[AXPIFingerModel delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didUpdateShapeForFingerModel:", self);

  }
}

- (void)updateWithPropertiesFromFingerModel:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "location");
  -[AXPIFingerModel setLocation:](self, "setLocation:");
  objc_msgSend(v4, "force");
  -[AXPIFingerModel setForce:](self, "setForce:");
  -[AXPIFingerModel setPressed:](self, "setPressed:", objc_msgSend(v4, "isPressed"));
  -[AXPIFingerModel setSelected:](self, "setSelected:", objc_msgSend(v4, "isSelected"));
  v5 = objc_msgSend(v4, "shape");

  -[AXPIFingerModel setShape:](self, "setShape:", v5);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXPIFingerModel;
  -[AXPIFingerModel description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPIFingerModel location](self, "location");
  v5 = v4;
  -[AXPIFingerModel location](self, "location");
  v7 = v6;
  v8 = -[AXPIFingerModel isPressed](self, "isPressed");
  v9 = -[AXPIFingerModel isSelected](self, "isSelected");
  -[AXPIFingerModel force](self, "force");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - location: {%f, %f}, pressed: %i, selected: %i, force: %f, shape: %i"), v5, v7, v8, v9, v10, -[AXPIFingerModel shape](self, "shape"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSValue)location3D
{
  return self->_location3D;
}

- (double)force
{
  return self->_force;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (AXPIFingerModelDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_location3D, 0);
}

@end
