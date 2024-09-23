@implementation IDSSocketPairEncryptedMessage

- (IDSSocketPairEncryptedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSSocketPairEncryptedMessage;
  return -[IDSSocketPairMessage initWithCommand:underlyingData:](&v5, sel_initWithCommand_underlyingData_, a3, a4);
}

- (IDSSocketPairEncryptedMessage)initWithData:(id)a3
{
  id v5;
  IDSSocketPairEncryptedMessage *v6;
  IDSSocketPairEncryptedMessage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSSocketPairEncryptedMessage;
  v6 = -[IDSSocketPairEncryptedMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (unsigned)command
{
  return 5;
}

- (NSData)data
{
  uint64_t v2;
  double v3;
  NSData *data;

  data = self->_data;
  if (data)
    return data;
  objc_msgSend__existingUnderlyingData(self, a2, v2, v3);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
