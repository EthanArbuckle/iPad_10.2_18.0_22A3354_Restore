@implementation ENTestResultPersistentSession

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)fetchedMetadata
{
  return self->_fetchedMetadata;
}

- (void)setFetchedMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)HMACKey
{
  return self->_HMACKey;
}

- (void)setHMACKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)revisionToken
{
  return self->_revisionToken;
}

- (void)setRevisionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)teks
{
  return self->_teks;
}

- (void)setTeks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)verificationError
{
  return self->_verificationError;
}

- (void)setVerificationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)verificationToken
{
  return self->_verificationToken;
}

- (void)setVerificationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationToken, 0);
  objc_storeStrong((id *)&self->_verificationError, 0);
  objc_storeStrong((id *)&self->_teks, 0);
  objc_storeStrong((id *)&self->_revisionToken, 0);
  objc_storeStrong((id *)&self->_HMACKey, 0);
  objc_storeStrong((id *)&self->_fetchedMetadata, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
