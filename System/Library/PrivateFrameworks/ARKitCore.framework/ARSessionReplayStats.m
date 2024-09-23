@implementation ARSessionReplayStats

- (NSString)arkitVersion
{
  if (self->_arkitVersion)
    return self->_arkitVersion;
  else
    return (NSString *)&stru_1E6676798;
}

- (NSString)fileName
{
  if (self->_fileName)
    return self->_fileName;
  else
    return (NSString *)&stru_1E6676798;
}

- (NSString)deviceModel
{
  if (self->_deviceModel)
    return self->_deviceModel;
  else
    return (NSString *)&stru_1E6676798;
}

- (NSString)osVersion
{
  if (self->_osVersion)
    return self->_osVersion;
  else
    return (NSString *)&stru_1E6676798;
}

- (int)recordingFormat
{
  return self->_recordingFormat;
}

- (void)setRecordingFormat:(int)a3
{
  self->_recordingFormat = a3;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (void)setArkitVersion:(id)a3
{
  objc_storeStrong((id *)&self->_arkitVersion, a3);
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (unint64_t)recordedSensorTypes
{
  return self->_recordedSensorTypes;
}

- (void)setRecordedSensorTypes:(unint64_t)a3
{
  self->_recordedSensorTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_arkitVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
