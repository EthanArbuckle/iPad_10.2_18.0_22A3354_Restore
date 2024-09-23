@implementation MADVIRectangleDetectionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIRectangleDetectionRequest)init
{
  MADVIRectangleDetectionRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADVIRectangleDetectionRequest;
  result = -[MADVIRectangleDetectionRequest init](&v3, sel_init);
  if (result)
  {
    result->_minimumAspectRatio = 0.5;
    result->_maximumAspectRatio = 1.0;
    result->_quadratureTolerance = 30.0;
    result->_minimumSize = 0.2;
    result->_minimumConfidence = 0.0;
    result->_maximumObservations = 1;
  }
  return result;
}

- (MADVIRectangleDetectionRequest)initWithCoder:(id)a3
{
  id v4;
  MADVIRectangleDetectionRequest *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADVIRectangleDetectionRequest;
  v5 = -[MADRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MinimumAspectRatio"));
    v5->_minimumAspectRatio = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MaximumAspectRatio"));
    v5->_maximumAspectRatio = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("QuadratureTolerance"));
    v5->_quadratureTolerance = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MinimumSize"));
    v5->_minimumSize = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MinimumConfidence"));
    v5->_minimumConfidence = v10;
    v5->_maximumObservations = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaximumObservations"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MADVIRectangleDetectionRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_minimumAspectRatio;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("MinimumAspectRatio"), v5, v10.receiver, v10.super_class);
  *(float *)&v6 = self->_maximumAspectRatio;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("MaximumAspectRatio"), v6);
  *(float *)&v7 = self->_quadratureTolerance;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("QuadratureTolerance"), v7);
  *(float *)&v8 = self->_minimumSize;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("MinimumSize"), v8);
  *(float *)&v9 = self->_minimumConfidence;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("MinimumConfidence"), v9);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumObservations, CFSTR("MaximumObservations"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("minimumAspectRatio: %0.2f, "), self->_minimumAspectRatio);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumAspectRatio: %0.2f, "), self->_maximumAspectRatio);
  objc_msgSend(v3, "appendFormat:", CFSTR("quadratureTolerance: %0.2f, "), self->_quadratureTolerance);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumSize: %0.2f, "), self->_minimumSize);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumConfidence: %0.2f, "), self->_minimumConfidence);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumObservations: %lu, "), self->_maximumObservations);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (float)minimumAspectRatio
{
  return self->_minimumAspectRatio;
}

- (void)setMinimumAspectRatio:(float)a3
{
  self->_minimumAspectRatio = a3;
}

- (float)maximumAspectRatio
{
  return self->_maximumAspectRatio;
}

- (void)setMaximumAspectRatio:(float)a3
{
  self->_maximumAspectRatio = a3;
}

- (float)quadratureTolerance
{
  return self->_quadratureTolerance;
}

- (void)setQuadratureTolerance:(float)a3
{
  self->_quadratureTolerance = a3;
}

- (float)minimumSize
{
  return self->_minimumSize;
}

- (void)setMinimumSize:(float)a3
{
  self->_minimumSize = a3;
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (unint64_t)maximumObservations
{
  return self->_maximumObservations;
}

- (void)setMaximumObservations:(unint64_t)a3
{
  self->_maximumObservations = a3;
}

@end
