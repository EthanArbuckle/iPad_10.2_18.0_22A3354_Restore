@implementation ACCHWComponentAuthServiceParams

- (unsigned)moduleAuthService
{
  return self->_moduleAuthService;
}

- (void)setModuleAuthService:(unsigned int)a3
{
  self->_moduleAuthService = a3;
}

- (unsigned)authFlags
{
  return self->_authFlags;
}

- (void)setAuthFlags:(unsigned int)a3
{
  self->_authFlags = a3;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSData)deviceNonce
{
  return self->_deviceNonce;
}

- (void)setDeviceNonce:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNonce, a3);
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSDictionary)certificateInfo
{
  return self->_certificateInfo;
}

- (void)setCertificateInfo:(id)a3
{
  objc_storeStrong((id *)&self->_certificateInfo, a3);
}

- (BOOL)skipComms
{
  return self->_skipComms;
}

- (void)setSkipComms:(BOOL)a3
{
  self->_skipComms = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateInfo, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_deviceNonce, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
