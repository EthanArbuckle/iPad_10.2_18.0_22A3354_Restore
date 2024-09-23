@implementation BWFastStereoDisparityConfiguration

- (BWFastStereoDisparityConfiguration)initWithInferenceType:(int)a3 fsdNetStereoImagesAlignment:(int)a4 disparityType:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  BWFastStereoDisparityConfiguration *result;
  int64_t v10;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 != 108)
    return 0;
  v12 = v5;
  v13 = v6;
  v11.receiver = self;
  v11.super_class = (Class)BWFastStereoDisparityConfiguration;
  result = -[BWInferenceConfiguration initWithInferenceType:](&v11, sel_initWithInferenceType_);
  if (!result)
    return result;
  result->_disparityType = a5;
  result->_fsdNetStereoImagesAlignment = a4;
  if (a5 == 2)
  {
    v10 = 3;
  }
  else
  {
    if (a5 != 1)
      return result;
    v10 = 2;
  }
  result->_disparityPrioritization = v10;
  return result;
}

- (int)fsdNetStereoImagesAlignment
{
  return self->_fsdNetStereoImagesAlignment;
}

- (unsigned)disparityType
{
  return self->_disparityType;
}

- (int64_t)disparityPrioritization
{
  return self->_disparityPrioritization;
}

@end
