@implementation NPKExpressUWBTransactionInfo

- (NPKExpressUWBTransactionInfo)initWithReaderID:(id)a3 lockStatus:(id)a4 timestamp:(id)a5
{
  id v9;
  id v10;
  id v11;
  NPKExpressUWBTransactionInfo *v12;
  NPKExpressUWBTransactionInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NPKExpressUWBTransactionInfo;
  v12 = -[NPKExpressUWBTransactionInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readerID, a3);
    objc_storeStrong((id *)&v13->_lockStatus, a4);
    objc_storeStrong((id *)&v13->_timestamp, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NPKExpressUWBTransactionInfo readerID](self, "readerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKExpressUWBTransactionInfo lockStatus](self, "lockStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKExpressUWBTransactionInfo timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n\treaderID: %@\n\tlockStatus: %@\n\ttimestamp: %@\n>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)readerID
{
  return self->_readerID;
}

- (NSNumber)lockStatus
{
  return self->_lockStatus;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_lockStatus, 0);
  objc_storeStrong((id *)&self->_readerID, 0);
}

@end
