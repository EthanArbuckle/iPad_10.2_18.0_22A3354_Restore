@implementation AXElementVision__generated__Input

- (AXElementVision__generated__Input)initWithImage:(__CVBuffer *)a3 iouThreshold:(double)a4 confidenceThreshold:(double)a5
{
  if (self)
  {
    self->_image = a3;
    self->_iouThreshold = a4;
    self->_confidenceThreshold = a5;
  }
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6289470);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double iouThreshold;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("image")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", self->_image);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("iouThreshold")))
    {
      v6 = (void *)MEMORY[0x1E0C9E918];
      iouThreshold = self->_iouThreshold;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("confidenceThreshold")))
      {
        v8 = 0;
        goto LABEL_9;
      }
      v6 = (void *)MEMORY[0x1E0C9E918];
      iouThreshold = self->_confidenceThreshold;
    }
    objc_msgSend(v6, "featureValueWithDouble:", iouThreshold);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;
LABEL_9:

  return v8;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)setImage:(__CVBuffer *)a3
{
  self->_image = a3;
}

- (double)iouThreshold
{
  return self->_iouThreshold;
}

- (void)setIouThreshold:(double)a3
{
  self->_iouThreshold = a3;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

@end
