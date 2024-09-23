@implementation AVTSCNNodeModifications

- (AVTSCNNodeModifications)initWithProjectionDirection:(double)a3 fieldOfView:(double)a4 verticalLensShift:(float)a5 framingMode:(id)a6
{
  id v11;
  AVTSCNNodeModifications *v12;
  AVTSCNNodeModifications *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)AVTSCNNodeModifications;
  v12 = -[AVTSCNNodeModifications init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_projectionDirection = (uint64_t)a3;
    v12->_fieldOfView = a4;
    v12->_verticalLensShift = a5;
    objc_storeStrong((id *)&v12->_framingMode, a6);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTSCNNodeModifications)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  float v10;
  void *v11;
  AVTSCNNodeModifications *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("projectionDirection"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fieldOfView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("lensShift"));
  v10 = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("framingMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AVTSCNNodeModifications initWithProjectionDirection:fieldOfView:verticalLensShift:framingMode:](self, "initWithProjectionDirection:fieldOfView:verticalLensShift:framingMode:", v11, (double)v5, v8, v10);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t projectionDirection_low;
  void *v6;
  double fieldOfView;
  void *v8;
  double v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  projectionDirection_low = LODWORD(self->_projectionDirection);
  v10 = a3;
  objc_msgSend(v4, "numberWithInt:", projectionDirection_low);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("projectionDirection"));

  fieldOfView = self->_fieldOfView;
  *(float *)&fieldOfView = fieldOfView;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", fieldOfView);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("fieldOfView"));

  *(float *)&v9 = self->_verticalLensShift;
  objc_msgSend(v10, "encodeFloat:forKey:", CFSTR("lensShift"), v9);
  objc_msgSend(v10, "encodeObject:forKey:", self->_framingMode, CFSTR("framingMode"));

}

- (int64_t)projectionDirection
{
  return self->_projectionDirection;
}

- (void)setProjectionDirection:(int64_t)a3
{
  self->_projectionDirection = a3;
}

- (double)fieldOfView
{
  return self->_fieldOfView;
}

- (void)setFieldOfView:(double)a3
{
  self->_fieldOfView = a3;
}

- (float)verticalLensShift
{
  return self->_verticalLensShift;
}

- (void)setVerticalLensShift:(float)a3
{
  self->_verticalLensShift = a3;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (void)setFramingMode:(id)a3
{
  objc_storeStrong((id *)&self->_framingMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framingMode, 0);
}

@end
