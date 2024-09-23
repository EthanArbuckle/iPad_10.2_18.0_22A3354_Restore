@implementation IDSTransactionLogDataMessage

- (IDSTransactionLogDataMessage)initWithData:(id)a3 accountUniqueID:(id)a4 fromID:(id)a5 loginID:(id)a6 serviceName:(id)a7
{
  id v13;
  id *v14;
  IDSTransactionLogDataMessage *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSTransactionLogDataMessage;
  v14 = -[IDSTransactionLogMessage _initWithAccountUniqueID:fromID:loginID:serviceName:](&v17, sel__initWithAccountUniqueID_fromID_loginID_serviceName_, a4, a5, a6, a7);
  v15 = (IDSTransactionLogDataMessage *)v14;
  if (v14)
    objc_storeStrong(v14 + 5, a3);

  return v15;
}

- (IDSTransactionLogDataMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  IDSTransactionLogDataMessage *v5;
  uint64_t v6;
  NSData *dataValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSTransactionLogDataMessage;
  v5 = -[IDSTransactionLogMessage initWithDictionaryRepresentation:](&v9, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageDataValueKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    dataValue = v5->_dataValue;
    v5->_dataValue = (NSData *)v6;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  -[IDSTransactionLogMessage _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSTransactionLogDataMessage dataValue](self, "dataValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IDSTransactionLogDataMessage dataValue](self, "dataValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("IDSTransactionLogMessageDataValueKey"));

  }
  return v3;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end
