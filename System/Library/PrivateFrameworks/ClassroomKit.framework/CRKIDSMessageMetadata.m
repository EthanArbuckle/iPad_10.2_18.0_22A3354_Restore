@implementation CRKIDSMessageMetadata

- (CRKIDSMessageMetadata)initWithMessageIdentifier:(id)a3 messageType:(int64_t)a4 messagingVersion:(int64_t)a5
{
  id v9;
  CRKIDSMessageMetadata *v10;
  CRKIDSMessageMetadata *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKIDSMessageMetadata;
  v10 = -[CRKIDSMessageMetadata init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageIdentifier, a3);
    v11->_messageType = a4;
    v11->_messagingVersion = a5;
  }

  return v11;
}

+ (CRKIDSMessageMetadata)metadataWithMessageType:(int64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageIdentifier:messageType:messagingVersion:", v5, a3, 1);

  return (CRKIDSMessageMetadata *)v6;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("MessageIdentifier");
  -[CRKIDSMessageMetadata messageIdentifier](self, "messageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("MessageType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKIDSMessageMetadata messageType](self, "messageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("MessagingVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRKIDSMessageMetadata messagingVersion](self, "messagingVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MessageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MessageIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MessagingVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = 0;
  if (v7 && v10 && v13)
  {
    v15 = objc_msgSend(v7, "integerValue");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
    v17 = objc_msgSend(v13, "integerValue");
    v14 = 0;
    if (v16 && (v15 & 0x8000000000000000) == 0 && v15 <= 2)
      v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageIdentifier:messageType:messagingVersion:", v16, v15, v17);

  }
  return v14;
}

- (NSUUID)messageIdentifier
{
  return self->_messageIdentifier;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (int64_t)messagingVersion
{
  return self->_messagingVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end
