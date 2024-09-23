@implementation CAUserAdjustmentCommand

- (CAUserAdjustmentCommand)initWithUserAdjustment:(id)a3 autoLuminanceBoost:(float)a4
{
  char *v6;
  CAUserAdjustmentCommand *v7;
  float v8;
  CAUserAdjustment *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CAUserAdjustmentCommand;
  v6 = -[CAUserAdjustmentCommand init](&v11, sel_init);
  v7 = (CAUserAdjustmentCommand *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_18474E5C0;
    *(_OWORD *)(v6 + 24) = xmmword_18474E5C0;
    *((_QWORD *)v6 + 5) = 0x3FED70A3D70A3D71;
    v8 = 1.128 / a4;
    if ((float)(1.128 / a4) > 1.08)
      v8 = 1.08;
    *((double *)v6 + 6) = v8;
    if (a3)
      v9 = (CAUserAdjustment *)a3;
    else
      v9 = -[CAUserAdjustment initWithXDelta:yDelta:luminanceScale:]([CAUserAdjustment alloc], "initWithXDelta:yDelta:luminanceScale:", 0.0, 0.0, 1.0);
    v7->_userAdjustment = v9;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CAUserAdjustmentCommand;
  -[CAUserAdjustmentCommand dealloc](&v3, sel_dealloc);
}

- (BOOL)transformWhitePointByXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CAUserAdjustment *v15;
  CAUserAdjustment *v16;

  -[CAUserAdjustment xDelta](self->_userAdjustment, "xDelta");
  v10 = v9 + a3;
  if (v10 >= self->_minXDelta + -0.000001
    && v10 <= self->_maxXDelta + 0.000001
    && (-[CAUserAdjustment yDelta](self->_userAdjustment, "yDelta"), v12 = v11 + a4, v12 >= self->_minYDelta + -0.000001)
    && v12 <= self->_maxYDelta + 0.000001
    && (-[CAUserAdjustment luminanceScale](self->_userAdjustment, "luminanceScale"),
        v14 = v13 * a5,
        v14 <= self->_maxLuminanceScale + 0.000001))
  {
    v15 = -[CAUserAdjustment initWithXDelta:yDelta:luminanceScale:]([CAUserAdjustment alloc], "initWithXDelta:yDelta:luminanceScale:", v10, v12, v14);
    if (v15)
    {
      v16 = v15;

      self->_userAdjustment = v16;
      LOBYTE(v15) = 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return (char)v15;
}

- (double)minXDelta
{
  return self->_minXDelta;
}

- (double)maxXDelta
{
  return self->_maxXDelta;
}

- (double)minYDelta
{
  return self->_minYDelta;
}

- (double)maxYDelta
{
  return self->_maxYDelta;
}

- (double)minLuminanceScale
{
  return self->_minLuminanceScale;
}

- (double)maxLuminanceScale
{
  return self->_maxLuminanceScale;
}

- (CAUserAdjustment)userAdjustment
{
  return self->_userAdjustment;
}

@end
