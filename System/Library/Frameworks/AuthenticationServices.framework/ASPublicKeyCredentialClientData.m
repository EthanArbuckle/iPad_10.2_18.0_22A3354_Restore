@implementation ASPublicKeyCredentialClientData

- (ASPublicKeyCredentialClientData)initWithChallenge:(NSData *)challenge origin:(NSString *)origin
{
  NSData *v6;
  NSString *v7;
  ASPublicKeyCredentialClientData *v8;
  uint64_t v9;
  NSData *v10;
  uint64_t v11;
  NSString *v12;
  ASPublicKeyCredentialClientData *v13;
  objc_super v15;

  v6 = challenge;
  v7 = origin;
  v15.receiver = self;
  v15.super_class = (Class)ASPublicKeyCredentialClientData;
  v8 = -[ASPublicKeyCredentialClientData init](&v15, sel_init);
  if (v8)
  {
    v9 = -[NSData copy](v6, "copy");
    v10 = v8->_challenge;
    v8->_challenge = (NSData *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_origin;
    v8->_origin = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)jsonForOperationType:(int64_t)a3
{
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFA9C0], "getClientDataJSONWithTopOrigin:challenge:origin:topOrigin:crossOrigin:", a3, self->_challenge, self->_origin, self->_topOrigin, self->_crossOrigin == 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(NSData *)challenge
{
  objc_storeStrong((id *)&self->_challenge, challenge);
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(NSString *)origin
{
  objc_storeStrong((id *)&self->_origin, origin);
}

- (NSString)topOrigin
{
  return self->_topOrigin;
}

- (void)setTopOrigin:(NSString *)topOrigin
{
  objc_storeStrong((id *)&self->_topOrigin, topOrigin);
}

- (ASPublicKeyCredentialClientDataCrossOriginValue)crossOrigin
{
  return self->_crossOrigin;
}

- (void)setCrossOrigin:(ASPublicKeyCredentialClientDataCrossOriginValue)crossOrigin
{
  self->_crossOrigin = crossOrigin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topOrigin, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
