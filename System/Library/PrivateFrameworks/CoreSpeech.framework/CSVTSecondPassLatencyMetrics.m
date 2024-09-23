@implementation CSVTSecondPassLatencyMetrics

- (unint64_t)secondPassAssetQueryStartTime
{
  return self->_secondPassAssetQueryStartTime;
}

- (void)setSecondPassAssetQueryStartTime:(unint64_t)a3
{
  self->_secondPassAssetQueryStartTime = a3;
}

- (unint64_t)secondPassAssetQueryCompleteTime
{
  return self->_secondPassAssetQueryCompleteTime;
}

- (void)setSecondPassAssetQueryCompleteTime:(unint64_t)a3
{
  self->_secondPassAssetQueryCompleteTime = a3;
}

- (unint64_t)secondPassAssetLoadStartTime
{
  return self->_secondPassAssetLoadStartTime;
}

- (void)setSecondPassAssetLoadStartTime:(unint64_t)a3
{
  self->_secondPassAssetLoadStartTime = a3;
}

- (unint64_t)secondPassAssetLoadCompleteTime
{
  return self->_secondPassAssetLoadCompleteTime;
}

- (void)setSecondPassAssetLoadCompleteTime:(unint64_t)a3
{
  self->_secondPassAssetLoadCompleteTime = a3;
}

- (unint64_t)secondPassAudioStreamStartTime
{
  return self->_secondPassAudioStreamStartTime;
}

- (void)setSecondPassAudioStreamStartTime:(unint64_t)a3
{
  self->_secondPassAudioStreamStartTime = a3;
}

- (unint64_t)secondPassAudioStreamReadyTime
{
  return self->_secondPassAudioStreamReadyTime;
}

- (void)setSecondPassAudioStreamReadyTime:(unint64_t)a3
{
  self->_secondPassAudioStreamReadyTime = a3;
}

- (unint64_t)secondPassFirstAudioPacketReceptionTime
{
  return self->_secondPassFirstAudioPacketReceptionTime;
}

- (void)setSecondPassFirstAudioPacketReceptionTime:(unint64_t)a3
{
  self->_secondPassFirstAudioPacketReceptionTime = a3;
}

- (unint64_t)secondPassLastAudioPacketReceptionTime
{
  return self->_secondPassLastAudioPacketReceptionTime;
}

- (void)setSecondPassLastAudioPacketReceptionTime:(unint64_t)a3
{
  self->_secondPassLastAudioPacketReceptionTime = a3;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionStartTime
{
  return self->_secondPassCheckerModelKeywordDetectionStartTime;
}

- (void)setSecondPassCheckerModelKeywordDetectionStartTime:(unint64_t)a3
{
  self->_secondPassCheckerModelKeywordDetectionStartTime = a3;
}

- (unint64_t)secondPassCheckerModelKeywordDetectionEndTime
{
  return self->_secondPassCheckerModelKeywordDetectionEndTime;
}

- (void)setSecondPassCheckerModelKeywordDetectionEndTime:(unint64_t)a3
{
  self->_secondPassCheckerModelKeywordDetectionEndTime = a3;
}

@end
