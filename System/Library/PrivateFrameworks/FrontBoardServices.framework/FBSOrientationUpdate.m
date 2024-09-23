@implementation FBSOrientationUpdate

- (int64_t)orientation
{
  return self->_orientation;
}

- (FBSOrientationUpdate)initWithOrientation:(int64_t)a3 sequenceNumber:(unint64_t)a4 duration:(double)a5 rotationDirection:(int64_t)a6
{
  FBSOrientationUpdate *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FBSOrientationUpdate;
  result = -[FBSOrientationUpdate init](&v11, sel_init);
  if (result)
  {
    result->_orientation = a3;
    result->_sequenceNumber = a4;
    result->_duration = a5;
    result->_rotationDirection = a6;
  }
  return result;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (int64_t)rotationDirection
{
  return self->_rotationDirection;
}

- (double)duration
{
  return self->_duration;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("orientation"));

  v6 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_sequenceNumber, CFSTR("sequenceNumber"));
  if (self->_duration != 0.0)
    v7 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("duration"));
  if (self->_rotationDirection)
  {
    BSOrientationRotationDirectionDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("direction"));

  }
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (FBSOrientationUpdate)init
{
  return -[FBSOrientationUpdate initWithOrientation:sequenceNumber:duration:rotationDirection:](self, "initWithOrientation:sequenceNumber:duration:rotationDirection:", 0, 0, 0, 0.0);
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setRotationDirection:(int64_t)a3
{
  self->_rotationDirection = a3;
}

@end
