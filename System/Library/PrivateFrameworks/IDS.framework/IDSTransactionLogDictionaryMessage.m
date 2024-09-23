@implementation IDSTransactionLogDictionaryMessage

- (IDSTransactionLogDictionaryMessage)initWithDictionary:(id)a3 accountUniqueID:(id)a4 fromID:(id)a5 loginID:(id)a6 serviceName:(id)a7
{
  id v13;
  id *v14;
  IDSTransactionLogDictionaryMessage *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSTransactionLogDictionaryMessage;
  v14 = -[IDSTransactionLogMessage _initWithAccountUniqueID:fromID:loginID:serviceName:](&v17, sel__initWithAccountUniqueID_fromID_loginID_serviceName_, a4, a5, a6, a7);
  v15 = (IDSTransactionLogDictionaryMessage *)v14;
  if (v14)
    objc_storeStrong(v14 + 5, a3);

  return v15;
}

- (IDSTransactionLogDictionaryMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  IDSTransactionLogDictionaryMessage *v5;
  uint64_t v6;
  NSDictionary *dictionaryValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSTransactionLogDictionaryMessage;
  v5 = -[IDSTransactionLogMessage initWithDictionaryRepresentation:](&v9, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSTransactionLogMessageDictionaryValueKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    dictionaryValue = v5->_dictionaryValue;
    v5->_dictionaryValue = (NSDictionary *)v6;

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
  -[IDSTransactionLogDictionaryMessage dictionaryValue](self, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IDSTransactionLogDictionaryMessage dictionaryValue](self, "dictionaryValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("IDSTransactionLogMessageDictionaryValueKey"));

  }
  return v3;
}

- (NSDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
}

@end
