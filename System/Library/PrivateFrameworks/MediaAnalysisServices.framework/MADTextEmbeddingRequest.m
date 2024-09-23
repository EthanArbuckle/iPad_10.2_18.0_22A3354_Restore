@implementation MADTextEmbeddingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextEmbeddingRequest)init
{
  MADTextEmbeddingRequest *v2;
  int v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADTextEmbeddingRequest;
  v2 = -[MADTextEmbeddingRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = _os_feature_enabled_impl();
    v4 = 4;
    if (v3)
      v4 = 5;
    v2->_version = v4;
  }
  return v2;
}

- (MADTextEmbeddingRequest)initWithCoder:(id)a3
{
  id v4;
  MADTextEmbeddingRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingRequest;
  v5 = -[MADTextRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Version"));
    v5->_calibrate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Calibrate"));
    v5->_computeThreshold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ComputeThreshold"));
    v5->_extendedContextLength = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ExtendedContextLength"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADTextEmbeddingRequest;
  v4 = a3;
  -[MADTextRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("Version"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_calibrate, CFSTR("Calibrate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_computeThreshold, CFSTR("ComputeThreshold"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_extendedContextLength, CFSTR("ExtendedContextLength"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("version: %d, "), self->_version);
  if (self->_calibrate)
    objc_msgSend(v3, "appendFormat:", CFSTR("calibrate: %d, "), 1);
  if (self->_computeThreshold)
    objc_msgSend(v3, "appendFormat:", CFSTR("computeThreshold: %d, "), 1);
  if (self->_extendedContextLength)
    objc_msgSend(v3, "appendFormat:", CFSTR("extendedContextLength: %d, "), 1);
  -[MADTextRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADTextRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (BOOL)calibrate
{
  return self->_calibrate;
}

- (void)setCalibrate:(BOOL)a3
{
  self->_calibrate = a3;
}

- (BOOL)computeThreshold
{
  return self->_computeThreshold;
}

- (void)setComputeThreshold:(BOOL)a3
{
  self->_computeThreshold = a3;
}

- (BOOL)extendedContextLength
{
  return self->_extendedContextLength;
}

- (void)setExtendedContextLength:(BOOL)a3
{
  self->_extendedContextLength = a3;
}

@end
