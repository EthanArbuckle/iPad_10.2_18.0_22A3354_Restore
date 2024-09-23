@implementation ECDKIMVerifiableMessage

- (ECDKIMVerifiableMessage)initWithHeaders:(id)a3 bodyData:(id)a4
{
  id v7;
  id v8;
  ECDKIMVerifiableMessage *v9;
  ECDKIMVerifiableMessage *v10;
  uint64_t v11;
  NSData *bodyData;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ECDKIMVerifiableMessage;
  v9 = -[ECDKIMVerifiableMessage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_headers, a3);
    v11 = objc_msgSend(v8, "copy");
    bodyData = v10->_bodyData;
    v10->_bodyData = (NSData *)v11;

  }
  return v10;
}

- (ECRawMessageHeaders)headers
{
  return self->_headers;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
