@implementation ULOdometryState

- (ULOdometryState)initWithTimestamp:(double)a3 deltaPositionX:(id)a4 deltaPositionY:(id)a5 deltaPositionZ:(id)a6
{
  id v10;
  id v11;
  id v12;
  ULOdometryState *v13;
  ULOdometryState *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ULOdometryState;
  v13 = -[ULOdometryState init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    -[ULOdometryState setTimestamp:](v13, "setTimestamp:", a3);
    if (v10)
      v15 = v10;
    else
      v15 = &unk_2511EDD20;
    -[ULOdometryState setDeltaPositionX:](v14, "setDeltaPositionX:", v15);
    if (v11)
      v16 = v11;
    else
      v16 = &unk_2511EDD20;
    -[ULOdometryState setDeltaPositionY:](v14, "setDeltaPositionY:", v16);
    if (v12)
      v17 = v12;
    else
      v17 = &unk_2511EDD20;
    -[ULOdometryState setDeltaPositionZ:](v14, "setDeltaPositionZ:", v17);
  }

  return v14;
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionX, a3);
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionY, a3);
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (void)setDeltaPositionZ:(id)a3
{
  objc_storeStrong((id *)&self->_deltaPositionZ, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaPositionZ, 0);
  objc_storeStrong((id *)&self->_deltaPositionY, 0);
  objc_storeStrong((id *)&self->_deltaPositionX, 0);
}

@end
