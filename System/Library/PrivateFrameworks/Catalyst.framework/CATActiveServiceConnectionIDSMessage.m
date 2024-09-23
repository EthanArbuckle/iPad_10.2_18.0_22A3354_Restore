@implementation CATActiveServiceConnectionIDSMessage

- (CATActiveServiceConnectionIDSMessage)initWithConnectionIdentifier:(id)a3 receivedSequenceNumber:(id)a4 content:(id)a5
{
  id v9;
  id v10;
  id v11;
  CATActiveServiceConnectionIDSMessage *v12;
  CATActiveServiceConnectionIDSMessage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CATActiveServiceConnectionIDSMessage;
  v12 = -[CATActiveServiceConnectionIDSMessage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connectionIdentifier, a3);
    objc_storeStrong((id *)&v13->_receivedSequenceNumber, a4);
    objc_storeStrong((id *)&v13->_content, a5);
  }

  return v13;
}

- (int64_t)messageType
{
  return 102;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[CATActiveServiceConnectionIDSMessage connectionIdentifier](self, "connectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ConnectionIdentifier"));

  -[CATActiveServiceConnectionIDSMessage content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Content"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[CATActiveServiceConnectionIDSMessage content](self, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "contentType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ContentType"));

  -[CATActiveServiceConnectionIDSMessage receivedSequenceNumber](self, "receivedSequenceNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ReceivedSequenceNumber"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "cat_uuidForKey:", CFSTR("ConnectionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContentType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReceivedSequenceNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = 0;
  if (v5 && v8 && v11)
  {
    v16 = objc_msgSend(v11, "integerValue");
    if ((unint64_t)(v16 - 1) <= 5
      && (-[__objc2_class instanceWithDictionary:](*off_24C1C5B78[v16 - 1], "instanceWithDictionary:", v8),
          (v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = (void *)v17;
      v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnectionIdentifier:receivedSequenceNumber:content:", v5, v14, v17);

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSNumber)receivedSequenceNumber
{
  return self->_receivedSequenceNumber;
}

- (CATActiveIDSServiceConnectionMessageContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_receivedSequenceNumber, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end
