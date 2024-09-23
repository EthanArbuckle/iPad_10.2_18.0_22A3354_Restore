@implementation ARMattingImageMetaData

- (ARMattingImageMetaData)initWithTimestamp:(double)a3 downSampledImageBuffer:(__CVBuffer *)a4 mattingScaleImageBuffer:(__CVBuffer *)a5
{
  ARMattingImageMetaData *v8;
  ARMattingImageMetaData *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ARMattingImageMetaData;
  v8 = -[ARMattingImageMetaData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    v8->_downSampledImageBuffer = CVPixelBufferRetain(a4);
    v9->_mattingScaleImageBuffer = CVPixelBufferRetain(a5);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_downSampledImageBuffer);
  CVPixelBufferRelease(self->_mattingScaleImageBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ARMattingImageMetaData;
  -[ARMattingImageMetaData dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARMattingImageMetaData timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p timestamp=%f>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__CVBuffer)downSampledImageBuffer
{
  return self->_downSampledImageBuffer;
}

- (__CVBuffer)mattingScaleImageBuffer
{
  return self->_mattingScaleImageBuffer;
}

@end
