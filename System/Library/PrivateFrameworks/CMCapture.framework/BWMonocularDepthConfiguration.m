@implementation BWMonocularDepthConfiguration

- (BWMonocularDepthConfiguration)initWithInferenceType:(int)a3 monocularDepthType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  BWMonocularDepthConfiguration *result;
  int64_t v8;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 != 106)
    return 0;
  v10 = v4;
  v11 = v5;
  v9.receiver = self;
  v9.super_class = (Class)BWMonocularDepthConfiguration;
  result = -[BWInferenceConfiguration initWithInferenceType:](&v9, sel_initWithInferenceType_);
  if (!result)
    return result;
  if (a4 == 2)
  {
    v8 = 3;
  }
  else
  {
    if (a4 != 1)
      return result;
    v8 = 2;
  }
  result->_monocularDepthType = a4;
  result->_depthPrioritization = v8;
  return result;
}

- (unsigned)monocularDepthType
{
  return self->_monocularDepthType;
}

- (int64_t)depthPrioritization
{
  return self->_depthPrioritization;
}

@end
