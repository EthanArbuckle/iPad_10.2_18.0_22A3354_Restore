@implementation NGMPrekeySignatureFormatter

- (id)initToSignKey:(id)a3
{
  id v4;
  NGMPrekeySignatureFormatter *v5;
  void *v6;
  double v7;
  NGMPrekeySignatureFormatter *v8;
  uint64_t v9;
  NSData *prekeyPublic;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMPrekeySignatureFormatter;
  v5 = -[NGMPrekeySignatureFormatter init](&v12, sel_init);
  if (!v5)
    goto LABEL_5;
  +[NGMTimeBasedEvaluations nowDate](NGMTimeBasedEvaluations, "nowDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v5->_timestamp = v7;

  if (v5->_timestamp >= 1680101200.0)
  {
    objc_msgSend(v4, "dataRepresentation");
    v9 = objc_claimAutoreleasedReturnValue();
    prekeyPublic = v5->_prekeyPublic;
    v5->_prekeyPublic = (NSData *)v9;

LABEL_5:
    v8 = v5;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (NGMPrekeySignatureFormatter)initWithPublicPrekey:(id)a3
{
  id v4;
  NGMPrekeySignatureFormatter *v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSData *prekeyPublic;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NGMPrekeySignatureFormatter;
  v5 = -[NGMPrekeySignatureFormatter init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v6;
    objc_msgSend(v4, "dhKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataRepresentation");
    v8 = objc_claimAutoreleasedReturnValue();
    prekeyPublic = v5->_prekeyPublic;
    v5->_prekeyPublic = (NSData *)v8;

  }
  return v5;
}

- (id)signedData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  -[NGMPrekeySignatureFormatter timestamp](self, "timestamp");
  v10 = v3;
  v4 = (void *)MEMORY[0x24BDBCEC8];
  objc_msgSend(CFSTR("NGMPrekeySignature"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NGMPrekeySignatureFormatter prekeyPublic](self, "prekeyPublic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v10, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v8);

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSData)prekeyPublic
{
  return self->_prekeyPublic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prekeyPublic, 0);
}

@end
