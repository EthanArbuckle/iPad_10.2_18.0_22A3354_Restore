@implementation HAP2EncodedResponseThread

- (HAP2EncodedResponseThread)initWithBTLEResponse:(id)a3
{
  id v5;
  HAP2EncodedResponseThread *v6;
  HAP2EncodedResponseThread *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2EncodedResponseThread;
  v6 = -[HAP2EncodedResponseThread init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_btleResponse, a3);

  return v7;
}

- (BOOL)isEncrypted
{
  void *v2;
  char v3;

  -[HAP2EncodedResponseThread btleResponse](self, "btleResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEncrypted");

  return v3;
}

- (HAPBTLEResponse)btleResponse
{
  return self->_btleResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btleResponse, 0);
}

@end
