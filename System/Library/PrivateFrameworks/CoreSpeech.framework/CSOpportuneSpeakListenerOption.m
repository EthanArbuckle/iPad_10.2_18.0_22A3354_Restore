@implementation CSOpportuneSpeakListenerOption

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (unint64_t)opportuneSpeakListeningType
{
  return self->_opportuneSpeakListeningType;
}

- (void)setOpportuneSpeakListeningType:(unint64_t)a3
{
  self->_opportuneSpeakListeningType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end
