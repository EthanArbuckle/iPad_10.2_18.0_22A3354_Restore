@implementation AVHapticPlayerParameterCurve

- (AVHapticPlayerParameterCurve)init
{

  return 0;
}

- (AVHapticPlayerParameterCurve)initWithType:(unint64_t)a3 relativeTime:(double)a4 shape:(unint64_t)a5 controlPoints:(id)a6
{
  id v10;
  AVHapticPlayerParameterCurve *v11;
  AVHapticPlayerParameterCurve *v12;
  uint64_t v13;
  NSArray *controlPoints;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVHapticPlayerParameterCurve;
  v11 = -[AVHapticPlayerParameterCurve init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_time = a4;
    v11->_shape = a5;
    v13 = objc_msgSend(v10, "copy");
    controlPoints = v12->_controlPoints;
    v12->_controlPoints = (NSArray *)v13;

  }
  return v12;
}

- (NSArray)controlPoints
{
  return self->_controlPoints;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("paramCurveType"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("paramCurveTime"), self->_time);
  objc_msgSend(v4, "encodeObject:forKey:", self->_controlPoints, CFSTR("controlPoints"));

}

- (AVHapticPlayerParameterCurve)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  AVHapticPlayerParameterCurve *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("paramCurveType"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("paramCurveTime"));
  v10 = v9;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("controlPoints"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVHapticPlayerParameterCurve initWithType:relativeTime:shape:controlPoints:](self, "initWithType:relativeTime:shape:controlPoints:", v8, 1, v11, v10);

  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (void)setShape:(unint64_t)a3
{
  self->_shape = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPoints, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
