@implementation CSPreMyriadVoiceTriggerMetaData

- (CSPreMyriadVoiceTriggerMetaData)init
{
  CSPreMyriadVoiceTriggerMetaData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSPreMyriadVoiceTriggerMetaData;
  result = -[CSPreMyriadVoiceTriggerMetaData init](&v3, sel_init);
  if (result)
    result->_firstPassMyriadGoodnessScore = -1.0;
  return result;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (float)firstPassMyriadGoodnessScore
{
  return self->_firstPassMyriadGoodnessScore;
}

- (void)setFirstPassMyriadGoodnessScore:(float)a3
{
  self->_firstPassMyriadGoodnessScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end
