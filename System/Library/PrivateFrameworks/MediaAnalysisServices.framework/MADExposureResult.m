@implementation MADExposureResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADExposureResult)initWithExposureScore:(double)a3
{
  MADExposureResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADExposureResult;
  result = -[MADResult init](&v5, sel_init);
  if (result)
    result->_exposureScore = a3;
  return result;
}

+ (id)resultWithExposureScore:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithExposureScore:", a3);
}

- (MADExposureResult)initWithCoder:(id)a3
{
  id v4;
  MADExposureResult *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADExposureResult;
  v5 = -[MADResult initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ExposureScore"));
    v5->_exposureScore = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADExposureResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ExposureScore"), self->_exposureScore);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %.3f>"), CFSTR("ExposureScore"), *(_QWORD *)&self->_exposureScore);
  return v3;
}

- (double)exposureScore
{
  return self->_exposureScore;
}

@end
