@implementation BMDistributedContextContextChangedMessage

- (BMDistributedContextContextChangedMessage)initWithSubscriptionIdentifier:(id)a3 translatedEvent:(id)a4 messageIntent:(unint64_t)a5
{
  id v9;
  id v10;
  BMDistributedContextContextChangedMessage *v11;
  BMDistributedContextContextChangedMessage *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMDistributedContextContextChangedMessage;
  v11 = -[BMDistributedContextContextChangedMessage init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subscriptionIdentifier, a3);
    objc_storeStrong((id *)&v12->_translatedEvent, a4);
    v12->_messageIntent = a5;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *subscriptionIdentifier;
  void *v7;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("type");
  v9[1] = CFSTR("messageVersion");
  v10[0] = CFSTR("context");
  v10[1] = CFSTR("1.0");
  v10[2] = &unk_24D27BA88;
  v9[2] = CFSTR("version");
  v9[3] = CFSTR("streamIdentifier");
  -[BMDistributedContextTranslatedEventMessage streamIdentifier](self->_translatedEvent, "streamIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  v9[4] = CFSTR("event");
  -[BMDistributedContextTranslatedEventMessage eventData](self->_translatedEvent, "eventData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  v9[5] = CFSTR("dataVersion");
  -[BMDistributedContextTranslatedEventMessage eventDataVersion](self->_translatedEvent, "eventDataVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[6] = CFSTR("identifier");
  subscriptionIdentifier = self->_subscriptionIdentifier;
  v10[5] = v5;
  v10[6] = subscriptionIdentifier;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BMDistributedContextContextChangedMessage)initWithMessageDictionary:(id)a3
{
  id v4;
  BMDistributedContextContextChangedMessage *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  BMDistributedContextContextChangedMessage *v13;
  uint64_t v14;
  NSString *subscriptionIdentifier;
  BMDistributedContextTranslatedEventMessage *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BMDistributedContextTranslatedEventMessage *translatedEvent;
  uint64_t v22;
  NSString *messageVersion;
  uint64_t v24;
  NSNumber *protocolVersion;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMDistributedContextContextChangedMessage;
  v5 = -[BMDistributedContextContextChangedMessage init](&v27, sel_init);
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageVersion"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("1.0"));

      if ((v11 & 1) == 0)
        goto LABEL_5;
    }
    else
    {

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    subscriptionIdentifier = v5->_subscriptionIdentifier;
    v5->_subscriptionIdentifier = (NSString *)v14;

    v16 = [BMDistributedContextTranslatedEventMessage alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[BMDistributedContextTranslatedEventMessage initWithStreamIdentifier:eventData:eventDataVersion:](v16, "initWithStreamIdentifier:eventData:eventDataVersion:", v17, v18, v19);
    translatedEvent = v5->_translatedEvent;
    v5->_translatedEvent = (BMDistributedContextTranslatedEventMessage *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageVersion"));
    v22 = objc_claimAutoreleasedReturnValue();
    messageVersion = v5->_messageVersion;
    v5->_messageVersion = (NSString *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
    v24 = objc_claimAutoreleasedReturnValue();
    protocolVersion = v5->_protocolVersion;
    v5->_protocolVersion = (NSNumber *)v24;

LABEL_10:
    v13 = v5;
    goto LABEL_11;
  }
LABEL_5:
  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[BMDistributedContextSubscribeMessage initWithMessageDictionary:fromRemoteDevice:localDevice:].cold.1(v4);

  v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (void)setSubscriptionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIdentifier, a3);
}

- (BMDistributedContextTranslatedEventMessage)translatedEvent
{
  return self->_translatedEvent;
}

- (void)setTranslatedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_translatedEvent, a3);
}

- (NSString)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_protocolVersion, a3);
}

- (unint64_t)messageIntent
{
  return self->_messageIntent;
}

- (void)setMessageIntent:(unint64_t)a3
{
  self->_messageIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_translatedEvent, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end
