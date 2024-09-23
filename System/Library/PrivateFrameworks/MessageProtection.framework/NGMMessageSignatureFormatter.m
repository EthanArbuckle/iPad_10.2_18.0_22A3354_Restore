@implementation NGMMessageSignatureFormatter

- (NGMMessageSignatureFormatter)initWithDHOutput:(id)a3 prekeyPub:(id)a4 ephemeralPub:(id)a5 recipientPub:(id)a6 ciphertext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NGMMessageSignatureFormatter *v17;
  NGMMessageSignatureFormatter *v18;
  objc_super v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v16, "appendData:", v15);

  objc_msgSend(v16, "appendData:", v14);
  objc_msgSend(v16, "appendData:", v13);

  objc_msgSend(v16, "appendData:", v12);
  v20.receiver = self;
  v20.super_class = (Class)NGMMessageSignatureFormatter;
  v17 = -[NGMMessageSignatureFormatter init](&v20, sel_init);
  v18 = v17;
  if (v17)
    objc_storeStrong((id *)&v17->_formattedSignedData, v16);

  return v18;
}

- (id)signedData
{
  return self->_formattedSignedData;
}

- (NSData)formattedSignedData
{
  return self->_formattedSignedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedSignedData, 0);
}

@end
