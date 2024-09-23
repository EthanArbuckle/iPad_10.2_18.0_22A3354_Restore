@implementation NPKIDVRemoteDeviceCredentialPreflightStatus

- (NPKIDVRemoteDeviceCredentialPreflightStatus)initWithCredentialType:(unint64_t)a3 provisionedPassesCount:(unint64_t)a4 preflightSuccessful:(BOOL)a5
{
  NPKIDVRemoteDeviceCredentialPreflightStatus *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NPKIDVRemoteDeviceCredentialPreflightStatus;
  result = -[NPKIDVRemoteDeviceCredentialPreflightStatus init](&v9, sel_init);
  if (result)
  {
    result->_credentialType = a3;
    result->_provisionedPassesCount = a4;
    result->_preflightSuccessful = a5;
  }
  return result;
}

- (NPKIDVRemoteDeviceCredentialPreflightStatus)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialType"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provisionedPassesCount"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preflightSuccessful"));

  return -[NPKIDVRemoteDeviceCredentialPreflightStatus initWithCredentialType:provisionedPassesCount:preflightSuccessful:](self, "initWithCredentialType:provisionedPassesCount:preflightSuccessful:", v5, v6, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t credentialType;
  id v5;

  credentialType = self->_credentialType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", credentialType, CFSTR("credentialType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_provisionedPassesCount, CFSTR("provisionedPassesCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_preflightSuccessful, CFSTR("preflightSuccessful"));

}

- (unint64_t)credentialType
{
  return self->_credentialType;
}

- (unint64_t)provisionedPassesCount
{
  return self->_provisionedPassesCount;
}

- (BOOL)preflightSuccessful
{
  return self->_preflightSuccessful;
}

@end
