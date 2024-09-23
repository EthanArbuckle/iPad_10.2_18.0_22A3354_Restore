@implementation MPStatusKitMessage

- (MPStatusKitMessage)initWithIndex:(unsigned __int16)a3 encryptedMessage:(id)a4 signature:(id)a5
{
  id v9;
  id v10;
  MPStatusKitMessage *v11;
  MPStatusKitMessage *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPStatusKitMessage;
  v11 = -[MPStatusKitMessage init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_index = a3;
    objc_storeStrong((id *)&v11->_encryptedMessage, a4);
    objc_storeStrong((id *)&v12->_signature, a5);
  }

  return v12;
}

- (unsigned)index
{
  return self->_index;
}

- (NSData)encryptedMessage
{
  return self->_encryptedMessage;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_encryptedMessage, 0);
}

@end
