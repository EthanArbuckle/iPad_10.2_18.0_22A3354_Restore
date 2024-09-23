@implementation CRKIDSMessagePayload

- (CRKIDSMessagePayload)initWithMessageContent:(id)a3 messageMetadata:(id)a4
{
  id v6;
  id v7;
  CRKIDSMessagePayload *v8;
  uint64_t v9;
  NSDictionary *messageContent;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKIDSMessagePayload;
  v8 = -[CRKIDSMessagePayload init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    messageContent = v8->_messageContent;
    v8->_messageContent = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_messageMetadata, a4);
  }

  return v8;
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
  v8[0] = CFSTR("MessageContent");
  -[CRKIDSMessagePayload messageContent](self, "messageContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("MessageMetadata");
  v9[0] = v3;
  -[CRKIDSMessagePayload messageMetadata](self, "messageMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryValue");
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
  CRKIDSMessagePayload *v10;
  BOOL v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MessageContent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MessageMetadata"));
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
    +[CRKIDSMessageMetadata instanceWithDictionary:](CRKIDSMessageMetadata, "instanceWithDictionary:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v10 = -[CRKIDSMessagePayload initWithMessageContent:messageMetadata:]([CRKIDSMessagePayload alloc], "initWithMessageContent:messageMetadata:", v6, v12);
    else
      v10 = 0;

  }
  return v10;
}

- (CRKIDSMessageMetadata)messageMetadata
{
  return self->_messageMetadata;
}

- (NSDictionary)messageContent
{
  return self->_messageContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageContent, 0);
  objc_storeStrong((id *)&self->_messageMetadata, 0);
}

@end
