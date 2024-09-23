@implementation CATIDSMessageMetadata

- (CATIDSMessageMetadata)initWithMessageIdentifier:(id)a3 messageType:(int64_t)a4 messagingVersion:(int64_t)a5
{
  id v9;
  CATIDSMessageMetadata *v10;
  CATIDSMessageMetadata *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CATIDSMessageMetadata;
  v10 = -[CATIDSMessageMetadata init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageIdentifier, a3);
    v11->_messageType = a4;
    v11->_messagingVersion = a5;
  }

  return v11;
}

- (CATIDSMessageMetadata)initWithMessageType:(int64_t)a3
{
  void *v5;
  CATIDSMessageMetadata *v6;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CATIDSMessageMetadata initWithMessageIdentifier:messageType:messagingVersion:](self, "initWithMessageIdentifier:messageType:messagingVersion:", v5, a3, 2);

  return v6;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("MessageIdentifier");
  -[CATIDSMessageMetadata messageIdentifier](self, "messageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("ContentType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CATIDSMessageMetadata messageType](self, "messageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("MessagingVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CATIDSMessageMetadata messagingVersion](self, "messagingVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = CFSTR("MessageType");
  v10[2] = v6;
  v10[3] = &unk_24C1D8DE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  CATIDSMessageMetadata *v11;
  BOOL v12;

  v3 = a3;
  objc_msgSend(v3, "cat_uuidForKey:", CFSTR("MessageIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ContentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MessagingVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = 0;
  if (v4)
  {
    if (v7)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (!v12)
      v11 = -[CATIDSMessageMetadata initWithMessageIdentifier:messageType:messagingVersion:]([CATIDSMessageMetadata alloc], "initWithMessageIdentifier:messageType:messagingVersion:", v4, objc_msgSend(v7, "integerValue"), objc_msgSend(v10, "unsignedIntegerValue"));
  }

  return v11;
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (unint64_t)messagingVersion
{
  return self->_messagingVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end
