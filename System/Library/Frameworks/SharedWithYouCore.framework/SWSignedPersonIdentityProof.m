@implementation SWSignedPersonIdentityProof

- (SWSignedPersonIdentityProof)initWithPersonIdentityProof:(SWPersonIdentityProof *)personIdentityProof signatureData:(NSData *)data
{
  NSData *v7;
  SWPersonIdentityProof *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SWSignedPersonIdentityProof *v12;

  v7 = data;
  v8 = personIdentityProof;
  -[SWPersonIdentityProof inclusionHashes](v8, "inclusionHashes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWPersonIdentityProof publicKey](v8, "publicKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SWPersonIdentityProof publicKeyIndex](v8, "publicKeyIndex");

  v12 = -[SWPersonIdentityProof initWithInclusionHashes:publicKey:localKeyIndex:](self, "initWithInclusionHashes:publicKey:localKeyIndex:", v9, v10, v11);
  if (v12)
    objc_storeStrong((id *)&v12->_signatureData, data);

  return v12;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureData, 0);
}

@end
