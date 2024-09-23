@implementation ECDKIMVerificationContext

- (ECDKIMVerificationContext)initWithVerifiableMessage:(id)a3 dkimSignatureHeaders:(id)a4
{
  id v7;
  id v8;
  ECDKIMVerificationContext *v9;
  ECDKIMVerificationContext *v10;
  uint64_t v11;
  NSArray *dkimSignatureHeaders;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ECDKIMVerificationContext;
  v9 = -[ECDKIMVerificationContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_verifiableMessage, a3);
    v11 = objc_msgSend(v8, "copy");
    dkimSignatureHeaders = v10->_dkimSignatureHeaders;
    v10->_dkimSignatureHeaders = (NSArray *)v11;

  }
  return v10;
}

- (ECRawMessageHeaders)headers
{
  void *v2;
  void *v3;

  -[ECDKIMVerificationContext verifiableMessage](self, "verifiableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ECRawMessageHeaders *)v3;
}

- (NSData)bodyData
{
  void *v2;
  void *v3;

  -[ECDKIMVerificationContext verifiableMessage](self, "verifiableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)removeDKIMSignatureHeaders:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v4 = (void *)-[NSArray mutableCopy](self->_dkimSignatureHeaders, "mutableCopy");
    objc_msgSend(v4, "removeObjectsInArray:", v5);
    -[ECDKIMVerificationContext setDkimSignatureHeaders:](self, "setDkimSignatureHeaders:", v4);

  }
}

- (NSArray)dkimSignatureHeaders
{
  return self->_dkimSignatureHeaders;
}

- (void)setDkimSignatureHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)requireFullBodySignature
{
  return self->_requireFullBodySignature;
}

- (void)setRequireFullBodySignature:(BOOL)a3
{
  self->_requireFullBodySignature = a3;
}

- (ECDKIMVerifiableMessage)verifiableMessage
{
  return self->_verifiableMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiableMessage, 0);
  objc_storeStrong((id *)&self->_dkimSignatureHeaders, 0);
}

@end
