@implementation DYMTLShaderProfilerResult

- (DYMTLShaderProfilerResult)init
{
  DYMTLShaderProfilerResult *v2;
  void *v3;
  void *v4;
  DYMTLShaderProfilerResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DYMTLShaderProfilerResult;
  v2 = -[DYShaderProfilerResult init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1024));
    -[DYShaderProfilerResult setShaderProfilingFrameTimes:](v2, "setShaderProfilingFrameTimes:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1024));
    -[DYShaderProfilerResult setBlitEncoderTimeInfo:](v2, "setBlitEncoderTimeInfo:", v4);

    v5 = v2;
  }

  return v2;
}

- (NSArray)encoderTilerParamBufBytesUsedArray
{
  return self->_encoderTilerParamBufBytesUsedArray;
}

- (void)setEncoderTilerParamBufBytesUsedArray:(id)a3
{
  objc_storeStrong((id *)&self->_encoderTilerParamBufBytesUsedArray, a3);
}

- (NSNumber)parameterBufferMaxSize
{
  return self->_parameterBufferMaxSize;
}

- (void)setParameterBufferMaxSize:(id)a3
{
  objc_storeStrong((id *)&self->_parameterBufferMaxSize, a3);
}

- (NSNumber)parameterBufferMaxSizeEverMemless
{
  return self->_parameterBufferMaxSizeEverMemless;
}

- (void)setParameterBufferMaxSizeEverMemless:(id)a3
{
  objc_storeStrong((id *)&self->_parameterBufferMaxSizeEverMemless, a3);
}

- (NSNumber)parameterBufferMaxSizeNeverMemless
{
  return self->_parameterBufferMaxSizeNeverMemless;
}

- (void)setParameterBufferMaxSizeNeverMemless:(id)a3
{
  objc_storeStrong((id *)&self->_parameterBufferMaxSizeNeverMemless, a3);
}

- (NSDictionary)parameterBufferPercentFullDict
{
  return self->_parameterBufferPercentFullDict;
}

- (void)setParameterBufferPercentFullDict:(id)a3
{
  objc_storeStrong((id *)&self->_parameterBufferPercentFullDict, a3);
}

- (NSDictionary)softwareCounterInfo
{
  return self->_softwareCounterInfo;
}

- (void)setSoftwareCounterInfo:(id)a3
{
  objc_storeStrong((id *)&self->_softwareCounterInfo, a3);
}

- (NSMutableData)unknownUSCSamples
{
  return self->_unknownUSCSamples;
}

- (void)setUnknownUSCSamples:(id)a3
{
  objc_storeStrong((id *)&self->_unknownUSCSamples, a3);
}

- (NSMutableDictionary)perRingPerFrameLimiterData
{
  return self->_perRingPerFrameLimiterData;
}

- (void)setPerRingPerFrameLimiterData:(id)a3
{
  objc_storeStrong((id *)&self->_perRingPerFrameLimiterData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perRingPerFrameLimiterData, 0);
  objc_storeStrong((id *)&self->_unknownUSCSamples, 0);
  objc_storeStrong((id *)&self->_softwareCounterInfo, 0);
  objc_storeStrong((id *)&self->_parameterBufferPercentFullDict, 0);
  objc_storeStrong((id *)&self->_parameterBufferMaxSizeNeverMemless, 0);
  objc_storeStrong((id *)&self->_parameterBufferMaxSizeEverMemless, 0);
  objc_storeStrong((id *)&self->_parameterBufferMaxSize, 0);
  objc_storeStrong((id *)&self->_encoderTilerParamBufBytesUsedArray, 0);
}

@end
