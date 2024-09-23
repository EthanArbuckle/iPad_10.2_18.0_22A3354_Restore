@implementation ARMLIntermediateDownScalingResultData

- (ARMLIntermediateDownScalingResultData)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4 originalImageData:(id)a5
{
  id v9;
  ARMLIntermediateDownScalingResultData *v10;
  ARMLIntermediateDownScalingResultData *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ARMLIntermediateDownScalingResultData;
  v10 = -[ARMLIntermediateDownScalingResultData init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_pixelBuffer = a3;
    CVPixelBufferRetain(a3);
    v11->_timestamp = a4;
    objc_storeStrong((id *)&v11->_originalImageData, a5);
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ARMLIntermediateDownScalingResultData;
  -[ARMLIntermediateDownScalingResultData dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  char v7;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    if ((__CVBuffer *)objc_msgSend(v5, "pixelBuffer") == self->_pixelBuffer
      && (objc_msgSend(v5, "timestamp"), v6 == self->_timestamp))
    {
      objc_msgSend(v5, "originalImageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isEqual:", self->_originalImageData);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (ARImageData)originalImageData
{
  return self->_originalImageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalImageData, 0);
}

@end
