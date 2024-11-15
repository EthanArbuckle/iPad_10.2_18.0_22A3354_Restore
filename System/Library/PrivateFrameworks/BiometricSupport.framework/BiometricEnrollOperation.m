@implementation BiometricEnrollOperation

- (BiometricEnrollOperation)init
{
  BiometricEnrollOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BiometricEnrollOperation;
  result = -[BiometricOperation init](&v3, sel_init);
  if (result)
    result->_userID = -1;
  return result;
}

- (int)type
{
  return 1;
}

- ($8DE116C3FB21CCD6F79AB3F71F0D566B)authData
{
  return ($8DE116C3FB21CCD6F79AB3F71F0D566B *)&self->_authData;
}

- (unsigned)cancelledMessage
{
  return 66;
}

- ($7287BE6C16BD8CBBAFC45DEB4D81687E)deviceGroup
{
  return ($7287BE6C16BD8CBBAFC45DEB4D81687E *)&self->_deviceGroup;
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (unsigned)processedFlags
{
  return self->_processedFlags;
}

- (void)setProcessedFlags:(unsigned int)a3
{
  self->_processedFlags = a3;
}

@end
