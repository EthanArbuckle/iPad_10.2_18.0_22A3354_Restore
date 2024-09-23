@implementation ATMessage(ATProtocolUtilities)

- (void)initWithATPMessage:()ATProtocolUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "init");
  if (v5)
  {
    objc_msgSend(v5, "setMessageID:", objc_msgSend(v4, "messageID"));
    objc_msgSend(v5, "setSessionID:", objc_msgSend(v4, "sessionID"));
    if (objc_msgSend(v4, "hasParameters"))
    {
      v6 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v4, "parameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "propertyListWithData:options:format:error:", v7, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setParameters:", v8);

    }
  }

  return v5;
}

- (ATPMessage)ATPMessage
{
  ATPMessage *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(ATPMessage);
  -[ATPMessage setMessageID:](v2, "setMessageID:", objc_msgSend(a1, "messageID"));
  -[ATPMessage setSessionID:](v2, "setSessionID:", objc_msgSend(a1, "sessionID"));
  objc_msgSend(a1, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(a1, "parameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATPMessage setParameters:](v2, "setParameters:", v6);

  }
  return v2;
}

- (ATPMessage)ATPMessageWithPayloadData:()ATProtocolUtilities
{
  id v4;
  ATPMessage *v5;

  v4 = a3;
  v5 = objc_alloc_init(ATPMessage);
  -[ATPMessage setMessageID:](v5, "setMessageID:", objc_msgSend(a1, "messageID"));
  -[ATPMessage setSessionID:](v5, "setSessionID:", objc_msgSend(a1, "sessionID"));
  -[ATPMessage setPayload:](v5, "setPayload:", v4);

  return v5;
}

@end
