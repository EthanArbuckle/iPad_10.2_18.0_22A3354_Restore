@implementation CATIDSMessagePayload

- (CATIDSMessagePayload)initWithMessage:(id)a3
{
  id v4;
  CATIDSMessageMetadata *v5;
  CATIDSMessagePayload *v6;

  v4 = a3;
  v5 = -[CATIDSMessageMetadata initWithMessageType:]([CATIDSMessageMetadata alloc], "initWithMessageType:", objc_msgSend(v4, "messageType"));
  v6 = -[CATIDSMessagePayload initWithMetadata:message:](self, "initWithMetadata:message:", v5, v4);

  return v6;
}

- (CATIDSMessagePayload)initWithMetadata:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  CATIDSMessagePayload *v9;
  CATIDSMessagePayload *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATIDSMessagePayload;
  v9 = -[CATIDSMessagePayload init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_message, a4);
  }

  return v10;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("MessageMetadata");
  -[CATIDSMessagePayload metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("MessageContent");
  v9[0] = v4;
  -[CATIDSMessagePayload messageContent](self, "messageContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  CATIDSMessagePayload *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __objc2_class **v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MessageMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MessageContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = 0;
  if (v6)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    +[CATIDSMessageMetadata instanceWithDictionary:](CATIDSMessageMetadata, "instanceWithDictionary:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "messageType");
      if (v14 == 101)
      {
        v15 = off_24C1C43F0;
      }
      else
      {
        if (v14 != 102)
          goto LABEL_18;
        v15 = off_24C1C43A0;
      }
      -[__objc2_class instanceWithDictionary:](*v15, "instanceWithDictionary:", v9);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v10 = -[CATIDSMessagePayload initWithMetadata:message:]([CATIDSMessagePayload alloc], "initWithMetadata:message:", v13, v16);

LABEL_19:
        goto LABEL_20;
      }
    }
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
LABEL_20:

  return v10;
}

- (id)messageContent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CATIDSMessagePayload message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Catalyst"), CFSTR("Yo"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (CATIDSMessageMetadata)metadata
{
  return self->_metadata;
}

- (CATIDSMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
