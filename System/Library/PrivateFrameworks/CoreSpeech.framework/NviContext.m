@implementation NviContext

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{isVT=%d, requestHistoricalAudio=%d, reqStartAudioSampleId=%lu, reqStartMachAbsTime=%llu}"), self->_voiceTriggerInfo != 0, self->_requestHistoricalAudio, self->_reqStartAudioSampleId, self->_reqStartMachAbsTime);
}

- (NSDictionary)voiceTriggerInfo
{
  return self->_voiceTriggerInfo;
}

- (void)setVoiceTriggerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerInfo, a3);
}

- (BOOL)requestHistoricalAudio
{
  return self->_requestHistoricalAudio;
}

- (void)setRequestHistoricalAudio:(BOOL)a3
{
  self->_requestHistoricalAudio = a3;
}

- (unint64_t)reqStartAudioSampleId
{
  return self->_reqStartAudioSampleId;
}

- (void)setReqStartAudioSampleId:(unint64_t)a3
{
  self->_reqStartAudioSampleId = a3;
}

- (unint64_t)reqStartMachAbsTime
{
  return self->_reqStartMachAbsTime;
}

- (void)setReqStartMachAbsTime:(unint64_t)a3
{
  self->_reqStartMachAbsTime = a3;
}

- (BOOL)shouldLogRawSensorData
{
  return self->_shouldLogRawSensorData;
}

- (void)setShouldLogRawSensorData:(BOOL)a3
{
  self->_shouldLogRawSensorData = a3;
}

- (NSString)rootLogDir
{
  return self->_rootLogDir;
}

- (void)setRootLogDir:(id)a3
{
  objc_storeStrong((id *)&self->_rootLogDir, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootLogDir, 0);
  objc_storeStrong((id *)&self->_voiceTriggerInfo, 0);
}

@end
