@implementation MADImageCaptionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageCaptionRequest)init
{
  return -[MADImageCaptionRequest initWithModelType:safetyType:](self, "initWithModelType:safetyType:", 1, 0);
}

- (MADImageCaptionRequest)initWithModelType:(int64_t)a3 safetyType:(int64_t)a4
{
  MADImageCaptionRequest *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MADImageCaptionRequest;
  result = -[MADImageCaptionRequest init](&v7, sel_init);
  if (result)
  {
    result->_modelType = a3;
    result->_safetyType = a4;
  }
  return result;
}

- (MADImageCaptionRequest)initWithCoder:(id)a3
{
  id v4;
  MADImageCaptionRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADImageCaptionRequest;
  v5 = -[MADRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_modelType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ImageCaptionModelType"));
    v5->_safetyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ImageCaptionSafetyType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADImageCaptionRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_modelType, CFSTR("ImageCaptionModelType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_safetyType, CFSTR("ImageCaptionSafetyType"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("imageCaptionModelType: %ld, "), -[MADImageCaptionRequest modelType](self, "modelType"));
  objc_msgSend(v3, "appendFormat:", CFSTR("imageCaptionSafetyType: %ld, "), -[MADImageCaptionRequest safetyType](self, "safetyType"));
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (int64_t)safetyType
{
  return self->_safetyType;
}

@end
