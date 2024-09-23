@implementation DKDrawingStrokePoint

- (DKDrawingStrokePoint)init
{
  DKDrawingStrokePoint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DKDrawingStrokePoint;
  result = -[DKDrawingStrokePoint init](&v3, sel_init);
  if (result)
  {
    result->_location = (CGPoint)*MEMORY[0x24BDBEFB0];
    result->_force = 0.0;
    result->_velocity = 0.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(DKDrawingStrokePoint);
  if (result)
  {
    *(CGPoint *)((char *)result + 24) = self->_location;
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_force;
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_velocity;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CGPoint v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDrawingStrokePoint location](self, "location");
  NSStringFromCGPoint(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDrawingStrokePoint force](self, "force");
  v8 = v7;
  -[DKDrawingStrokePoint velocity](self, "velocity");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: location: %@  force: %f velocity: %f"), v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

@end
