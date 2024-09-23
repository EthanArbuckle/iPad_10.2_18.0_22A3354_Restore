@implementation CKFetchTranscodeServerPublicKeyOperationInfo

- (NSString)transcodeServerHostname
{
  return self->_transcodeServerHostname;
}

- (void)setTranscodeServerHostname:(id)a3
{
  objc_storeStrong((id *)&self->_transcodeServerHostname, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcodeServerHostname, 0);
}

@end
