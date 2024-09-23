@implementation IMSimulatedMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMSimulatedMessage item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("item"));

  -[IMSimulatedMessage groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupID"));

  -[IMSimulatedMessage chatGUID](self, "chatGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("chatGUID"));

  -[IMSimulatedMessage handles](self, "handles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("handles"));

  -[IMSimulatedMessage lastAddressedHandle](self, "lastAddressedHandle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lastAddressedHandle"));

}

- (IMSimulatedMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("item"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSimulatedMessage setItem:](self, "setItem:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSimulatedMessage setGroupID:](self, "setGroupID:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chatGUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSimulatedMessage setChatGUID:](self, "setChatGUID:", v7);

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("handles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSimulatedMessage setHandles:](self, "setHandles:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastAddressedHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMSimulatedMessage setLastAddressedHandle:](self, "setLastAddressedHandle:", v9);
  return self;
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[IMSimulatedMessage _copyDictionaryRepresentation](self, "_copyDictionaryRepresentation");
  objc_msgSend(v4, "setValuesForKeysWithDictionary:", v5);

}

- (IMSimulatedMessage)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  return (IMSimulatedMessage *)MEMORY[0x1E0DE7D20](self, sel__initWithDictionaryRepresentation_);
}

- (id)_initWithDictionaryRepresentation:(id)a3
{
  id v4;
  IMSimulatedMessage *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMSimulatedMessage;
  v5 = -[IMSimulatedMessage init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc(+[IMItem classForMessageItemDictionary:](IMItem, "classForMessageItemDictionary:", v4));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);
    -[IMSimulatedMessage setItem:](v5, "setItem:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSimulatedMessage setGroupID:](v5, "setGroupID:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chatGUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSimulatedMessage setChatGUID:](v5, "setChatGUID:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSimulatedMessage setHandles:](v5, "setHandles:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastAddressedHandle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSimulatedMessage setLastAddressedHandle:](v5, "setLastAddressedHandle:", v12);

  }
  return v5;
}

- (id)_copyDictionaryRepresentation
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMSimulatedMessage item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("item"));

  -[IMSimulatedMessage groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IMSimulatedMessage groupID](self, "groupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("groupID"));

  }
  -[IMSimulatedMessage chatGUID](self, "chatGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IMSimulatedMessage chatGUID](self, "chatGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("chatGUID"));

  }
  -[IMSimulatedMessage handles](self, "handles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IMSimulatedMessage handles](self, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("handles"));

  }
  -[IMSimulatedMessage lastAddressedHandle](self, "lastAddressedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IMSimulatedMessage lastAddressedHandle](self, "lastAddressedHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lastAddressedHandle"));

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (NSString)guid
{
  void *v2;
  void *v3;

  -[IMSimulatedMessage item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IMMessageItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
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
  objc_storeStrong((id *)&self->_item, 0);
}

@end
