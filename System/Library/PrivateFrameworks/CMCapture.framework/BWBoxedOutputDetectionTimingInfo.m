@implementation BWBoxedOutputDetectionTimingInfo

- (BWBoxedOutputDetectionTimingInfo)init
{
  BWBoxedOutputDetectionTimingInfo *result;
  uint64_t v3;
  __int128 v4;
  int64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWBoxedOutputDetectionTimingInfo;
  result = -[BWBoxedOutputDetectionTimingInfo init](&v6, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    v4 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_previousDetectionPTS.value = *MEMORY[0x1E0CA2E18];
    v5 = *(_QWORD *)(v3 + 16);
    result->_previousDetectionPTS.epoch = v5;
    *(_OWORD *)&result->_previousDetectionDuration.value = v4;
    result->_previousDetectionDuration.epoch = v5;
    *(_OWORD *)&result->_previousNoDetectionPTS.value = v4;
    result->_previousNoDetectionPTS.epoch = v5;
    result->_lastDetectionCount = 0;
  }
  return result;
}

@end
