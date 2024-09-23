@implementation NGMGelatoPresenceSignatureFormatter

- (NGMGelatoPresenceSignatureFormatter)initWithApplicationData:(id)a3
{
  id v4;
  NGMGelatoPresenceSignatureFormatter *v5;
  void *v6;
  NSData *v7;
  NSData *v8;
  NSData *signedData;
  NGMGelatoPresenceSignatureFormatter *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMGelatoPresenceSignatureFormatter;
  v5 = -[NGMGelatoPresenceSignatureFormatter init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(CFSTR("com.apple.SharedWithYou.Presence"), "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v4, "length") + objc_msgSend(v6, "length"));
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {

      v10 = 0;
      goto LABEL_6;
    }
    v8 = v7;
    -[NSData appendData:](v7, "appendData:", v6);
    -[NSData appendData:](v8, "appendData:", v4);
    signedData = v5->_signedData;
    v5->_signedData = v8;

  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
  objc_storeStrong((id *)&self->_signedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedData, 0);
}

@end
