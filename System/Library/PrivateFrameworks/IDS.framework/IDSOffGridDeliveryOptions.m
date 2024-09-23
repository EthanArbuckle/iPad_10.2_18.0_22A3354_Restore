@implementation IDSOffGridDeliveryOptions

- (IDSOffGridDeliveryOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryOptions;
  return -[IDSOffGridDeliveryOptions init](&v3, sel_init);
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_command);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFDictionarySetValue(v3, CFSTR("IDSSendMessageOptionCommand"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_transportType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    CFDictionarySetValue(v3, CFSTR("IDSSendMessageOptionsOffGridDeliveryTransportType"), v5);

  IDSGetUUIDData();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v3, CFSTR("IDSSendMessageOptionsOffGridDeliveryOriginalUUID"), v6);

  IDSGetUUIDData();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("IDSSendMessageOptionUUID"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sendMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v3, CFSTR("IDSSendMessageOptionSendModeKey"), v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_encryptPayload);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v3, CFSTR("IDSSendMessageOptionEncryptPayload"), v9);

  CFDictionarySetValue(v3, CFSTR("IDSSendMessageOptionWantsCertifiedDelivery"), MEMORY[0x1E0C9AAB0]);
  v10 = (void *)-[__CFDictionary mutableCopy](v3, "mutableCopy");

  return v10;
}

- (void)setDefaultOptionsForTransportType:(int64_t)a3
{
  if (a3)
    self->_sendMode = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t command;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  command = self->_command;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", command);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("command"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_transportType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("transport-type"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_originalUUID, CFSTR("originalUUID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sendMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("send-mode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_encryptPayload);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("encrypt-payload"));

}

- (IDSOffGridDeliveryOptions)initWithCoder:(id)a3
{
  id v4;
  IDSOffGridDeliveryOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(IDSOffGridDeliveryOptions);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("command"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryOptions setCommand:](v5, "setCommand:", (int)objc_msgSend(v6, "intValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transport-type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryOptions setTransportType:](v5, "setTransportType:", (int)objc_msgSend(v7, "intValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryOptions setOriginalUUID:](v5, "setOriginalUUID:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryOptions setIdentifier:](v5, "setIdentifier:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("send-mode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridDeliveryOptions setSendMode:](v5, "setSendMode:", (int)objc_msgSend(v10, "intValue"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encrypt-payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSOffGridDeliveryOptions setEncryptPayload:](v5, "setEncryptPayload:", objc_msgSend(v11, "BOOLValue"));
  return v5;
}

- (IDSURI)senderURI
{
  return self->_senderURI;
}

- (void)setSenderURI:(id)a3
{
  objc_storeStrong((id *)&self->_senderURI, a3);
}

- (int64_t)command
{
  return self->_command;
}

- (void)setCommand:(int64_t)a3
{
  self->_command = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSString)originalUUID
{
  return self->_originalUUID;
}

- (void)setOriginalUUID:(id)a3
{
  objc_storeStrong((id *)&self->_originalUUID, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)sendMode
{
  return self->_sendMode;
}

- (void)setSendMode:(int64_t)a3
{
  self->_sendMode = a3;
}

- (BOOL)encryptPayload
{
  return self->_encryptPayload;
}

- (void)setEncryptPayload:(BOOL)a3
{
  self->_encryptPayload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_originalUUID, 0);
  objc_storeStrong((id *)&self->_senderURI, 0);
}

@end
