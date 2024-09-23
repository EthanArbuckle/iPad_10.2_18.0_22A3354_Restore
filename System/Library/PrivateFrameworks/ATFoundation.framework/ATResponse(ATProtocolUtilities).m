@implementation ATResponse(ATProtocolUtilities)

- (id)initWithATPMessage:()ATProtocolUtilities
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&off_1EFC6F900;
  v5 = objc_msgSendSuper2(&v13, sel_initWithATPMessage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v4, "response");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithATPError:", v10);
      objc_msgSend(v5, "setError:", v11);

    }
  }

  return v5;
}

- (id)ATPMessage
{
  void *v2;
  ATPResponse *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&off_1EFC6F900;
  objc_msgSendSuper2(&v10, sel_ATPMessage);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(ATPResponse);
  objc_msgSend(v2, "setResponse:", v3);

  if (objc_msgSend(a1, "isPartial"))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v2, "setMessageType:", v4);
  objc_msgSend(a1, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ATPError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v7);

  }
  return v2;
}

- (id)ATPMessageWithPayloadData:()ATProtocolUtilities
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&off_1EFC6F900;
  v4 = a3;
  objc_msgSendSuper2(&v7, sel_ATPMessageWithPayloadData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageType:", 4, v7.receiver, v7.super_class);
  objc_msgSend(v5, "setMessageID:", objc_msgSend(a1, "messageID"));
  objc_msgSend(v5, "setSessionID:", objc_msgSend(a1, "sessionID"));
  objc_msgSend(v5, "setPayload:", v4);

  return v5;
}

@end
