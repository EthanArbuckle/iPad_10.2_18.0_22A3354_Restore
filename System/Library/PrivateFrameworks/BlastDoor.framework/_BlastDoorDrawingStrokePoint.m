@implementation _BlastDoorDrawingStrokePoint

- (_BlastDoorDrawingStrokePoint)init
{
  _BlastDoorDrawingStrokePoint *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_BlastDoorDrawingStrokePoint;
  result = -[_BlastDoorDrawingStrokePoint init](&v3, sel_init);
  if (result)
  {
    result->_location = (CGPoint)*MEMORY[0x1E0C9D538];
    result->_force = 0.0;
    result->_velocity = 0.0;
  }
  return result;
}

- (id)createDKStrokePoint
{
  void *v3;
  objc_class *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getDKDrawingStrokePointClass_softClass;
  v11 = getDKDrawingStrokePointClass_softClass;
  if (!getDKDrawingStrokePointClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getDKDrawingStrokePointClass_block_invoke;
    v7[3] = &unk_1E5CCC218;
    v7[4] = &v8;
    __getDKDrawingStrokePointClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "init");
  -[_BlastDoorDrawingStrokePoint location](self, "location");
  objc_msgSend(v5, "setLocation:");
  -[_BlastDoorDrawingStrokePoint force](self, "force");
  objc_msgSend(v5, "setForce:");
  -[_BlastDoorDrawingStrokePoint velocity](self, "velocity");
  objc_msgSend(v5, "setVelocity:");
  return v5;
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
