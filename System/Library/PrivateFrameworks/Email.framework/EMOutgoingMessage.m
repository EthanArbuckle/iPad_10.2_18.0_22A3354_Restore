@implementation EMOutgoingMessage

- (EMOutgoingMessage)initWithMessageData:(id)a3
{
  id v4;
  id v5;
  EMOutgoingMessage *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__EMOutgoingMessage_initWithMessageData___block_invoke;
  v8[3] = &unk_1E70F54A0;
  v9 = v4;
  v5 = v4;
  v6 = -[EMOutgoingMessage initWithBuilder:](self, "initWithBuilder:", v8);

  return v6;
}

void __41__EMOutgoingMessage_initWithMessageData___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setMessageData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAction:", 0);
  objc_msgSend(v3, "setOriginalMessageID:", 0);
  objc_msgSend(v3, "setShouldSign:", 0);
  objc_msgSend(v3, "setShouldEncrypt:", 0);
  objc_msgSend(v3, "setConversationNotificationLevel:", 0);

}

- (EMOutgoingMessage)initWithBuilder:(id)a3
{
  void (**v4)(id, EMOutgoingMessage *);
  EMOutgoingMessage *v5;
  objc_super v7;

  v4 = (void (**)(id, EMOutgoingMessage *))a3;
  v7.receiver = self;
  v7.super_class = (Class)EMOutgoingMessage;
  v5 = -[EMOutgoingMessage init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMOutgoingMessage)initWithCoder:(id)a3
{
  id v4;
  id v5;
  EMOutgoingMessage *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__EMOutgoingMessage_initWithCoder___block_invoke;
  v8[3] = &unk_1E70F54A0;
  v9 = v4;
  v5 = v4;
  v6 = -[EMOutgoingMessage initWithBuilder:](self, "initWithBuilder:", v8);

  return v6;
}

void __35__EMOutgoingMessage_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_messageData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageData:", v3);

  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_originalMessageID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOriginalMessageID:", v4);

  objc_msgSend(v5, "setAction:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_action")));
  objc_msgSend(v5, "setShouldSign:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldSign")));
  objc_msgSend(v5, "setShouldEncrypt:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", CFSTR("EFPropertyKey_shouldEncrypt")));
  objc_msgSend(v5, "setConversationNotificationLevel:", objc_msgSend(*(id *)(a1 + 32), "decodeIntegerForKey:", CFSTR("EFPropertyKey_conversationNotificationLevel")));

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMOutgoingMessage messageData](self, "messageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_messageData"));

  -[EMOutgoingMessage originalMessageID](self, "originalMessageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_originalMessageID"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMOutgoingMessage action](self, "action"), CFSTR("EFPropertyKey_action"));
  objc_msgSend(v6, "encodeBool:forKey:", -[EMOutgoingMessage shouldSign](self, "shouldSign"), CFSTR("EFPropertyKey_shouldSign"));
  objc_msgSend(v6, "encodeBool:forKey:", -[EMOutgoingMessage shouldEncrypt](self, "shouldEncrypt"), CFSTR("EFPropertyKey_shouldEncrypt"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMOutgoingMessage conversationNotificationLevel](self, "conversationNotificationLevel"), CFSTR("EFPropertyKey_conversationNotificationLevel"));

}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  _BOOL4 v8;
  int64_t v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMOutgoingMessage originalMessageID](self, "originalMessageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EMOutgoingMessage action](self, "action");
  if (-[EMOutgoingMessage shouldSign](self, "shouldSign"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = -[EMOutgoingMessage shouldEncrypt](self, "shouldEncrypt");
  v9 = -[EMOutgoingMessage conversationNotificationLevel](self, "conversationNotificationLevel");
  if (v8)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n\tOriginalMessageID: %@\n\tAction: %lu\n\tShouldSign: %@\n\tShouldEncrypt: %@\n\tConversationNotificationLevel: %lu"), v4, self, v5, v6, v7, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (EMMessageObjectID)originalMessageID
{
  return self->_originalMessageID;
}

- (void)setOriginalMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_originalMessageID, a3);
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (void)setShouldSign:(BOOL)a3
{
  self->_shouldSign = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (int64_t)conversationNotificationLevel
{
  return self->_conversationNotificationLevel;
}

- (void)setConversationNotificationLevel:(int64_t)a3
{
  self->_conversationNotificationLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessageID, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end
