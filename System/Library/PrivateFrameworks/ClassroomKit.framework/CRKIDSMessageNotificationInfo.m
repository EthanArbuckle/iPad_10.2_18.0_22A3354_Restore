@implementation CRKIDSMessageNotificationInfo

- (CRKIDSMessageNotificationInfo)initWithMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKIDSMessageNotificationInfo *v11;
  uint64_t v12;
  NSDictionary *message;
  uint64_t v14;
  NSString *senderAppleID;
  uint64_t v16;
  NSString *senderAddress;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRKIDSMessageNotificationInfo;
  v11 = -[CRKIDSMessageNotificationInfo init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    message = v11->_message;
    v11->_message = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    senderAppleID = v11->_senderAppleID;
    v11->_senderAppleID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    senderAddress = v11->_senderAddress;
    v11->_senderAddress = (NSString *)v16;

  }
  return v11;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("Message");
  -[CRKIDSMessageNotificationInfo message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("SenderAppleID");
  -[CRKIDSMessageNotificationInfo senderAppleID](self, "senderAppleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("SenderAddress");
  -[CRKIDSMessageNotificationInfo senderAddress](self, "senderAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKIDSMessageNotificationInfo instanceWithDictionary:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("CRKListenForIDSMessagesRequest.m"), 56, CFSTR("expected %@, got %@"), v13, v15);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SenderAppleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKIDSMessageNotificationInfo instanceWithDictionary:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("CRKListenForIDSMessagesRequest.m"), 57, CFSTR("expected %@, got %@"), v19, v21);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SenderAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKIDSMessageNotificationInfo instanceWithDictionary:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("CRKListenForIDSMessagesRequest.m"), 58, CFSTR("expected %@, got %@"), v25, v27);

  }
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:senderAppleID:senderAddress:", v5, v6, v7);

  return v8;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)senderAppleID
{
  return self->_senderAppleID;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_senderAppleID, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
