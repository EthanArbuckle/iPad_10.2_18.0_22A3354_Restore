@implementation CAUserAdjustment

- (CAUserAdjustment)initWithXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5
{
  double v9;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "now"), "timeIntervalSince1970");
  return -[CAUserAdjustment initWithXDelta:yDelta:luminanceScale:timestamp:](self, "initWithXDelta:yDelta:luminanceScale:timestamp:", a3, a4, a5, v9);
}

- (CAUserAdjustment)initWithXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5 timestamp:(double)a6
{
  CAUserAdjustment *result;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CAUserAdjustment;
  result = -[CAUserAdjustment init](&v11, sel_init);
  if (result)
  {
    result->_xDelta = a3;
    result->_yDelta = a4;
    result->_luminanceScale = a5;
    result->_timestamp = a6;
  }
  return result;
}

- (double)xDelta
{
  return self->_xDelta;
}

- (double)yDelta
{
  return self->_yDelta;
}

- (double)luminanceScale
{
  return self->_luminanceScale;
}

- (double)timestamp
{
  return self->_timestamp;
}

@end
