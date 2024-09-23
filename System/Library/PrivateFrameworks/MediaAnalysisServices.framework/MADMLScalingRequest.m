@implementation MADMLScalingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMLScalingRequest)initWithScaledImageWidth:(unint64_t)a3 scaledImageHeight:(unint64_t)a4 scalingModel:(int64_t)a5
{
  MADMLScalingRequest *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MADMLScalingRequest;
  result = -[MADMLScalingRequest init](&v9, sel_init);
  if (result)
  {
    result->_scaledImageWidth = a3;
    result->_scaledImageHeight = a4;
    result->_scalingModelIndex = a5;
  }
  return result;
}

- (MADMLScalingRequest)initWithScaledImageWidth:(unint64_t)a3 scaledImageHeight:(unint64_t)a4
{
  MADMLScalingRequest *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MADMLScalingRequest;
  result = -[MADMLScalingRequest init](&v7, sel_init);
  if (result)
  {
    result->_scaledImageWidth = a3;
    result->_scaledImageHeight = a4;
    result->_scalingModelIndex = 0;
  }
  return result;
}

- (MADMLScalingRequest)initWithCoder:(id)a3
{
  id v4;
  MADMLScalingRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADMLScalingRequest;
  v5 = -[MADRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_scaledImageWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ScaledImageWidth"));
    v5->_scaledImageHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ScaledImageHeight"));
    v5->_scalingModelIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ScalingModelIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADMLScalingRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_scaledImageWidth, CFSTR("ScaledImageWidth"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_scaledImageHeight, CFSTR("ScaledImageHeight"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_scalingModelIndex, CFSTR("ScalingModelIndex"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR(", scaledImageWidth: %lu"), self->_scaledImageWidth);
  objc_msgSend(v3, "appendFormat:", CFSTR(", scaledImageHeight: %lu"), self->_scaledImageHeight);
  objc_msgSend(v3, "appendFormat:", CFSTR(", scalingModelIndex: %lu"), self->_scalingModelIndex);
  -[MADRequest error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v6);

  return v3;
}

- (unint64_t)scaledImageWidth
{
  return self->_scaledImageWidth;
}

- (unint64_t)scaledImageHeight
{
  return self->_scaledImageHeight;
}

- (int64_t)scalingModelIndex
{
  return self->_scalingModelIndex;
}

@end
