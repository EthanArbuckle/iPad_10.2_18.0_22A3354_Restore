@implementation AVExposureBiasRange

+ (AVExposureBiasRange)exposureBiasRangeWithMinExposureBias:(float)a3 maxExposureBias:(float)a4
{
  id v6;
  double v7;
  double v8;

  v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&v7 = a3;
  *(float *)&v8 = a4;
  return (AVExposureBiasRange *)(id)objc_msgSend(v6, "initWithMinExposureBias:maxExposureBias:", v7, v8);
}

- (AVExposureBiasRange)initWithMinExposureBias:(float)a3 maxExposureBias:(float)a4
{
  AVExposureBiasRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVExposureBiasRange;
  result = -[AVExposureBiasRange init](&v7, sel_init);
  if (result)
  {
    result->_minExposureBias = a3;
    result->_maxExposureBias = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %.2f - %.2f>"), NSStringFromClass(v4), self, self->_minExposureBias, self->_maxExposureBias);
}

- (BOOL)containsExposureBias:(float)a3
{
  return self->_minExposureBias <= a3 && self->_maxExposureBias >= a3;
}

- (float)minExposureBias
{
  return self->_minExposureBias;
}

- (float)maxExposureBias
{
  return self->_maxExposureBias;
}

@end
