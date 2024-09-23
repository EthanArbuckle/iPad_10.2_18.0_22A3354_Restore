@implementation ARMLImageDownScalingResultData

- (ARMLImageDownScalingResultData)initWithResultDataArray:(id)a3 timestamp:(double)a4 rotationOfResultTensor:(int64_t)a5 originalImageData:(id)a6
{
  id v11;
  id v12;
  ARMLImageDownScalingResultData *v13;
  ARMLImageDownScalingResultData *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ARMLImageDownScalingResultData;
  v13 = -[ARMLImageDownScalingResultData init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_downScalingResults, a3);
    v14->_timestamp = a4;
    v14->_rotationOfResultTensor = a5;
    objc_storeStrong((id *)&v14->_originalImageData, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    objc_msgSend(v5, "downScalingResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", self->_downScalingResults);

    if (v7
      && (objc_msgSend(v5, "timestamp"), v8 == self->_timestamp)
      && objc_msgSend(v5, "rotationOfResultTensor") == self->_rotationOfResultTensor)
    {
      objc_msgSend(v5, "originalImageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", self->_originalImageData);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)rotationOfResultTensor
{
  return self->_rotationOfResultTensor;
}

- (NSArray)downScalingResults
{
  return self->_downScalingResults;
}

- (ARImageData)originalImageData
{
  return self->_originalImageData;
}

- (ARMLImageDownScalingResultData)latestResizedUltraWideImageData
{
  return self->_latestResizedUltraWideImageData;
}

- (void)setLatestResizedUltraWideImageData:(id)a3
{
  objc_storeStrong((id *)&self->_latestResizedUltraWideImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResizedUltraWideImageData, 0);
  objc_storeStrong((id *)&self->_originalImageData, 0);
  objc_storeStrong((id *)&self->_downScalingResults, 0);
}

@end
