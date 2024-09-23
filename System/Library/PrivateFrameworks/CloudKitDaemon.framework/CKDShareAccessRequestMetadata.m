@implementation CKDShareAccessRequestMetadata

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKDPUserInformationRequestAccess)userInformationRequestAccess
{
  return self->_userInformationRequestAccess;
}

- (void)setUserInformationRequestAccess:(id)a3
{
  objc_storeStrong((id *)&self->_userInformationRequestAccess, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInformationRequestAccess, 0);
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end
