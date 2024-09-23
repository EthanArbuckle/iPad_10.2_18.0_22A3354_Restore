@implementation HMDDataStreamFrameReader

- (HMDDataStreamFrameReader)init
{
  HMDDataStreamFrameReader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDDataStreamFrameReader;
  result = -[HMDDataStreamFrameReader init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_headerInfoRead = 0;
    result->_payloadLength = 0;
    result->_currentframeType = 0;
  }
  return result;
}

- (BOOL)hasFailed
{
  return self->_streamFailed;
}

- (BOOL)hasCompleteFrame
{
  return !-[HMDDataStreamFrameReader hasFailed](self, "hasFailed")
      && -[HMDDataStreamFrameReader bytesNeededForCurrentFrame](self, "bytesNeededForCurrentFrame") == 0;
}

- (BOOL)hasPartialData
{
  return self->_partialFrame
      && -[HMDDataStreamFrameReader bytesNeededForCurrentFrame](self, "bytesNeededForCurrentFrame") != 0;
}

- (unint64_t)_getCurrentFrameSize
{
  if (self->_currentframeType - 1 > 2)
    return 0;
  else
    return self->_payloadLength + qword_1CDB8F090[(self->_currentframeType - 1)];
}

- (unint64_t)bytesNeededForCurrentFrame
{
  NSObject *partialFrame;
  size_t size;
  size_t v6;
  unint64_t v7;

  if (-[HMDDataStreamFrameReader hasFailed](self, "hasFailed"))
    return 0;
  partialFrame = self->_partialFrame;
  if (!partialFrame)
    return 4;
  size = dispatch_data_get_size(partialFrame);
  v6 = size;
  if (!self->_headerInfoRead)
    return 4 - size;
  v7 = -[HMDDataStreamFrameReader _getCurrentFrameSize](self, "_getCurrentFrameSize");
  if (v7 >= v6)
    return v7 - v6;
  else
    return 0;
}

- (void)pushFrameData:(id)a3
{
  NSObject *partialFrame;
  OS_dispatch_data *concat;
  OS_dispatch_data *v6;
  NSObject *data2;

  data2 = a3;
  if (!-[HMDDataStreamFrameReader hasFailed](self, "hasFailed"))
  {
    partialFrame = self->_partialFrame;
    if (partialFrame)
      concat = (OS_dispatch_data *)dispatch_data_create_concat(partialFrame, data2);
    else
      concat = data2;
    v6 = self->_partialFrame;
    self->_partialFrame = concat;

    -[HMDDataStreamFrameReader _readFrameHeaderIfPossible](self, "_readFrameHeaderIfPossible");
  }

}

- (void)_readFrameHeaderIfPossible
{
  unsigned __int8 *p_currentframeType;
  unint64_t *p_payloadLength;
  _BOOL4 v5;
  OS_dispatch_data *partialFrame;
  OS_dispatch_data *v7;

  if (!self->_headerInfoRead)
  {
    p_currentframeType = &self->_currentframeType;
    p_payloadLength = &self->_payloadLength;
    v5 = +[HMDDataStreamMessageCoder readHeaderFromPartialData:frameType:payloadLength:](HMDDataStreamMessageCoder, "readHeaderFromPartialData:frameType:payloadLength:", self->_partialFrame, &self->_currentframeType, &self->_payloadLength);
    self->_headerInfoRead = v5;
    if (v5)
    {
      if (*p_payloadLength - 1048572 <= 0xFFFFFFFFFFEFFFFFLL)
      {
        partialFrame = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
      if (*p_currentframeType - 1 >= 3)
      {
        v7 = self->_partialFrame;
        self->_partialFrame = 0;

        self->_streamFailed = 1;
      }
    }
  }
}

- (void)reset
{
  OS_dispatch_data *partialFrame;

  partialFrame = self->_partialFrame;
  self->_partialFrame = 0;

  *(_WORD *)&self->_headerInfoRead = 0;
}

- (id)popRawFrame
{
  size_t v3;
  dispatch_data_t subrange;
  NSObject *partialFrame;
  size_t size;
  size_t v7;
  dispatch_data_t v8;

  if (-[HMDDataStreamFrameReader hasCompleteFrame](self, "hasCompleteFrame"))
  {
    v3 = -[HMDDataStreamFrameReader _getCurrentFrameSize](self, "_getCurrentFrameSize");
    subrange = dispatch_data_create_subrange((dispatch_data_t)self->_partialFrame, 0, v3);
    partialFrame = self->_partialFrame;
    size = dispatch_data_get_size(partialFrame);
    v7 = size - v3;
    if (size == v3)
    {
      -[HMDDataStreamFrameReader reset](self, "reset", v7);
    }
    else
    {
      v8 = dispatch_data_create_subrange(partialFrame, v3, v7);
      -[HMDDataStreamFrameReader reset](self, "reset");
      -[HMDDataStreamFrameReader pushFrameData:](self, "pushFrameData:", v8);

    }
  }
  else
  {
    subrange = 0;
  }
  return subrange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialFrame, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_34124 != -1)
    dispatch_once(&logCategory__hmf_once_t0_34124, &__block_literal_global_34125);
  return (id)logCategory__hmf_once_v1_34126;
}

void __39__HMDDataStreamFrameReader_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_34126;
  logCategory__hmf_once_v1_34126 = v0;

}

@end
