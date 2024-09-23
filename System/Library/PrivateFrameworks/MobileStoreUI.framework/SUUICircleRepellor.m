@implementation SUUICircleRepellor

- (id)description
{
  void *v3;
  void *v4;
  PKPhysicsBody *physicsBody;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)SUUICircleRepellor;
  -[SUUICircleRepellor description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  physicsBody = self->_physicsBody;
  NSStringFromCGPoint(self->_center);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Body: %@, Center: %@, Radius: %.2f"), v4, physicsBody, v6, *(_QWORD *)&self->_radius);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(double)a3
{
  self->_bufferSize = a3;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (PKPhysicsBody)physicsBody
{
  return self->_physicsBody;
}

- (void)setPhysicsBody:(id)a3
{
  objc_storeStrong((id *)&self->_physicsBody, a3);
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicsBody, 0);
}

@end
