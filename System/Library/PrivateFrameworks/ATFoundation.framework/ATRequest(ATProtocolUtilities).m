@implementation ATRequest(ATProtocolUtilities)

- (id)initWithATPMessage:()ATProtocolUtilities
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&off_1EFC6F6F8;
  v5 = objc_msgSendSuper2(&v11, sel_initWithATPMessage_, v4);
  if (v5)
  {
    objc_msgSend(v4, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "command");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCommand:", v7);

    objc_msgSend(v4, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDataClass:", v9);

  }
  return v5;
}

- (id)ATPMessage
{
  void *v2;
  ATPRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_1EFC6F6F8;
  objc_msgSendSuper2(&v9, sel_ATPMessage);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMessageType:", 0);
  v3 = objc_alloc_init(ATPRequest);
  objc_msgSend(v2, "setRequest:", v3);

  objc_msgSend(a1, "command");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCommand:", v4);

  objc_msgSend(a1, "dataClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataClass:", v6);

  return v2;
}

- (id)ATPMessageWithPayloadData:()ATProtocolUtilities
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&off_1EFC6F6F8;
  v4 = a3;
  objc_msgSendSuper2(&v7, sel_ATPMessageWithPayloadData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageType:", 3, v7.receiver, v7.super_class);
  objc_msgSend(v5, "setMessageID:", objc_msgSend(a1, "messageID"));
  objc_msgSend(v5, "setSessionID:", objc_msgSend(a1, "sessionID"));
  objc_msgSend(v5, "setPayload:", v4);

  return v5;
}

@end
