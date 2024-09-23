@implementation CBSpatialInteractionPeerInfoClient

- (unsigned)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(unsigned int)a3
{
  self->_peerID = a3;
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)uwbTokenFlags
{
  return self->_uwbTokenFlags;
}

- (void)setUwbTokenFlags:(unsigned int)a3
{
  self->_uwbTokenFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_tokenData, 0);
}

@end
