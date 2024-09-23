@implementation IMDiMessageIDSTrustedData

- (IMDiMessageIDSTrustedData)initWithTopLevelMessage:(id)a3 fromPushID:(id)a4 messageContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMDiMessageIDSTrustedData *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *fromPushID;
  void *v16;
  uint64_t v17;
  NSData *fromToken;
  void *v19;
  uint64_t v20;
  NSString *fromIdentifier;
  void *v22;
  uint64_t v23;
  NSString *toIdentifier;
  uint64_t v25;
  NSString *senderCorrelationIdentifier;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)IMDiMessageIDSTrustedData;
  v11 = -[IMDiMessageIDSTrustedData init](&v28, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("IDSIncomingMessagePushPayload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34A38]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("c"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v9, "copy");
    fromPushID = v11->_fromPushID;
    v11->_fromPushID = (NSString *)v14;

    objc_msgSend(v12, "objectForKey:", CFSTR("t"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    fromToken = v11->_fromToken;
    v11->_fromToken = (NSData *)v17;

    objc_msgSend(v12, "objectForKey:", CFSTR("sP"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    fromIdentifier = v11->_fromIdentifier;
    v11->_fromIdentifier = (NSString *)v20;

    objc_msgSend(v12, "objectForKey:", CFSTR("tP"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    toIdentifier = v11->_toIdentifier;
    v11->_toIdentifier = (NSString *)v23;

    v11->_command = objc_msgSend(v13, "integerValue");
    v11->_fromTrustedSender = objc_msgSend(v10, "isFromTrustedSender");
    v11->_fromSnapTrustedSender = objc_msgSend(v12, "BOOLValueForKey:withDefault:", CFSTR("stu"), 1);
    objc_msgSend(v10, "senderCorrelationIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    senderCorrelationIdentifier = v11->_senderCorrelationIdentifier;
    v11->_senderCorrelationIdentifier = (NSString *)v25;

  }
  return v11;
}

- (BOOL)isFromMe
{
  return self->_toIdentifier && -[NSString isEqualToString:](self->_fromIdentifier, "isEqualToString:");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMDiMessageIDSTrustedData fromPushID](self, "fromPushID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSTrustedData fromToken](self, "fromToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSTrustedData fromIdentifier](self, "fromIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDiMessageIDSTrustedData toIdentifier](self, "toIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDiMessageIDSTrustedData isFromMe](self, "isFromMe"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMDiMessageIDSTrustedData: %p; fromPushID = %@; fromToken = %@; fromIdentifier = %@; toIdentifier = %@; isFromMe = %@; command = %ld>"),
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    -[IMDiMessageIDSTrustedData command](self, "command"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)fromPushID
{
  return self->_fromPushID;
}

- (NSData)fromToken
{
  return self->_fromToken;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (int64_t)command
{
  return self->_command;
}

- (BOOL)isFromTrustedSender
{
  return self->_fromTrustedSender;
}

- (BOOL)isFromSnapTrustedSender
{
  return self->_fromSnapTrustedSender;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_fromToken, 0);
  objc_storeStrong((id *)&self->_fromPushID, 0);
}

@end
