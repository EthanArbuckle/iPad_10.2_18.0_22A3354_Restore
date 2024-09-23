@implementation IMSPISimulatedMessage

- (id)_calculateSender
{
  void *v3;
  void *v4;
  void *v5;

  if (-[IMSPISimulatedMessage fromMe](self, "fromMe"))
  {
    v3 = 0;
  }
  else
  {
    -[IMSPISimulatedMessage sender](self, "sender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[IMSPISimulatedMessage sender](self, "sender");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[IMSPISimulatedMessage handles](self, "handles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)_calculateServiceName
{
  void *v2;
  void *v3;
  id v4;

  -[IMSPISimulatedMessage serviceName](self, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)*MEMORY[0x1E0D38F58];
  v4 = v2;

  return v4;
}

- (id)_createItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[IMSPISimulatedMessage _calculateSender](self, "_calculateSender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D39918]);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSender:time:guid:type:", v3, v5, v6, 0);

  -[IMSPISimulatedMessage _calculateServiceName](self, "_calculateServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setService:", v8);

  if (-[IMSPISimulatedMessage fromMe](self, "fromMe"))
  {
    objc_msgSend(v7, "setFlags:", objc_msgSend(v7, "flags") | 4);
    objc_msgSend(v7, "setFlags:", objc_msgSend(v7, "flags") | 0x8000);
  }
  -[IMSPISimulatedMessage accountID](self, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountID:", v9);

  objc_msgSend(v7, "setFlags:", objc_msgSend(v7, "flags") | 1);
  objc_msgSend(v7, "setFlags:", objc_msgSend(v7, "flags") & 0xFFFFFFFFFFFFFFF7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B50]), "initWithContent:", &stru_1E4725068);
  -[IMSPISimulatedMessage text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v11);

  objc_msgSend(v10, "body");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBody:", v12);

  objc_msgSend(v10, "body");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlainBody:", v14);

  -[IMSPISimulatedMessage lastAddressedHandle](self, "lastAddressedHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDestinationCallerID:", v15);

  return v7;
}

- (id)_createSimulatedMessage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0D39AF0]);
  -[IMSPISimulatedMessage _createItem](self, "_createItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItem:", v4);

  -[IMSPISimulatedMessage groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupID:", v5);

  -[IMSPISimulatedMessage chatGUID](self, "chatGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChatGUID:", v6);

  -[IMSPISimulatedMessage handles](self, "handles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandles:", v7);

  -[IMSPISimulatedMessage lastAddressedHandle](self, "lastAddressedHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastAddressedHandle:", v8);

  return v3;
}

- (IMSPISimulatedMessage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSPISimulatedMessage;
  return -[IMSPISimulatedMessage init](&v3, sel_init);
}

- (IMSPISimulatedMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  IMSPISimulatedMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[IMSPISimulatedMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setText:](v5, "setText:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sender"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setSender:](v5, "setSender:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serviceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setServiceName:](v5, "setServiceName:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setAccountID:](v5, "setAccountID:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fromMe"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setFromMe:](v5, "setFromMe:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chatGUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setChatGUID:](v5, "setChatGUID:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setGroupID:](v5, "setGroupID:", v12);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handles"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setHandles:](v5, "setHandles:", v13);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastAddressedHandle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSPISimulatedMessage setLastAddressedHandle:](v5, "setLastAddressedHandle:", v14);

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMSPISimulatedMessage text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IMSPISimulatedMessage text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("text"));

  }
  -[IMSPISimulatedMessage sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IMSPISimulatedMessage sender](self, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sender"));

  }
  -[IMSPISimulatedMessage serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IMSPISimulatedMessage serviceName](self, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("serviceName"));

  }
  -[IMSPISimulatedMessage accountID](self, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[IMSPISimulatedMessage accountID](self, "accountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("accountID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMSPISimulatedMessage fromMe](self, "fromMe"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("fromMe"));

  -[IMSPISimulatedMessage chatGUID](self, "chatGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[IMSPISimulatedMessage chatGUID](self, "chatGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("chatGUID"));

  }
  -[IMSPISimulatedMessage groupID](self, "groupID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[IMSPISimulatedMessage groupID](self, "groupID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("groupID"));

  }
  -[IMSPISimulatedMessage handles](self, "handles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[IMSPISimulatedMessage handles](self, "handles");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("handles"));

  }
  -[IMSPISimulatedMessage lastAddressedHandle](self, "lastAddressedHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[IMSPISimulatedMessage lastAddressedHandle](self, "lastAddressedHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("lastAddressedHandle"));

  }
  v21 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v21;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
  objc_storeStrong((id *)&self->_chatGUID, a3);
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (void)setLastAddressedHandle:(id)a3
{
  objc_storeStrong((id *)&self->_lastAddressedHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
