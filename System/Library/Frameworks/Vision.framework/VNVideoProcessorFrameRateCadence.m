@implementation VNVideoProcessorFrameRateCadence

- (VNVideoProcessorFrameRateCadence)initWithFrameRate:(NSInteger)frameRate
{
  VNVideoProcessorFrameRateCadence *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNVideoProcessorFrameRateCadence;
  result = -[VNVideoProcessorFrameRateCadence init](&v5, sel_init);
  if (result)
    result->_frameRate = frameRate;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  VNVideoProcessorFrameRateCadence *v4;
  VNVideoProcessorFrameRateCadence *v5;
  NSInteger v6;
  uint64_t v7;
  BOOL v8;

  v4 = (VNVideoProcessorFrameRateCadence *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNVideoProcessorFrameRateCadence frameRate](self, "frameRate");
      v7 = -[VNVideoProcessorFrameRateCadence frameRate](v5, "frameRate");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)populateVCPVideoProcessorRequestConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNVideoProcessorFrameRateCadence;
  v4 = a3;
  -[VNVideoProcessorCadence populateVCPVideoProcessorRequestConfiguration:](&v6, sel_populateVCPVideoProcessorRequestConfiguration_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VNVideoProcessorFrameRateCadence frameRate](self, "frameRate", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("VNVideoProcessingOptionFrameCadence"));

}

- (NSInteger)frameRate
{
  return self->_frameRate;
}

@end
